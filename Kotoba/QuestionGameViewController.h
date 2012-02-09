//
//  QuestionGameViewController.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuestionRepository;

@interface QuestionGameViewController : UIViewController {
    UITextView *questionTextView;
    UITextView *answerTextView;
    UILabel *questMarkLabel;
    QuestionRepository *repository;
    
}

@property (strong, nonatomic) IBOutlet UITextView *questionTextView;
@property (strong, nonatomic) IBOutlet UITextView *answerTextView;
@property (strong, nonatomic) IBOutlet UILabel *questionMarkLabel;
@property (strong, nonatomic) QuestionRepository *repository;
- (IBAction)showAnswer:(id)sender;
- (IBAction)nextQuestion:(id)sender;


@end
