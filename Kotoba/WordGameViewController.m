//
//  KotobaViewController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/26/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "WordGameViewController.h"
#import <stdio.h>
#import "KotobaAppDelegate.h"

@implementation WordGameViewController
@synthesize questionMarkLabel, answerView;
@synthesize editButton;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self nextQuestion:nil];
    self.answerView.text = @"Hello World";
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

- (IBAction)nextQuestion:(id)sender {
    [self hideAnswer];
}

- (IBAction)showAnswer:(id)sender {
    questionMarkLabel.hidden = YES;
    answerView.hidden = NO;
}


- (void) hideAnswer {
    NSLog(@"%d,%d", questionMarkLabel.hidden, answerView.hidden);
    questionMarkLabel.hidden = NO;
    answerView.hidden = YES;
    NSLog(@"%d,%d", questionMarkLabel.hidden, answerView.hidden);
}


@end
