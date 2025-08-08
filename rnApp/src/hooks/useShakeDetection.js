import {useEffect} from 'react';
import {AppState} from 'react-native';
import RNShake from 'react-native-shake';

export const executeIfAppIsActive = fn => AppState.currentState === 'active' && fn();

const useShakeDetection = ({shouldAbortShake, onShake}) => {
  let RNShakeListener;

  useEffect(() => {
    if (shouldAbortShake) {
      RNShakeListener?.remove();
    } else {
      RNShakeListener = RNShake.addListener(() => executeIfAppIsActive(onShake));
    }

    return () => RNShakeListener?.remove();
  }, [shouldAbortShake, onShake]);
};

export default useShakeDetection;
