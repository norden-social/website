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


