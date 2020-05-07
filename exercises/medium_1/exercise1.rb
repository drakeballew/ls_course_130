class Device
  def initialize
    @recordings = []
  end

  def listen
   record(yield) if block_given?
  end

  def record(recording)
    @recordings << recording
  end

  def play
    @recordings.each { |rec| puts rec }
  end
end

listener = Device.new
listener.listen { 'Hello world'}
listener.listen
listener.play
listener.listen { 'Hi again'}
listener.play
