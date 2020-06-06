import React from "react";
import { Container, ButtonContainer } from "./style";
import { H2 } from "../../common/text/H2/style";
import { Body } from "../../common/text/Body/style";
export const Card = () => {
  return (
    <Container>
      <H2>Cosa vuoi prenotare?</H2>
      <ButtonContainer>
        <button>-</button>
        <Body>1</Body>
        <button>+</button>
      </ButtonContainer>
    </Container>
  );
};
