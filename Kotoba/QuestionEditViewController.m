//
//  QuestionEditViewController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionEditViewController.h"
#import "UIPlaceHolderTextView.h"

@implementation QuestionEditViewController
@synthesize questionTextField;
@synthesize answerTextView;


- (void)viewDidLoad
{
    self.answerTextView.placeholder = NSLocalizedStringFromTable(@"Please type your answer here", @"UI", nil);
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setAnswerTextView:nil];
    [self setQuestionTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)onSaveAction:(id)sender {
}
@end
