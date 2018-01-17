#!/usr/bin/env ruby

require './State.rb'
require './Element.rb'
require './Source.rb'
require './And.rb'
require './Nand.rb'
require './Or.rb'
require './Nor.rb'
require './Xor.rb'
require './Xnor.rb'
require './Not.rb'


####

src_1 = Source.new(0)
src_2 = Source.new(1)
src_3 = Source.new(1)
src_4 = Source.new(1)

and_1 = And.new(src_2.output[0], src_3.output[0], src_1.output[0], src_4.output[0])
nand_1 = Nand.new(src_2.output[0], src_3.output[0], src_1.output[0], src_4.output[0])
or_1 = Or.new(src_2.output[0], src_3.output[0], src_1.output[0], src_4.output[0])
nor_1 = Nor.new(src_2.output[0], src_3.output[0], src_1.output[0], src_4.output[0])
xor_1 = Xor.new(src_2.output[0], src_3.output[0], src_1.output[0], src_4.output[0])
xnor_1 = Xnor.new(src_2.output[0], src_3.output[0], src_1.output[0], src_4.output[0])
not_1 = Not.new(src_1.output[0])
not_2 = Not.new(src_1.output[1])



5.times do
    sleep(0.51)
    puts
end

src_1.input = 1
src_2.input = 0
src_3.input = 0
src_4.input = 0



loop do

end
