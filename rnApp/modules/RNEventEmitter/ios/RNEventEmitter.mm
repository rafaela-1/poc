#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(RNEventEmitter, RCTEventEmitter)

RCT_EXTERN_METHOD(sendDataToNative:(NSDictionary *)params)


+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
