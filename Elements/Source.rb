class Source < Element

    attr_writer :input
    attr_reader :output

    def initialize (_in)

        @input = _in
        @output = Array.new()
        @output << State.new << State.new
        
        Thread.fork{
            loop do
                sleep(0.5)
                #puts "Source Output port: #{ @output[0].state }"
                calculate()
            end     
        }
    end

    def calculate
        @output[0].state = @input
        @output[1].state = negation(@input)
    end

end