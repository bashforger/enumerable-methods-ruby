require '../main.rb'

describe Enumerable do
  emp_arr = []
  ran = (1..10)
  arr = [3, 4, 7, 1, 2, 8]
  arr_str = %w[andrik alan lluis akshay]
  up_arr = %w[ANDRIK ALAN LLUIS AKSHAY]

  context '#my_each' do
    it "my_each iteration testing" do
      expect(arr.my_each {|i|}).to eq(arr.each {|i|})
    end

    it "my_each block testing" do
      my_emp_arr = []
      arr.each {|i| emp_arr << (i + 1)}
      arr.my_each {|i| my_emp_arr << (i + 1)}
      expect(my_emp_arr).to eq(emp_arr)
    end

    it "my_each range testing" do
      expect(ran.my_each {|i|}).to eq(ran.each {|i|})
    end
  end

  context '#my_each_with_index' do
    it "my_each_with_index iteration testing" do
      expect(arr.my_each_with_index {|i, j|}).to eq(arr.each_with_index {|i, j|})
    end

    it "my_each_with_index block testing" do
      expect(arr.my_each_with_index {|i, j| puts "#{i} : #{j}"}).to eq(arr.each_with_index {|i, j| puts "#{i} : #{j}"})
    end

    it "my_each_with_index range testing" do
      expect(ran.my_each_with_index {|i, j| puts "#{i} : #{j}"}).to eq(ran.each_with_index {|i, j| puts "#{i} : #{j}"})
    end
  end

  context '#my_select' do
    it 'my_select iteration testing' do
      expect(arr.my_select(&:odd?)).to eq(arr.select(&:odd?))
    end

    it 'my_select block testing' do
      expect(arr.my_select { |n| n == 5 }).to eq(arr.select { |n| n == 5 })
    end
  end
  
  context '#my_all?' do
    it 'my_all? block iteration testing' do
      expect(arr.my_all?(&:odd?)).to eq(arr.all?(&:odd?))
    end

    it 'my_all? range testing' do
      expect(ran.my_all?(6)).to eq(ran.all?(6))
    end

    it 'my_all? class testing' do
      expect(arr_str.my_all?(String)).to eq(arr_str.all?(String))
    end
  end

  context '#my_any?' do
    it 'my_any? block iteration testing' do
      expect(arr.my_any?(&:odd?)).to eq(arr.any?(&:odd?))
    end
    it 'my_any? range testing' do
      expect(ran.my_any?(7)).to eq(ran.any?(7))
    end
    it 'my_any? class testing' do
      expect(arr_str.my_any?(String)).to eq(arr_str.any?(String))
    end
  end

  context '#my_none?' do
    it 'my_none? block iteration testing' do
      expect(arr.my_none?(&:odd?)).to eq(arr.none?(&:odd?))
    end
    it 'my_none? range testing' do
      expect(ran.my_none?(8)).to eq(ran.none?(8))
    end
    it 'my_none? class testing' do
      expect(arr_str.my_none?(String)).to eq(arr_str.none?(String))
    end
  end

end