//
//  KotobaViewController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/26/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "WordGameViewController.h"
#import <stdio.h>
#import "Word.h"
#import "WordRepository.h"
#import "KotobaAppDelegate.h"

@implementation WordGameViewController
@synthesize wordLabel, answerLabel;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void) setRepository:(WordRepository *)newRepository {
    self->repository = newRepository;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    KotobaAppDelegate *appDelegate = (KotobaAppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.rootViewController = self;
    
    self->repository = [[WordRepository alloc] init];
    self->selectedWord = nil;
                       
    [self nextWord: nil];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)nextWord: (id)sender {
    self->selectedWord = [self->repository getRandomWord];
    wordLabel.text = [self->selectedWord wordValue];
    answerLabel.text = @"";
}

- (IBAction)showAnswer:(id)sender {
    answerLabel.text = [self->selectedWord answer];
}

@end
