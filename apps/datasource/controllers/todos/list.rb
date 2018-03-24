# coding: utf-8
module Datasource::Controllers::Todos
  class List
    include Datasource::Action
    accept :json
    expose :todos

    def call(params)
      @todos = TodoRepository.new.all
    end
  end
end
