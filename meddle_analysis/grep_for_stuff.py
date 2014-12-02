import os, subprocess

path_to_dir = 'soeller.g'
files_in_dir = os.listdir(path_to_dir)

f = open('parsed/grep.txt', 'w')
for file_in_dir in files_in_dir:
  if file_in_dir != '.DS_Store':
    for tcp_dump in os.listdir(path_to_dir + '/' + file_in_dir):
      filename = path_to_dir + '/' + file_in_dir + '/' + tcp_dump
      print filename
      p = subprocess.Popen(['./grepForStuff copy.sh', filename], stdout=subprocess.PIPE)
      output = p.communicate()[0]
      split = output.split('\n')
      print split
      if len(split) > 2:
        f1 = open('parsed/packets/' + split[0].split('/')[2], 'w')
        f2 = open('httpdata.txt')
        for line in f2:
          f1.write(line)
        f1.close()
        f2.close()
        #exit()

      f.write(filename + '\n' + output + '\n\n')
f.close()