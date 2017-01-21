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
@property (strong, nonatomic) QuestionLibrary *gameSession;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameSession = [[QuestionLibrary alloc] init];
    [self generateQuestion];
}

- (void)generateQuestion {
    [self.gameSession nextQuestion];
    self.questionLabel.text = self.gameSession.currentQuestion.question;
    NSArray *answers = [self.gameSession.currentQuestion getAllAnswers];
    
    [self.answerBtn1 setTitle:[answers objectAtIndex:0] forState:UIControlStateNormal];
    [self.answerBtn2 setTitle:[answers objectAtIndex:1] forState:UIControlStateNormal];
    [self.answerBtn3 setTitle:[answers objectAtIndex:2] forState:UIControlStateNormal];
    [self.answerBtn4 setTitle:[answers objectAtIndex:3] forState:UIControlStateNormal];
}

- (IBAction)summitAnswer:(UIButton *)sender {
    if([self.gameSession isAnswerRight:sender.titleLabel.text]) {
        sender.backgroundColor = [UIColor greenColor];
        self.infoLabel.text = @"Du gissade rätt!";
        self.infoLabel.textColor = [UIColor greenColor];
    } else {
        sender.backgroundColor = [UIColor redColor];
        self.infoLabel.text = @"Du gissade fel!";
        self.infoLabel.textColor = [UIColor redColor];
        [self highlightAnswerGreen];
    }
    self.continueBtn.hidden = NO;
    
    [self toggleButtons];
}

- (IBAction)continueGame:(UIButton *)sender {
    [self.continueBtn setTitle:@"Ny Fråga" forState:UIControlStateNormal];
    self.infoLabel.text = @"";
    [self resetBtnColors];
    if([self.gameSession isGameOver]) {
        [self finishGame];
    } else {
        self.continueBtn.hidden = YES;
        [self toggleButtons];
        [self generateQuestion];
    }
}

- (void)finishGame {
    self.questionLabel.text = [NSString stringWithFormat:@"Du har svarat på %d frågor.\n Av dessa hade du %d rätt.", self.gameSession.player.questionsAnswered, self.gameSession.player.points];
    [self.continueBtn setTitle:@"Ny omgång" forState:UIControlStateNormal];
    [self.gameSession startNewGame];
}

-(void)toggleButtons {
    self.continueBtn.enabled = !self.continueBtn.enabled;
    self.answerBtn1.enabled = !self.answerBtn1.enabled;
    self.answerBtn2.enabled = !self.answerBtn2.enabled;
    self.answerBtn3.enabled = !self.answerBtn3.enabled;
    self.answerBtn4.enabled = !self.answerBtn4.enabled;
}

- (void)resetBtnColors {
    self.answerBtn1.backgroundColor = [UIColor clearColor];
    self.answerBtn2.backgroundColor = [UIColor clearColor];
    self.answerBtn3.backgroundColor = [UIColor clearColor];
    self.answerBtn4.backgroundColor = [UIColor clearColor];
}

- (void)highlightAnswerGreen {
    if([self.gameSession.currentQuestion checkGuess:self.answerBtn1.titleLabel.text]) {
        self.answerBtn1.backgroundColor = [UIColor greenColor];
    }
    if([self.gameSession.currentQuestion checkGuess:self.answerBtn2.titleLabel.text]) {
        self.answerBtn2.backgroundColor = [UIColor greenColor];
    }
    if([self.gameSession.currentQuestion checkGuess:self.answerBtn3.titleLabel.text]) {
        self.answerBtn3.backgroundColor = [UIColor greenColor];
    }
    if([self.gameSession.currentQuestion checkGuess:self.answerBtn4.titleLabel.text]) {
        self.answerBtn4.backgroundColor = [UIColor greenColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
