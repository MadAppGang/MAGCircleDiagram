//
//  MAGSmallCircleDoagram.m
//  MAGCircleDiagram
//
//  Created by Ievgen Rudenko on 04/12/13.
//  Copyright (c) 2013 MadAppGang. All rights reserved.
//

#import "MAGSmallCircleDoagram.h"

@implementation MAGSmallCircleDoagram

- (UIImage*)backgroundImage {
    return [UIImage imageNamed:@"smallCircleDiagramBackground.png"];
}

- (UIImage*)progressImage {
    
    return self.progress<75?[UIImage imageNamed:@"smallCircleDiagramFillBlue.png"]:
    [UIImage imageNamed:@"smallCircleDiagramFillRed.png"];
}


@end
