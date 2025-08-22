import React, { useState } from 'react';
import { View, Button, Alert, NativeModules, NativeEventEmitter, Text } from 'react-native';
import {
  Container,
  ItemText,
  TextInput,
  TextInputContainer,
} from './src/components/StyledComponents';
import SafeLayout from './src/components/SafeLayout';
import { SafeAreaProvider, initialWindowMetrics } from 'react-native-safe-area-context';
import { sendDataToNative } from 'react-native-event-emitter';

console.log('NativeModules', NativeModules);
const App2 = () => {
  const [message, setMessage] = useState('');

  const dataToSend = {
    message: message,
    timestamp: new Date().toISOString(),
    userId: 'user123',
  };

  return (
    <SafeAreaProvider initialMetrics={initialWindowMetrics}>
      <SafeLayout>
        <Container
          style={{
            borderWidth: 1,
            margin: 20,
            borderRadius: 8,
          }}>
          <ItemText style={{ marginBottom: 10 }}>RN module 2</ItemText>
          <TextInputContainer style={{ width: '100%', marginBottom: 10 }}>
            <TextInput placeholder="Enter data to send" value={message} onChangeText={setMessage} />
          </TextInputContainer>
          <Button
            title="Send to Native"
            onPress={() => {
              console.log('App2: Sending data to native:', dataToSend);
              sendDataToNative(dataToSend);
            }}
          />
        </Container>
      </SafeLayout>
    </SafeAreaProvider>
  );
};

export default App2;
