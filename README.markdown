Description
===========

A simple plugin that adds a .to_b method to various classes to aide in testing 
for boolean values against variously typed objects.

Why nil, false and true
-----------------------

If you look at the source, you'll note that nil.to_b returns nil, rather than 
false. Additionally, a string like 'notaboolean'.to_b also returns nil. This 
was done on purpose. I always ensure all the boolean columns in my database 
are created with :null => false to avoid any issues relating to null values 
in boolean fields. However, to_b returning nil in certain circumstances allows 
me the flexibility when using this in conjunction with an API to accept nil, 
false and true values for specific parameters.

An example of why I want the ability the test for nil, false and true is that 
if a boolean parameter is left out I want my SQL to search WHERE true OR false, 
if the parameter is set to true I want it to search WHERE true and if the parameter 
is false, false. It is simply easier to have a scope like the following:

    named_scope :with_tip, lambda {|value| value.to_b.nil? ? {} : {:conditions => {:tip => value.to_b}}}

Rather than explicitly searching WHERE true OR false, I simply leave out the 
condition. When the value is true or false, I include the condition.

Examples
--------

    >> true.to_b
    => true
    
    >> false.to_b
    => false
    
    >> nil.to_b
    => nil
    
    >> 'true'.to_b
    => true
    
    >> 'TRUE '.to_b
    => true
    
    >> 'false'.to_b
    => false
    
    >> 'F'.to_b
    => false
    
    >> 'random'.to_b
    => nil
    
    >> 1.to_b
    => true
    
    >> 0.to_b
    => false
    
    >> 5.to_b
    => nil