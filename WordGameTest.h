//
//  WordGameTest.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 8/23/11.
//  Copyright 2011 P2D. All rights reserved.
//

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
//#import "application_headers" as required

@interface WordGameTest : SenTestCase

- (void)testAppDelegate;    // simple test on application
-(void) testShouldShowTranslationAndShowNextWord;

@end
