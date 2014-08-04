//
//  PKTAsyncTask.h
//  PodioFoundation
//
//  Created by Sebastian Rehnby on 28/07/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PKTAsyncTaskResolver;

typedef void (^PKTAsyncTaskCompleteBlock) (id result, NSError *error);
typedef void (^PKTAsyncTaskSuccessBlock) (id result);
typedef void (^PKTAsyncTaskErrorBlock) (NSError *error);
typedef void (^PKTAsyncTaskCancelBlock) (void);
typedef PKTAsyncTaskCancelBlock (^PKTAsyncTaskResolveBlock) (PKTAsyncTaskResolver *resolver);

@interface PKTAsyncTask : NSObject

@property (readonly) BOOL succeeded;
@property (readonly) BOOL errored;

+ (instancetype)taskForBlock:(PKTAsyncTaskResolveBlock)block;

- (instancetype)onComplete:(PKTAsyncTaskCompleteBlock)completeBlock;
- (instancetype)onSuccess:(PKTAsyncTaskSuccessBlock)successBlock;
- (instancetype)onError:(PKTAsyncTaskErrorBlock)errorBlock;
- (instancetype)onSuccess:(PKTAsyncTaskSuccessBlock)successBlock onError:(PKTAsyncTaskErrorBlock)errorBlock;

- (void)cancel;

// Combinators
+ (instancetype)when:(NSArray *)tasks;
- (instancetype)map:(id (^)(id result))block;
- (instancetype)flattenMap:(PKTAsyncTask *(^)(id result))block;

@end

@interface PKTAsyncTaskResolver : NSObject

- (void)succeedWithResult:(id)result;
- (void)failWithError:(NSError *)error;

@end