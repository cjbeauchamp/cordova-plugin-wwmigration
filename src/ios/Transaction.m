//
//  Transaction.m
//  Moni
//
//  Created by Chris Beauchamp on 7/16/12.
//  Copyright (c) 2012 Chris Beauchamp. All rights reserved.
//

#import "Transaction.h"
#import "MAccount.h"


@implementation Transaction

@dynamic amount;
@dynamic created;
@dynamic desc;
@dynamic isAdjustment;
@dynamic account;
@dynamic modified;
@dynamic needsUpload;
@dynamic kiiURI;

@end
