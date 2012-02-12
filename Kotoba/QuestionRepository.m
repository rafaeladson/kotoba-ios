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
    
    self.questions = [[NSMutableArray alloc] initWithArray:questionsAttr];
    [self _sortQuestionsByRandom];
    return self;
    
}

-(Question *) nextRandomQuestion {
    return [self.questions objectAtIndex:0];
}


-(void) _sortQuestionsByRandom {
    for(int i = 0; i < [self.questions count]; i++) {
        int indexOfExchange = (arc4random() % ([self.questions count] - i ) ) + i;
        [self.questions exchangeObjectAtIndex:i withObjectAtIndex:indexOfExchange];
    }
    
}






@end
