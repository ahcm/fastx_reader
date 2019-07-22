# Package

version       = "0.1.0"
author        = "Andreas Hauser"
description   = "FastQ and Fasta readers for NIM"
license       = "LGPL-3.0"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["fastx_reader"]
binDir        = "bin"



# Dependencies

requires "nim >= 0.20.0"
