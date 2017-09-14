#!/bin/bash

source $HOME/.config/polybar/location.sh

# write xml to variable
w_xml=$(curl --silent "https://weather.tuxnet24.de/?id=$location&mode=xml&unit=imperial");
# get fields from xml via xmllint | xargs for trimming
# weather description
w_txt=$(xmllint --xpath "string(//current_text)" - <<<"$w_xml" | xargs);
# temperature | remove spaces from text (&#176;C prepended by space)
w_tpc=$(xmllint --xpath "string(//current_temp)"  - <<<"$w_xml" | xargs); w_tpc=${w_tpc//[[:blank:]]/};
# further fields not used atm
# w_tph=$(xmllint --xpath "string(//current_temp_high)"  - <<<"$w_xml" | xargs);
# w_tpl=$(xmllint --xpath "string(//current_temp_low)"  - <<<"$w_xml" | xargs);

# set $w_sym according to $w_txt
if   [ "$w_txt" == "Sunny" ]; then w_sym="";
elif [ "$w_txt" == "Mostly Sunny" ]; then w_sym="~";
elif [ "$w_txt" == "Showers" ]; then w_sym="";
elif [ "$w_txt" == "Clear" ]; then w_sym="";
elif [ "$w_txt" == "Thunderstorms" ]; then w_sym="";
elif [ "$w_txt" == "Scattered Thunderstorms" ]; then w_sym="~";
elif [ "$w_txt" == "Isolated Thundershovers" ]; then w_sym="~~";
elif [ "$w_txt" == "Cloudy" ]; then w_sym="";
elif [ "$w_txt" == "Mostly Cloudy" ]; then w_sym="~";
elif [ "$w_txt" == "Partly Cloudy" ]; then w_sym="";
elif [ "$w_txt" == "Breezy" ]; then w_sym="";
# if unknown text, set text instead of symbol
else w_sym=$w_txt; 
fi
# output <symbol><space><temp>
echo "$w_sym"" ""$w_tpc";

exit 0
