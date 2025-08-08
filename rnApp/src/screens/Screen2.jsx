import React from 'react';
import { Button, ActivityIndicator, Pressable } from 'react-native';
import { FlashList } from '@shopify/flash-list';
import axios from 'axios';
import { useQuery } from '@tanstack/react-query';
import SafeLayout from '../components/SafeLayout';
import { Container, ItemText, ItemContainer } from '../components/StyledComponents';


const fetchPosts = async () => {
  const res = await axios.get('https://jsonplaceholder.typicode.com/posts?_limit=20');
  return res.data;
};

export default function Screen2({ navigation, route }) {
  const gameCode = route.params?.gameCode;
  const { data, isLoading, isError } = useQuery({
    queryKey: ['posts'],
    queryFn: fetchPosts,
  });


  if (isError) {
    return <Text>Error fetching posts</Text>;
  }

  return (
    <SafeLayout>
      {isLoading && <ActivityIndicator size="large" />}
      <Container>
        <ItemText>Screen 2 with game code: {gameCode}</ItemText>
        <FlashList
          data={data}
          stimatedItemSize={70}
          keyExtractor={(item) => item.id.toString()}
          style={{ marginTop: 20 }}
          renderItem={({ item }) => (
            <ItemContainer>
              <Pressable onPress={() => navigation.navigate('Screen4', { post: item })}>
                <ItemText>{item.title}</ItemText>
              </Pressable>
            </ItemContainer>
          )}
        />
      </Container>
      <Button title="Go to Screen 3" onPress={() => navigation.navigate('Screen3')} />
    </SafeLayout>
  );
}
