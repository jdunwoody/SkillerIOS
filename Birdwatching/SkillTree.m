//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SkillTree.h"

@implementation SkillTree
@synthesize name = _name;
@synthesize location = _location;
@synthesize date = _date;

-(id) initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date {
    self = [super init];
    if (self) {
        _name = name;
        _date = date;
        _location = location;
        return self;
    }
    return self;
}
@end
