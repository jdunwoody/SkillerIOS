//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SkillTree;

@interface SkillTreeDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterBirdSightingList;

-(NSUInteger) countOfList;

-(void)addBirdSightingWithName:(NSString *)inputBirdName location:(NSString *)inputLocation;

-(SkillTree *)objectInListAtIndex:(NSUInteger)theIndex;

@end
