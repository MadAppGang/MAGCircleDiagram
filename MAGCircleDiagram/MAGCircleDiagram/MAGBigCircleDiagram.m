//
//  MAGBigCircleDiagram.m
//  MAGCircleDiagram
//
//  Created by Ievgen Rudenko on 02/12/13.
//  Copyright (c) 2013 MadAppGang. All rights reserved.
//

#import "MAGBigCircleDiagram.h"

@implementation MAGBigCircleDiagram

- (UIImage*)backgroundImage {
    return [UIImage imageNamed:@"bigCircleDiagramBackground.png"];
}

- (UIImage*)progressImage {
    
    return self.progress<75?[UIImage imageNamed:@"bigCircleDiagramFillBlue.png"]:
                            [UIImage imageNamed:@"bigCircleDiagramFillRed.png"];
}



@end
