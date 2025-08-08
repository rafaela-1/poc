import React from 'react';
import { View, Button, Alert } from 'react-native';
import { Container, ItemText } from './src/components/StyledComponents';
import SafeLayout from './src/components/SafeLayout';
import { SafeAreaProvider, initialWindowMetrics } from 'react-native-safe-area-context';

const App2 = ({ gameCode }) => {
  const showAlert = () => {
    Alert.alert('Hello from module 2');
  };

  return (
    <SafeAreaProvider initialMetrics={initialWindowMetrics}>
      <SafeLayout>
        <Container>
          <ItemText>Hello from module 2 with params from ios app: {gameCode}</ItemText>
          <Button title="Press me" onPress={showAlert} />
        </Container>
      </SafeLayout>
    </SafeAreaProvider>
  );
};

export default App2;
