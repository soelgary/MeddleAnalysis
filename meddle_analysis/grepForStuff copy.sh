#!/bin/bash

filename="$1"

tcpdump -Ar $filename| grep -v 'TCP' | grep -v 'HTTP' | grep -v 'seq' > httpdata.txt
echo $filename

#echo "-Looking for lat=, latitude="
egrep -io "[^a-zA-Z]?lat([^a-zA-Z]|itude).*[0-9]+(\.?)[0-9]+" httpdata.txt | sort | uniq -c

#echo " Looking for pw=, pwd=, password=, user= " #generalized password and username. commented out because we searched for phone-specific
#egrep -io "[^a-zA-Z]?pw[^a-zA-Z]?([=:])+(\"?)....." httpdata.txt | sort | uniq -c
#egrep -io "[^a-zA-Z]?pwd[^a-zA-Z]?([:=])+(\"?)...." httpdata.txt | sort | uniq -c
#egrep -io "[^a-zA-Z]?password[^a-zA-Z]?([:=])+(\"?)...." httpdata.txt | sort | uniq -c
#egrep -io "[^a-zA-Z]?user[^a-zA-Z]?([:=])+(\"?)...." httpdata.txt | sort | uniq -c

#echo " Looking for IMEI=  " #generalized imei. commented out because we searched for phone specific.
#egrep -io "[^a-zA-Z]?IMEI[^a-zA-Z]?([:=])+(\"?)[0-9]{15,}" httpdata.txt | sort | uniq -c
#egrep -io "[^a-zA-Z]?udid[^a-zA-Z]?([:=])+(\"?)[0-9]{15,}" httpdata.txt | sort | uniq -c
#egrep -io "[^a-zA-Z]?uuid[^a-zA-Z]?([:=])+(\"?)[0-9]{15,}" httpdata.txt | sort | uniq -c
#egrep -io "[^a-zA-Z]?-Id[^a-zA-Z]?([:=])+(\"?)[0-9]{15,}" httpdata.txt | sort | uniq -c

#Wecho "Looking for phone specific things"
#phone-specific searches
#grep -i "[your IMEI and/or device ID]" httpdata.txt | sort | uniq -c
#grep -i "355031040753366" httpdata.txt | sort | uniq -c
#grep -i "soelgary" httpdata.txt | sort| uniq -c
#grep -i "soeller.g" httpdata.txt | sort| uniq -c
#grep "finger11" httpdata.txt | sort | uniq -c

#contact info (phone specific)
#grep -i "[strings in your contacts list]" httpdata.txt | sort | uniq -c
#grep -i "[phone numbers - yours and others'" httpdata.txt | sort | uniq -c

#echo " Looking for phone number, also phone=, number=  "
#egrep -io "[^a-zA-Z]?number[^a-zA-Z]?([:=])+(\"?).........." httpdata.txt | sort | uniq -c
#egrep -io "[^a-zA-Z]?phone[^a-zA-Z]?([:=])+(\"?)........." httpdata.txt | sort | uniq -c
#grep "9350165" httpdata.txt | sort | uniq -c
#grep "935-0165" httpdata.txt | sort | uniq -c
#echo " Looking for credit card numbers "
#egrep -io '4[0-9]{12}(?:[0-9]{3})?' httpdata.txt | sort  | uniq -c #Visa
#egrep -io '5[1-5][0-9]{14}' httpdata.txt | sort | uniq -c #MasterCard
#egrep -io '[47][0-9]{13}' httpdata.txt | sort | uniq -c #AmEx
#egrep -io '3(?:0[0-5]|[68][0-9])[0-9]{11}' httpdata.txt | sort | uniq -c #DinersClub
#egrep -io '6(?:011|5[0-9]{2})[0-9]{12}' httpdata.txt | sort | uniq -c #Discover
#egrep -io '(?:2131|1800|35\d{3})\d{11}' httpdata.txt | sort | uniq -c #JCB

#echo "\nLooking for email addresses"
#egrep -io "[^ ]+@([a-z]+\.)+(((com)|(org))|((edu)|(net)))" httpdata.txt