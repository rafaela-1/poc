import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-event-emitter' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const RNEventEmitter = NativeModules.RNEventEmitter
  ? NativeModules.RNEventEmitter
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      },
    );

export function sendDataToNative(params: any): Promise<string> {
  return RNEventEmitter.sendDataToNative(params);
}
