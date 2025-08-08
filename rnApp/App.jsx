/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import { StatusBar, useColorScheme } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import StackNavigator from './src/StackNavigator';
import { SafeAreaProvider, initialWindowMetrics } from 'react-native-safe-area-context';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { createStore, Provider as JotaiProvider } from 'jotai';

const queryClient = new QueryClient();
const store = createStore();

function App({ gameCode }) {
  const isDarkMode = useColorScheme() === 'dark';

  return (
    <SafeAreaProvider initialMetrics={initialWindowMetrics}>
      <JotaiProvider store={store}>
        <QueryClientProvider client={queryClient}>
          <NavigationContainer>
            <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
            <StackNavigator gameCode={gameCode} />
          </NavigationContainer>
        </QueryClientProvider>
      </JotaiProvider>
    </SafeAreaProvider>
  );
}

export default App;
