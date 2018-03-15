// jQuery with webpack のテスト

$ = require('jquery');

$('#hello').after('hello webpack');

// Vue.jsのテスト
var Vue = require('vue');

var app = new Vue({
    el: '#app',
    data: {
        message: "Hello Vue.js !!"
    }
});
