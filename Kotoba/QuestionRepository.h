//
//  QuestionRepository.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Question;

@interface QuestionRepository : NSObject {
    NSMutableArray *questions;
}


@property(nonatomic, retain) NSMutableArray *questions;

-(QuestionRepository *) initWithQuestions:(NSArray *)questions;
-(Question *) nextRandomQuestion;
-(void) _sortQuestionsByRandom;
@end
