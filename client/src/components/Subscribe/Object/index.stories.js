import React from "react";
import { Container, Input, Button } from "../style";
import { useForm } from "react-hook-form";
export default { title: "form/Ob" };

export const Ob = () => {
  const { register, handleSubmit } = useForm();
  const onSubmit = (values) => console.log(values);
  return (
    <Container onSubmit={handleSubmit(onSubmit)}>
      <Input ref={register} name="nome" placeholder="Nome" />
      <Input name="cognome" ref={register} placeholder="Cognome" />

      <Input ref={register} name="email" placeholder="Email" />
      <Button type="submit">Submit</Button>
    </Container>
  );
};
