import React from "react";
import { Container } from "./style";
import { Top } from "./components/Order/Top/index";
import { Card } from "./components/Order/Card/index";
import axios from "axios";

function callServer() {
  axios
    .get(`http://localhost:${process.env.REACT_APP_SERVER_PORT}/test`, {
      params: {
        table: "CODICE_SANITARIO",
      },
    })
    .then((response) => {
      console.log(response.data);
    });
}

export const App = () => {
  return (
    <Container>
      <Top />
      <div>{callServer()}</div>
    </Container>
  );
};
