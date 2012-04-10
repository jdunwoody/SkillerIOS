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
    
    NSArray *skillTrees = [self getJsonFromServer];
    
    for (id skillTree in skillTrees) {
        [self addSkillTreeWithName:[skillTree name] score:[skillTree score]];
    }
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

#define url [NSURL URLWithString: @"http://glowing-sunset-9969.herokuapp.com/skill_trees/everything.json"] 

- (NSArray *)getJsonFromServer {
    NSMutableArray *skillTrees = [[NSMutableArray alloc] init];
    
    NSError* error;
   
    NSData* data = [NSData dataWithContentsOfURL:url];
    
    NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (!json) {
        NSLog(@"Error = %@", error);
        return skillTrees;
    }
    
    for (id skillTreeJson in json) {
        NSString *name = [skillTreeJson objectForKey:@"name"];
        NSNumber *score = [skillTreeJson objectForKey:@"score"];
        NSDate *date = [skillTreeJson objectForKey:@"updated_at"];
    
        SkillTree *skillTree = [[SkillTree alloc] initWithName: name score:score date:date];

        [skillTrees addObject:skillTree];
    }   
    
    return skillTrees;    
}

@end