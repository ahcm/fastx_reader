# written by Andreas Hauser
# simple iterators for FastQ and Fasta  format
#
import system

iterator fastq_reader*(infile : File) : (string, string, string) =
  var name = infile.readLine()
  while true:
    var sequence = ""
    for s in infile.lines:
      if s[0] == '+':
        var commentp = s
        break
      else:
        sequence &= s
    var needs_yield = true
    var qual = ""
    for q in infile.lines:
      if len(qual) > 0 and  q[0] == '@':
        yield (name, sequence, qual)
        needs_yield = false
        name = q
        break
      else:
        qual &= q
    if needs_yield:
      yield (name, sequence, qual)
      break


iterator fasta_reader*(infile : File) : (string, string) =
  var name = readLine(infile)
  while true:
    var needs_yield = true
    var sequence = ""
    for line in infile.lines:
      if len(line) > 0 and line[0] == '>':
        yield (name,sequence)
        needs_yield = false
        name = line
        break
      else:
        sequence &= line
    if needs_yield:
      yield (name, sequence)
      break


when isMainModule:
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
