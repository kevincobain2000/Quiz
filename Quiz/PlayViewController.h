//
//  PlayViewController.h
//  Quiz
//
//  Created by Pulkit Kathuria on 12/2/12.
//  Copyright (c) 2012 Pulkit Kathuria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController
{
    int numCorrect;
    int currentQuestion;
}
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion;

@property (weak, nonatomic) IBOutlet UIButton *buttonA;
@property (weak, nonatomic) IBOutlet UIButton *buttonB;
@property (weak, nonatomic) IBOutlet UIButton *buttonC;
@property (strong, nonatomic) IBOutlet UILabel *labelScore;

@property (strong, nonatomic) IBOutlet UILabel *labelHighestScore;


@property (strong, nonatomic) NSUserDefaults *highScore;




@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UILabel *labelB;
@property (weak, nonatomic) IBOutlet UILabel *labelC;

- (IBAction)buttonPressedA:(id)sender;
- (IBAction)buttonPressedB:(id)sender;
- (IBAction)buttonPressedC:(id)sender;


@property (strong, nonatomic) NSDictionary* questions;
@property (weak, nonatomic) NSString* answer;

- (void) showNextQuestion;

@end
