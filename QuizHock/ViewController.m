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
@property (strong, nonatomic) Question *currentQuestion;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameSession = [[QuestionLibrary alloc] init];
    [self generateQuestion];
}

- (void)generateQuestion {
    self.currentQuestion = [self.gameSession getQuestion];
    [self displayQuestion];
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

- (void)displayQuestion {
    self.questionLabel.text = self.currentQuestion.question;
    NSArray *answers = [self.currentQuestion getAllAnswers];
    
    [self.answer1 setTitle:[answers objectAtIndex:0] forState:UIControlStateNormal];
    [self.answer2 setTitle:[answers objectAtIndex:1] forState:UIControlStateNormal];
    [self.answer3 setTitle:[answers objectAtIndex:2] forState:UIControlStateNormal];
    [self.answer4 setTitle:[answers objectAtIndex:3] forState:UIControlStateNormal];
}

-(void)toggleButtons {
    self.continueBtn.enabled = !self.continueBtn.enabled;
    self.answer1.enabled = !self.answer1.enabled;
    self.answer2.enabled = !self.answer2.enabled;
    self.answer3.enabled = !self.answer3.enabled;
    self.answer4.enabled = !self.answer4.enabled;
}

- (void)resetBtnColors {
    self.answer1.backgroundColor = [UIColor clearColor];
    self.answer2.backgroundColor = [UIColor clearColor];
    self.answer3.backgroundColor = [UIColor clearColor];
    self.answer4.backgroundColor = [UIColor clearColor];
}

- (void)highlightAnswerGreen {
    if([self.currentQuestion checkGuess:self.answer1.titleLabel.text]) {
        self.answer1.backgroundColor = [UIColor greenColor];
    }
    else if([self.currentQuestion checkGuess:self.answer2.titleLabel.text]) {
        self.answer2.backgroundColor = [UIColor greenColor];
    }
    else if([self.currentQuestion checkGuess:self.answer3.titleLabel.text]) {
        self.answer3.backgroundColor = [UIColor greenColor];
    }
    else if([self.currentQuestion checkGuess:self.answer4.titleLabel.text]) {
        self.answer4.backgroundColor = [UIColor greenColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
