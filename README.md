# fastx_reader
FastQ and Fasta readers for NIM

# Usage
"""
  import os
  let args = commandLineParams()
  let filename = args[0]
  case filename[^1]
  of 'a':
    for name, sequence in fasta_reader(open(filename)):
      echo filename, " ", name," ", len(sequence)
  of 'q':
    for name, sequence , quality in fastq_reader(open(filename)):
      echo filename, " ", name," ", len(sequence)
  else:
    echo "Don't know whether file is Fasta or FastQ from filename"
"""
