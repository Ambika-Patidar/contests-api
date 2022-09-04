require 'test_helper'

class ContestTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end

  test 'should not save contest without name, registration and timings' do
    contest = Contest.new(description: 'test', platform: 'test')
    assert_not contest.save
  end
end
