//
//  QuestionGameViewControllerTest.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
@class QuestionGameViewController;
//#import "application_headers" as required

@interface QuestionGameViewControllerTest : SenTestCase {
    QuestionGameViewController *controller;
}

- (void)testAnswerShouldOnlyAppearWhenUserWantsToSeeIt;    // simple test on application

@end
