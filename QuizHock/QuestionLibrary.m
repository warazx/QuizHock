//
//  QuestionDictionary.m
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "QuestionLibrary.h"

@class Question;

@interface QuestionLibrary ()
@property (strong, nonatomic) NSArray *questions;
@end

@implementation QuestionLibrary

int const GAMES_PER_SESSION = 5;

- (instancetype)init
{
    self = [super init];
    if (self) {

        Question *q0 = [[Question alloc] initWithQuestion:@"Vilket nummer hade HV71's poängkung Johan Davidsson?" andAnswer:@"76" andFalseAnswers:@[@"71", @"21", @"28"]];
        
        Question *q1 = [[Question alloc] initWithQuestion:@"Hur många omgångar spelas det i SHL efter övergången till 14 lag?" andAnswer:@"52" andFalseAnswers:@[@"55", @"48", @"50"]];
        
        Question *q2 = [[Question alloc] initWithQuestion:@"Hur många guld har Luleå HF tagit?" andAnswer:@"1" andFalseAnswers:@[@"2", @"3", @"4"]];
        
        Question *q3 = [[Question alloc] initWithQuestion:@"Q3?" andAnswer:@"A" andFalseAnswers:@[@"B", @"C", @"D"]];
        
        Question *q4 = [[Question alloc] initWithQuestion:@"Q4?" andAnswer:@"A" andFalseAnswers:@[@"B", @"C", @"D"]];
        
        Question *q5 = [[Question alloc] initWithQuestion:@"Q5?" andAnswer:@"A" andFalseAnswers:@[@"B", @"C", @"D"]];
        
        Question *q6 = [[Question alloc] initWithQuestion:@"Q6?" andAnswer:@"A" andFalseAnswers:@[@"B", @"C", @"D"]];
        
        Question *q7 = [[Question alloc] initWithQuestion:@"Q7?" andAnswer:@"A" andFalseAnswers:@[@"B", @"C", @"D"]];
        
        Question *q8 = [[Question alloc] initWithQuestion:@"Q8?" andAnswer:@"A" andFalseAnswers:@[@"B", @"C", @"D"]];
        
        Question *q9 = [[Question alloc] initWithQuestion:@"Q9?" andAnswer:@"A" andFalseAnswers:@[@"B", @"C", @"D"]];

        self.questions = @[q0, q1, q2, q3, q4, q5, q6, q7, q8, q9];
    }
    return self;
}

-(Question*)getRandomQuestion {
    return [self.questions objectAtIndex:arc4random() % self.questions.count];
}

-(NSMutableArray*)getQuestionForSession {
    NSMutableArray *questionArray = [[NSMutableArray alloc] initWithArray:self.questions];
    NSMutableArray *sessionArray = [[NSMutableArray alloc] init];
    while(sessionArray.count < GAMES_PER_SESSION) {
        int objectAtIndex = arc4random() % questionArray.count;
        [sessionArray addObject:[questionArray objectAtIndex:objectAtIndex]];
        [questionArray removeObjectAtIndex:objectAtIndex];
    }
    return sessionArray;
}

@end
