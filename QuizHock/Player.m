//
//  Player.m
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.points = 0;
        self.questionsAnswered = 0;
    }
    return self;
}

-(void)reset {
    self.points = 0;
    self.questionsAnswered = 0;
}

@end
