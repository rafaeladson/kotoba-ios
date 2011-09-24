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
    UILabel *questionMarkLabel;
    UITextView *answerView;
    
}

@property (nonatomic, strong) IBOutlet UITextView *answerView;
@property (nonatomic, strong) IBOutlet UILabel *questionMarkLabel;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *editButton;
- (IBAction)nextQuestion:(id)sender;
- (void)hideAnswer;
- (IBAction)showAnswer:(id)sender;



@end
