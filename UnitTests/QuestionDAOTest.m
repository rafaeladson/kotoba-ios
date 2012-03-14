//
//  QuestionDAOTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManagerBaseTest.h"
#import "QuestionDAO.h"
#import "DataManager.h"

@interface QuestionDAOTest : DataManagerBaseTest

@property (strong, nonatomic) QuestionDAO *dao;

@end


@implementation QuestionDAOTest

@synthesize dao = _dao;

-(void) setUpClass {
    [self startWithDatabaseName:@"questionDAO_test"];
    self.dao = [[QuestionDAO alloc] init];
}

-(void) testCreateNewQuestion {
    Question *question = [self.dao createNewQuestionWithValue:@"foo" andAnswer:@"bar" inManagedObjectContext:self.dataManager.managedObjectContext];
    GHAssertEqualStrings(@"foo", question.value, nil);
    GHAssertEqualStrings(@"bar", question.answer, nil);
    
    NSArray *questions = [self getAllInstancesOfEntity:@"Question"];
    int numberOfQuestions = [questions count];
    GHAssertEquals(1, numberOfQuestions, nil);
    GHAssertEqualObjects(question, [questions objectAtIndex:0], nil);
}

-(void) tearDown {
    [self deleteInstancesWithEntityName:@"Question"];
}

@end
