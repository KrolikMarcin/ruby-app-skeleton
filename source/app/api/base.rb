# frozen_string_literal: true

require "grape"
require_relative "info"
require_relative "v1/base"

Dir[File.join(__dir__, 'helpers', '*.rb')].each { |file| require file }

module API
  class Base < Grape::API
    content_type :json, "application/json"
    default_format :json

    rescue_from(:all) { |exception| error_500! }
    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error! e, 400
    end

    helpers Helpers::Params
    helpers Helpers::Failure

    namespace :/ do
      mount API::Info
    end

    namespace "/v1" do
      mount V1::Base
    end
  end
end
