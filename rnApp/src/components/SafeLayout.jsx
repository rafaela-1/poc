import React from 'react';
import {SafeAreaView} from 'react-native-safe-area-context';

const SafeLayout = ({children}) => <SafeAreaView style={{flex: 1}}>{children}</SafeAreaView>;

export default SafeLayout;
