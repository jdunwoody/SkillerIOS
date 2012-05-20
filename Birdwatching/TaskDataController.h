#import <Foundation/Foundation.h>
#import "ViewableInTable.h"

@class SkillTree;
@class Task;

@interface TaskDataController : NSObject

@property (nonatomic, copy) NSMutableArray *valueList;

-(NSUInteger) countOfList;

- (id)initWithSkillTree: (SkillTree *)skillTree;

-(id <ViewableInTable>)objectInListAtIndex:(NSUInteger)theIndex;

- (BOOL) updateStatus:(NSUInteger) theIndex;
@end