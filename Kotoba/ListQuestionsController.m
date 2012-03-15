//
//  ListQuestionsController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListQuestionsController.h"
#import "DataManager.h"
#import "EditQuestionController.h"
#import "PreConditions.h"
#import "QuestionDAO.h"

@implementation ListQuestionsController

@synthesize addButton = _addButton;



-(void) setDataManager:(DataManager *)dataManager {
    [PreConditions checkNotNil:dataManager];
    [super setDataManager:dataManager];
    
    QuestionDAO *questionDAO = [[QuestionDAO alloc] init];
    NSFetchRequest *fetchAllQuestionsRequest = [questionDAO findAllFetchRequest];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchAllQuestionsRequest managedObjectContext:self.dataManager.managedObjectContext sectionNameKeyPath:nil cacheName:nil];

}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) viewDidAppear:(BOOL)animated {
    self.navigationController.toolbarHidden = NO;
}

-(void) viewDidDisappear:(BOOL)animated {
    self.navigationController.toolbarHidden = YES;
}

- (void)viewDidUnload
{
    [self setAddButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
    (interfaceOrientation == UIInterfaceOrientationLandscapeRight) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"QuestionCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Question *currentQuestion = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = currentQuestion.value;
    
    return cell;
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueIdentifier = [segue identifier];
    if ( [@"newQuestion" isEqualToString:segueIdentifier] ) {
        EditQuestionController *destinationController = [segue destinationViewController];
        destinationController.dataManager = self.dataManager;
    } else if ( [@"editQuestion" isEqualToString:segueIdentifier] ) {
        EditQuestionController *destinationController = [segue destinationViewController];
        NSIndexPath *selectedCellIndexPath = [self.tableView indexPathForSelectedRow];
        Question *selectedQuestion = [self.fetchedResultsController objectAtIndexPath:selectedCellIndexPath];
        destinationController.currentQuestion = selectedQuestion;
    } else {
        [NSException raise:NSInvalidArgumentException format:@"Unsupported segue with identifier: %@", segueIdentifier];
    }
}

-(void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    if ( editing ) {
        self.addButton.enabled = NO;
    } else {
        self.addButton.enabled = YES;
    }
}

-(NSArray *) toolbarItems {
    return [NSArray arrayWithObject:self.editButtonItem];
}


@end
