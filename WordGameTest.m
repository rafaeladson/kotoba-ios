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
    
}


@end
