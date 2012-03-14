//
//  QuestionDAO.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionDAO.h"

@implementation QuestionDAO


-(Question *)createNewQuestionWithValue:(NSString *)value andAnswer:(NSString *)answer inManagedObjectContext:(NSManagedObjectContext *)context {
    Question *newQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    newQuestion.value = value;
    newQuestion.answer = answer;
    
    return newQuestion;
}

@end
