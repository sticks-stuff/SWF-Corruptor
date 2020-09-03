# SWF-Corruptor
This uses FFDEC to extract all the shapes inside SWF files, randomize them and then replace them. 

# Usage
`swfCorruptor.vbs <input_swf>`

If you add `--overwrite` it will overwrite the input swf, otherwise it will output a swf in the same directory with -corrupted added to the end of the filename

Included is a batch script to corrupt every single swf file in a directory (`corruptDirectory.bat`), however this will overwrite all the swfs so make a backup!

# TODO
- Since this uses command line arguments for randomization, it will fail if there are too many shapes because of the length limit of commands (32767 characters)
- It extracts them as PNGs meaning there is a quality loss because I can't seem to get FFDEC to replace using SVGs
