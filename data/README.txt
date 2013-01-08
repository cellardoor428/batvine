20121026-

revised 2011 & 2012 site variables with 5 character site legend (to match) Justin's style.

Made detector_date_site tables for 2011 & 2012

20121027-

merged 2011 & 2012 site variables- removed columns (date, round, detector). Now only 1 entry per site. Added column for extra.

copied pass_bin_2012.csv into batvine/data

renamed the 2011 pass_bin.csv to pass_bin_2011.csv

20121101-
added sensor data batvine - about to try and append SMX and correct date for all files.

20121108-
Corrected detector_date_site_2011 with correct dates for round 5 (7/28-8/1). Then re-ran ipython notebook for nightly_sums_2011.

20121120-
Moved pass_bin_both_years from results folder to data folder (see notes in result folder).
20121213-
made csv with site and WGLH densities for 2011. Named file site_wglh_2011.

20121213-
opened sensors_all.txt and manually removed SM3_20120721 - entry for 2100, because it was the only detector that turned on before I removed the batteries when I picked up all detectors after the last round.

Temperature error found! M1-R4, Sm2 & SM5 were not cleared of data from previous round, duplicate temperature files found, deleted temperature data from 7/21-7/23 in the M1-R4 sensor files (in directory bat_vineyard_data). 

20121222- 
Opened sensors_all.txt and manually removed the duplicate entries for SM2 & SM5 from 7/21-7/23 (adjusted for date). Reran temperature python script.

20130106- 
Copied all the "too hot" sunset temperautres from the temperature ipynb, and manually compared them against the historic data on weather underground, appended record temps to the txt file (named: "too_hot_temps.txt"). Looks like all the SM temps are indeed too high- maybe exclude this variable? 
Went back through the ipynb script and tried changing the sunset temp to the 8th not the 4th entry and still had several temps >32. Hmph!
