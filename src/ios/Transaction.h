//
//  Transaction.h
//  Moni
//
//  Created by Chris Beauchamp on 7/16/12.
//  Copyright (c) 2012 Chris Beauchamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MAccount, RecurringTransaction;

@interface Transaction : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * isAdjustment;
@property (nonatomic, retain) MAccount *account;

@property (nonatomic, strong) NSDate * modified;
@property (nonatomic, strong) NSNumber * needsUpload;
@property (nonatomic, strong) NSString * kiiURI;

@end
