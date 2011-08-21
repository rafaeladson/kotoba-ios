//
//  Word.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/27/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "Word.h"
#import <stdio.h>

@implementation Word

@synthesize wordValue, answer;

- (id)initWithValue: (NSString *) pWordValue andAnswer: (NSString * )pWordAnswer 
{
    self = [super init];
    if (self) {
        self.wordValue = pWordValue;
        self.answer = pWordAnswer;
        

    }
    
    return self;
}

-(NSComparisonResult) compareRandomlyWithAnotherWord:(Word *)anotherWord {
    int greaterSelector = arc4random() % 2;
    return (greaterSelector == 0 ) ? NSOrderedAscending : NSOrderedDescending;
}



@end
