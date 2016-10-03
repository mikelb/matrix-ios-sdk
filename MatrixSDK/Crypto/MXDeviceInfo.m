/*
 Copyright 2016 OpenMarket Ltd

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

#import "MXDeviceInfo.h"

@implementation MXDeviceInfo

- (instancetype)initWithDeviceId:(NSString *)deviceId
{
    self = [super init];
    if (self)
    {
        _deviceId = deviceId;
    }
    return self;
}

- (NSString *)fingerprint
{
    return _keys[[NSString stringWithFormat:@"ed25519:%@", _deviceId]];
}

- (NSString *)identityKey
{
    return _keys[[NSString stringWithFormat:@"curve25519:%@", _deviceId]];

}

- (NSString *)displayName
{
    return _unsignedData[@"device_display_name"];
}

#pragma mark - MXJSONModel

+ (id)modelFromJSON:(NSDictionary *)JSONDictionary
{
    MXDeviceInfo *deviceInfo = [[MXDeviceInfo alloc] initWithDeviceId:JSONDictionary[@"device_id"]];
    if (deviceInfo)
    {
        MXJSONModelSetString(deviceInfo.userId, JSONDictionary[@"user_id"]);
        MXJSONModelSetArray(deviceInfo.algorithms, JSONDictionary[@"algorithms"]);
        MXJSONModelSetDictionary(deviceInfo.keys, JSONDictionary[@"keys"]);
        MXJSONModelSetDictionary(deviceInfo.signatures, JSONDictionary[@"signatures"]);
        MXJSONModelSetDictionary(deviceInfo.unsignedData, JSONDictionary[@"unsigned"]);
    }

    return deviceInfo;
}

- (NSDictionary *)JSONDictionary
{
    NSMutableDictionary *JSONDictionary = [NSMutableDictionary dictionary];

    JSONDictionary[@"device_id"] = _deviceId;
    if (_userId)
    {
        JSONDictionary[@"user_id"] = _userId;
    }
    if (_algorithms)
    {
        JSONDictionary[@"algorithms"] = _algorithms;
    }
    if (_keys)
    {
        JSONDictionary[@"keys"] = _keys;
    }
    if (_signatures)
    {
        JSONDictionary[@"signatures"] = _signatures;
    }
    if (_unsignedData)
    {
        JSONDictionary[@"unsigned"] = _unsignedData;
    }

    return JSONDictionary;
}

- (NSDictionary *)signalableJSONDictionary
{
    NSMutableDictionary *signalableJSONDictionary = [NSMutableDictionary dictionary];

    signalableJSONDictionary[@"device_id"] = _deviceId;
    if (_userId)
    {
        signalableJSONDictionary[@"user_id"] = _userId;
    }
    if (_algorithms)
    {
        signalableJSONDictionary[@"algorithms"] = _algorithms;
    }
    if (_keys)
    {
        signalableJSONDictionary[@"keys"] = _keys;
    }

    return signalableJSONDictionary;
}

@end