def test_format(format_string)
  print "Testing '#{format_string}': "
  puts format(format_string, 12.3456) 
end

test_format "%7.3f"
test_format "%7.2f"
test_format "%7.1f"
test_format "%.1f"
test_format "%.2f"