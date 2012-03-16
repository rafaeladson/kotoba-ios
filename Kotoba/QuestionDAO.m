//
//  QuestionDAO.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionDAO.h"

@implementation QuestionDAO

-(NSArray *)findAllInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError *__autoreleasing *)error {
    NSFetchRequest *request = [self findAllFetchRequest];
    NSArray *questions = [context executeFetchRequest:request error:error];
    return questions;
}

-(NSFetchRequest *) findAllFetchRequest {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Question"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"value" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    request.sortDescriptors = sortDescriptors;
    
    return request;
}

-(Question *)createNewQuestionWithValue:(NSString *)value andAnswer:(NSString *)answer inManagedObjectContext:(NSManagedObjectContext *)context {
    Question *newQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    newQuestion.value = value;
    newQuestion.answer = answer;
    
    return newQuestion;
}


@end
