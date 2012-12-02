//
//  PlayViewController.m
//  Quiz
//
//  Created by Pulkit Kathuria on 12/2/12.
//  Copyright (c) 2012 Pulkit Kathuria. All rights reserved.
//

#import "PlayViewController.h"
@interface PlayViewController ()

@end

@implementation PlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set The background Image
    self.highScore = [NSUserDefaults standardUserDefaults];
    
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"QuestionsAnswers" ofType:@"plist"];
    NSDictionary *questionsDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.questions = [questionsDict copy];
    currentQuestion = 0;
    [self showNextQuestion];
}

- (void)showNextQuestion
{
    if ([self.highScore integerForKey:@"HighScore"]<numCorrect){
        [self.highScore setInteger:numCorrect forKey:@"HighScore"];
        [self.highScore synchronize];
    }
    
    currentQuestion ++;
    if (currentQuestion <= [self.questions count]){
        self.labelScore.text = [NSString stringWithFormat:@"%d", numCorrect];
        self.labelHighestScore.text = [NSString stringWithFormat:@"%d", [self.highScore integerForKey:@"HighScore"]];
        
        NSDictionary* nextQuestion = [self.questions objectForKey:[NSString stringWithFormat:@"%d", currentQuestion]];
        NSString* correctAnswer = [nextQuestion objectForKey:@"CorrectAnswer"];
        self.answer = correctAnswer;
        
        self.labelA.text = [nextQuestion objectForKey:@"A"];
        self.labelB.text = [nextQuestion objectForKey:@"B"];
        self.labelC.text = [nextQuestion objectForKey:@"C"];
 
        self.labelQuestion.text = [nextQuestion objectForKey:@"QuestionTitle"];

    }
    else{
        currentQuestion --;
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonPressedA:(id)sender {
    if([self.answer isEqualToString: @"A" ]){
        numCorrect += 100;
        self.labelScore.text = [NSString stringWithFormat:@"%d", numCorrect];
    }
    [self performSelector:@selector(showNextQuestion) withObject:self afterDelay:1];
}

- (IBAction)buttonPressedB:(id)sender {
    if([self.answer isEqualToString: @"B"]){
        numCorrect += 100;
        self.labelScore.text = [NSString stringWithFormat:@"%d", numCorrect];
    }

    [self performSelector:@selector(showNextQuestion) withObject:self afterDelay:1];
}

- (IBAction)buttonPressedC:(id)sender {
    if([self.answer isEqualToString: @"C"]){
        numCorrect += 100;
        self.labelScore.text = [NSString stringWithFormat:@"%d", numCorrect];
    }
    [self performSelector:@selector(showNextQuestion) withObject:self afterDelay:1];
}


@end
