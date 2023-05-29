# Vite Project Issue Demonstration: Multiple Instances of `@emotion/react` Module

This repository serves as a demonstration for the issue of multiple instances of the `@emotion/react` module occurring within a Vite project. 

## Setup

You can clone this repository and run the development server with the following commands:

```bash
git clone https://github.com/garronej/vite-dual-package-repro-repo
cd vite-dual-package-repro-repo
yarn install
yarn dev
```

## Expected Results

Upon running the development server, you should see the following:

![Expected Output](https://github.com/garronej/vite-dual-package-repro-repo/assets/6702424/37ff3f4a-a8b5-4804-b496-e016523b300a)

If you open the debugger, you should see:

![Debugger Output](https://github.com/garronej/vite-dual-package-repro-repo/assets/6702424/97e01bf4-d72c-463b-95a7-5f307e416e87)

## Problem Description

The issue arises when we use a [third-party module](https://github.com/garronej/a-module-that-uses-emotion) that has `@emotion/react` as a peer dependency and this module is distributed solely in CommonJS (CJS) format. 

The internal import of `@emotion/react` within `a-module-that-uses-emotion` results in the CJS distribution of `@emotion/react` being imported. However, the import made in `src/main.tsx` results in the ES Module (ESM) distribution of `@emotion/react` being imported. This causes multiple instances of the same module.  

### With Next.js

Note that this behaviour isn't observable in Next.js  

<img width="1728" alt="image" src="https://github.com/garronej/vite-dual-package-repro-repo/assets/6702424/792db4c6-6cef-4b88-9866-a36ebdb3ad13">  

### With Node in type: module mode

The same experiment with node in `type: module` will led to having no module duplication because in emotion the `exports.import` condition point to a file
that only re-export the CJS distribution however, the import from within `a-module-that-uses-emotion` of `@emotion/react` result in `exports.default` to be
imported and the import in the main file result in `exports.import` to be imported.  

## Comparison

Interestingly, this problem does not occur with `@mui/material`, where only the ESM distribution is used. However, the approach implemented by Material-UI, which involves placing sub `package.json` files in specific import paths instead of using the `exports` field, is incompatible with Node running in `type: module` mode. You can read more about this in the corresponding [issue discussion](https://github.com/mui/material-ui/issues/37335).  


