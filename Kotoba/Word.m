//
//  Word.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/27/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "Word.h"

@implementation Word

@synthesize original, translation;

- (id)initWithOriginal: (NSString *) originalWord andTranslation: (NSString * )wordTranslation 
{
    self = [super init];
    if (self) {
        self.original = originalWord;
        self.translation = wordTranslation;
        

    }
    
    return self;
}



@end
