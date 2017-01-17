//
//  Question.h
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic) NSString *question;
@property (nonatomic) NSString *answer;
@property (nonatomic) NSArray *falseAnswers;

- (instancetype)initWithQuestion:(NSString*)question
                       andAnswer:(NSString*)answer
                 andFalseAnswers:(NSArray*)falseAnswers;

-(NSArray*)getAllAnswers;

@end
