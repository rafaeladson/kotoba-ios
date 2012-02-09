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
    NSArray *questions;
}


@property(nonatomic, retain) NSArray *questions;

-(QuestionRepository *) initWithQuestions:(NSArray *)questions;
-(Question *) nextRandomQuestion;

@end
