//
//  ViewController.m
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import "ViewController.h"
#import "QuestionLibrary.h"
#import "Player.h"

@interface ViewController ()
@property (strong, nonatomic) QuestionLibrary *library;
@property (strong, nonatomic) Question *currentQuestion;
@property (strong, nonatomic) Player *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.library = [[QuestionLibrary alloc] init];
    self.player = [[Player alloc] init];
    [self generateQuestion];
}

- (IBAction)summitAnswer:(UIButton *)sender {
    self.player.questionsAnswered++;
    if([self.currentQuestion checkGuess:sender.titleLabel.text]) {
        self.player.points++;
        self.infoLabel.text = @"Du gissade rätt!";
        self.infoLabel.textColor = [UIColor greenColor];
    } else {
        self.infoLabel.text = @"Du gissade fel!";
        self.infoLabel.textColor = [UIColor redColor];
    }
    if(self.player.isGameOver) {
        [self finishGame];
    } else {
        [self generateQuestion];
    }
    
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

- (void)finishGame {
    self.questionLabel.text = [NSString stringWithFormat:@"Du har svarat på %d frågor.\n Av dessa hade du %d rätt.", self.player.questionsAnswered, self.player.points];
    self.continueBtn.hidden = NO;
    [self toggleButtons];
}

-(void)toggleButtons {
    self.continueBtn.enabled = !self.continueBtn.enabled;
    self.answer1.enabled = !self.answer1.enabled;
    self.answer2.enabled = !self.answer2.enabled;
    self.answer3.enabled = !self.answer3.enabled;
    self.answer4.enabled = !self.answer4.enabled;
}
- (IBAction)newGame:(UIButton *)sender {
    [self toggleButtons];
    [self generateQuestion];
    [self.player reset];
    self.continueBtn.hidden = YES;
    self.infoLabel.text = @"";
}


@end
