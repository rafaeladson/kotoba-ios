//
//  WordRepository.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 8/18/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Word;

@interface WordRepository : NSObject {
    NSArray *words;
    Word *previousSelectedWord;
    
}

- (id)init;
- (id)initWithWords:(NSArray *)words;
- (Word *)getRandomWord;



@end
