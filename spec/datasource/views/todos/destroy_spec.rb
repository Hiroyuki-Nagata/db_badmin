require_relative '../../../spec_helper'

describe Datasource::Views::Todos::Destroy do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/datasource/templates/todos/destroy.html.erb') }
  let(:view)      { Datasource::Views::Todos::Destroy.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
