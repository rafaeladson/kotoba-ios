//
//  KotobaViewController.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/26/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "KotobaViewController.h"
#import <stdio.h>
#import "Word.h"

@implementation KotobaViewController
@synthesize wordLabel, wordsInDatabase;
@synthesize selectedWordIndex;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    wordsInDatabase = [[NSArray alloc] initWithObjects:
                       [[Word alloc] initWithOriginal:@"おじいさん" andTranslation:@"(seu) Avô"],
                       [[Word alloc] initWithOriginal:@"おばあさん" andTranslation:@"(sua) Avó"],
                       [[Word alloc] initWithOriginal:@"おとうさん" andTranslation:@"(seu) Pai"],
                       [[Word alloc] initWithOriginal:@"おかあさん" andTranslation:@"(sua) Mãe"],
                       [[Word alloc] initWithOriginal:@"おにいさん" andTranslation:@"(seu) Irmão mais velho"],
                       [[Word alloc] initWithOriginal:@"おねえさん" andTranslation:@"(sua) Irmã mais velha"],
                       [[Word alloc] initWithOriginal:@"おとうとさん" andTranslation:@"(seu) Irmão mais novo"],
                       [[Word alloc] initWithOriginal:@"おもうとさん" andTranslation:@"(sua) Irmã mais nova"],
                       [[Word alloc] initWithOriginal:@"おじさん" andTranslation:@"(seu) Tio"],
                       [[Word alloc] initWithOriginal:@"おばさん" andTranslation:@"(sua) Tia"],
                       [[Word alloc] initWithOriginal:@"いとこさん" andTranslation:@"(seu) Primo"],
                       [[Word alloc] initWithOriginal:@"そふ" andTranslation:@"(meu) Avô"],
                       [[Word alloc] initWithOriginal:@"そぼ" andTranslation:@"(minha) Avó"],
                       [[Word alloc] initWithOriginal:@"ちち" andTranslation:@"(meu) Pai"],
                       [[Word alloc] initWithOriginal:@"はは" andTranslation:@"(minha) Mãe"],
                       [[Word alloc] initWithOriginal:@"あに" andTranslation:@"(meu) Irmão mais velho"],
                       [[Word alloc] initWithOriginal:@"あね" andTranslation:@"(minha) Irmã mais velha"],
                       [[Word alloc] initWithOriginal:@"おとうと" andTranslation:@"(meu) Irmão mais novo"],
                       [[Word alloc] initWithOriginal:@"いもうと" andTranslation:@"(minha) Irmã mais nova"],
                       [[Word alloc] initWithOriginal:@"おじ" andTranslation:@"(meu) Tio"],
                       [[Word alloc] initWithOriginal:@"おば" andTranslation:@"(minha) Tia"],
                       [[Word alloc] initWithOriginal:@"りょうしん" andTranslation:@"(meus) pais"],
                       [[Word alloc] initWithOriginal:@"しゅじん。おっと" andTranslation:@"(meu) marido, esposo"],
                       [[Word alloc] initWithOriginal:@"かない。つま" andTranslation:@"(minha) esposa"],
                       [[Word alloc] initWithOriginal:@"こども" andTranslation:@"(meu) filho, (minha) filha, criança"],
                       [[Word alloc] initWithOriginal:@"むすこ" andTranslation:@"(meu) filho"],
                       [[Word alloc] initWithOriginal:@"むすめ" andTranslation:@"(minha) filha"],
                       [[Word alloc] initWithOriginal:@"おい" andTranslation:@"(meu) sobrinho"],
                       [[Word alloc] initWithOriginal:@"めい" andTranslation:@"(minha) sobrinha"],
                       [[Word alloc] initWithOriginal:@"まご" andTranslation:@"(meu) neto, (minha) neta"],
                       [[Word alloc] initWithOriginal:@"ひとりっこ" andTranslation:@"filho(a) único(a)"],
                       [[Word alloc] initWithOriginal:@"ごりょうしん" andTranslation:@"(seus) pais"],
                       [[Word alloc] initWithOriginal:@"ごしゅじん" andTranslation:@"(seu) marido, esposo"],
                       [[Word alloc] initWithOriginal:@"おくさん" andTranslation:@"(sua) esposa"],
                       [[Word alloc] initWithOriginal:@"おこさん" andTranslation:@"(seu) filho, (sua) filha"],
                       [[Word alloc] initWithOriginal:@"むすこさん" andTranslation:@"(seu) filho"],
                       [[Word alloc] initWithOriginal:@"むすめさん" andTranslation:@"(sua) filha"],
                       [[Word alloc] initWithOriginal:@"おいごさん" andTranslation:@"(seu) sobrinho"],
                       [[Word alloc] initWithOriginal:@"めいごさん" andTranslation:@"(sua) sobrinha"],
                       [[Word alloc] initWithOriginal:@"おまごさん" andTranslation:@"(seu) neto, (sua) neta"], nil ];

                       
    [self nextWord: nil];
    answerLabel.text = @"";
    
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
    selectedWordIndex = arc4random() % ([wordsInDatabase count]);
    wordLabel.text = [[wordsInDatabase objectAtIndex:selectedWordIndex] original];
    answerLabel.text = @"";
    
}

- (IBAction)showTranslationOrOriginal:(id)sender {
        answerLabel.text = [[wordsInDatabase objectAtIndex:selectedWordIndex] translation];
}

@end
