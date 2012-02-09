//
//  Question.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject {
    NSString *value;
    NSString *answer;
}

@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) NSString *answer;


-(Question *) initWithValue:(NSString *)value andAnswer:(NSString *)answer;



@end
