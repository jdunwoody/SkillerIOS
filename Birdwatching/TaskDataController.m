#import "TaskDataController.h"
#import "SkillTree.h"
#import "ViewableInTable.h"

@implementation TaskDataController

@synthesize valueList = _valueList;

- (id)initWithSkillTree: (SkillTree *)skillTree {
    if (self = [super init]) {
        self.valueList = [[NSMutableArray alloc] init];
        [self.valueList addObject:skillTree];
        
        for (Level *level in skillTree.levels) {
            [self.valueList addObject:level];
            for (Task *task in level.tasks) {
                [self.valueList addObject:task];
            }
        }
        NSLog(@"Initialised TaskDataController with %d values", [self.valueList count]);
    }
    NSLog(@"Dumping Task Data controller");
    [skillTree dump];
    return self;
}

- (void)setValueList:(NSMutableArray *)newList {
    if(_valueList != newList) {
        _valueList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfList {
    return [self.valueList count];
}

- (id <ViewableInTable>)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.valueList objectAtIndex:theIndex];
}

@end