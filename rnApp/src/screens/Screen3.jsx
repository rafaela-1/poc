import React from 'react';
import { Button } from 'react-native';
import SafeLayout from '../components/SafeLayout';
import { Container, ItemText, ButtonContainer } from '../components/StyledComponents';
import { sendDataToNative, subscription } from '../utils/RNDynamicEventEmitter';

export default function Screen3({ navigation, route }) {
  const gameCode = route.params?.gameCode;

  useEffect(() => {
    return () => subscription.remove();
  }, []);

  const sendParams = () => {
    sendDataToNative({ message: 'Hello from React Native!', timestamp: Date.now() });
  };

  return (
    <SafeLayout>
      <Container>
        <ItemText>Send params to ios</ItemText>
        <ButtonContainer>
          <Button title="press me" onPress={sendParams} />
        </ButtonContainer>
      </Container>
    </SafeLayout>
  );
}
