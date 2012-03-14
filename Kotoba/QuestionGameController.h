//
//  QuestionGameViewController.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManagerDelegate.h"
@class DataManager;

@interface QuestionGameController : UIViewController <DataManagerDelegate> {
    UITextView *questionTextView;
    UITextView *answerTextView;
    UILabel *questMarkLabel;
    
}

@property (strong, nonatomic) IBOutlet UITextView *questionTextView;
@property (strong, nonatomic) IBOutlet UITextView *answerTextView;
@property (strong, nonatomic) IBOutlet UILabel *questionMarkLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *manageQuestionsButton;
- (IBAction)showAnswer:(id)sender;
- (IBAction)nextQuestion:(id)sender;
@property (strong, nonatomic) DataManager *dataManager;

@end
