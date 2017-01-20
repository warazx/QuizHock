//
//  Player.h
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property (nonatomic) int points;
@property (nonatomic) int questionsAnswered;

-(void)reset;

@end
