//
//  MAGViewController.m
//  MAGCircleDiagram
//
//  Created by Ievgen Rudenko on 02/12/13.
//  Copyright (c) 2013 MadAppGang. All rights reserved.
//

#import "MAGViewController.h"
#import "MAGBigCircleDiagram.h"
#import "MAGSmallCircleDoagram.h"

@interface MAGViewController ()

@end

@implementation MAGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeProgress:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(fire:)
                                   userInfo:nil
                                    repeats:YES];
//    NSInteger p = self.progressView.progress;
//    p += 10;
//    if (p>100) p=0;
//    self.progressView.progress = p;
}

-(void)fire:(id)something {
    NSInteger p = self.progressView.progress;
    p += 1;
    if (p>100) p=0;
    self.progressView.progress = p;
    self.smallProgressView.progress = 100-p;
}

@end
