import { NativeModules, NativeEventEmitter } from 'react-native';

const { RNDynamicEventEmitter } = NativeModules;

const eventEmitter = new NativeEventEmitter(RNDynamicEventEmitter);

const subscription = eventEmitter.addListener('EventFromRN', (event) => {
  console.log('Got event from native:', event);
});

const sendDataToNative = (params) => {
  RNDynamicEventEmitter.sendEventToNative(params);
};

export { sendDataToNative, subscription };
