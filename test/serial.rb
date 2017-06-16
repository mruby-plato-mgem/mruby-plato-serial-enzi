# PlatoEnzi::Serial class

module ENZI
  class Serial
    def initialize(baud); end
    def read; -1; end
    def write(v); v; end
    def available; 0; end
    def flush; end
    def close; end
  end
end

assert('Serial', 'class') do
  assert_equal(PlatoEnzi::Serial.class, Class)
end

assert('Serial', 'superclass') do
  assert_equal(PlatoEnzi::Serial.superclass, Object)
end

assert('Serial', 'new') do
  ser1 = PlatoEnzi::Serial.new(9600)
  ser2 = PlatoEnzi::Serial.new(19200, 7)
  ser3 = PlatoEnzi::Serial.new(38400, 8, 1)
  ser4 = PlatoEnzi::Serial.new(76800, 8, 1, 1)
  ser5 = PlatoEnzi::Serial.new(115200, 8, 1, 1, :even)
  assert_true(ser1 && ser2 && ser3 && ser4 && ser5)
end

assert('Serial', 'new - argument error') do
  assert_raise(ArgumentError) {PlatoEnzi::Serial.new}
  assert_raise(ArgumentError) {PlatoEnzi::Serial.new(19200, 8, 1, 1, :odd, 1)}
end

assert('Serial', '_read') do
  ser = PlatoEnzi::Serial.new(9600)
  assert_equal(ser._read, -1)
end

assert('Serial', '_write') do
  assert_nothing_raised {
    ser = PlatoEnzi::Serial.new(9600)
    ser._write(1)
  }
end

assert('Serial', 'flush') do
  assert_nothing_raised {
    ser = PlatoEnzi::Serial.new(9600)
    ser.flush
  }
end

assert('Serial', 'close') do
  assert_nothing_raised {
    ser = PlatoEnzi::Serial.new(9600)
    ser.close
  }
end
