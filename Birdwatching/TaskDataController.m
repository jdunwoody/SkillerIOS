#import "TaskDataController.h"
#import "SkillTree.h"

//@interface TaskDataController ()
//- (void)initializeWithSkillTree;
//@end

@implementation TaskDataController

@synthesize valueList = _valueList;

- (id)initWithSkillTree: (SkillTree *)skillTree {
    if (self = [super init]) {
//        NSMutableArray *valueList = [[NSMutableArray alloc] init];
        self.valueList = [[NSMutableArray alloc] init];
        [self.valueList addObject:skillTree.name];
        
        for (Level *level in skillTree.levels) {
            [self.valueList addObject:level.name];
            for (Task *task in level.tasks) {
                [self.valueList addObject:task.name];
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
    NSUInteger count = [self.valueList count];
//    NSLog(@"Number of tasks: %@", count);

    return count;
}

- (NSString *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.valueList objectAtIndex:theIndex];
}

//- (void)addSkillTreeWithName:(NSString *)inputName score:(NSNumber *)inputScore {
//    NSDate *today = [NSDate date];
//    SkillTree *skillTree = [[SkillTree alloc] initWithName:inputName score:inputScore date:today];
//    [self.masterSkillTreeList addObject:skillTree];
//}

//#define url [NSURL URLWithString: @"http://glowing-sunset-9969.herokuapp.com/skill_trees/everything.json"] 
//// not in code listing
//- (NSArray *)getJsonFromServer {
//    NSMutableArray *skillTrees = [[NSMutableArray alloc] init];
//    
//    NSError* error;
//    
//    NSData* data = [NSData dataWithContentsOfURL:url];
//    
//    NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    if (!json) {
//        NSLog(@"Error = %@", error);
//        return skillTrees;
//    }
//    
//    for (id skillTreeJson in json) {
//        NSString *name = [skillTreeJson objectForKey:@"name"];
//        NSNumber *score = [skillTreeJson objectForKey:@"score"];
//        NSDate *date = [skillTreeJson objectForKey:@"updated_at"];
//        
//        SkillTree *skillTree = [[SkillTree alloc] initWithName: name score:score date:date];
//        [skillTrees addObject:skillTree];
//        
//        for (id levelJson in [skillTreeJson objectForKey:@"levels"]) {
//            Level *level = [[Level alloc] initWithName:[levelJson objectForKey:@"name"] score:[levelJson objectForKey:@"score"]];
//            [[skillTree levels] addObject:level];
//            
//            for (id taskJson in [levelJson objectForKey:@"tasks"]) {
//                NSString *status = [taskJson objectForKey:@"status"];
//                
//                Task *task = [[Task alloc] initWithName:[taskJson objectForKey:@"name"] description:[taskJson objectForKey:@"description"] status:status];
//                [[level tasks] addObject:task];
//                
//            }
//        }
//    }   
//    
//    return skillTrees;    
//}

@end