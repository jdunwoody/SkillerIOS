//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkillTree : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSDate *date;

- (id)initWithName: (NSString *)name score:(NSString *)score date:(NSDate *)date;
@end
