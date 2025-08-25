import React from 'react';
import { View, Button, Alert } from 'react-native';
import { Container, ItemText } from './src/components/StyledComponents';
import SafeLayout from './src/components/SafeLayout';
import { SafeAreaProvider, initialWindowMetrics } from 'react-native-safe-area-context';

const App3 = () => {
  return (
    <SafeAreaProvider initialMetrics={initialWindowMetrics}>
      <SafeLayout>
        <Container>
          <ItemText style={{ fontSize: 20, fontWeight: 'bold', textAlign: 'center' }}>
            This is a modal from rn
          </ItemText>
          <ItemText style={{ fontSize: 16, fontWeight: 'normal', marginTop: 40 }}>
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
            has been the industry's standard dummy text ever since the 1500s, when an unknown
            printer took a galley of type and scrambled it to make a type specimen book. It has
            survived not only five centuries, but also the leap into electronic typesetting,
            remaining essentially unchanged. It was popularised in the 1960s with the release of
            Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
            publishing software like Aldus PageMaker including versions of Lorem Ipsum.
          </ItemText>
        </Container>
      </SafeLayout>
    </SafeAreaProvider>
  );
};

export default App3;
