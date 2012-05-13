//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "level.h"
#import "ViewableInTable.h"

@interface SkillTree : NSObject<ViewableInTable>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *score;
@property (nonatomic, strong) NSDate *date;
@property (readwrite, retain) NSMutableArray *levels;

- (id)initWithName: (NSString *)name score:(NSNumber *)score date:(NSDate *)date;
- (void)dump;
- (NSString *)dataForTable;
@end
