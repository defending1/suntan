import React, {useState } from "react";
import { Container, Input, Text, Button } from "../style";
import { useForm } from "react-hook-form";
import { Mappa } from './Map.stories.js'
export default { title: "form/Lido" };

export const Lido = () => {
  const coordinates = [[50, 2]];
  const { register, handleSubmit } = useForm();
  const onSubmit = (values) => console.log(values);
  return (
    <Container onSubmit={handleSubmit(onSubmit)}>
      <h1>Lido</h1>
      <Input ref={register} name="Nome" placeholder="Nome" />
      <Text
        rows="5"
        cols="80"
        name="Descrizione"
        ref={register}
        placeholder="Descrizione"
      />

      <Input
        ref={register}
        name="Capienza"
        type="number"
        placeholder="Capienza"
      />
      <Mappa pointVals={coordinates}/>
      <Button type="submit">Submit</Button>
    </Container>
  );
};
