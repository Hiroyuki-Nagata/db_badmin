module Datasource::Views::Todos
  class List
    include Datasource::View
    layout false

    def render
      "[]"
    end
  end
end
