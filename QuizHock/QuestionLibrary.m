//
//  QuestionDictionary.m
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "QuestionLibrary.h"

@class Question;
@class Player;

@interface QuestionLibrary ()
@property (strong, nonatomic) NSArray *questions;
@property (strong, nonatomic) NSMutableArray *sessionQuestions;
@end

@implementation QuestionLibrary

int const GAMES_PER_SESSION = 5;

- (instancetype)init
{
    self = [super init];
    if (self) {

        self.questions = @[
                           
        [[Question alloc] initWithQuestion:@"Vilket nummer hade HV71's poängkung Johan Davidsson?" andAnswer:@"76" andFalseAnswers:@[@"71", @"21", @"28"]],
        
        [[Question alloc] initWithQuestion:@"Hur många omgångar spelas det i SHL efter övergången till 14 lag?" andAnswer:@"52" andFalseAnswers:@[@"55", @"48", @"50"]],
        
        [[Question alloc] initWithQuestion:@"Hur många guld har Luleå HF tagit?" andAnswer:@"1" andFalseAnswers:@[@"2", @"3", @"4"]],
        
        [[Question alloc] initWithQuestion:@"Hur många minuters utvisning får man för hög klubba som resulterar i blodvite?" andAnswer:@"4" andFalseAnswers:@[@"2", @"5", @"10"]],
        
        [[Question alloc] initWithQuestion:@"Vilket är det minsta antalet spelare på planen samtidigt?" andAnswer:@"8" andFalseAnswers:@[@"4", @"6", @"10"]],
        
        [[Question alloc] initWithQuestion:@"Vad heter utvisningen när man slår någon med klubban?" andAnswer:@"Slashing" andFalseAnswers:@[@"Hooking", @"Hitting", @"Roughing"]],
        
        [[Question alloc] initWithQuestion:@"Vem gjorde mest mål i grundserien 2015/16?" andAnswer:@"Nick Johnson" andFalseAnswers:@[@"Broc Little", @"Richard Gynge", @"Milan Gulas"]],
        
        [[Question alloc] initWithQuestion:@"Vem vann utvisningsligan 2015/16?" andAnswer:@"Daniel Rahimi" andFalseAnswers:@[@"Ilari Melart", @"Ryan O'Byrne", @"Jere Karalahti"]],
        
        [[Question alloc] initWithQuestion:@"Vilket lag åkte ur SHL säsongen 2015/16?" andAnswer:@"MODO" andFalseAnswers:@[@"AIK", @"Timrå", @"Mora"]],
        
        [[Question alloc] initWithQuestion:@"Hur många spelare kan som mest få poäng vid mål?" andAnswer:@"3" andFalseAnswers:@[@"1", @"2", @"4"]]];
        
        self.player = [[Player alloc] init];
        self.currentQuestion = [[Question alloc] init];
        self.sessionQuestions = [[NSMutableArray alloc] init];
        [self assignQuestionForSession];
    }
    return self;
}

-(void)nextQuestion {
    self.currentQuestion = [self.sessionQuestions objectAtIndex:0];
    [self.sessionQuestions removeObjectAtIndex:0];
}

-(void)assignQuestionForSession {
    NSMutableArray *questionArray = [[NSMutableArray alloc] initWithArray:self.questions];
    while(self.sessionQuestions.count < GAMES_PER_SESSION) {
        int objectAtIndex = arc4random() % questionArray.count;
        [self.sessionQuestions addObject:[questionArray objectAtIndex:objectAtIndex]];
        [questionArray removeObjectAtIndex:objectAtIndex];
    }
}

-(BOOL)isAnswerRight:(NSString*)answer {
    self.player.questionsAnswered++;
    if([self.currentQuestion checkGuess:answer]) {
        self.player.points++;
        return YES;
    }
    return NO;
}

-(BOOL)isGameOver {
    return self.sessionQuestions.count == 0;
}

-(void)startNewGame {
    [self.player reset];
    [self assignQuestionForSession];
}

-(BOOL)isAllQuestionsAnswered {
    return self.player.questionsAnswered == GAMES_PER_SESSION;
}

@end
