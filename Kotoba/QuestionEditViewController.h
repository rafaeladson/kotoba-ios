//
//  QuestionEditViewController.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UIPlaceHolderTextView;

@interface QuestionEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *questionTextField;
@property (weak, nonatomic) IBOutlet UIPlaceHolderTextView *answerTextView;
- (IBAction)onSaveAction:(id)sender;

@end
