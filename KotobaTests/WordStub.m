//
//  WordStub.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 8/21/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "WordStub.h"

@implementation WordStub

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(NSComparisonResult) compareRandomlyWithAnotherWord:(Word *)anotherWord {
    return NSOrderedAscending;
}

@end
