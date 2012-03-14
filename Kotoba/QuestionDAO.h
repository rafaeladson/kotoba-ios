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

-(Question *) createNewQuestionWithValue:(NSString *)value andAnswer:(NSString *)answer inManagedObjectContext:(NSManagedObjectContext *)context;

@end
