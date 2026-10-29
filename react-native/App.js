import React from 'react';
import { Button, SafeAreaView, Text } from 'react-native';
import * as Watchtower from '@watchtowerobservability/react-native';

// Publishable keys are public by design; set EXPO_PUBLIC_WT_PUBLISHABLE_KEY in your shell or a git-ignored .env.
Watchtower.init({
  publishableKey: process.env.EXPO_PUBLIC_WT_PUBLISHABLE_KEY,
  endpoint: process.env.EXPO_PUBLIC_WT_ENDPOINT || 'http://localhost:4318',
  service: 'react-native-example',
});

export default function App() {
  return (
    <SafeAreaView style={{ padding: 24 }}>
      <Text>Watchtower React Native example</Text>
      <Button title="Capture error" onPress={() => Watchtower.captureError(new Error('boom from the RN example'))} />
      <Button title="Throw (uncaught)" onPress={() => { throw new Error('uncaught from the RN example'); }} />
    </SafeAreaView>
  );
}
