//
//  Account.m
//  Moni
//
//  Created by Chris Beauchamp on 4/15/12.
//  Copyright (c) 2012 Chris Beauchamp. All rights reserved.
//

#import "MAccount.h"
#import "Transaction.h"


@implementation MAccount

@dynamic name;
@dynamic order;
@dynamic transactions;
@dynamic modified;
@dynamic needsUpload;
@dynamic kiiURI;

- (NSDecimalNumber *) transactionSum {
    return [self valueForKeyPath:@"transactions.@sum.amount"];
}

@end
