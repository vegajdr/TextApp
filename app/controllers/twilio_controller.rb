class TwilioController < ApplicationController


  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def incoming
    slack_post
  end

  private

    def slack_post
      request = HTTParty.post "https://slack.com/api/chat.postMessage",
      header: {
        "Authorization" => "token #{ENV["TEST_TOKEN"]}",
        "User-Agent" => "Vega"
      },
      query: {
        token: ENV["TEST_TOKEN"],
        channel: "C1MSM6PLY",
        text: "#{params[:Body]}",
        as_user: true
      }
    end


end
