#import <Foundation/Foundation.h>

@class SkillTree;

@interface TaskDataController : NSObject

@property (nonatomic, copy) NSMutableArray *valueList;

-(NSUInteger) countOfList;

//-(void)addSkillTreeWithName:(NSString *)inputName score:(NSNumber *)inputScore;
- (id)initWithSkillTree: (SkillTree *)skillTree;

-(NSString *)objectInListAtIndex:(NSUInteger)theIndex;

@end