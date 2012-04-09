//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SkillTree;

@interface SkillTreeDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterSkillTreeList;

-(NSUInteger) countOfList;

-(void)addSkillTreeWithName:(NSString *)inputName score:(NSString *)inputScore;

-(SkillTree *)objectInListAtIndex:(NSUInteger)theIndex;

@end
