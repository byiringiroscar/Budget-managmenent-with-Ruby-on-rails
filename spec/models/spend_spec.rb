require 'rails_helper'

RSpec.describe Spend, type: :model do
  subject do
    Spend.new(
      name: 'Cake',
      amount: 100,
      author_id: 1,
      category_id: 1
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a category_id' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
end
