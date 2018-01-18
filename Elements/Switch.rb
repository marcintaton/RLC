class Switch < Element

    attr_writer :input
    attr_reader :output, :name

    def initialize (name, _in)

        @name = name
        @input = _in
        @output = Array.new()
        @output << State.new << State.new
        
        Thread.fork{
            loop do
                sleep(0.1)
                #puts "Switch Output port: #{ @output[0].state }"
                calculate()
            end     
        }
    end

    def calculate
        @output[0].state = @input
        @output[1].state = negation(@input)
    end

end