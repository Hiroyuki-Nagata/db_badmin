require_relative '../../../spec_helper'

describe Datasource::Views::Todos::Create do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/datasource/templates/todos/create.html.erb') }
  let(:view)      { Datasource::Views::Todos::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
