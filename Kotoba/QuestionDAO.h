//
//  QuestionDAO.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface QuestionDAO : NSObject

-(NSArray *) findAllInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError *__autoreleasing *)error;

-(NSFetchRequest *) findAllFetchRequest;

-(Question *) createNewQuestionWithValue:(NSString *)value andAnswer:(NSString *)answer inManagedObjectContext:(NSManagedObjectContext *)context;

@end
