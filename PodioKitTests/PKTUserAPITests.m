//
//  PKTUserAPITests.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 17/04/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PKTUserAPI.h"

@interface PKTUserAPITests : XCTestCase

@end

@implementation PKTUserAPITests

- (void)testRequestForUserStatus {
  PKTRequest *request = [PKTUserAPI requestForUserStatus];
  expect(request.method).to.equal(PKTRequestMethodGET);
  expect(request.path).to.equal(@"/user/status");
}

@end
