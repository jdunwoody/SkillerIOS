#import <Foundation/Foundation.h>
#import "ViewableInTable.h"

@class SkillTree;

@interface SkillTreeDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterSkillTreeList;

-(NSUInteger) countOfList;

-(id <ViewableInTable>)objectInListAtIndex:(NSUInteger)theIndex;

@end
