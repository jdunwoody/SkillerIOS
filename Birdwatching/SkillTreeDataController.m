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
    }
    return self;
}

- (void)initializeDefaultDataList {
    NSMutableArray *skillTreeList = [[NSMutableArray alloc] init];
    self.masterSkillTreeList = skillTreeList;
    
    NSArray *skillTrees = [self getJsonFromServer];
    
    for (id skillTree in skillTrees) {
        [self.masterSkillTreeList addObject:skillTree];
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

- (id <ViewableInTable>)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterSkillTreeList objectAtIndex:theIndex];
}


#define url [NSURL URLWithString: @"http://glowing-sunset-9969.herokuapp.com/skill_trees/everything.json"] 
// not in code listing
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

        for (id levelJson in [skillTreeJson objectForKey:@"levels"]) {
            Level *level = [[Level alloc] initWithName:[levelJson objectForKey:@"name"] score:[levelJson objectForKey:@"score"]];
            [[skillTree levels] addObject:level];
            
            for (id taskJson in [levelJson objectForKey:@"tasks"]) {
//                NSString *status = [taskJson objectForKey:@"status"];
                
                Task *task = [[Task alloc] initWithName:[taskJson objectForKey:@"name"] description:[taskJson objectForKey:@"description"] status:@"ok"];
                [[level tasks] addObject:task];
                
            }
        }
        NSLog(@">>>>>>>>> Dumping in Skill Tree Data Controller getJson for %@", name);
        [skillTree dump];
    }   
    
    return skillTrees;    
}

@end