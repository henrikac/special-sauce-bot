# Thoughts

The idea is to create a bunch of small commands that all inherits from `abstrat class Command`.  
When a command inherits from this class they have to implement their own version of `execute(caller_name : String, ducky_args : String) : String`. Having a bunch of smaller command classes makes it easier to extend a command, if needed some day, or split a fat `execute` method up into one or more private methods that's then called in `execute`.

## Next step

Figure out how to call the `execute` method from a specific command based on the input form chat. I'm not sure how this is done in `Crystal` of if its even possible?