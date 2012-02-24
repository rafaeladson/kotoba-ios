//
//  QuestionGameViewController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionGameViewController.h"
#import "AppDelegate.h"
#import "Question.h"
#import "CircularItemCursor.h"

@interface QuestionGameViewController() 

@property (strong, nonatomic) CircularItemCursor *cursor;

@end
@implementation QuestionGameViewController
@synthesize questionTextView;
@synthesize answerTextView;
@synthesize questionMarkLabel;
@synthesize cursor = _cursor;



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    Question *question = [[Question alloc] initWithValue:@"What's the meaning to life, the universe and everything else" andAnswer:@"42" ];
    NSArray *questions = [[NSArray alloc] initWithObjects:question , nil];
    
    self.cursor = [[CircularItemCursor alloc] initWithArray:questions];
    
    delegate.rootViewController = self;
    
    [self nextQuestion:nil];
    
}

- (void)viewDidUnload
{
    [self setQuestionTextView:nil];
    [self setAnswerTextView:nil];
    [self setQuestionMarkLabel:nil];
    [self setCursor:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
        (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction)showAnswer:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    questionMarkLabel.alpha = 0;
    answerTextView.alpha = 1;
    [UIView commitAnimations];

}

- (IBAction)nextQuestion:(id)sender {
    Question *question = self.cursor.currentItem;
    questionTextView.text = question.value;
    answerTextView.text = question.answer;
    
    questionMarkLabel.alpha = 1;
    answerTextView.alpha = 0;
    
}
@end
