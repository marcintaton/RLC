#!/usr/bin/env ruby

#Logic Circut elements
require './Elements/State.rb'
require './Elements/Element.rb'
require './Elements/Switch.rb'
require './Elements/And.rb'
require './Elements/Nand.rb'
require './Elements/Or.rb'
require './Elements/Nor.rb'
require './Elements/Xor.rb'
require './Elements/Xnor.rb'
require './Elements/Not.rb'
require './Elements/Flipflop.rb'
require './Elements/D_flipflop.rb'
require './Elements/Lamp.rb'


#Controlers
require './Controlers/View_controler.rb'


###################################
#                                 #
#  Build your logic circut below  #
#                                 #
###################################

# Add all switches
clock = Switch.new("c", 0)
dinput = Switch.new("d", 1)


# Put all switches into switch array
Switch_array = Array.new()
Switch_array << clock << dinput
# Declare and connect all circut components


d_ff = D_flipflop.new("level", clock, dinput)

# Connect lamps to the circuit
lamp_1 = Lamp.new("Q", d_ff.output[0])
lamp_2 = Lamp.new("!Q", d_ff.output[1])


# Put all lamps into lamp array
Lamp_array = Array.new()
Lamp_array << lamp_1 << lamp_2 

# Create view controler component
v_c = View_controler.new(Switch_array, Lamp_array)


