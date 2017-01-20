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
        self.question = question;
        self.answer = answer;
        self.falseAnswers = falseAnswers;
    }
    return self;
}

-(NSArray*)getAllAnswers {
    return [@[self.answer, [self.falseAnswers objectAtIndex:0], [self.falseAnswers objectAtIndex:1], [self.falseAnswers objectAtIndex:2]] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

-(BOOL)checkGuess:(NSString*)guess {
    return [guess isEqualToString:self.answer];
}

@end
