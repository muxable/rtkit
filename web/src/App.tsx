import type { Component } from "solid-js";

import { Route, Routes } from "solid-app-router";
import Home from "./Home";
import Agent from "./Agent";

const App: Component = () => {
  return (
    <>
      <Routes>
        <Route path="/:id" element={<Agent />} />
        <Route path="/" element={<Home />} />
      </Routes>
    </>
  );
};

export default App;
