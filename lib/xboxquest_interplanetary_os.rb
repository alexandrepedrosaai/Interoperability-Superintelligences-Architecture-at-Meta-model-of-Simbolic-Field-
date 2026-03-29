# Xboxquest Interplanetary OS — Gem of Ruby's Stars Caches Fields
# Integrates artifacts from:
#   - AvatarOSTB   (avatarostb.rb)
#   - MetaverseOSTB (metaverseostb.rb)
#   - AvatarTB      (avatartb.rb)
#   - InteroperabilitySuperintelligences (lib/interoperability_superintelligences.rb)
#
# Cache artifact key:
#   setup-ruby-bundler-cache-v6-ubuntu-24.04-x64-ruby-3.2.11-wd-
#   .../Gemfile.lock-83394beefc8ea1853fd68afa4f5a27ac118d91ac9ac3fa2451fb17adc1535126

require_relative "interoperability_superintelligences"
require_relative "../avatarostb"
require_relative "../metaverseostb"

module XboxquestInterplanetaryOS
  GEM_NAME    = "xboxquest_interplanetary_os_gem_of_rubys_stars_caches_fields"
  VERSION     = "1.0.0"
  CACHE_KEY   = "setup-ruby-bundler-cache-v6-ubuntu-24.04-x64-ruby-3.2.11-wd-" \
                "Gemfile.lock-83394beefc8ea1853fd68afa4f5a27ac118d91ac9ac3fa2451fb17adc1535126"

  # Orchestrates all artifact testbenches in sequence
  class StarField
    def self.launch
      puts "=" * 60
      puts "  Xboxquest Interplanetary OS — Stars Caches Fields"
      puts "  Version: #{VERSION}"
      puts "=" * 60
      puts
      puts "[Core] #{InteroperabilitySuperintelligences::Core.status}"
      puts "[Core] #{InteroperabilitySuperintelligences::Core.symbolic_field_status}"
      puts

      puts "--- AvatarOSTB Sequence ---"
      AvatarOSTB.new.run
      puts

      puts "--- MetaverseOSTB Sequence ---"
      MetaverseOSTB.new.run
      puts

      puts "[Cache Key] #{CACHE_KEY}"
      puts
      puts "All interplanetary artifact fields initialized."
    end
  end
end

XboxquestInterplanetaryOS::StarField.launch if __FILE__ == $PROGRAM_NAME
