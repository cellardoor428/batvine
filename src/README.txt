20130118-

Important! - when working on the preliminary data exploration- I realized that all the min_temp values were really high, looked at the combined 2011 & 2012 pass_bin_full table and saw that all the mean_temp values were missing from 2012- when we cat + tailed these two in the (temp ipynb) after I added the bug_count column to the 2011 pass_bin file- the columns no longer aligned. So I went into the 2012 nightly sum ipynb and created a dummy column with bug_count as the title, in the right location (col 770). Once we get the insect data for 2012 this will need to be adjusted.
