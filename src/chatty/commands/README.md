# Idea

Have a `Command` class that handles which command to call. This is handled in `Command.run(String, String = "", String = "")`.  
`run(String, String = "", String = "")` allows new commands to implement their methods with 0 or more parameters.
This is handy because not all commands require `caller_name` and/or `ducky_args` - see `echo.cr` and `consent.cr`.  

New commands can be created in separate files or multiple commands can be grouped together as done in `duckie.cr`.

# Next step

Call `Commands::Command.run("cmd-name", "caller-name", "duckie-args")` in `Chatty.respond`... (I think).