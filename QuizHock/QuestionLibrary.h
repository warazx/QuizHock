//
//  QuestionDictionary.h
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "Player.h"

@interface QuestionLibrary : NSObject
@property (strong, nonatomic) Question *currentQuestion;
@property (strong, nonatomic) Player *player;

-(BOOL)isAnswerRight:(NSString*)answer;
-(void)nextQuestion;
-(BOOL)isGameOver;
-(void)startNewGame;

@end
