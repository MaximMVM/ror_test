class GameController < ApplicationController
  @@result = nil # for change data between variable because every HTTP-request create new instanse GameController
  @@cpu = nil

  def index
    @result = @@result 
    @cpu_input = @@cpu
  end

  def calc
    units = %w(камень ножницы бумага)
    serv = units[rand(0..2)]
    @@cpu = serv
    user = params[:unit]

    # could rules class variable but it smal and I'm lazy
    rules = {"камень"=> "ножницы",
             "ножницы" => "бумага",
             "бумага"=> "камень",
            }
   if serv == user
      result = "Ничья, вы оба загадали #{user}"
   else
   
     rules.each do |key, value|
       if serv == key and user == value
          result = "Сервер победил! Он загадал #{serv}, а вы #{user}"
          break
       elsif user == key and serv == value
           result = "Вы победили! Вы загадали #{user}, а сервер #{serv}"
           break
       end
     end
    end
   @@result = result
   redirect_back(fallback_location: gi_path)

end

end


