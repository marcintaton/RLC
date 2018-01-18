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
require './Elements/Lamp.rb'

#Controlers
require './Controlers/View_controler.rb'


###################################
#                                 #
#  Build your logic circut below  #
#                                 #
###################################

# Add all switches
src_1 = Switch.new("x0", 0)
src_2 = Switch.new("x1", 1)
src_3 = Switch.new("x2", 1)
src_4 = Switch.new("x3", 1)

# Put all switches into switch array
Switch_array = Array.new()
Switch_array << src_1 << src_2 << src_3 << src_4

# Declare and connect all circut components
and_1 = And.new(src_2.output[0], src_3.output[0], src_1.output[0], src_4.output[0])

# Connect lamps to the circuit
lamp_1 = Lamp.new("And_1", and_1.output[0])

# Put all lamps into lamp array
Lamp_array = Array.new()
Lamp_array << lamp_1

# Create view controler component
v_c = View_controler.new(Switch_array, Lamp_array)


