class State 

    attr_accessor :state

    def initialize (*args)

        if args.length == 0
            @state = 0
        elsif args.length == 1
            @state = args[0]
        end
        
    end
end