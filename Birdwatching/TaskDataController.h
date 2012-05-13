#import <Foundation/Foundation.h>
#import "ViewableInTable.h"

@class SkillTree;

@interface TaskDataController : NSObject

@property (nonatomic, copy) NSMutableArray *valueList;

-(NSUInteger) countOfList;

- (id)initWithSkillTree: (SkillTree *)skillTree;

-(id <ViewableInTable>)objectInListAtIndex:(NSUInteger)theIndex;

@end