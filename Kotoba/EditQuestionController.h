//
//  QuestionEditViewController.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UIPlaceHolderTextView;
@class DataManager;
@class AlertHelper;
@class Question;

@interface EditQuestionController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *questionTextField;
@property (weak, nonatomic) IBOutlet UIPlaceHolderTextView *answerTextView;
@property (strong, nonatomic) DataManager *dataManager;
@property (strong, nonatomic) Question *currentQuestion;

- (IBAction)onSaveAction:(id)sender;
-(void) mockAlertHelper:(AlertHelper *)alertHelper;


@end
