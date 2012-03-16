//
//  QuestionGameControllerTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import "QuestionGameController.h"
#import "ListQuestionsController.h"
#import "DataManagerBaseTest.h"
#import "QuestionDAO.h"


@interface QuestionGameControllerTest : DataManagerBaseTest

@property(strong, nonatomic) QuestionGameController *controller;
@property(strong, nonatomic) UIStoryboard *storyboard;
@property(strong, nonatomic) QuestionDAO *dao;

@end

@implementation QuestionGameControllerTest

@synthesize controller = _controller, storyboard = _storyboard, dao = _dao;


-(void) setUpClass {
    [self startWithDatabaseName:@"question_game_controller_test"];
}

-(void) setUp {
    self.dao = [[QuestionDAO alloc] init];
    self.storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    self.controller = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionGameController"];
    
    self.controller.dataManager = self.dataManager;
    [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.controller viewDidLoad ];
    
}

-(void)testAnswerShouldOnlyAppearWhenUserWantsToSeeIt  {
    GHAssertNotNil(self.controller, @"Setup did not run");
    UITextView *answerTextView = [self.controller answerTextView];
    UILabel *questionMarkLabel = [self.controller questionMarkLabel];
    
    GHAssertEquals((int)answerTextView.alpha, 0, @"Answer should not be shown at startup");
    GHAssertEquals((int)questionMarkLabel.alpha, 1, @"Question mark should be shown at startup");
    
    [self.controller performSelectorOnMainThread:@selector(showAnswer:) withObject:nil waitUntilDone:YES];
    GHAssertEquals((int)questionMarkLabel.alpha, 0, @"Question mark should have vanished when user wants too see answer");
    GHAssertEquals((int)answerTextView.alpha, 1, @"Answer should have appeared when user clicked on show answer");
    
    [self.controller performSelectorOnMainThread:@selector(nextQuestion:) withObject:nil waitUntilDone:YES];
    GHAssertEquals((int)answerTextView.alpha, 0, @"Answer should not be shown when new question appear");
    GHAssertEquals((int)questionMarkLabel.alpha, 1, @"Question mark should be shown when new question appear");
}

-(void) testShouldPrepareSegueForManagingQuestions {
    ListQuestionsController *destinationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListQuestionsController"];
    
    UIStoryboardSegue *segue = [[UIStoryboardSegue alloc] initWithIdentifier:@"manageQuestions" source:self.controller destination:destinationController];
    [self.controller prepareForSegue:segue sender:nil];
    
    GHAssertNotNil(destinationController.dataManager, nil);
}

-(void) testReloadCursor {
    UITextView *answerTextView = [self.controller answerTextView];
    UITextView *questionTextView = [self.controller questionTextView];
    
    NSString *defaultAnswerText = @"You can click in the Edit Button to see the list of questions you have in database and to add new Questions. When you come back here, the questions you registered will be presented to you in a random order.";
    NSString *defaultQuestionText = @"How do I use Kotoba?";
    
    GHAssertEqualStrings(defaultQuestionText, questionTextView.text, nil);
    GHAssertEqualStrings(defaultAnswerText, answerTextView.text, nil);
    
    Question *question = [self.dao createNewQuestionWithValue:@"foo" andAnswer:@"bar" inManagedObjectContext:self.dataManager.managedObjectContext];
    [self.controller performSelectorOnMainThread:@selector(viewDidAppear:) withObject:nil waitUntilDone:YES];
    GHAssertEqualStrings(@"foo", questionTextView.text, nil);
    GHAssertEqualStrings(@"bar", answerTextView.text, nil);
    
    [self.dataManager.managedObjectContext deleteObject:question];
    [self.controller performSelectorOnMainThread:@selector(viewDidAppear:) withObject:nil waitUntilDone:YES];
    GHAssertEqualStrings(defaultQuestionText, questionTextView.text, nil);
    GHAssertEqualStrings(defaultAnswerText, answerTextView.text, nil);
    
    
}

-(void) testWordGameWithTwoWords {
    [self.dao createNewQuestionWithValue:@"question01" andAnswer:@"answer01" inManagedObjectContext:self.dataManager.managedObjectContext];
    [self.dao createNewQuestionWithValue:@"question02" andAnswer:@"answer02" inManagedObjectContext:self.dataManager.managedObjectContext];
    [self.controller performSelectorOnMainThread:@selector(viewDidAppear:) withObject:nil waitUntilDone:YES];
    
    UITextView *questionTextView = [self.controller questionTextView];
    NSString *firstQuestionValue = questionTextView.text;
    GHAssertNotNil(firstQuestionValue, nil);
    GHAssertTrue([firstQuestionValue isEqualToString:@"question01"] || [firstQuestionValue isEqualToString:@"question02"], 
                 @"Actual value: %@", firstQuestionValue);
    
    [self.controller performSelectorOnMainThread:@selector(nextQuestion:) withObject:nil waitUntilDone:YES];
    NSString *secondQuestionValue = questionTextView.text;
    GHAssertNotNil(secondQuestionValue, nil);
    GHAssertNotEqualStrings(firstQuestionValue, secondQuestionValue, nil);
    GHAssertTrue([secondQuestionValue isEqualToString:@"question01"] || [secondQuestionValue isEqualToString:@"question02"], 
                 @"Actual value: %@", secondQuestionValue);
    
    [self.controller performSelectorOnMainThread:@selector(nextQuestion:) withObject:nil waitUntilDone:YES];
    NSString *thirdQuestionValue = questionTextView.text;
    GHAssertNotNil(thirdQuestionValue, nil);
    GHAssertTrue([thirdQuestionValue isEqualToString:firstQuestionValue] || [thirdQuestionValue isEqualToString:secondQuestionValue], 
                 @"Actual value: %@", thirdQuestionValue);
    
}


-(void) tearDown {
    [self deleteInstancesWithEntityName:@"Question"];
}

@end
