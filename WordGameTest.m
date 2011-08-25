//
//  WordGameTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 8/23/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "WordGameTest.h"
#import "KotobaAppDelegate.h"
#import "KotobaViewController.h"
#import "WordRepository.h"
#import "WordStub.h"

@implementation WordGameTest

// All code under test is in the iOS Application
- (void)testAppDelegate
{
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
}

-(void) testShouldShowTranslationAndShowNextWord {
    KotobaAppDelegate *appDelegate = (KotobaAppDelegate *)[[UIApplication sharedApplication] delegate];
    STAssertNotNil(appDelegate.window, @"Could not get reference to main window");
    KotobaViewController *rootViewController = (KotobaViewController *)appDelegate.rootViewController;
    
    UILabel *wordLabel = rootViewController.wordLabel;
    UILabel *answerLabel = rootViewController.answerLabel;
    
    STAssertNotNil(wordLabel.text, @"Could get value for text on rootViewController");
    STAssertEqualObjects(@"", answerLabel.text, @"Answer label should have no value" );
    
    [rootViewController showTranslationOrOriginal:nil];
    STAssertFalse([answerLabel.text isEqual: @""], @"Answer was not initialized");
    
    [rootViewController setRepository: [[WordRepository alloc] initWithWords:[[NSArray alloc] initWithObjects:
                                                                              [[WordStub alloc] initWithValue:@"foo" andAnswer:@"bar"], nil]]];
                                                                                                                                           
    [rootViewController nextWord:nil];
    STAssertEqualObjects(@"foo", wordLabel.text, @"worldlabel was not set to first word" );
    STAssertEqualObjects(@"", answerLabel.text, @"Answer label should have no value" );
    
    [rootViewController showTranslationOrOriginal:nil];
    STAssertEqualObjects(@"bar", answerLabel.text, @"Did not show correct translation");
    
}


@end
