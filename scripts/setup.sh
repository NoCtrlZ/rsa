#!/bin/sh

npm init -y
yarn add -D husky lint-staged prettier @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint eslint-config-prettier eslint-plugin-prettier typescript
echo '{
    "printWidth": 80,
    "tabWidth": 2,
    "singleQuote": true,
    "trailingComma": "es5",
    "semi": true,
    "newline-before-return": true,
    "no-duplicate-variable": [true, "check-parameters"],
    "no-var-keyword": true,
    "jsxBracketSameLine": false
}' >> .prettierrc
echo '*.json
lib
node_modules' >> .prettierignore
echo '{
    "extends": [
      "plugin:@typescript-eslint/recommended",
      "plugin:@typescript-eslint/recommended-requiring-type-checking",
      "plugin:prettier/recommended",
      "prettier/@typescript-eslint"
    ],
    "plugins": ["@typescript-eslint", "prettier"],
    "parser": "@typescript-eslint/parser",
    "parserOptions": {
      "sourceType": "module",
      "project": "./tsconfig.json",
      "ecmaFeatures": {
        "jsx": true // Allows for the parsing of JSX
      }
    },
    "env": { "browser": true, "node": true, "es6": true },
    "rules": {
      "quotes": [2, "single"],
      "no-unused-vars": ["error", { "vars": "local" }],
      "no-undef": "error"
    }
}' >> .eslintrc.json
echo '{
    "compilerOptions": {
      "allowJs": true,
      "alwaysStrict": true,
      "esModuleInterop": true,
      "forceConsistentCasingInFileNames": true,
      "jsx": "preserve",
      "lib": ["dom", "es2017"],
      "moduleResolution": "node",
      "noFallthroughCasesInSwitch": true,
      "declaration": true,
      "noUnusedLocals": true,
      "noUnusedParameters": true,
      "resolveJsonModule": true,
      "skipLibCheck": true,
      "strict": true,
      "outDir": "lib"
    },
    "include": ["src/**/*.ts"],
    "exclude": ["node_modules"]
}' >> tsconfig.json
echo 'node_modules
lib' >> .gitignore
mkdir src
echo 'const hello = () => {
    console.log("hello")
}

hello()
' >> src/index.ts
