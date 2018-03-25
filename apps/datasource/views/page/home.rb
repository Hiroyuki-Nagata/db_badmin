# coding: utf-8
#require 'hanami'

module Datasource::Views::Page
  class Home
    include Datasource::View

    def tes()
      # 応答チェック
      "Tes."
    end

    def script_for(bundle)
      # webpackの場所を示す
      path = Hanami.root.join('webpack-assets.json')
      file = File.read(path)
      json = JSON.parse(file)
      json[bundle]['js']
    end
  end
end
