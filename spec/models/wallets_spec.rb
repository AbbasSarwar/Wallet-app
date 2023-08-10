require 'rails_helper'
RSpec.describe Wallet, type: :model do
  before :each do
    @us = User.create(name: 'Abbas', email: 'abbas123@gmail.com', password: 'txt1235')
  end
  subject do
    @wallet = Wallet.new(name: 'Abbas', amount: 200, user_id: @us.id)
  end
  before { subject.save }
  it 'Item name should be walid' do
    subject.name = 'item1'
    expect(subject).to be_valid
  end
  it 'Valid amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
  it 'Should have valid user id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
