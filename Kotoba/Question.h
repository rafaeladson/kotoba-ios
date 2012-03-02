//
//  Question.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Question : NSManagedObject

@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) NSString * answer;

@end
