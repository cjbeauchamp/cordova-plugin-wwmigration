//
//  DeleteTransaction.h
//  Moni
//
//  Created by Chris on 1/7/14.
//  Copyright (c) 2014 Chris Beauchamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DeleteTransaction : NSManagedObject

@property (nonatomic, retain) NSString * kiiURI;

@end
