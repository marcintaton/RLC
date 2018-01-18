class View_controler 

    def initialize (switch_array, lamp_array)

        @time_diagram = Array.new()
        (switch_array.length + lamp_array.length).times do
            @time_diagram << Array.new()
        end
        @name_length = set_name_length(switch_array, lamp_array)
        @state_num_array = Array.new()
        @state_num_array << 0

        sleep(1)
        display(switch_array, lamp_array)
        
    end

    def clear_screen
        Gem.win_platform? ? (system "cls") : (system "clear")
    end
    
    def display (switch_array, lamp_array)

        _exit_param = 0

        while _exit_param == 0

            update_diagram(switch_array, lamp_array)
            
            clear_screen()
            show_states(switch_array, lamp_array)
            puts
            show_diagram(switch_array, lamp_array)
            puts
            puts "Type chosen switch name to click it:"
            _option = gets
            _option = _option.chomp

            if _option == "exit"
                _exit_param = 1
            else
                switch_array.each do |i|
                    if i.name == _option
                        if i.output[0].state == 0
                            i.input = 1
                        else
                            i.input = 0
                        end
                    end
                end
            end
            @state_num_array << @state_num_array.last + 1
            sleep(0.5)
        end

    end

    def set_name_length (switch_array, lamp_array)

        _i=0
        _dump_array = switch_array + lamp_array
        _dump_array.each do |i| 
            if i.name.length > _i
                _i = i.name.length
            end
        end

        if _i%3 == 0
            @name_length = _i
        elsif _i%3 == 1
            @name_length = _i + 2
        elsif _i%3 == 2
            @name_length = _i + 1
        end        
    end

    def update_diagram (switch_array, lamp_array)

        _i = 0
        _dump_array = switch_array + lamp_array
        for _i in 0.._dump_array.length-1 do 
            @time_diagram[_i] << _dump_array[_i].output[0].state
        end

    end

    def show_states(switch_array, lamp_array)

        switch_array.each do |i|
            puts "#{i.name} : #{i.output[0].state}"
        end

        puts

        lamp_array.each do |i|
            puts "#{i.name} : #{i.output[0].state}"
        end
        
    end

    def show_diagram (switch_array, lamp_array)

        
        puts "Time diagram:"
        puts
        print_state_nums()
        _i = 0
        _dump_array = switch_array + lamp_array
        @time_diagram.each do |i|
            print _dump_array[_i].name 
            (@name_length - _dump_array[_i].name.length + 1).times do
                print ' '
            end
            print '||  '
            i.each do |j|       
            
                if j == 0
                    3.times do
                        print '_'                    
                    end
                elsif j == 1
                    3.times do
                        print "\u2584"
                    end
                end

                #print j
            end
            puts
            puts
            _i += 1
        end

    end

    def print_state_nums 

        _height = @state_num_array.max.to_s.length

        _j =  " "

        (_height - 1).times do 
            _j << " "
        end

        _white_char = Array.new(@name_length/3+2, _j)

        _temp_arr = _white_char + @state_num_array
        
        _temp_arr.map do |num|
        num.to_s.ljust(_height).split(//)
        end.transpose.each do |line|
            puts line.join("  ")
        end      

    end
end