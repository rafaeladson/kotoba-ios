//
//  WordRepositoryTest.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 8/19/11.
//  Copyright 2011 P2D. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>

@interface WordRepositoryTest : SenTestCase

- (void)testShouldGetNonNullRandomWord;
- (void)testShouldNotReturnSameWordTwiceIfMoreThanTwoWords;
- (void)testShouldReturnSameWordTwiceIfOnlyOneWord;
- (void)testShouldReturnNilIfHasNoWords;
- (void)testShouldRestartQueue;


@end
