
With this repo we demonstrate how we can end up with multiple instance 
of the `@emotion/react` module within a Vite project. 

```bash
git clone https://github.com/garronej/vite-dual-package-repro-repo
cd vite-dual-package-repro-repo
yarn
yarn dev
```

You should see:  

![image](https://github.com/garronej/vite-dual-package-repro-repo/assets/6702424/37ff3f4a-a8b5-4804-b496-e016523b300a)  

And if you open the debugger:  

![image](https://github.com/garronej/vite-dual-package-repro-repo/assets/6702424/97e01bf4-d72c-463b-95a7-5f307e416e87)  

What's happening is we use a [3rd party module](https://github.com/garronej/a-module-that-uses-emotion) that has `@emotion/react` as peer
dependency. This module is only distributed in CJS.  
The internal import of `@emotion/react` made within `a-module-that-uses-emotion` result in the CJS dist or `@emotion/react` being imported
when the import made in `src/main.tsx` result in the ESM distribution of `@emotion/react` being imported.  

Note that we don't have the same problem with `@mui/material` where only the ESM distribution used **but** the approach
implemented by MUI that consists in placing sub `package.json`s in specific import path instead of using the `exports`  
field isn't compatible with Node running in `type: module` mode. [See issue](https://github.com/mui/material-ui/issues/37335).  



