import React from "react";
import { Container } from "./style";
import { Top } from "./components/Order/Top/index";
import { Card } from "./components/Order/Card/index";

export const App = () => {
  return (
    <Container>
      <Top />
      <Card />
    </Container>
  );
};
