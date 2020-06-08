import React from "react";
import { Container } from "./style";
import { Subscribe } from "./Subscribe/index";
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
      <Subscribe />
      <div>{callServer()}</div>
    </Container>
  );
};
