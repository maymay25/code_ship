require 'benchmark'
 
N = 50000
K = 10000
 
a = {}
K.times{|i| a[i] = nil}
 
class Hash
  def custom_shift
    ar = first
    delete ar[0]
    ar
  end
end
 
Benchmark.bm do |x|
  x.report("Hash#shift") do
    N.times{ k,v = a.shift; a[k] = v }
  end
 
  x.report("Hash#custom_shift") do
    N.times{ k,v = a.custom_shift; a[k] = v }
  end
end