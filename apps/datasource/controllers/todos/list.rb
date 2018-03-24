# coding: utf-8
module Datasource::Controllers::Todos
  class List
    include Datasource::Action
    accept :json
    expose :todos

    def call(params)
      #@todos = TodoRepository.new.all
      @todos = [
        { task: '牛乳を買う', isCompleted: false },
        { task: 'プロテインを買う', isCompleted: true },
        { task: 'スポーツドリンクを買う', isCompleted: false }
      ]
    end
  end
end
