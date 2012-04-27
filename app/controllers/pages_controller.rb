class PagesController < ApplicationController
  before_filter :common_content

  def common_content
	@defeat={rock: :scissors, paper: :rock, scissors: :paper, lizard: :paper, spock: :rock}
	@defeat2 = {rock: :lizard, paper: :spock, scissors: :lizard, lizard: :spock, spock: :scissors}
	@throws=@defeat.keys
  end
  
  def index
    session[:t]=0
	session[:l]=0
	session[:w]=0
  end
  
  def home
    
  end
  
  def result
    @computer_throw=@throws.sample 
	@player_throw= params[:type].to_sym
    if @computer_throw == @player_throw 
	  @title="You tied with the computer. Try again!" 
	  session[:t] ||= 0
	  session[:t] +=1
	elsif (@computer_throw == @defeat[@player_throw] or @computer_throw == @defeat2[@player_throw] )
      @title="Nicely done; #{@player_throw} beats #{@computer_throw}!" 
	  session[:w] ||= 0
	  session[:w] +=1
    else   
      @title="Ouch; #{@computer_throw} beats #{@player_throw}. Better luck next time!" 
      session[:l] ||= 0
	  session[:l] +=1
    end
  end
 
  

  def stat
    @t=session[:t]
	@w=session[:w]
	@l=session[:l]
  end

end
