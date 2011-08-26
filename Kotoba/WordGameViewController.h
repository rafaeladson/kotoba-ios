//
//  KotobaViewController.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/26/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WordRepository;
@class Word;


@interface WordGameViewController : UIViewController {
    UILabel *wordLabel;
    UILabel *answerLabel;
    WordRepository *repository;
    Word *selectedWord;
    
}

@property (nonatomic, strong) IBOutlet UILabel *wordLabel;
@property (nonatomic, strong) IBOutlet UILabel *answerLabel;
- (IBAction)nextWord:(id)sender;
- (IBAction)showAnswer:(id)sender;
- (void) setRepository:(WordRepository *)newRepository;



@end
