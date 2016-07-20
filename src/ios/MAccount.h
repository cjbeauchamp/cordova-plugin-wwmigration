//
//  MAccount.h
//  Moni
//
//  Created by Chris Beauchamp on 4/15/12.
//  Copyright (c) 2012 Chris Beauchamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Transaction;

@interface MAccount : NSManagedObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSNumber * order;
@property (nonatomic, strong) NSSet *transactions;

@property (nonatomic, strong) NSDate * modified;
@property (nonatomic, strong) NSNumber * needsUpload;
@property (nonatomic, strong) NSString * kiiURI;

@property (unsafe_unretained, nonatomic, readonly) NSDecimalNumber *transactionSum;    

@end

@interface MAccount (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(Transaction *)value;
- (void)removeTransactionsObject:(Transaction *)value;
- (void)addTransactions:(NSSet *)values;
- (void)removeTransactions:(NSSet *)values;

@end
