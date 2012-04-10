//
//  Task.m
//  Skiller
//
//  Created by James on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Task.h"

@implementation Task
@synthesize name = _name;
@synthesize description = _description;
@synthesize status = _status;

-(id) initWithName:(NSString *)name description:(NSString *)description status:(BOOL)status {
    self = [super init];
    if (self) {
        _name = name;
        _description = description;
        _status = status;
        return self;
    }
    return self;
}

@end
