# cfg_sysadmin



## About 

This is a legacy puppet module that may well be picked up for development and modernisation again. It's been cloned from my internal git repo after a data loss scare.

The module currently only does one thing of value, creating a custom fact allowin ipv4 or ipv6 ip addresses to be matched to the fqdn of a system, allowing the fact to be referenced in other modules and classes. This is important on multi-homed system where you want a class to configure something against the correct ip address on your system, most commonly the fqdn of a system

## Integrate with your tools

at the moment there are no integrations with anything such as test tools or runners. It's an old module that I may pickup again


## Name
cfg_sysadmin - puppet class for configuring system administration functions. It's a legacy naming standard from an internal repo where cfg was modules that configured functionality / settings. If the module is to go forward (doubtful it's old) it should probably be renamed to comply with modern puppet naming standards

## Description
delivers basic functionality into sysctl / kernal parameters. Key functionality is the custom fact mapping ipv4 and ipv6 addresses to fqdn of host

## Contributing

I'd love and welcome contirbutions to this module it would probably inspire me to pick it up and do more and better with it

fork and merge if you want to put something into it, or take the custom fact out of it and do something better with it

## Authors and acknowledgment
Matthew Darcy a

## License
Free for anyone to use how they want

## Project status
Alive - but slow
