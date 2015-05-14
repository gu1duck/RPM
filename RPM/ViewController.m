//
//  ViewController.m
//  RPM
//
//  Created by Jeremy Petter on 2015-05-14.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arbitraryConstant = 4.71238898/3000;
    self.startingRotation = -3.92699082;
    //UIImageView* needle2 = [[UIImageView alloc] init];
    //self.needle = needle2;
    self.dial.image = [UIImage imageNamed:@"dial"];
    self.needle.image = [UIImage imageNamed:@"needle"];
    self.needle.transform = CGAffineTransformMakeRotation(self.startingRotation);
    UIPanGestureRecognizer* rotato = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveTheNeedle:)];
    [self.view addGestureRecognizer:rotato];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveTheNeedle:(UIPanGestureRecognizer*)rotato{
    
    if (rotato.state == UIGestureRecognizerStateChanged){
        CGPoint current = [rotato velocityInView:self.view];
        float linearVelocity = sqrt(current.x * current.x + current.y * current.y);
        NSLog(@"%f", linearVelocity);
        
//        CGPoint current = [rotato locationInView:self.view];
//        float diffX = self.oldX - current.x;
//        float diffY = self.oldY - current.y;
//        float distance = sqrt((diffX * diffX) + (diffY * diffY));
//        NSLog(@"%f", distance);
//        self.oldX = current.x;
//        self.oldY = current.y;
        float rotation = self.startingRotation + (linearVelocity * self.arbitraryConstant);
        self.needle.transform = CGAffineTransformMakeRotation(rotation);
        
    }
    
    if (rotato.state == UIGestureRecognizerStateEnded){
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(resetMeter)
                                   userInfo:nil
                                    repeats:NO];
    }
    
}

-(void) resetMeter{
    self.needle.transform = CGAffineTransformMakeRotation(self.startingRotation);
}
@end
