import os

path_to_dir = 'ServersContacted'
files_in_dir = os.listdir(path_to_dir)
website_count = {}
for current_dir in files_in_dir:
    if current_dir != '.DS_Store':
      f = open(path_to_dir + '/' + current_dir + '/serverscontacted.txt', 'r')
      for line in f:
        if line != '' and not 'soeller.g' in line:
          split = line.replace('\n', '').split('\t')
          if split[1] != '':
            if split[1] in website_count:
              website_count[split[1]] += 1
            else:
              website_count[split[1]] = 1
      f.close()

f = open('parsed/servers_contacted.txt', 'w')
for key, value in sorted(website_count.iteritems(), key=lambda (k,v): (v,k), reverse=True):
  f.write("%s: %s\n" % (key, value) )