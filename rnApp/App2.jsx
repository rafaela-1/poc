import React, { useState, useEffect } from 'react';
import { View, Pressable } from 'react-native';
import {
  Container,
  ItemText,
  TextInput,
  TextInputContainer,
} from './src/components/StyledComponents';
import SafeLayout from './src/components/SafeLayout';
import { SafeAreaProvider, initialWindowMetrics } from 'react-native-safe-area-context';
import { sendDataToNative, addListener, removeListener } from 'react-native-event-emitter';

const App2 = () => {
  const [message, setMessage] = useState('');
  const [receivedFromIOS, setReceivedFromIOS] = useState(null);

  useEffect(() => {
    // Safely listen for data from iOS using the module's addListener function
    let subscription = null;

    try {
      subscription = addListener('DataFromNative', (data) => {
        console.log('Received data from iOS:', data);
        setReceivedFromIOS(data);
      });
    } catch (error) {
      console.error('Error setting up event listener:', error);
    }

    return () => {
      if (subscription) {
        removeListener('DataFromNative', subscription);
      }
    };
  }, []);

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
          <Pressable
            style={{
              backgroundColor: '#007AFF',
              padding: 10,
              borderRadius: 8,
              alignItems: 'center',
            }}
            onPress={() => {
              console.log('App2: Sending data to native:', dataToSend);
              sendDataToNative(dataToSend);
            }}>
            <ItemText style={{ color: 'white', fontSize: 16 }}>Send to Native</ItemText>
          </Pressable>

          <View style={{ marginTop: 20 }}>
            <ItemText style={{ marginBottom: 8 }}>Data Received from iOS:</ItemText>
            <TextInputContainer style={{ width: '100%', marginBottom: 10 }}>
              <TextInput
                readOnly
                placeholder="Enter data to send"
                value={receivedFromIOS?.message}
              />
            </TextInputContainer>
          </View>
        </Container>
      </SafeLayout>
    </SafeAreaProvider>
  );
};

export default App2;
