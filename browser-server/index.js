import path from "path"; // eslint-disable-line import/no-nodejs-modules
import {readFileSync} from "fs"; // eslint-disable-line import/no-nodejs-modules
import React from "react";
import requireEnvironmentVariables from "require-environment-variables";
import {Provider as ReduxProvider} from "react-redux";
import {StaticRouter} from "react-router";
import {renderToString} from "react-dom/server"; // eslint-disable-line import/no-internal-modules
import express from "express";
import cors from "cors";
import morgan from "morgan";
import compression from "compression";
import {parse} from "mustache";
import {render} from "mustache";
import helmet from "helmet";
import logger from "./logger";
import store from "@internal/server-store";
import {Application} from "@internal/elements";

requireEnvironmentVariables([
  "PORT",
  "NODE_ENV",
  "WWW_ORIGIN",
]);
const template = parse(readFileSync(path.join(__dirname, "index.html")));
const application = express();

application.use(morgan(process.env.NODE_ENV === "production" ? "combined" : "dev"));
application.use(compression());
application.use(cors());
application.use(helmet());
application.use("/assets", express.static(path.join(__dirname, "assets"), {fallthrough: false}));
application.get("*", (request, response) => {
  const helmetContext = {};
  const routerContext = {};
  const content = renderToString(
    <ReduxProvider store={store}>
      <StaticRouter location={request.url} context={routerContext}>
        <Application />
      </StaticRouter>
    </ReduxProvider>
  );

  if (routerContext.url) {
    return 400;
  }

  return response.send(render(template, {
    content,
    googleTagManagerId: "",
    supportEmail: "",
    metadata: {
      title: "Kemeplen",
    },
  }));
});

application.listen(
  process.env.PORT,
  () => {
    logger.info(`Listening to ${process.env.PORT}`);
  }
);
