//
//  ViewController.h
//  RPM
//
//  Created by Jeremy Petter on 2015-05-14.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIImageView* dial;
@property (nonatomic, weak) IBOutlet UIImageView* needle;
@property (nonatomic, assign) float oldX;
@property (nonatomic, assign) float oldY;
@property (nonatomic, assign) float startingRotation;
@property (nonatomic, assign) float arbitraryConstant;

@end

