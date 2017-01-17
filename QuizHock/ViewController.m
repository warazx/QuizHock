//
//  ViewController.m
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "ViewController.h"
#import "QuestionLibrary.h"

@interface ViewController ()
@property (strong, nonatomic) QuestionLibrary *library;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.library = [[QuestionLibrary alloc] init];
    [self generateQuestion];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)generateQuestion {
    Question *question = [self.library.questions objectAtIndex:1];
    self.questionLabel.text = question.question;
    
    [self.answer1 setTitle:question.answer forState:UIControlStateNormal];
    [self.answer2 setTitle:[question.falseAnswers objectAtIndex:0] forState:UIControlStateNormal];
    [self.answer3 setTitle:[question.falseAnswers objectAtIndex:1] forState:UIControlStateNormal];
    [self.answer4 setTitle:[question.falseAnswers objectAtIndex:2] forState:UIControlStateNormal];
}


@end
