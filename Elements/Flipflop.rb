class Flipflop < Element

    def determine_ff(type)

        if type == "rising_edge"
            if (@prev_state == 0 && @curr_state == 1)
                @prev_state = 1
                return true
            end
        elsif type == "falling_edge"
            if (@prev_state == 1 && @curr_state == 0)
                @prev_state = 0
                return true
            end
        elsif type == "level"
            if @curr_state == 1
                return true
            end
        else 
            return false
        end
    end
end