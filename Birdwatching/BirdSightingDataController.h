//
//  BirdSightingDataController.h
//  Birdwatching
//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BirdSighting;

@interface BirdSightingDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterBirdSightingList;

-(NSUInteger) countOfList;

-(void)addBirdSightingWithName:(NSString *)inputBirdName location:(NSString *)inputLocation;

-(BirdSighting *)objectInListAtIndex:(NSUInteger)theIndex;

@end
