//
//  QuestionGameViewController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionGameController.h"
#import "AppDelegate.h"
#import "OldQuestion.h"
#import "CircularItemCursor.h"
#import "DataManager.h"
#import "ListQuestionsController.h"



@interface QuestionGameController() 

@property (strong, nonatomic) CircularItemCursor *cursor;

-(void) addSwipeLeftRecognizer;

@end
@implementation QuestionGameController
@synthesize questionTextView;
@synthesize answerTextView;
@synthesize questionMarkLabel;
@synthesize cursor = _cursor, dataManager = _dataManager, manageQuestionsButton = _manageQuestionsButton;



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
    if ( self.dataManager == nil ) {
        [self.manageQuestionsButton setEnabled:false];
        self.dataManager = [[DataManager alloc] initWithDatabaseName:@"kotoba" andDelegate:self];
    } else {
        [self documentDidLoad];
    }
    
    
}

-(void) documentDidLoad {
    
    [self performSelectorOnMainThread:@selector(nextQuestion:) withObject:self waitUntilDone:YES];
    [self.manageQuestionsButton setEnabled:true];
    
}

- (void)viewDidUnload
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
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
        (interfaceOrientation == UIInterfaceOrientationLandscapeRight) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)showAnswer:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    self.questionMarkLabel.alpha = 0;
    self.answerTextView.alpha = 1;
    [UIView commitAnimations];

}

- (IBAction)nextQuestion:(id)sender {
    self.questionTextView.text = @"hello";
    self.answerTextView.text = @"world";
    
    self.questionMarkLabel.alpha = 1;
    self.answerTextView.alpha = 0;
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueIdentifier = [segue identifier];
    if ( [@"manageQuestions" isEqualToString:segueIdentifier] ) {
        ListQuestionsController *destinationController = [segue destinationViewController];
        destinationController.dataManager = self.dataManager;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (CGRectContainsPoint(questionMarkLabel.frame, [[[event allTouches] anyObject] locationInView:self.view])) {
        [self showAnswer:nil];
    }
    
    [super touchesBegan:touches withEvent:event];
}

-(void) addSwipeLeftRecognizer {
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextQuestion:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftRecognizer];
}



@end
