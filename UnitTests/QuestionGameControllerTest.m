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


@interface QuestionGameControllerTest : GHAsyncTestCase

@property(strong, nonatomic) QuestionGameController *controller;
@property(strong, nonatomic) UIStoryboard *storyboard;

-(void) applicationStarted:(NSNotification *)notification;

@end

@implementation QuestionGameControllerTest

@synthesize controller = _controller, storyboard = _storyboard;


-(void) setUp {
    self.storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    self.controller = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionGameController"];
    
    [self prepare];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationStarted:) name:@"APPLICATION_STARTED" object:self.controller];
    [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.controller viewDidLoad ];
    
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
}


-(void) applicationStarted:(NSNotification *)notification {
    [self notify:kGHUnitWaitStatusSuccess forSelector:nil];
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


@end
