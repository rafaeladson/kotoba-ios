//
//  Word.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/27/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject {
    NSString *wordValue;
    NSString *answer;
    
}

@property (nonatomic, retain) NSString *wordValue;

@property (nonatomic, retain ) NSString *answer;

-(id)initWithValue: (NSString *)wordValue andAnswer: (NSString *) answer;

@end
