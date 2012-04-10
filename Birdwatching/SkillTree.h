//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "level.h"

@interface SkillTree : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *score;
@property (nonatomic, copy) NSDate *date;
@property (readwrite, retain) NSMutableArray *levels;

- (id)initWithName: (NSString *)name score:(NSNumber *)score date:(NSDate *)date;

@end
