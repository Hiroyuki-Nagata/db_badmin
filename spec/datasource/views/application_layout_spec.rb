require "spec_helper"

describe Datasource::Views::ApplicationLayout do
  let(:layout)   { Datasource::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/datasource/templates/application.html.erb') }

  it 'contains application name' do
    rendered.must_include('Datasource')
  end
end
