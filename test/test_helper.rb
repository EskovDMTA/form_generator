# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'
def load_fixture(name)
  File.read "#{__dir__}/hexlet_code/fixtures/#{name}"
end

require 'minitest/autorun'
