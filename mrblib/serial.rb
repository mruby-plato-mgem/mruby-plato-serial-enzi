#
# PlatoEnzi::Serial class
#
module PlatoEnzi
  class Serial
    include Plato::Serial

    @@serial = nil
    @@baud = nil

    def initialize(baud, dbits=8, start=1, stop=1, parity=:none)
      if @@serial
        if @@baud != baud
          @@serial.close
          @@serial = @baud = nil
        end
      end
      unless @@serial
        @@serial = ENZI::Serial.new(baud)
        @@baud = baud
      end
    end

    def _read
      raise "Serial not initialized." unless @@serial
      v = @@serial.read
      v = -1 if v == 0xffff # for enzi-1.04 or earlier
      v
    end

    def _write(v)
      raise "Serial not initialized." unless @@serial
      @@serial.write(v)
    end

    def available
      raise "Serial not initialized." unless @@serial
      @@serial.available
    end

    def flush
      raise "Serial not initialized." unless @@serial
      @@serial.flush
    end

    def close
      @@serial.close if @@serial
      @@serial = nil
    end
  end
end

# register enzi device
Plato::Serial.register_device(PlatoEnzi::Serial)
