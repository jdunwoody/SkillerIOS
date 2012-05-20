//
//  Task.h
//  Skiller
//
//  Created by James on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewableInTable.h"

@interface Task : NSObject<ViewableInTable>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, assign) BOOL status;

- (id)initWithName: (NSString *)name description:(NSString *)description status:(BOOL) status;
- (void)dump;
- (NSString *)dataForTable;
@end
