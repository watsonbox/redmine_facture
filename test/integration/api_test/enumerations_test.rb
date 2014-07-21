require File.expand_path('../../../test_helper', __FILE__)

class Redmine::ApiTest::EnumerationsTest < Redmine::ApiTest::Base
  fixtures :enumerations
  ActiveRecord::Fixtures.create_fixtures(File.dirname(__FILE__) + '/../../fixtures/', [:custom_fields, :custom_values])

  def setup
    Setting.rest_api_enabled = '1'
  end

  test "GET /enumerations/issue_priorities.xml should return priorities" do
    get '/enumerations/issue_priorities.xml'
    assert_response :success
    assert_equal 'application/xml', response.content_type
    assert_select 'issue_priorities[type=array]' do
      assert_select 'issue_priority' do
        assert_select 'id', :text => '6'
        assert_select 'name', :text => 'High'
      end
    end
  end

  test "GET /enumerations/time_entry_activities.xml should return time entry activities with custom fields" do
    get '/enumerations/time_entry_activities.xml'
    assert_response :success
    assert_equal 'application/xml', response.content_type
    assert_select 'time_entry_activities[type=array]' do
      assert_select 'time_entry_activity' do
        assert_select 'id', :text => '9'
        assert_select 'name', :text => 'Design'
        assert_select 'custom_fields[type=array]' do
          assert_select 'custom_field[name=Price]' do
            assert_select 'value', :text => '10'
          end
        end
      end
    end
  end
end
