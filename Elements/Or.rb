class Or < Element

    attr_reader :output 

    def initialize (*args)

        @output = Array.new()
        @output << State.new << State.new

        Thread.fork {
                loop do
                sleep(0.5)
                #puts "Or output port: #{ @output[0].state } "
                calculate(*args)
            end       
        }
    end

    def calculate (*args)

        @output[0].state = 0
        @output[1].state = 1
        args.each do |i|
            if i.state == 1
                @output[0].state = 1
                @output[1].state = 0
            end
        end
    end

end