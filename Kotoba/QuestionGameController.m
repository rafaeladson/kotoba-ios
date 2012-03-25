//
//  QuestionGameViewController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionGameController.h"
#import "AppDelegate.h"
#import "QuestionDAO.h"
#import "CircularItemCursor.h"
#import "DataManager.h"
#import "ListQuestionsController.h"
#import "AlertHelper.h"



@interface QuestionGameController() 

@property (strong, nonatomic) CircularItemCursor *cursor;
@property (strong, nonatomic) QuestionDAO *questionDAO;
@property BOOL documentReady;

-(void) reloadCursor;
-(void) addSwipeLeftRecognizer;
-(void) restoreDefaultTextViewValues;

@end
@implementation QuestionGameController
@synthesize questionTextView;
@synthesize answerTextView;
@synthesize questionMarkLabel;
@synthesize cursor = _cursor, dataManager = _dataManager, manageQuestionsButton = _manageQuestionsButton,
    questionDAO = _questionDAO, documentReady = _documentReady;



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
    self.questionDAO = [[QuestionDAO alloc] init];
    self.documentReady = NO;
    [self.navigationController.toolbar setTintColor:self.navigationController.navigationBar.tintColor];
    [super viewDidLoad];
    if ( self.dataManager == nil ) {
        [self.manageQuestionsButton setEnabled:false];
        self.dataManager = [[DataManager alloc] initWithDatabaseName:@"kotoba" andDelegate:self];
    } else {
        [self documentDidLoad];
    }
    
    
}

-(void) documentDidLoad {
    self.documentReady = YES;
    [self.manageQuestionsButton setEnabled:true];
    [self reloadCursor];
    [self addSwipeLeftRecognizer];
}

-(void) viewDidAppear:(BOOL)animated {
    [self reloadCursor];
    self.navigationController.toolbarHidden = YES;
}

-(void) viewDidDisappear:(BOOL)animated {
    self.cursor = nil;
}



- (void)viewDidUnload
{
    self.documentReady = NO;
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
    if ( self.cursor != nil ) {
        Question *question = self.cursor.currentItem;
        self.questionTextView.text = question.value;
        self.answerTextView.text = question.answer;
        [self.cursor goToNext];
    } else {
        [self restoreDefaultTextViewValues];
    }
    
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

-(void) reloadCursor {
    NSError *error = nil;
    NSArray *questions = [self.questionDAO findAllInManagedObjectContext:self.dataManager.managedObjectContext error:&error ];
    if ( error == nil ) {
        if ( [questions count] > 0 ) {
            self.cursor = [[CircularItemCursor alloc] initWithArray:questions];
        } else {
            self.cursor = nil;
        }
        [self performSelectorOnMainThread:@selector(nextQuestion:) withObject:self waitUntilDone:YES];

    } else {
        AlertHelper *helper = [[AlertHelper alloc] init];
        [helper showAlertDialogWithMessage:NSLocalizedString(@"Error: Could not fetch questions from database", nil)];
        NSLog(@"Error: could not fetch questions from database. Reason: %@", [error localizedDescription]);
    }

}

-(void) addSwipeLeftRecognizer {
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextQuestion:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftRecognizer];
}

-(void) restoreDefaultTextViewValues {
    NSString *defaultAnswerText = @"You can click in the Edit Button to see the list of questions you have in database and to add new Questions. When you come back here, the questions you registered will be presented to you in a random order.";
    NSString *defaultQuestionText = @"How do I use Kotoba?";
    
    self.questionTextView.text = defaultQuestionText;
    self.answerTextView.text = defaultAnswerText;

}



@end
