class Lamp < Element

    attr_reader :output, :name

    def initialize (name, _in)

        @name = name
        @output = Array.new()
        @output << State.new
        
        Thread.fork{
            loop do
                sleep(0.09)
                #puts "Lamp Output port: #{ @output[0].state }"
                calculate(_in)
            end     
        }
    end

    def calculate (_in)
        @output[0].state = _in.state
    end

end