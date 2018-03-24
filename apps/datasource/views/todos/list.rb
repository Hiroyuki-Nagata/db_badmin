module Datasource::Views::Todos
  class List
    include Datasource::View
    layout false

    def render
      _raw JSON.dump(todos.map{|todo| todo.to_h})
    end
  end
end
