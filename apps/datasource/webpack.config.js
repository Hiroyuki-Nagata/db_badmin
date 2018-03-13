var path = require('path');
var webpack = require('webpack');
var assetsPlugin = require('assets-webpack-plugin');

module.exports = {
    entry: './frontend/application.js',
    output: {
        path: path.resolve(__dirname, '..', '..', 'public'),
        filename: 'bundle_web-[hash].js'
    },
    plugins: [new assetsPlugin()],
    resolve: {
        alias: {
            vue: 'vue/dist/vue.js'
        }
    }
};
