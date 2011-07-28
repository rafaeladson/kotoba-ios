//
//  Word.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 7/27/11.
//  Copyright 2011 P2D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject {
    NSString *original;
    NSString *translation;
    
}

@property (nonatomic, retain) NSString *original;

@property (nonatomic, retain ) NSString *translation;

-(id)initWithOriginal: (NSString *)original andTranslation: (NSString *) translation;

@end
