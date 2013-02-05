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

20121213- 

Removed dead days from temperature data (note: look at days that had double the number of temperature entries), then updated csv and named it final_temp_data.

Merged the temp data with the 2011 pass_bin_nightly_sum_2011_full.csv (need to figure out how to merge the 2011 & 2012 table- I just want to add the 2012 data below the 2011, right?) named it: nightly_sum_full_2011. 

20121222- 

reran the temperature script after removing the duplicate days. 

Printed out a list of all the sunset temperatures that were greater than 32 degrees celsius to compare against historical temperature data from weatherunderground.com

updated insect data script, created a csv containing the detector_date, site, and closest bug count date, named it detector_date_close_bug.csv, tried to append the count data for the close date to this file (from csv in data folder, called _site_wgkh_2011). First I merged the to on the site, but I couldn't figure out how to append the right count data. For the sake of running preliminary analysis, I made a copy of the un-merged csv bug_data.csv, called it bug_data1.csv, and manually appended the bug count data from the closest date to the detector_date into a new column, and called it bug_count. (also the insect_data kernel froze and I hadn't saved the last 4 hours of attempts- lame).

20130118-

Over the last couple of weeks, many failed attempts to figure out the bug data. Finally succeeded. Made some preliminary plots- box plots of activity and bug densities, scatter plots of activity, site, also formatted figure with nightly pass distribution.

20130204- 
Made a copy of the pass_bin_temp.csv (file containing all variables), for Justin to format the model with. Manually removed most of the heterogeneity index columns- left only Hab05km-Hab60km (cut all hab types and Vin05km-60km, because it is just the inverse of Hab).
Also cut unnamed, lat, long, max_temp, and temp_sunset columns. For pretty formatting sake, also cut site, extra and pair columns and pasted them so they were the first 3 columns. Saved csv and pushed all changes.

