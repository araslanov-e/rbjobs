module TokenGenerator
  # Generate string with random hex numbers
  # E.g: 1FA1304E-2530-42A9-25BD-04919FE9DB4B
  def generate_token
    ("%04x%04x-%04x-%04x-%04x-%06x%06x" % [ rand(0x0010000), rand(0x0010000), rand(0x0010000), rand(0x0010000), rand(0x0010000), rand(0x1000000), rand(0x1000000) ]).upcase
  end
end