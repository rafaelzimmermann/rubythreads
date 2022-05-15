class ThreadTest
  def initialize
   @counter = [0]
  end

  
  def add!
   v = @counter[0] + 1
   File.open("output#{Thread.current.to_s}", "a") { |line| line.puts("#{v}\n") }
   @counter[0] = v
  end

  def run
   @counter = [0]
   100.times.map do 
   Thread.new do
      sleep(0.1)  
      100_000.times do
         add!
      end
    end
   end.each(&:join)
   puts @counter
  end
end

t = ThreadTest.new
t.run