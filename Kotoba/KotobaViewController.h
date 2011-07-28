//
//  KotobaViewController.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/26/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KotobaViewController : UIViewController {
    UILabel *wordLabel;
    NSArray *wordsInDatabase;
    @private int selectedWordIndex;
    IBOutlet UILabel *answerLabel;
}

@property (nonatomic, strong) IBOutlet UILabel *wordLabel;
@property (nonatomic, retain) NSArray *wordsInDatabase;
- (IBAction)nextWord:(id)sender;
- (IBAction)showTranslationOrOriginal:(id)sender;
@property (readwrite, assign) int selectedWordIndex;


@end
