//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SkillTreeDataController.h"
#import "SkillTree.h"

@interface SkillTreeDataController ()
- (void)initializeDefaultDataList;
@end

@implementation SkillTreeDataController

@synthesize masterSkillTreeList = _masterSkillTreeList;

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;
}

- (void)initializeDefaultDataList {
    NSMutableArray *skillTreeList = [[NSMutableArray alloc] init];
    self.masterSkillTreeList = skillTreeList;
    [self addSkillTreeWithName:@"Programming" score:@"1"];
}

- (void)setMasterSkillTreeList:(NSMutableArray *)newList {
    if(_masterSkillTreeList != newList) {
        _masterSkillTreeList = [newList mutableCopy];
    }
}
 
- (NSUInteger)countOfList {
    return [self.masterSkillTreeList count];
}

- (SkillTree *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterSkillTreeList objectAtIndex:theIndex];
}

- (void)addSkillTreeWithName:(NSString *)inputName score:(NSString *)inputScore {
    NSDate *today = [NSDate date];
    SkillTree *skillTree = [[SkillTree alloc] initWithName:inputName score:inputScore date:today];
    [self.masterSkillTreeList addObject:skillTree];
}
@end
