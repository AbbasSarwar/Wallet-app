require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Abbas', email: 'abbas@gmail.com', password: 'txt123')
  end
  it 'name should be valid during Registeration' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Email should be valid' do
    subject.email = 'abbas.com'
    expect(subject).to_not be_valid
  end
  it 'Password should be valud' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
