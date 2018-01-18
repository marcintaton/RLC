class Not < Element

    attr_reader :output

    def initialize (*args)

        @output = Array.new()
        @output << State.new
        
        Thread.fork{
            loop do
                sleep(0.1)
                #puts "Not Output port: #{ @output[0].state }"
                calculate(*args)
            end     
        }
    end

    def calculate (*args)
        @output[0].state = negation(args[0].state)
    end

end