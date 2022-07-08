class GameController < ApplicationController
  def index
    units = %w(камень ножницы бумага)
    @cpu_input = units[rand(0..2)]
    @user_input = params[:unit]
    @result = calc(@user_input, @cpu_input)
  end

end

def calc(user, serv)

      # @user_input = params[:unit]
      result = nil
      rules = {"камень"=> "ножницы",
               "ножницы" => "бумага",
               "бумага"=> "камень",
              }
     if serv == user
        result = "Ничья, вы оба загадали #{user}"
     end
     
     rules.each do |key, value|
		 if serv == key and user == value
			 result = "Сервер победил, он загадал #{serv}, а вы #{user}"
		     break
		 elsif user == key and serv == value
		     result = "Вы победили! Вы загадали #{user}, а сервер #{serv}"
		     break
		 end
     end
     # redirect_back(fallback_location: gi_path)
    result  
 end
