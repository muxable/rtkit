/* @refresh reload */
import { Route, Router, Routes } from "solid-app-router";
import { render } from "solid-js/web";
import Agent from "./Agent";
import Home from "./Home";
import "./index.css";

render(
  () => (
    <Router>
      <Routes>
        <Route path="/:id" component={Agent} />
        <Route path="/" component={Home} />
      </Routes>
    </Router>
  ),
  document.getElementById("root") as HTMLElement
);
