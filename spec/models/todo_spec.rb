require 'rails_helper'

describe 'todo-method' do
  before do
    @user = create(:user)
    @todo = create(:todo)
  end

  describe '#days_count_method' do
    it "counts the days left" do
      expect(@todo.days_left).to eq(7)
    end
  end

  describe '.destroy_all_method' do
    it 'destroys all todos >7 days' do
      @todo2 = create(:todo, created_at: "12-12-2014")
      expect(Todo.destroy_all_old.count).to eq(1)
    end
  end

end