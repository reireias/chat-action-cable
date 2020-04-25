module.exports = {
  root: true,
  env: {
    browser: true
  },
  parserOptions: {
    parser: 'babel-eslint'
  },
  extends: [
    'prettier',
    'prettier/vue',
    'plugin:vue',
    'plugin:prettier/recommended',
  ],
  plugins: [
    'prettier'
  ],
  // add your custom rules here
  rules: {
  }
}
