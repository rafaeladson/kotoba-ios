//
//  QuestionEditViewControllerTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GHUnitIOS/GHUnit.h>
#import "DataManagerBaseTest.h"
#import "EditQuestionController.h"
#import "UIPlaceHolderTextView.h"
#import "ViewHelper.h"
#import "QuestionDAO.h"
#import "DataManager.h"
#import "OCMockObject.h"
#import "AlertHelper.h"

@interface EditQuestionControllerTest : DataManagerBaseTest

@property (nonatomic, strong) EditQuestionController *controller;
@property (nonatomic, strong) ViewHelper *viewHelper;
@property (nonatomic, strong) QuestionDAO *dao;

@end


@implementation EditQuestionControllerTest

@synthesize controller = _controller, viewHelper = _viewHelper, dao = _dao;

-(void) setUpClass {
    [self startWithDatabaseName:@"test_question_edit_view_controller"];
    self.viewHelper = [[ViewHelper alloc] init];
    self.dao = [[QuestionDAO alloc] init];
}

-(void) setUp {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    self.controller = [storyBoard instantiateViewControllerWithIdentifier:@"EditQuestionController"];
    [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];

    [self.controller viewDidLoad ];
}

-(void) testPreconditions {
    GHAssertNotNil(self.controller.answerTextView, nil);
    GHAssertNotNil(self.controller.questionTextField, nil);
    
    GHAssertEqualStrings(@"Please type your answer here", self.controller.answerTextView.placeholder, nil);
}


-(void) testSaveNewQuestion {
    self.controller.dataManager = self.dataManager;
    [self.viewHelper typeText:@"foo" onTextField:self.controller.questionTextField];
    GHAssertEqualStrings(@"foo", self.controller.questionTextField.text, nil);
    [self.viewHelper typeText:@"bar" onTextView:self.controller.answerTextView];
    [self.controller onSaveAction:nil];
    
    NSArray *questions = [self getAllInstancesOfEntity:@"Question"];
    GHAssertTrue([questions count] == 1, @"%d == 1", [questions count]);
    
    Question *questionFromDb = [questions objectAtIndex:0];
    GHAssertEqualStrings(@"foo", questionFromDb.value, nil);
    GHAssertEqualStrings(@"bar", questionFromDb.answer, nil);
}

-(void) testSaveQuestionOnEdit {
    Question *existingQuestion = [self.dao createNewQuestionWithValue:@"foo" andAnswer:@"bar" inManagedObjectContext:self.dataManager.managedObjectContext];
    
    self.controller.dataManager = self.dataManager;
    self.controller.currentQuestion = existingQuestion;
    
    [self.viewHelper typeText:@"What's the color of milk?" onTextField:self.controller.questionTextField];
    [self.viewHelper typeText:@"White" onTextView:self.controller.answerTextView];
    [self.controller onSaveAction:nil];
    
    GHAssertEqualStrings(@"What's the color of milk?", existingQuestion.value, nil);
    GHAssertEqualStrings(@"White", existingQuestion.answer, nil);
    
    NSArray *questions = [self getAllInstancesOfEntity:@"Question"];
    int numberOfQuestions = [questions count];
    GHAssertEquals(1, numberOfQuestions, nil);
}

-(void) testShouldShowAlertWhenQuestionFieldIsEmpty {
    self.controller.dataManager = self.dataManager;
    [self.viewHelper typeText:@"bar" onTextView:self.controller.answerTextView];
    
    id mockedHelper = [OCMockObject mockForClass:[AlertHelper class]];
    [[mockedHelper expect] showAlertDialogWithMessage:@"Please type a question."];
    [self.controller mockAlertHelper:mockedHelper];
    
    [self.controller onSaveAction:nil];
    
    [mockedHelper verify];
    
    NSArray *questions = [self getAllInstancesOfEntity:@"Question"];
    GHAssertTrue([questions count] == 0, @"No questions should have been saved. Found: %d", [questions count]);
}


-(void) tearDown {
    [self deleteInstancesWithEntityName:@"Question"];
}

@end
