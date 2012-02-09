//
//  QuestionRepository.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionRepository.h"
#import "Question.h"

@implementation QuestionRepository 

@synthesize questions;

-(QuestionRepository *) initWithQuestions:(NSArray *)questionsAttr {
    self.questions = questionsAttr;
    return self;
}

-(Question *) nextRandomQuestion {
    return [self.questions objectAtIndex:0];
}






@end
