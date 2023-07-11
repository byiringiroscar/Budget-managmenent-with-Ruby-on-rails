require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    Category.new(
      name: 'Food',
      icon: 'https://cdn-icons-png.flaticon.com/512/2771/2771401.png',
      author_id: 1
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

  it 'is not valid without a icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end
end
