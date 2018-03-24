// jQuery with webpack のテスト

// $ = require('jquery');

// $('#hello').after('hello webpack');

// Vue.js
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'

Vue.use(BootstrapVue);

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// Axios
import Axios from 'axios';

var app = new Vue({
    el: '#app',
    data: {
        message: "Hello Vue.js !!"
    }
});

new Vue({
    el: '#my-app',
    data: {
        newTask: '',
        todos: []
    },
    methods: {
        getAjax: function(url, name) {
            return Axios.get(url).then((res) => {
                Vue.set(this, name, res.data);
                this.$emit('GET_AJAX_COMPLETE');
            });
        },
        getData: function(name) {
            return this.$data[name];
        },
        addTodo: function() {
            if( this.newTask == '' ) return;
            this.todos.push(
                { task: this.newTask, isCompleted: false }
            );
            this.newTask = '';
        },
        deleteTodo: function(todo) {
            this.todos.splice(todo, 1); // vue.js v2
            //this.todos.$remove(todo); // vue.js v1
        }
    },
    created: function() {
        // 要素の初期値を 'created' で設定
        Axios.get("/todos").then((res) => {
            Vue.set(this, 'todos', res.data);
            this.$emit('GET_AJAX_COMPLETE');
        });
        this.$on('GET_AJAX_COMPLETE', () => {
            this.todos = this.getData('todos');
        });
    },
    computed: {
        remains: function() {
            var counter = 0;
            for(var i=0; i<this.todos.length; i++) {
                if(!this.todos[i].isCompleted) {
                    counter ++;
                }
            }
            return counter;
        }
    }
});
