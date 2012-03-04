//
//  QuestionEditViewController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EditQuestionController.h"
#import "UIPlaceHolderTextView.h"
#import "DataManager.h"
#import "Question.h"
#import "AlertHelper.h"

@interface EditQuestionController() 

@property (strong, nonatomic) AlertHelper *alertHelper;

@end

@implementation EditQuestionController
@synthesize questionTextField;
@synthesize answerTextView;
@synthesize dataManager = _dataManager, alertHelper = _alertHelper;


- (void)viewDidLoad
{
    self.alertHelper = [[AlertHelper alloc] init];
    self.answerTextView.placeholder = NSLocalizedStringFromTable(@"Please type your answer here", @"UI", nil);
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.alertHelper = nil;
    [self setAnswerTextView:nil];
    [self setQuestionTextField:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}



- (IBAction)onSaveAction:(id)sender {
    NSString *valueText = self.questionTextField.text;
    if ( [valueText length] > 0 )  {
        Question *newQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.dataManager.managedObjectContext];
        newQuestion.value = valueText;
        newQuestion.answer = self.answerTextView.text;
        NSLog(@"Used saved new question with value %@ and answer %@", newQuestion.value, newQuestion.answer);
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.alertHelper showAlertDialogWithMessage:NSLocalizedStringFromTable(@"Please type a question.", @"Alerts", nil)];
    }
}

-(void) mockAlertHelper:(AlertHelper *)alertHelper {
    self.alertHelper = alertHelper;
}
@end
