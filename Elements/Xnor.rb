class Xnor < Element

    attr_reader :output 

    def initialize (*args)

        @output = Array.new()
        @output << State.new << State.new

        Thread.fork {
                loop do
                sleep(0.1)
                #puts "Xnor output port: #{ @output[0].state } "
                calculate(*args)
            end       
        }
    end

    def calculate (*args)

        _num_of_1s = 0         
        args.each do |i|
            if i.state == 1
                _num_of_1s+=1
            end
        end

        if _num_of_1s%2 == 0
            @output[0].state = 1
            @output[1].state = 0
        else
            @output[0].state = 0
            @output[1].state = 1
            
        end
    end

end