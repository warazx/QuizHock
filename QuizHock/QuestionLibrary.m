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

        Question *q0 = [[Question alloc] initWithQuestion:@"hejhej" andAnswer:@"hej" andFalseAnswers:@[@"fel1", @"fel2", @"fel3"]];
        
        _questions = @[q0];
    }
    return self;
}

@end
