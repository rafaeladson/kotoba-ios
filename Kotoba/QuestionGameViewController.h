//
//  QuestionGameViewController.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionGameViewController : UIViewController {
    UITextView *answerTextView;
    UILabel *questMarkLabel;
}

@property (strong, nonatomic) IBOutlet UITextView *answerTextView;
@property (strong, nonatomic) IBOutlet UILabel *questionMarkLabel;
- (IBAction)showAnswer:(id)sender;
- (IBAction)nextQuestion:(id)sender;


@end
