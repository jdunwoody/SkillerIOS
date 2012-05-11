#import <Foundation/Foundation.h>

@class SkillTree;

@interface TaskDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterSkillTreeList;

-(NSUInteger) countOfList;

-(void)addSkillTreeWithName:(NSString *)inputName score:(NSNumber *)inputScore;

-(SkillTree *)objectInListAtIndex:(NSUInteger)theIndex;

@end