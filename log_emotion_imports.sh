#!/bin/bash

echo 'console.log("Importing @emotion/react with exports.module.browser condition");' >> node_modules/\@emotion/react/dist/emotion-element-c39617d8.browser.esm.js
echo 'console.log("Importing @emotion/react with exports.default condition");' >> node_modules/\@emotion/react/dist/emotion-react.cjs.js

echo 'console.log("Importing @mui/material/styles using the package.json located at node_modules/@mui/material/styles/package.json module field");' >> node_modules/\@mui/material/styles/index.js
echo 'console.log("Importing @mui/material/styles using the package.json located at node_modules/@mui/material/styles/package.json main field");' >> node_modules/\@mui/material/node/styles/index.js
