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


@interface ListQuestionsControllerTest : DataManagerBaseTest

@property (nonatomic, strong) ListQuestionsController *controller;
@property (nonatomic, strong) UIStoryboard *storyboard;

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


@end
