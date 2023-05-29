import ReactDOM from "react-dom/client";
import { css as css_ } from "a-module-that-uses-emotion/i-export-css-from-emotion-react";
import { css } from "@emotion/react";
import { useTheme as useTheme_ } from "a-module-that-uses-emotion/i-export-useTheme-from-mui-material-styles";
import { useTheme } from "@mui/material/styles";

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <>
    <h2>@emotion/react dual package situation: {css_ === css ? "false" : "true"}</h2>
    <h2>@mui/material dual package situation: {useTheme_ === useTheme ? "false" : "true"}</h2>
  </>
);
