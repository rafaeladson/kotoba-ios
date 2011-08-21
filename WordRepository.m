//
//  WordRepository.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 8/18/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import "WordRepository.h"
#import "Word.h"
#import <stdio.h>

@implementation WordRepository

- (id)init
{
    return [self initWithWords:[[NSArray alloc] initWithObjects:
                       [[Word alloc] initWithValue:@"おじいさん" andAnswer:@"(seu) Avô"],
                       [[Word alloc] initWithValue:@"おばあさん" andAnswer:@"(sua) Avó"],
                       [[Word alloc] initWithValue:@"おとうさん" andAnswer:@"(seu) Pai"],
                       [[Word alloc] initWithValue:@"おかあさん" andAnswer:@"(sua) Mãe"],
                       [[Word alloc] initWithValue:@"おにいさん" andAnswer:@"(seu) Irmão mais velho"],
                       [[Word alloc] initWithValue:@"おねえさん" andAnswer:@"(sua) Irmã mais velha"],
                       [[Word alloc] initWithValue:@"おとうとさん" andAnswer:@"(seu) Irmão mais novo"],
                       [[Word alloc] initWithValue:@"おもうとさん" andAnswer:@"(sua) Irmã mais nova"],
                       [[Word alloc] initWithValue:@"おじさん" andAnswer:@"(seu) Tio"],
                       [[Word alloc] initWithValue:@"おばさん" andAnswer:@"(sua) Tia"],
                       [[Word alloc] initWithValue:@"いとこさん" andAnswer:@"(seu) Primo"],
                       [[Word alloc] initWithValue:@"そふ" andAnswer:@"(meu) Avô"],
                       [[Word alloc] initWithValue:@"そぼ" andAnswer:@"(minha) Avó"],
                       [[Word alloc] initWithValue:@"ちち" andAnswer:@"(meu) Pai"],
                       [[Word alloc] initWithValue:@"はは" andAnswer:@"(minha) Mãe"],
                       [[Word alloc] initWithValue:@"あに" andAnswer:@"(meu) Irmão mais velho"],
                       [[Word alloc] initWithValue:@"あね" andAnswer:@"(minha) Irmã mais velha"],
                       [[Word alloc] initWithValue:@"おとうと" andAnswer:@"(meu) Irmão mais novo"],
                       [[Word alloc] initWithValue:@"いもうと" andAnswer:@"(minha) Irmã mais nova"],
                       [[Word alloc] initWithValue:@"おじ" andAnswer:@"(meu) Tio"],
                       [[Word alloc] initWithValue:@"おば" andAnswer:@"(minha) Tia"],
                       [[Word alloc] initWithValue:@"りょうしん" andAnswer:@"(meus) pais"],
                       [[Word alloc] initWithValue:@"しゅじん。おっと" andAnswer:@"(meu) marido, esposo"],
                       [[Word alloc] initWithValue:@"かない。つま" andAnswer:@"(minha) esposa"],
                       [[Word alloc] initWithValue:@"こども" andAnswer:@"(meu) filho, (minha) filha, criança"],
                       [[Word alloc] initWithValue:@"むすこ" andAnswer:@"(meu) filho"],
                       [[Word alloc] initWithValue:@"むすめ" andAnswer:@"(minha) filha"],
                       [[Word alloc] initWithValue:@"おい" andAnswer:@"(meu) sobrinho"],
                       [[Word alloc] initWithValue:@"めい" andAnswer:@"(minha) sobrinha"],
                       [[Word alloc] initWithValue:@"まご" andAnswer:@"(meu) neto, (minha) neta"],
                       [[Word alloc] initWithValue:@"ひとりっこ" andAnswer:@"filho(a) único(a)"],
                       [[Word alloc] initWithValue:@"ごりょうしん" andAnswer:@"(seus) pais"],
                       [[Word alloc] initWithValue:@"ごしゅじん" andAnswer:@"(seu) marido, esposo"],
                       [[Word alloc] initWithValue:@"おくさん" andAnswer:@"(sua) esposa"],
                       [[Word alloc] initWithValue:@"おこさん" andAnswer:@"(seu) filho, (sua) filha"],
                       [[Word alloc] initWithValue:@"むすこさん" andAnswer:@"(seu) filho"],
                       [[Word alloc] initWithValue:@"むすめさん" andAnswer:@"(sua) filha"],
                       [[Word alloc] initWithValue:@"おいごさん" andAnswer:@"(seu) sobrinho"],
                       [[Word alloc] initWithValue:@"めいごさん" andAnswer:@"(sua) sobrinha"],
                       [[Word alloc] initWithValue:@"おまごさん" andAnswer:@"(seu) neto, (sua) neta"], nil ] ];
    
}

-(id) initWithWords:(NSArray *)newWords {
    self = [super init];
    if( self ) {
        self->words = newWords;
        self->previousSelectedWord = nil;
        [self buildRandomOrderedWordsArray];
    }
    
    return self;
}


-(Word *) getRandomWord {
    
    if ( [self->words count] == 0) {
        return nil;
    }
    else {
        if ( [self->randomOrderedWords count] == 0 ) {
            [self buildRandomOrderedWordsArray];
        }
        
        Word *selectedWord = [self->randomOrderedWords objectAtIndex:0];
        [self->randomOrderedWords removeObjectAtIndex:0];
        return selectedWord;

    }
}

-(void) buildRandomOrderedWordsArray {
    NSArray *randomOrderedWordsTempArray = [self->words sortedArrayUsingSelector:@selector(compareRandomlyWithAnotherWord:) ];
    self->randomOrderedWords = [ [NSMutableArray alloc] initWithArray:randomOrderedWordsTempArray];
}

@end
