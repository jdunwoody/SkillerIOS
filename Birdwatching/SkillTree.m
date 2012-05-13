//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SkillTree.h"
#import "level.h"

@implementation SkillTree
@synthesize name = _name;
@synthesize score = _score;
@synthesize date = _date;
@synthesize levels = _levels;

-(id) initWithName:(NSString *)name score:(NSNumber *)score date:(NSDate *)date {
    self = [super init];
    if (self) {
        _name = name;
        _date = date;
        _score = score;
        _levels = [[NSMutableArray alloc]init];
        return self;
    }
    return self;
}

-(void) dump {
    NSLog(@"SkillTree: %@", _name);
    for (Level *level in _levels) {
        [level dump];
        
    }
}

@end
