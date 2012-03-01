//
//  Question.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OldQuestion.h"

@implementation OldQuestion


@synthesize value, answer;

-(OldQuestion *) initWithValue:(NSString *)valueAttr andAnswer:(NSString *)answerAttr {
    self.value = valueAttr;
    self.answer = answerAttr;
    return self;
}

@end
