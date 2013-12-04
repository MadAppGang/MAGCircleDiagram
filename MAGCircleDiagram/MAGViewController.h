//
//  MAGViewController.h
//  MAGCircleDiagram
//
//  Created by Ievgen Rudenko on 02/12/13.
//  Copyright (c) 2013 MadAppGang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MAGBigCircleDiagram;
@class MAGSmallCircleDoagram;
@interface MAGViewController : UIViewController

@property (weak, nonatomic) IBOutlet MAGBigCircleDiagram *progressView;
@property (weak, nonatomic) IBOutlet MAGSmallCircleDoagram *smallProgressView;

- (IBAction)changeProgress:(id)sender;

@end
