# coding: utf-8
module Datasource::Views::Todos
  class Destroy
    include Datasource::View
    layout false

    def render
      # 作成されたTODOのインデックス値を返す
      "{}"
    end
  end
end
