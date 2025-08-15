# Compatibility shim for Liquid < 5 on Ruby >= 3.2
# Ruby 3.2 removed Object#tainted?. Liquid 4 still calls it.
# Define a no-op fallback only if the method is missing.
unless nil.respond_to?(:tainted?)
  class Object
    def tainted?
      false
    end
  end
end

# Additionally, guard Liquid's taint check to avoid calling `tainted?` on nil
begin
  require 'liquid'
  if Liquid.const_defined?(:Variable)
    # Force-disable Liquid's taint check in dev environments where Ruby >= 3.2 removes tainted?
    Liquid::Variable.class_eval do
      def taint_check(_obj)
        # no-op
      end
    end
  end
rescue LoadError
  # Ignore if Liquid is not available yet; Jekyll will require it.
end


