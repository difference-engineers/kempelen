import React from "react";
import {graphql} from "@apollo/react-hoc";
import {useQuery} from "@apollo/react-hooks";
import query from "./index.gql";

import {Page} from "@internal/elements";
import {Link} from "@internal/elements";

const layoutStyle = {
  gridTemplateAreas: `
    "showcase showcase showcase"
    "brand brand authentication"
    "review review review"
    "feed feed feed"
  `,
  gridGap: "5px",
};

export default graphql(query)(function LandingPage () {
  const {loading, error, data} = useQuery(query);
  console.log({loading, error, data});

  return <Page layoutStyle={layoutStyle} subtitle="Welcome!">
    <section css={{gridArea: "showcase"}}>
      showcase
    </section>

    <header css={{gridArea: "brand"}}>
      <h1>Kempelen</h1>
    </header>

    <section css={{gridArea: "authentication"}}>
      <section>
        <Link kind="primary" href="/sign-up">
          Join us
        </Link>
      </section>

      <section>
        <Link kind="secondary" href="/sign-in">
          Login
        </Link>
      </section>
    </section>

    <section css={{gridArea: "review"}}>
      review
    </section>

    <section css={{gridArea: "feed"}}>
      feed
    </section>
  </Page>;
});
