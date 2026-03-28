# Avatar-OS — Master Testbench em Ruby
# Este script simula as fases descritas no testbench VHDL do Avatar-OS:
# Reset, Avatar Init, World Render, Physics Active, Assets Loaded,
# Identity Verified, Crypto Secured, Social Connected, Economy Running, AI Orchestrated.

class AvatarOSTB
  STEP_NS = 10

  def initialize
    @time_ns = 0
    @clk = 0
    @reset = 1
    @signals = {
      avatar_out: 0,
      world_out: 0,
      physics_out: 0,
      asset_out: 0,
      identity_out: 0,
      secure_out: 0,
      social_out: 0,
      economy_out: 0,
      ai_out: 0
    }
  end

  def tick(steps)
    steps.times do
      @time_ns += STEP_NS
      @clk ^= 1
    end
  end

  def run
    # Reset (0–20 ns)
    @reset = 1
    tick(2)
    @reset = 0
    puts "[#{@time_ns} ns] Reset released"

    # Avatar Init (20–60 ns)
    tick(4)
    puts "[#{@time_ns} ns] Avatar Init phase"

    # World Render (60–100 ns)
    tick(4)
    puts "[#{@time_ns} ns] World Render phase"

    # Physics Active (100–140 ns)
    tick(4)
    puts "[#{@time_ns} ns] Physics Active phase"

    # Assets Loaded (140–180 ns)
    tick(4)
    puts "[#{@time_ns} ns] Assets Loaded phase"

    # Identity Verified (180–220 ns)
    tick(4)
    puts "[#{@time_ns} ns] Identity Verified phase"

    # Crypto Secured (220–260 ns)
    tick(4)
    puts "[#{@time_ns} ns] Crypto Secured phase"

    # Social Connected (260–300 ns)
    tick(4)
    puts "[#{@time_ns} ns] Social Connected phase"

    # Economy Running (300–340 ns)
    tick(4)
    puts "[#{@time_ns} ns] Economy Running phase"

    # AI Orchestrated (340–400 ns)
    tick(6)
    puts "[#{@time_ns} ns] AI Orchestrated phase"
  end
end

if __FILE__ == $PROGRAM_NAME
  tb = AvatarOSTB.new
  tb.run
end
