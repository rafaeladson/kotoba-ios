//
//  Question.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Question.h"

@implementation Question


@synthesize value, answer;

-(Question *) initWithValue:(NSString *)valueAttr andAnswer:(NSString *)answerAttr {
    self.value = valueAttr;
    self.answer = answerAttr;
    return self;
}

@end
