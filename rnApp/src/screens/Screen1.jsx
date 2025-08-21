import React, { useState } from 'react';
import { Button, Dimensions } from 'react-native';
import {
  Container,
  ItemText,
  ButtonContainer,
  AnimationContainer,
  TextInputContainer,
  TextInput,
} from '../components/StyledComponents';
import SafeLayout from '../components/SafeLayout';
import confetti from '../assets/confetti.json';
import LottieAnimation from '../components/LottieAnimation';

export default function Screen1({ navigation, route }) {
  const gameCode = route.params?.gameCode;
  const [hasReachedMaxLines, setHasReachedMaxLines] = useState(false);
  const [value, setValue] = useState('');

  return (
    <SafeLayout>
      <Container>
        <ItemText>Screen 1 with params from ios app: {gameCode}</ItemText>
        <AnimationContainer>
          <ItemText>Lottie Animation:</ItemText>
          <LottieAnimation
            key="confetti"
            source={confetti}
            loop={true}
            autoPlay={true}
            pointerEvents="none"
            style={{
              width: Dimensions.get('window').width,
              height: 100,
            }}
          />
        </AnimationContainer>
        <TextInputContainer>
          <TextInput placeholder="Type here..." value={value} onChangeText={setValue} />
          <ItemText>Value: {value}</ItemText>
        </TextInputContainer>

        <ButtonContainer>
          <Button title="Go to Screen 2" onPress={() => navigation.navigate('Screen2')} />
        </ButtonContainer>
      </Container>
    </SafeLayout>
  );
}
