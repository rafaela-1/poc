import styled from 'styled-components/native';

export const Container = styled.View`
  flex: 1;
  padding: 16px;
`;

export const ItemContainer = styled.View`
  background-color: #ccc;
  padding: 16px;
  margin-bottom: 8px;
  border-radius: 8px;
`;

export const Heading = styled.Text`
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 12px;
`;

export const ItemText = styled.Text`
  font-size: 16px;
`;

export const ButtonContainer = styled.View`
  justify-content: flex-end;
  align-items: center;
  flex: 1;
`;

export const AnimationContainer = styled.View`
  margin-top: 40px;
  margin-bottom: 40px;
  flex-direction: column;
  gap: 20px;
`;

export const TextInputContainer = styled.View`
  flex-direction: column;
  gap: 20px;
`;
export const TextInput = styled.TextInput`
  border-width: 1px;
  border-color: '#ccc';
  border-radius: 8px;
  padding: 12px 12px;
  font-size: 16px;
`;
