require 'stringio'
require File.expand_path('../../lib/procession', __FILE__)

module Procession
  describe Bar do
    let(:test_out){ test_out = StringIO.new }
    let(:bar) { Procession::Bar.new(10, test_out) }

    it "should print out progres bar" do
      bar.update(1)

      test_out.string.should == "[###{' ' * 18}] 10% " 
    end

    it "should use a progressbar template" do
      bar.template = "%bar %percent %text"

      bar.update(1)

      test_out.string.should == "###{' ' * 18} 10 "
    end

    it 'should add additional info' do
      bar.update(1) do |i|
        "update 10%"
      end

      test_out.string.should == "[###{' ' * 18}] 10% update 10%"
    end

    it 'should clear last line' do
      bar.update(1)

      last_line_length = test_out.string.length

      bar.should_receive(:clear).with(last_line_length)

      bar.update(2)
    end

    # Useless test atm but clear maybe different for different shells
    it 'should clear a line' do
      bar.send(:clear, 12)

      test_out.string == "\e12D"
    end

    it 'should the specified amount of symbols' do
      bar.length = 10

      bar.update(1)

      test_out.string.should == "[##{' ' * 9}] 10% "

      test_out.string = ''

      bar = Procession::Bar.new(10, test_out)

      bar.length = 40
      bar.update 1

      test_out.string == "[#####{' ' * 16} 10% "
    end

  end
end
