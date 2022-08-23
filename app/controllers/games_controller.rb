class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score

    # access data from form through params
    user_answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{user_answer}"
    response = URI.open(url).read
    data = JSON.parse(response)
    @result = data
    raise

    if data['found']
      @eng_result = "Congrats, #{user_answer} is a valid word"
    else
      @eng_result = "No, #{user_answer} is not a valid word"
    end
  end
end
