//
//  Level.h
//  Skiller
//
//  Created by James on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import "ViewableInTable.h"

@interface Level : NSObject<ViewableInTable>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *score;
@property (readwrite, retain) NSMutableArray *tasks;

- (id)initWithName: (NSString *)name score:(NSNumber *)score;
- (void)dump;
- (NSString *)dataForTable;
@end