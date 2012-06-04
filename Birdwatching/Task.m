//
//  Task.m
//  Skiller
//
//  Created by James on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Task.h"

@implementation Task
@synthesize taskId = _taskId;
@synthesize name = _name;
@synthesize description = _description;
@synthesize status = _status;

- (id)initWithTaskId:(NSString *)taskId name:(NSString *)name description:(NSString *)description status:(BOOL) status {
    self = [super init];
    if (self) {
        _name = name;
        _description = description;
        _status = status;
        _taskId = taskId;
        return self;
    }
    return self;
}

-(void) dump {
    NSLog(@"Task: %@", _name);
}

- (NSString *)dataForTable {
    return [NSString stringWithFormat:@"Task: %@", _name];
}

@end
