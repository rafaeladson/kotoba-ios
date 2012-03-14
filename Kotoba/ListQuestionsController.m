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

@synthesize dataManager = _dataManager;


-(void) setDataManager:(DataManager *)dataManager {
    [PreConditions checkNotNil:dataManager];
    _dataManager = dataManager;
    
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


- (void)viewDidUnload
{
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
    } else {
        [NSException raise:NSInvalidArgumentException format:@"Unsupported segue with identifier: %@", segueIdentifier];
    }
}



@end
