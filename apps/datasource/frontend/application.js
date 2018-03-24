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
        getData: function(name) {
            return this.$data[name];
        },
        addTodo: function() {
            if( this.newTask == '' ) return;
            // 要素をバックエンドに送る
            Axios.post("/todos",{
                task: this.newTask,
                isCompleted: false
            }).then(function (response) {
                // 成功したらHTML要素を追加
                console.log(response);
            }).catch(function (error) {
                console.log(error);
            });
            this.todos.push(
                { task: this.newTask, isCompleted: false }
            );
            this.newTask = '';
        },
        deleteTodo: function(todo, index) {
            // 削除する情報をバックエンドに送る
            Axios.delete(`/todos/${todo.todo_no}`, {
                // nothing to send (because of it's delete)
            }).then(function (response) {
                // 成功したらHTML要素を削除
                console.log(response);
            }).catch(function (error) {
                console.log(error);
            });
            this.todos.splice(index, 1); // vue.js v2
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
