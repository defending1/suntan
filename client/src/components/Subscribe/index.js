import React, { useState } from "react";
import Dropdown from "react-dropdown";
import { Top } from "./Top/index";
import { Form } from "./Form/index";
import axios from "axios";

export const Subscribe = () => {
  const [data, setData] = useState({});
  const changeTable = async (options) => {
    console.log(options.value);
    axios
      .get(`http://localhost:${process.env.REACT_APP_SERVER_PORT}/get_data`, {
        params: {
          table: options.value,
        },
      })
      .then((response) => {
        setData(response.data);
      });
  };
  console.log(data);
  const options = ["CLIENTE", "STABILIMENTO_BALNEARE"];
  const defaultOption = options[0];
  return (
    <div>
      <Top />
      <Form />
      <Dropdown
        options={options}
        onChange={(e) => changeTable(e)}
        value={defaultOption}
        placeholder="Select an option"
      />
    </div>
  );
};
