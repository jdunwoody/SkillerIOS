//
//  Task.h
//  Skiller
//
//  Created by James on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, assign) NSString *status;

- (id)initWithName: (NSString *)name description:(NSString *)description status:(NSString *) status;

@end
