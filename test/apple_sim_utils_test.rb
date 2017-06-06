require 'test_helper'

class AppleSimUtilsTest < Minitest::Test
  def test_with_allow_all
    c = AppleSimUtils::Cmd.new(bundle_id: 'com.apple.example')
    expected = "--simulator 'iPhone SE, OS = 10.3' --bundle com.apple.example --setPermissions 'notifications=YES,photos=YES,camera=YES'"

    assert_equal c.allow_all(device: 'iPhone SE, OS = 10.3', permissions: %w(notifications photos camera)), expected
  end

  def test_with_deny_all
    c = AppleSimUtils::Cmd.new(bundle_id: 'com.apple.example')
    expected = "--simulator 'iPhone SE, OS = 10.3' --bundle com.apple.example --setPermissions 'notifications=NO,photos=NO,camera=NO'"

    assert_equal c.deny_all(device: 'iPhone SE, OS = 10.3', permissions: %w(notifications photos camera)), expected
  end

  def test_with_set
    c = AppleSimUtils::Cmd.new(bundle_id: 'com.apple.example')
    expected = "--simulator 'iPhone SE, OS = 10.3' --bundle com.apple.example --setPermissions 'location=always'"

    assert_equal c.set(device: 'iPhone SE, OS = 10.3', permission:'location', value: 'always'), expected
  end

  def test_with_reset
    c = AppleSimUtils::Cmd.new
    expected = "--simulator 'iPhone SE, OS = 10.3' --restartSB"

    assert_equal c.restart(device: 'iPhone SE, OS = 10.3'), expected
  end
end
