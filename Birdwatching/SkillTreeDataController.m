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

@synthesize masterBirdSightingList = _masterBirdSightingList;

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;
}

- (void)initializeDefaultDataList {
    NSMutableArray *sightedList = [[NSMutableArray alloc] init];
    self.masterBirdSightingList = sightedList;
    [self addBirdSightingWithName:@"Pigeon" location:@"Everywhere"];
}

- (void)setMasterBirdSightingList:(NSMutableArray *)newList {
    if(_masterBirdSightingList != newList) {
        _masterBirdSightingList = [newList mutableCopy];
    }
}
 
- (NSUInteger)countOfList {
    return [self.masterBirdSightingList count];
}

- (SkillTree *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterBirdSightingList objectAtIndex:theIndex];
}

- (void)addBirdSightingWithName:(NSString *)inputBirdName location:(NSString *)inputLocation {
    NSDate *today = [NSDate date];
    SkillTree *sighting = [[SkillTree alloc] initWithName:inputBirdName location:inputLocation date:today];
    [self.masterBirdSightingList addObject:sighting];
}
@end
