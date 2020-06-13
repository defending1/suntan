import React from "react";
import { useForm } from "react-hook-form";

import LocationPicker from "react-leaflet-location-picker";
export default { title: "form/Mappa" };

export const Mappa = () => {
  const pointVals = [[50, 2]];
  const pointMode = {
    banner: true,
    control: {
      values: pointVals,
      onClick: (point) => (pointVals[0] = point),
      onRemove: (point) =>
        console.log("I've just been clicked for removal :(", point),
    },
  };
  return <LocationPicker pointMode={pointMode} />;
};
