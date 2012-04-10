//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SkillTree.h"

@implementation SkillTree
@synthesize name = _name;
@synthesize score = _score;
@synthesize date = _date;

-(id) initWithName:(NSString *)name score:(NSNumber *)score date:(NSDate *)date {
    self = [super init];
    if (self) {
        _name = name;
        _date = date;
        _score = score;
        return self;
    }
    return self;
}
@end
