class D_flipflop < Flipflop

    attr_reader :output 

    def initialize (*args)

        @output = Array.new()
        @output << State.new << State.new

        @output[0].state = 1
        @output[1].state = 0

        @prev_state = 0
        @curr_state = 0
        
        Thread.fork {
                loop do
                sleep(0.1)
                #puts "D flipflop output port: #{ @output[0].state } "
                calculate(*args)
            end       
        }
    end

    def calculate (*args)      
    
        @curr_state = args[1].output[0].state
        
        if determine_ff(args[0]) == true
            @output[0].state = args[2].output[0].state
            if args[2].output[0].state == 1
                @output[1].state = 0
            else 
                @output[1].state = 1
            end
        end

    end

end
