import React, {useRef, useEffect} from 'react';
import {InteractionManager} from 'react-native';
import LottieView from 'lottie-react-native';

function LottieAnimation({
  source,
  loop = true,
  autoPlay = true,
  onAnimationFinish = undefined,
  style = {},
  shouldUseTimeout = true,
  testID = '',
}) {
  const lottieAnimationRef = useRef(null);

  useEffect(() => {
    InteractionManager.runAfterInteractions(() => {
      if (autoPlay) {
        shouldUseTimeout
          ? setTimeout(() => lottieAnimationRef.current?.play(), 0)
          : lottieAnimationRef.current?.play();
      }
    });
  }, [autoPlay, source]);

  return (
    <LottieView
      ref={lottieAnimationRef}
      resizeMode="cover"
      loop={loop}
      source={source}
      onAnimationFinish={onAnimationFinish}
      style={style}
      testID={testID}
    />
  );
}

export default LottieAnimation;
