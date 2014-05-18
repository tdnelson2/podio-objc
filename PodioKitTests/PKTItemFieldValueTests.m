//
//  PKTItemFieldValueTests.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 28/04/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PKTStringItemFieldValue.h"
#import "PKTDateItemFieldValue.h"
#import "PKTMoneyItemFieldValue.h"
#import "PKTEmbedItemFieldValue.h"
#import "PKTFileItemFieldValue.h"
#import "PKTAppItemFieldValue.h"
#import "PKTProfileItemFieldValue.h"
#import "PKTCalculationItemFieldValue.h"
#import "PKTCategoryItemFieldValue.h"
#import "PKTDurationItemFieldValue.h"
#import "PKTEmbed.h"
#import "PKTFile.h"
#import "PKTItem.h"
#import "PKTProfile.h"
#import "PKTDateRange.h"
#import "PKTMoney.h"
#import "PKTDuration.h"
#import "PKTCategoryOption.h"
#import "PKTNumberItemFieldValue.h"

@interface PKTItemFieldValueTests : XCTestCase

@end

@implementation PKTItemFieldValueTests

- (void)testStringValue {
  NSDictionary *valueDict = @{@"value" : @"This is a title"};
  PKTStringItemFieldValue *value = [[PKTStringItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(valueDict);
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testNumberValue {
  NSDictionary *valueDict = @{@"value" : @"12324.43277"};
  PKTNumberItemFieldValue *value = [[PKTNumberItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(valueDict);
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testDateValue {
  NSDictionary *valueDict = @{@"start" : @"2014-04-30 15:30:00",
                              @"end" : @"2014-04-30 16:00:00"};
  PKTDateItemFieldValue *value = [[PKTDateItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(valueDict);
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testMoneyValue {
  NSDictionary *valueDict = @{@"value" : @"125.532",
                              @"currency" : @"DKK"};
  PKTMoneyItemFieldValue *value = [[PKTMoneyItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(valueDict);
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testEmbedValue {
  NSDictionary *valueDict = @{@"embed" : @{@"embed_id" : @1111},
                              @"file" : @{@"file_id" : @2222}};
  PKTEmbedItemFieldValue *value = [[PKTEmbedItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(@{@"embed" : @1111});
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testFileValue {
  NSDictionary *valueDict = @{@"value" : @{@"file_id" : @2222}};
  PKTFileItemFieldValue *value = [[PKTFileItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(@{@"value" : @2222});
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testAppValue {
  NSDictionary *valueDict = @{@"value" : @{@"item_id" : @3333}};
  PKTAppItemFieldValue *value = [[PKTAppItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(@{@"value" : @3333});
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testProfileValue {
  NSDictionary *valueDict = @{@"value" : @{@"profile_id" : @4444}};
  PKTProfileItemFieldValue *value = [[PKTProfileItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(@{@"value" : @4444});
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testCalculationValue {
  NSDictionary *valueDict = @{@"value" : @324};
  PKTCalculationItemFieldValue *value = [[PKTCalculationItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.beNil();
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testCategoryValue {
  NSDictionary *valueDict = @{
      @"value" : @{@"option_id" : @123,
                   @"status" : @"active",
                   @"text" : @"First option",
                   @"color" : @"ff0000"}};
  PKTCategoryItemFieldValue *value = [[PKTCategoryItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(@{@"value" : @123});
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testDurationValue {
  NSDictionary *valueDict = @{@"value" : @101010};
  PKTDurationItemFieldValue *value = [[PKTDurationItemFieldValue alloc] initFromValueDictionary:valueDict];
  expect(value.valueDictionary).to.equal(@{@"value" : @101010});
  expect(value.unboxedValue).toNot.beNil();
}

- (void)testBoxedValueSupportForValidStringValue {
  expect([PKTStringItemFieldValue supportsBoxingOfValue:@"Some text"]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidNumberValue {
  expect([PKTNumberItemFieldValue supportsBoxingOfValue:@32123.432]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidDateValue {
  PKTDateRange *value = [[PKTDateRange alloc] initWithStartDate:[NSDate date] endDate:[NSDate date]];
  expect([PKTDateItemFieldValue supportsBoxingOfValue:value]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidMoneyValue {
  PKTMoney *value = [[PKTMoney alloc] initWithAmount:@125.5 currency:@"DKK"];
  expect([PKTMoneyItemFieldValue supportsBoxingOfValue:value]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidEmbedValue {
  PKTEmbed *embed = [[PKTEmbed alloc] init];;
  expect([PKTEmbedItemFieldValue supportsBoxingOfValue:embed]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidFileValue {
  PKTFile *file = [[PKTFile alloc] init];
  expect([PKTFileItemFieldValue supportsBoxingOfValue:file]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidAppValue {
  PKTItem *item = [[PKTItem alloc] init];
  expect([PKTAppItemFieldValue supportsBoxingOfValue:item]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidProfileValue {
  PKTProfile *profile = [[PKTProfile alloc] init];
  expect([PKTProfileItemFieldValue supportsBoxingOfValue:profile]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidCategoryValue {
  PKTCategoryOption *option = [PKTCategoryOption new];
  expect([PKTCategoryItemFieldValue supportsBoxingOfValue:option]).to.beTruthy();
}

- (void)testBoxedValueSupportForValidDurationValue {
  PKTDuration *duration = [[PKTDuration alloc] initWithHours:3 minutes:23 seconds:55];
  expect([PKTDurationItemFieldValue supportsBoxingOfValue:duration]).to.beTruthy();
}

- (void)testBoxedValueSupportForInvalidStringValue {
  expect([PKTStringItemFieldValue supportsBoxingOfValue:@32123]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidNumberValue {
  expect([PKTNumberItemFieldValue supportsBoxingOfValue:@"32123.432"]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidDateValue {
  expect([PKTDateItemFieldValue supportsBoxingOfValue:@"Invalid value"]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidMoneyValue {
  expect([PKTMoneyItemFieldValue supportsBoxingOfValue:@"Invalid value"]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidEmbedValue {
  expect([PKTEmbedItemFieldValue supportsBoxingOfValue:@"Invalid value"]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidFileValue {
  expect([PKTFileItemFieldValue supportsBoxingOfValue:@"Invalid value"]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidAppValue {
  expect([PKTAppItemFieldValue supportsBoxingOfValue:@"Invalid value"]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidProfileValue {
  expect([PKTProfileItemFieldValue supportsBoxingOfValue:@"Invalid value"]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidCategoryValue {
  expect([PKTCategoryItemFieldValue supportsBoxingOfValue:@"Invalid value"]).to.beFalsy();
}

- (void)testBoxedValueSupportForInvalidDurationValue {
  expect([PKTDurationItemFieldValue supportsBoxingOfValue:@"Invalid value"]).to.beFalsy();
}

@end
