# datasource

## Todo API !

* 作成方法

- Actionを作成
- Controllers/Viewのファイルをそれぞれ編集
- Modelを作成
- migrationファイルを改変する(DBのテーブルを定義)
- migration実行


```
// Action作成
$ bundle exec hanami generate action datasource todos#list

// 編集
$ apps/datasource/controllers/todos/list.rb
$ apps/datasource/views/todos/list.rb

// Model作成
$ bundle exec hanami generate model todo

// migrationファイルを改変する
$ db_badmin/db/migrations/YYYYMMDD000000_create_todos.rb

// DB作成（初回のみ）
$ bundle exec hanami db create

// 移行を実施
$ bundle exec hanami db migrate
```

## Memo(Yarnの使い方)

```
$ yarn add axios --dev
```

## Memo(TODOのSQL的な設計)

* まあ厳密に作らなくてもORM側でやってくれるのだが

```
CREATE TABLE todos (
    todo_no      INT          NOT NULL,
    task         VARCHAR(255) NOT NULL,
    is_completed VARCHAR(1)   NOT NULL,
    created_at   TIMESTAMP    NOT NULL,
    updated_at   TIMESTAMP    NOT NULL,
    PRIMARY KEY (todo_no)
);
```

```
Hanami::Model.migration do
  change do
    create_table :todos do
      primary_key :todo_no, Integer, null: false
      column :task, String, null: false, size: 255
      column :is_completed, Bool, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
```
