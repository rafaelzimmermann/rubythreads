
class ThreadTest
  def initialize
    @counter = 0
  end

  def run
    100.times.map do
      Thread.new do
        sleep(0.1)
        100_000.times do
          v = @counter
          v = v + 1
          @counter = v
        end
      end
    end.each(&:join)

    puts(@counter)
  end
end

t = ThreadTest.new
t.run