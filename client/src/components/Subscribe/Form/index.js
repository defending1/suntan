import React from "react";
import { Container, Input, Button } from "./style";
import { useForm } from "react-hook-form";
import axios from 'axios'

const postData = async values => {
  console.log(values)
  axios.post(`http://localhost:${process.env.REACT_APP_SERVER_PORT}/add_client`, {
    params: {
      values,
    },
  }).then((response) => {
    console.log(response.data);
  });
}

export const Form = () => {
  const { register, handleSubmit } = useForm();
  const onSubmit = (values) => postData(values);
  return (
    <Container onSubmit={handleSubmit(onSubmit)}>
      <Input ref={register} name="Nome" type="text" placeholder="Nome" />
      <Input ref={register} name="Cognome" type="text" placeholder="Cognome" />
      <Input name="Mail" ref={register} type="email" placeholder="Email" />
      <Input ref={register} name="Password" type="password" placeholder="Password" />
      <Input ref={register} name="Data_Nascita" type="date" placeholder="Data di nascita" />
      <Input ref={register} name="Residenza" type="text" placeholder="Residenza" />
      <Button type="submit">Submit</Button>
    </Container>
  );
};
