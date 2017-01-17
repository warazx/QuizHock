//
//  QuestionDictionary.m
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "QuestionLibrary.h"

@class Question;

@implementation QuestionLibrary

- (instancetype)init
{
    self = [super init];
    if (self) {

        Question *q0 = [[Question alloc] initWithQuestion:@"Vilket nummer hade HV71's poängkung Johan Davidsson?" andAnswer:@"76" andFalseAnswers:@[@"71", @"21", @"28"]];
        
        Question *q1 = [[Question alloc] initWithQuestion:@"Hur många omgångar spelas det i SHL efter övergången till 14 lag?" andAnswer:@"52" andFalseAnswers:@[@"55", @"48", @"50"]];
        
        Question *q2 = [[Question alloc] initWithQuestion:@"Hur många guld har Luleå HF tagit?" andAnswer:@"1" andFalseAnswers:@[@"2", @"3", @"4"]];

        _questions = @[q0, q1, q2];
    }
    return self;
}

-(Question*)getRandomQuestion {
    return [self.questions objectAtIndex:arc4random() % self.questions.count];
}

@end
