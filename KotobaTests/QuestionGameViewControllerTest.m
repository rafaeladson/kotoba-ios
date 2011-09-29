//
//  QuestionGameViewControllerTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionGameViewControllerTest.h"
#import "QuestionGameViewController.h"
#import "AppDelegate.h"

@implementation QuestionGameViewControllerTest

// All code under test is in the iOS Application
- (void)setUp
{
    AppDelegate *yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
    
    self->controller = (QuestionGameViewController *)yourApplicationDelegate.rootViewController;
    STAssertNotNil(self->controller, @"Failed to find root view controller");
    
    
}

-(void)testAnswerShouldOnlyAppearWhenUserWantsToSeeIt  {
    STAssertNotNil(self->controller, @"Setup did not run");
    UITextView *answerTextView = [self->controller answerTextView];
    UILabel *questionMarkLabel = [self->controller questionMarkLabel];
    
    STAssertTrue(answerTextView.hidden, @"Answer should not be shown at startup");
    STAssertFalse(questionMarkLabel.hidden, @"Question mark should be shown at startup");
    
    [self->controller showAnswer:nil];
    STAssertTrue(questionMarkLabel.hidden, @"Question mark should have vanished when user wants too see answer");
    STAssertFalse(answerTextView.hidden, @"Answer should have appeared when user clicked on show answer");
    
    [self->controller nextQuestion:nil];
    STAssertTrue(answerTextView.hidden, @"Answer should not be shown when new question appear");
    STAssertFalse(questionMarkLabel.hidden, @"Question mark should be shown when new question appear");
    
    
}



@end
