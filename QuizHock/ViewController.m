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
@property (strong, nonatomic) Question *currentQuestion;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.library = [[QuestionLibrary alloc] init];
    [self generateQuestion];
}

- (IBAction)summitAnswer:(UIButton *)sender {
    if([sender.titleLabel.text isEqualToString:self.currentQuestion.answer]) {
        NSLog(@"Rätt svar!");
    } else {
        NSLog(@"Fel svar...");
    }
    [self generateQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)generateQuestion {
    self.currentQuestion = self.library.getRandomQuestion;
    self.questionLabel.text = self.currentQuestion.question;
    
    NSArray *answers = [self.currentQuestion getAllAnswers];
    
    [self.answer1 setTitle:[answers objectAtIndex:0] forState:UIControlStateNormal];
    [self.answer2 setTitle:[answers objectAtIndex:1] forState:UIControlStateNormal];
    [self.answer3 setTitle:[answers objectAtIndex:2] forState:UIControlStateNormal];
    [self.answer4 setTitle:[answers objectAtIndex:3] forState:UIControlStateNormal];
}


@end
