require 'test_helper'

class Api::ContestsControllerTest < ActionDispatch::IntegrationTest
  test 'create contest' do
    post '/api/contests', params: {
      name: 'contest2',
      description: 'abc',
      platform: 'abc',
      registration: 'abc',
      timings: '10:00'
    }
    body = JSON.parse(response.body)
    assert_equal 200, response.status
    assert_equal 'SUCCESS', body['status']
    assert_equal 'Contest is saved', body['message']
  end

  test 'should not contest without name' do
    post '/api/contests', params: {
      description: 'abc',
      platform: 'abc',
      registration: 'abc',
      timings: '10:00'
    }
    body = JSON.parse(response.body)
    assert_not_equal 200, response.status
    assert_equal 'Error', body['status']
    assert_equal 'Contest is not saved', body['message']
  end

  test 'fetch all contests' do
    Contest.create(
      name: 'contest2',
      description: 'abc',
      platform: 'abc',
      registration: 'abc',
      timings: '10:00'
    )
    get '/api/contests'
    body = JSON.parse(response.body)
    assert_equal 200, response.status
    assert_equal 'SUCCESS', body['status']
    assert_equal 'Loaded contests', body['message']
  end
end
