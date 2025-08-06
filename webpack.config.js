
const path = require('path');

const dev = true;

const config = {
  mode: dev ? 'development' : 'production',
  devtool: dev ? 'inline-source-map' : undefined,
  entry: dev ? ['./src/index.js'] : ['babel-polyfill', './src/index.js'],
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, 'dist')
  },
  module: {
    rules: [
      {
        test: /.js$/,
        include: path.join(__dirname, 'src'),
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['env', 'react']
          }
        }
      },
      {
        test: /\.css$/,
        include: path.join(__dirname, 'src'),
        use: [ // you need to use extract-text plugin for production!
          'style-loader', // injects css into <head>
          {
            loader: 'css-loader', // treats @import in css as require in js
            options: {
              importLoaders: 1,
              modules: true, // enables namespacing
              localIdentName: '[name]-[local]-[hash:base64:6]', // [name] is for the css file; [local] is the name of the class
            }
          },
          'postcss-loader',
        ]
      },
    ]
  },
};

module.exports = config;

