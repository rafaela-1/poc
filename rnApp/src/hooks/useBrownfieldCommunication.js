import { useEffect, useRef } from 'react';
import { NativeModules, NativeEventEmitter } from 'react-native';
//import BrownfieldCommunication from 'react-native-brownfield-communication';

// const { BrownfieldCommunication } = NativeModules;
console.log('Available NativeModules:', Object.keys(NativeModules));
// console.log('BrownfieldCommunication:', BrownfieldCommunication);

// const nativeBridgeEmitter = new NativeEventEmitter(BrownfieldCommunication);

export function useBrownfieldCommunication(onEvent) {
  // const subscription = useRef(null);
  // useEffect(() => {
  //   if (onEvent) {
  //     subscription.current = nativeBridgeEmitter.addListener('BrownfieldEvent', onEvent);
  //   }
  //   return () => {
  //     if (subscription.current) {
  //       subscription.current.remove();
  //       subscription.current = null;
  //     }
  //   };
  // }, [onEvent]);
  // function sendDataToNative(params, callback) {
  //   console.log('Attempting to call sendDataToNative with params:', params);
  //   if (BrownfieldCommunication && BrownfieldCommunication.sendDataToNative) {
  //     BrownfieldCommunication.sendDataToNative(params, callback);
  //   } else {
  //     console.error('BrownfieldCommunication.sendDataToNative is not available');
  //     callback && callback(['Error: Module not available']);
  //   }
  // }
  // function sendDataToJS() {
  //   console.log('Attempting to call sendDataToJS');
  //   if (BrownfieldCommunication && BrownfieldCommunication.sendDataToJS) {
  //     BrownfieldCommunication.sendDataToJS();
  //   } else {
  //     console.error('BrownfieldCommunication.sendDataToJS is not available');
  //   }
  // }
  // return { sendDataToNative, sendDataToJS, subscription: subscription.current };
}
