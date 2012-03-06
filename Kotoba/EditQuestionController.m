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
@property int noKeyboardAnswerTextViewHeight;

-(void) keyboardDidShow: (NSNotification *)notif;
-(void) keyboardDidHide: (NSNotification *)notif;

@end

@implementation EditQuestionController

@synthesize questionTextField;
@synthesize answerTextView;
@synthesize dataManager = _dataManager, alertHelper = _alertHelper;
@synthesize noKeyboardAnswerTextViewHeight = _noKeyboardAnswerTextViewHeight;


- (void)viewDidLoad
{
    self.alertHelper = [[AlertHelper alloc] init];
    self.answerTextView.placeholder = NSLocalizedStringFromTable(@"Please type your answer here", @"UI", nil);

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)name: UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:) name: UIKeyboardDidHideNotification object:nil];
    
    [super viewDidLoad];
    
    
}

- (void)viewDidUnload
{
    [self setEditing:NO animated:YES];
    
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self];

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


/**
 * Taken from http://www.ibolo.com/technology/apple-products/ios-development/reducing-the-height-of-uitextview-when-keyboard-shows-up/
 */
-(void) keyboardDidShow: (NSNotification *)notif {
    NSDictionary *userInfo = [notif userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    CGFloat keyboardTop = keyboardRect.origin.y;

    
    self.noKeyboardAnswerTextViewHeight = self.answerTextView.bounds.size.height;
    CGRect frame = self.answerTextView.frame;

    frame.size.height = keyboardTop-frame.origin.y;
    self.answerTextView.frame=frame;
}
-(void) keyboardDidHide: (NSNotification *)notif {
    NSDictionary *userInfo = [notif userInfo];
    CGRect frame = self.answerTextView.frame;
    frame.size.height=self.noKeyboardAnswerTextViewHeight;
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    // Animate the resize of the text view's frame in sync with the keyboard's appearance.
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    self.answerTextView.frame=frame;
    [UIView commitAnimations];
}

-(void) mockAlertHelper:(AlertHelper *)alertHelper {
    self.alertHelper = alertHelper;
}
@end
