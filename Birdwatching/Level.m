//
//  Created by James on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "Task.h"

@implementation Level
@synthesize name = _name;
@synthesize score = _score;
@synthesize tasks = _tasks;

-(id) initWithName:(NSString *)name score:(NSNumber *)score {
    self = [super init];
    if (self) {
        _name = name;
        _score = score;
        _tasks = [[NSMutableArray alloc]init];
        
        return self;
    }
    return self;
}

- (void)dump {
    NSLog(@"Level: %@", _name);
    for(Task *task in _tasks) {
        [task dump];
    }
}
@end