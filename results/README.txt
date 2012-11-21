20121028

Following Justin's script, added detector_date to 2012 pass_bin, then summed by night.

Following Justin's script, joined pass_bin_nightly_sum + detector_date_to_site + site_to_variables for 2011 & 2012.
named these files: 
pass_bin_2011_nightly_sums_full
pass_bin_2012_nightly_sums_full
respectively

20121115
checked corrections Justin made to temperature script, converted temperature data with right date/time to csv, to check visually.

Then tried to loop through date columns and extract mean, max, min, and sunset temperature- but ran into error (I think because the temperature column values have decimals), pushed script to Justin for help.

20121119 
Finally fixed temperature script, (had to separate detector and date into separate columns). Have all the temp. data with the correct date. 
Tried to write script to sum nightly temperature data (avg., min., max., tsunset)- but failing, so will wait for Justin's help.

20121120
Created new csv with all passes from 2011 and 2012 - copied and pasted all data from (pass_bin_detector_date & pass_bin_detector_date_2012). Named file: pass_bin_both_years and put in data folder.

Adjusted date and took (mean, tmin, tmax, and tsunset) for each night of temperature data, imported file as temp_right_date_time- also made a copy of file called temp_data) **still need to figure out how to make tsunset actually the 10th reading (not the first reading)- error in python.

Made file of nightly distribution of calls by species, Woot! named file hour_pass_distribution. Also created duplicate called nightly_distribution_calls_graph - to create a graph.

