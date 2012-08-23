require 'rubygems'
require "tic_tac_toe"
#*****************************печатаю  в терминале доску****************************************
def print (arg)
 	  arg.each do |arr|
          arr_temp=[]
  	  3.times do |i|
          arr_temp[i]="+"  if arr[i]== nil 
          arr_temp[i]="X" if arr[i]== 1  
          arr_temp[i]="O" if arr[i]== 0 
          end     
  	  puts "#{arr_temp[0]}#{arr_temp[1]}#{arr_temp[2]}"
	 end

end

#******************************делаю ход и проверяю выиграл кто то*******************************
def mov(player,cords,n)
        
          
        @board.move(cords[1].to_i-1,cords[0].to_i-1,n) 
	puts "----------------------"
               	if @game.finish_game(@board.cells) != nil then
                        if @game.finish_game(@board.cells) != "no winner" then   
                                      print(@board.cells)
            		              puts "Winn #{player.name}: "+@game.finish_game(@board.cells) 
                             else 
                                       print(@board.cells)
                                       puts @game.finish_game(@board.cells)
                             end
            		exit      
        	end

end
#***************************** инициализация основных переменных****************************************
def init
        @one=false # если one false один игрок иначе 2
        puts "if one player enter 1 else 2: "
	
        @one=true if 2.to_s == gets.chop           

 
	@game=TicTacToe::Game.new
	@board=TicTacToe::Board.new
	#@board.clear
	puts "Please enter first player ('X'): "
	name=gets.chop  
	@player_X=TicTacToe::Player.new(name.to_s)

	if @one==true then
                       puts "Please enter first player ('O'):"
		       name=gets.chop
                     else
                       name="Bot"
                     end

  
	@player_O=TicTacToe::Player.new(name.to_s)

	puts "press Enter to start Game:"


	name=gets.chop
	print(@board.cells)
end

#***********************************сама игра************************************
 def enter_cords(player)
        cords=[nil,nil]
  	puts "Player #{player.name} enter x_cords:"
 	cords[0]=gets.chop
	puts "Player #{player.name} enter y_cords:"
 	cords[1]=gets.chop
       cords
 end
	
 def play 
      while 1== 1 
        cords=[nil,nil]
        
        cords=enter_cords(@player_X) 
        mov(@player_X,cords,1)
        print(@board.cells)
        
        if @one==true then 
                       cords=enter_cords(@player_O)
                     else 
        		cords=@game.bot(@board.cells,0)
                     end
        mov(@player_O,cords,0) 
	print(@board.cells)
                  
        
    end

end

# инициализирую и играю
init
play


