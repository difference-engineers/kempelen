/* eslint-disable import/no-commonjs */
module.exports = {
  presets: [
    [
      "@babel/preset-env",
      {
        useBuiltIns: "entry",
        corejs: "3.6",
        targets: "> 0.25%, not dead",
      },
    ],
    [
      "@babel/preset-react",
      {
        development: process.env.NODE_ENV !== "production",
      },
    ],
    "@emotion/babel-preset-css-prop",
    process.env.NODE_ENV === "production" ? "minify" : null,
  ].filter((preset) => preset),
  plugins: [
    "babel-plugin-graphql-tag",
    [
      "module-resolver",
      {
        alias: {
          "^@internal/(.+)$": "./@internal/\\1",
          "^@assets/(.+)$": "./assets/\\1",
        },
      },
    ],
    process.env.NODE_ENV === "production" ? null : "annotate-console-log",
  ].filter((preset) => preset),
};
