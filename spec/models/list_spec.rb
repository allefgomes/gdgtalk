# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'validations' do
    subject { List.new(name: 'name', color: 'red') }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { should validate_uniqueness_of(:name) }

    context 'permitted format colors' do
      it 'given #fff as colors, is valid' do
        # configuracao
        list = List.new(name: 'list_name')

        # exercicio
        list.color = '#fff'

        # verificacao
        expect(list).to be_valid
      end

      it { should allow_value('#fff').for(:color) }
      it { should allow_value('#452').for(:color) }
      it { should allow_value('#fffcc2').for(:color) }
      it { should allow_value('#123452').for(:color) }
    end

    context 'non permitted format colors' do
      it 'given red as colors, is valid' do
        # configuracao
        list = List.new(name: 'list_name')

        # exercicio
        list.color = 'red'

        # verificacao
        expect(list).not_to be_valid
      end

      it { should_not allow_value('#fffcc22').for(:color) }
      it { should_not allow_value('fffcc2').for(:color) }
      it { should_not allow_value('fff').for(:color) }
    end
  end
end
