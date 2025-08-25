import React from 'react';
import SafeLayout from '../components/SafeLayout';
import { Heading, ItemText, Container } from '../components/StyledComponents';

export default function Screen3({ route }) {
  const { post } = route.params;

  return (
    <SafeLayout>
      <Container>
        <Heading>{post.title}</Heading>
        <ItemText>{post.body}</ItemText>
      </Container>
    </SafeLayout>
  );
}
