require 'rails_helper'


RSpec.describe User, type: :model do
  subject do
    User.new(
      full_name: 'Geno',
      email: 'geno@gmail.com',
      password: '123456'
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a full_name' do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
