//
//  WordGameTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 8/23/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "WordGameTest.h"
#import "KotobaAppDelegate.h"
#import "WordGameViewController.h"
#import "WordRepository.h"
#import "WordStub.h"

@implementation WordGameTest

// All code under test is in the iOS Application
- (void)testAppDelegate
{
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
}

-(void) testShouldShowAnswerAndNextQuestion {
    KotobaAppDelegate *appDelegate = (KotobaAppDelegate *)[[UIApplication sharedApplication] delegate];
    STAssertNotNil(appDelegate.window, @"Could not get reference to main window");
    WordGameViewController *rootViewController = (WordGameViewController *)appDelegate.rootViewController;
    
    UITextView *answerView = rootViewController.answerView;
    UILabel *questionMarkLabel = rootViewController.questionMarkLabel;
    
    questionMarkLabel.hidden = YES;
    //answerView.text = @"Hello World";
    //STAssertEqualObjects(answerView.text, @"Hello World", @"Text is right" );
    //STAssertEquals([questionMarkLabel isHidden], NO, @"Should be wrong");
    STAssertTrue( questionMarkLabel.isHidden , @"Testing the obvious" );
    
    
    
    STAssertFalse(questionMarkLabel.hidden, @"Question Mark should be visible when I start the app");
    STAssertTrue(answerView.hidden, @"The answer is supposed to be hidden in application start");
    
    
    [rootViewController showAnswer:nil];
    STAssertTrue(questionMarkLabel.hidden, @"When I show the answer, question mark should be invisible" );
    STAssertFalse(answerView.hidden, @"When I show the answer, the textView that holds it should be visible" );
    
    
    [rootViewController nextQuestion:nil];
    STAssertFalse(questionMarkLabel.hidden, @"Question mark should be visible when I show next Question" );
    STAssertTrue(answerView.hidden, @"The answer should be hidden when user clicked next Question" );
    
    
}


@end
