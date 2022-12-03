require 'rails_helper'

RSpec.describe 'lists/edit', type: :view do
  let(:list) do
    List.create!(
      name: 'MyString',
      color: '#fff'
    )
  end

  before(:each) do
    assign(:list, list)
  end

  it 'renders the edit list form' do
    render

    assert_select 'form[action=?][method=?]', list_path(list), 'post' do
      assert_select 'input[name=?]', 'list[name]'

      assert_select 'input[name=?]', 'list[color]'
    end
  end
end
