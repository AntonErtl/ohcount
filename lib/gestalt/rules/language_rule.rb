module Ohcount
	module Gestalt

		# states that a platform depends on a programming
		# language being at least :min_percent
		class LanguageRule < Rule
			attr_reader :language
			attr_reader :min_percent

			def initialize(language, options= {})
				@min_percent = options.delete(:min_percent) || 0
				raise "Unrecognized LanguageRule options '#{ options.keys.inspect }'" if options.any?
				@language = language
			end

			def triggered?(g)
				return self if g.includes_language?(language, min_percent)
			end

		end
	end
end
