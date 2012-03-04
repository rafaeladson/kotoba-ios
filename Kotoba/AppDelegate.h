//
//  AppDelegate.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIViewController *rootViewController;
}

@property (strong, nonatomic) UIWindow *window;

@property (readwrite, strong, nonatomic) UIViewController *rootViewController;

- (NSURL *)applicationDocumentsDirectory;

@end
