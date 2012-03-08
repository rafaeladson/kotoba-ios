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
@property (strong, nonatomic, readwrite) DataManager *dataManager;
-(void) addSwipeLeftRecognizer;
-(void) dataManagerReady:(NSNotification *)notification;

@end
@implementation QuestionGameController
@synthesize questionTextView;
@synthesize answerTextView;
@synthesize questionMarkLabel;
@synthesize cursor = _cursor, dataManager = _dataManager;



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
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(dataManagerReady:) name:DOCUMENT_READY object:self.dataManager];
    
    self.dataManager = [[DataManager alloc] initWithDatabaseName:@"kotoba"];
    
}

-(void) dataManagerReady:(NSNotification *)notification {
    
    OldQuestion *question = [[OldQuestion alloc] initWithValue:@"What's the meaning to life, the universe and everything else" andAnswer:@"42" ];
    NSArray *questions = [[NSArray alloc] initWithObjects:question , nil];
    
    self.cursor = [[CircularItemCursor alloc] initWithArray:questions];

    
    [self performSelectorOnMainThread:@selector(nextQuestion:) withObject:self waitUntilDone:YES];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *applicationStartedNotification = [NSNotification notificationWithName:@"APPLICATION_STARTED" object:self];
    [notificationCenter postNotification:applicationStartedNotification];
    
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
    questionMarkLabel.alpha = 0;
    answerTextView.alpha = 1;
    [UIView commitAnimations];

}

- (IBAction)nextQuestion:(id)sender {
    OldQuestion *question = self.cursor.currentItem;
    questionTextView.text = question.value;
    answerTextView.text = question.answer;
    
    questionMarkLabel.alpha = 1;
    answerTextView.alpha = 0;
    
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
