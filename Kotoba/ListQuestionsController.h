//
//  ListQuestionsController.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
@class DataManager;

@interface ListQuestionsController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) DataManager *dataManager;

@end
