//
//  ViewController.h
//  QuizHock
//
//  Created by Christian Karlsson on 2017-01-17.
//  Copyright © 2017 Christian Karlsson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerBtn1;
@property (weak, nonatomic) IBOutlet UIButton *answerBtn2;
@property (weak, nonatomic) IBOutlet UIButton *answerBtn3;
@property (weak, nonatomic) IBOutlet UIButton *answerBtn4;
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;

@end

