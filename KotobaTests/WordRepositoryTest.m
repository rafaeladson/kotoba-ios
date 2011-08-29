//
//  WordRepositoryTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 8/19/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "WordRepositoryTest.h"
#import "WordRepository.h"
#import "Word.h"
#import "WordStub.h"

@implementation WordRepositoryTest

- (void)testShouldGetNonNullRandomWord {
    WordRepository *repository = [[WordRepository alloc] init];
    Word *randomWord = [repository getRandomWord];
    STAssertNotNil(randomWord, @"Got a null word from word Repository");   
}

- (void)testShouldNotReturnSameWordTwiceIfMoreThanTwoWords {
    WordRepository *repository = [[WordRepository alloc] initWithWords:[NSArray arrayWithObjects:
                                                                        [[Word alloc] initWithValue:@"Kotoba" andAnswer:@"Word"],
                                                                        [[Word alloc] initWithValue:@"Wort" andAnswer:@"Word"], nil]];
    Word *firstRandomWord = [repository getRandomWord];
    STAssertNotNil(firstRandomWord, @"Repository returned nil for getRandomWord");
    Word *secondRandomWord = [repository getRandomWord];
    STAssertNotNil(secondRandomWord, @"Repository returned nil for getRandomWord");
    STAssertFalse([firstRandomWord isEqual: secondRandomWord], [NSString stringWithFormat: @"%@ should be different than %@", [firstRandomWord wordValue], [secondRandomWord wordValue]]);
}

- (void)testShouldReturnSameWordTwiceIfOnlyOneWord {
    WordRepository *repository = [[WordRepository alloc] initWithWords:[NSArray arrayWithObjects:
                                                                        [[Word alloc] initWithValue:@"Kotoba" andAnswer:@"Word"], nil] ];
    Word *firstRandomWord = [repository getRandomWord];
    STAssertNotNil(firstRandomWord, @"Random word should not be null");
    
    Word *secondRandomWord = [repository getRandomWord];
    STAssertEqualObjects(firstRandomWord, secondRandomWord, [NSString stringWithFormat:@"%@ should be the same as %@", [firstRandomWord wordValue], [secondRandomWord wordValue]]);
}

- (void)testShouldReturnNilIfHasNoWords {
    WordRepository *repository = [[WordRepository alloc] initWithWords:[NSArray arrayWithObjects:nil]];
    Word *randomWord = [repository getRandomWord];
    STAssertNil(randomWord, @"Word should be nil when there's no word in the array");
}

- (void)testShouldRestartQueue {
    WordRepository *repository = [[WordRepository alloc] initWithWords: [NSArray arrayWithObjects:
                                  [[WordStub alloc] initWithValue:@"Kotoba" andAnswer:@"Word"],
                                   [[WordStub alloc] initWithValue:@"Inu" andAnswer:@"Dog"], nil] ];
    
    Word *firstWord = [repository getRandomWord];
    STAssertEquals(@"Kotoba", [firstWord wordValue], [NSString stringWithFormat:@"%@ should be equal to Kotoba", [firstWord wordValue]]);
    
    Word *secondWord = [repository getRandomWord];
    STAssertEquals(@"Inu", [secondWord wordValue], [NSString stringWithFormat:@"%@ should be equal to Inu", [secondWord wordValue]]);
    
    Word *firstWordAfterRestartQueue = [repository getRandomWord];
    STAssertEqualObjects(firstWord, firstWordAfterRestartQueue, @"Queue was not reinitialized correctly");
}





@end
