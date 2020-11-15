class HomeController < ApplicationController
  def index
    @user = current_user
  end

  def create_proposition  
    @proposition = current_user.team.propositions.new(proposition_params)
    respond_to do |format|
      @proposition.save
      puts @proposition.errors.inspect
      if  @proposition.save
        @proposition.errors
        format.html { redirect_to root_path }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def vote
    @answer = Answer.new(answer_params)
    respond_to do |format|
      @answer.save
      puts @answer.errors.inspect
      if  @answer.save
        @answer.errors
        format.html { redirect_to root_path }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def simulation_vote
    Answer.transaction do
      current_user.team.users.each do |user|
        if user.id != current_user.id
          @answer = Answer.new(:proposition_1 => true, :proposition_2 =>false, :user_id => user.id, :proposition_id => params[:proposition_id])
          @answer.save(:validate => false)
        end
      end
    end
    redirect_to root_path
  end

  def destroy_all_propositions
    Proposition.delete_all
    Answer.delete_all
    redirect_to root_path
  end

  def no_proposition
    if current_user.team.propositions.length == 0
      return true
    else
      if current_user.team.propositions.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).length > 0
        return false
      else
        return true
      end
    end
  end

  def get_todays_proposition
    current_user.team.propositions.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).last
  end

  def get_color(user)
    return "black"
  end
  
  helper_method :no_proposition
  helper_method :get_todays_proposition
  helper_method :get_color

  def proposition_params
    params.require(:proposition).permit(:proposition_1, :proposition_2, :team_id)
  end

  def answer_params
    params.require(:answer).permit(:proposition_1, :proposition_2, :user_id, :proposition_id)
  end
  
end
