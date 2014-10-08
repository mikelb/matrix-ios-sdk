/*
 Copyright 2014 OpenMarket Ltd
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <Foundation/Foundation.h>

// The URL of your test home server
FOUNDATION_EXPORT NSString * const kMXTestsHomeServerURL;

// The URL to the home server hosted on matrix.org
// @TODO: To remove once we will be able to feed a test HS with data.
FOUNDATION_EXPORT NSString * const kMXTestsMatrixHomeServerURL;


@interface MatrixSDKTestsData : NSObject

@end