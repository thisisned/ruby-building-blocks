module Enumerable

	def my_each
		(self.length).times do |i|
			yield(self[i])
		end
		self
	end


	def my_each_with_index
		(self.length).times do |i|
			yield(self[i],i)
		end
		self
	end


	def my_select
		arr = []
		self.my_each do |i|
			arr << i if yield(i)
		end
		arr
	end


	def my_all?
		result = true
		self.my_each do |i|
			if block_given?
				result = false unless yield(i)
			else
				result = false unless i
			end
		end
		result
	end


	def my_any?
		result = false
		self.my_each do |i|
			if block_given?
				result = true if yield(i)
			else
				result = true if i
			end
		end
		result
	end


	def my_none?
		result = true
		self.my_each do |i|
			if block_given?
				result = false if yield(i)
			else
				result = false if i
			end
		end
		result
	end


	def my_count(val = nil)
		count = 0
		self.my_each do |i|
			if block_given?
				if yield(i)
					count += 1
				end
			elsif val
				if val == i
					count += 1
				end
			else
				count += 1
			end
		end
		count
	end
	
=begin
	def my_map
		result = []
		self.my_each do |i|
			result << yield(i)
		end
		result
	end
=end

	def my_map(proc = nil) ## Can't make this work w/ passing both block and proc, but why would you?
		result = []
		if proc
			self.my_each do |i|
				result << (proc.call(i))
			end
		else
			self.my_each do |i|
				result << yield(i)
			end
		end
		result
	end
	
	def my_inject(initial=nil, sym=nil) ## Stolen from someone else I freely admit

		case initial

		when Numeric
			memo = initial
			case sym

			when Symbol
				for element in self
					case sym
					when :*
						memo = memo * element
					when :+
						memo = memo + element
					when :- 
						memo = memo - element
					when :/
						memo = memo/element
					when :%
						memo = memo % element
					else 
						return
					end		
				end			

			else
				for element in self
					memo = yield(memo, element)
				end
			end

		when Symbol
			skip = true
			for element in self
				if skip
					memo = element
					skip = false
				else
					case initial
					when :*
						memo = memo * element
					when :+
						memo = memo + element
					when :- 
						memo = memo - element
					when :/
						memo = memo/element
					when :%
						memo = memo % element
					else 
						return
					end
				end
			end

		else
			skip = true
			for element in self
				if skip
					memo = element
					skip = false

				else
					memo = yield(memo, element)	
				end
			end
		end
		memo
	end
end
	
	
def multiply_els(arr)
	arr.my_inject(:*)
end