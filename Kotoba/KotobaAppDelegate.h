//
//  KotobaAppDelegate.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/26/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KotobaAppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate> {
    UINavigationController *navigationController;

}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UINavigationController *navigationController;





@end
