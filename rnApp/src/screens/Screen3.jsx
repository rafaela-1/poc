import React, { useEffect } from 'react';
import { Button } from 'react-native';
import SafeLayout from '../components/SafeLayout';
import { Container, ItemText, ButtonContainer } from '../components/StyledComponents';

export default function Screen3({ navigation, route }) {
  const gameCode = route.params?.gameCode;

  return (
    <SafeLayout>
      <Container>
        <ItemText>Screen 3 with params from ios app: {gameCode}</ItemText>
        <ButtonContainer>
          <Button title="press me" onPress={() => {}} />
        </ButtonContainer>
      </Container>
    </SafeLayout>
  );
}
