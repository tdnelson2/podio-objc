//
//  PKTOrganizationsAPI.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 12/05/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTBaseAPI.h"

@interface PKTOrganizationsAPI : PKTBaseAPI

+ (PKTRequest *)requestForAllOrganizations;
+ (PKTRequest *)requestForOrganizationWithID:(NSUInteger)organizationID;
+ (PKTRequest *)requestToUpdateOrganizationWithID:(NSUInteger)organizationID withName:(NSString *)name;

@end
