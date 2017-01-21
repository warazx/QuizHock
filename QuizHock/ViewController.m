//
//  ViewController.m
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "ViewController.h"
#import "QuestionLibrary.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (strong, nonatomic) QuestionLibrary *gameSession;
@property (strong, nonatomic) UIColor *lightGreen;
@property (strong, nonatomic) UIColor *lightRed;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDesign];
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
        sender.backgroundColor = self.lightGreen;
    } else {
        sender.backgroundColor = self.lightRed;
        [self highlightAnswerGreen];
    }
    self.continueBtn.hidden = NO;
    if([self.gameSession isAllQuestionsAnswered]) {
        [self.continueBtn setTitle:@"Resultat" forState:UIControlStateNormal];
    }
    
    [self toggleButtons];
}

- (IBAction)continueGame:(UIButton *)sender {
    if([self.continueBtn.titleLabel.text isEqualToString:@"Ny omgång"]) {
        [self toggleAnswerButtons];
    }
    
    [self resetBtnColors];
    
    if([self.gameSession isGameOver]) {
        [self finishGame];
    } else {
        [self.continueBtn setTitle:@"Nästa Fråga" forState:UIControlStateNormal];
        self.continueBtn.hidden = YES;
        [self toggleButtons];
        [self generateQuestion];
    }
}

- (void)finishGame {
    self.questionLabel.text = [NSString stringWithFormat:@"Du har svarat på %d frågor.\n Av dessa hade du %d rätt.", self.gameSession.player.questionsAnswered, self.gameSession.player.points];
    [self.continueBtn setTitle:@"Ny omgång" forState:UIControlStateNormal];
    [self toggleAnswerButtons];
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
    self.answerBtn1.backgroundColor = [UIColor whiteColor];
    self.answerBtn2.backgroundColor = [UIColor whiteColor];
    self.answerBtn3.backgroundColor = [UIColor whiteColor];
    self.answerBtn4.backgroundColor = [UIColor whiteColor];
}

- (void)highlightAnswerGreen {
    if([self.gameSession.currentQuestion checkGuess:self.answerBtn1.titleLabel.text]) {
        self.answerBtn1.backgroundColor = self.lightGreen;
    }
    if([self.gameSession.currentQuestion checkGuess:self.answerBtn2.titleLabel.text]) {
        self.answerBtn2.backgroundColor = self.lightGreen;
    }
    if([self.gameSession.currentQuestion checkGuess:self.answerBtn3.titleLabel.text]) {
        self.answerBtn3.backgroundColor = self.lightGreen;
    }
    if([self.gameSession.currentQuestion checkGuess:self.answerBtn4.titleLabel.text]) {
        self.answerBtn4.backgroundColor = self.lightGreen;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toggleAnswerButtons {
    self.answerBtn1.hidden = !self.answerBtn1.isHidden;
    self.answerBtn2.hidden = !self.answerBtn2.isHidden;
    self.answerBtn3.hidden = !self.answerBtn3.isHidden;
    self.answerBtn4.hidden = !self.answerBtn4.isHidden;
}
    

-(void)initDesign {
    [[self.answerBtn1 layer] setCornerRadius:8.0f];
    [[self.answerBtn2 layer] setCornerRadius:8.0f];
    [[self.answerBtn3 layer] setCornerRadius:8.0f];
    [[self.answerBtn4 layer] setCornerRadius:8.0f];
    [[self.continueBtn layer] setCornerRadius:8.0f];
    
    [[self.answerBtn1 layer] setBorderWidth:1.0f];
    [[self.answerBtn2 layer] setBorderWidth:1.0f];
    [[self.answerBtn3 layer] setBorderWidth:1.0f];
    [[self.answerBtn4 layer] setBorderWidth:1.0f];
    [[self.continueBtn layer] setBorderWidth:1.0f];
    
    [[self.questionBox layer] setBorderWidth:1.0f];
    [[self.questionBox layer] setCornerRadius:8.0f];
    self.questionBox.layer.masksToBounds = YES;
    
    self.lightGreen = [[UIColor alloc] initWithDisplayP3Red:155/255.0 green:1 blue:155/255.0 alpha:1];
    self.lightRed = [[UIColor alloc] initWithDisplayP3Red:1 green:155/255.0 blue:155/255.0 alpha:1];
}

@end
