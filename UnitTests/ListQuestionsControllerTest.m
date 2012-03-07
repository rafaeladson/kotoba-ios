//
//  ListQuestionsControllerTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import "DataManagerBaseTest.h"
#import "ListQuestionsController.h"
#import "EditQuestionController.h"
#import "Question.h"
#import "DataManager.h"


@interface ListQuestionsControllerTest : DataManagerBaseTest

@property (nonatomic, strong) ListQuestionsController *controller;
@property (nonatomic, strong) UIStoryboard *storyboard;

-(Question *) questionForValue:(NSString *)value andAnswer:(NSString *)answer;
-(bool) cellAtRow:(int)row hasText:(NSString *) text;

@end


@implementation ListQuestionsControllerTest

@synthesize controller = _controller, storyboard = _storyboard;

-(void) setUpClass {
    [self startWithDatabaseName:@"test_list_questions_controller"];
}

-(void) setUp {
    
    self.storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    self.controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ListQuestionsController"];
    [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
    [self.controller viewDidLoad ];
}

-(void) testShouldPerformSegueForNewQuestion {
    self.controller.dataManager = self.dataManager;
    EditQuestionController *destinationController = [self.storyboard instantiateViewControllerWithIdentifier:@"EditQuestionController"];
    
    UIStoryboardSegue *segue = [[UIStoryboardSegue alloc] initWithIdentifier:@"newQuestion" source:self.controller destination:destinationController];
    [self.controller prepareForSegue:segue sender:nil];
    
    GHAssertNotNil(destinationController.dataManager, nil);
    GHAssertEqualObjects(destinationController.dataManager, self.dataManager, nil);
}

-(void) testShouldNotPerformInvalidSegue {
    EditQuestionController *destinationController = [self.storyboard instantiateViewControllerWithIdentifier:@"EditQuestionController"];
    UIStoryboardSegue *segue = [[UIStoryboardSegue alloc] initWithIdentifier:@"invalid_segue" source:self.controller destination:destinationController];
    GHAssertThrows([self.controller prepareForSegue:segue sender:nil], nil);
}

-(void) testShouldShowOneQuestionIfThereIsOneOnDatabaseWhenSettingDataManager {
    Question *question = [self questionForValue:@"foo" andAnswer:@"bar"];
    
    self.controller.dataManager = self.dataManager;
    int numberOfRowsInTable = [self.controller tableView:self.controller.tableView numberOfRowsInSection:0];
    GHAssertEquals(1, numberOfRowsInTable, nil);
    
    GHAssertTrue([self cellAtRow:0 hasText:@"foo"], nil);
        
    [self.dataManager.managedObjectContext deleteObject:question];
}

-(void) testShouldShowManyQuestionsOnAlphabeticalOrder {
    Question *questionA = [self questionForValue:@"Avocato" andAnswer:@"fruit"];
    Question *questionB = [self questionForValue:@"Banana" andAnswer:@"fruit"];
    Question *questionC = [self questionForValue:@"blueberry" andAnswer:@"fruit"];
    Question *questionD = [self questionForValue:@"apple" andAnswer:@"fruit"];
    
    self.controller.dataManager = self.dataManager;
    int numberOfRowsInTable = [self.controller tableView:self.controller.tableView numberOfRowsInSection:0];
    GHAssertEquals(4, numberOfRowsInTable, nil);

    GHAssertTrue([self cellAtRow:0 hasText:@"apple"], nil);
    GHAssertTrue([self cellAtRow:1 hasText:@"Avocato"], nil);
    GHAssertTrue([self cellAtRow:2 hasText:@"Banana"], nil);
    GHAssertTrue([self cellAtRow:3 hasText:@"blueberry"], nil);
    
    [self.dataManager.managedObjectContext deleteObject:questionA];
    [self.dataManager.managedObjectContext deleteObject:questionB];
    [self.dataManager.managedObjectContext deleteObject:questionC];
    [self.dataManager.managedObjectContext deleteObject:questionD];
    
}

-(void) testShouldNotHaveAnyCellForZeroQuestions {
    self.controller.dataManager = self.dataManager;
    int numberOfRowsInTable = [self.controller tableView:self.controller.tableView numberOfRowsInSection:0];
    GHAssertEquals(0, numberOfRowsInTable, nil);
}

-(Question *) questionForValue:(NSString *)value andAnswer:(NSString *)answer {
    Question *question = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:self.dataManager.managedObjectContext];
    question.value = value;
    question.answer = answer;
    
    return question;
}


-(bool) cellAtRow:(int)row hasText:(NSString *)text {
    UITableViewCell *cell = [self.controller tableView:self.controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
    return [cell.textLabel.text isEqualToString:text];
}



@end
