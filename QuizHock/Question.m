//
//  Question.m
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithQuestion:(NSString*)question
                       andAnswer:(NSString*)answer
                 andFalseAnswers:(NSArray*)falseAnswers {
    self = [super init];
    if (self) {
        _question = question;
        _answer = answer;
        _falseAnswers = falseAnswers;
    }
    return self;
}

@end
