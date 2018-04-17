---
title: 'Apple Health Data Extractor (Matlab)'
tags:
- health
- step counting
authors:
- name: Joseph M. Mahoney
  orcid: 0000-0002-8098-0170
  affiliation: 1
affiliations:
- name: The Pennsylvania State University, Berks College
  index: 1

date: 14 April 2018
bibliography: paper.bib
---

# Summary

With the increased interest in activity monitoring, especially step counting, the ability to accurately measure and record steps is imperative. Commonly-available commercial products such as FitBit and ActiGraph can be worn to measure steps in addition to other activityThese devices have been shown to be accurate [?] in step counting studies. However, they require that 

- subjects remember to wear the device at all times, 
- researchers purchase and maintain enough devices to run a large-scale study
- subjects periodically upload their data in a long-term study

A solution to these problems is to leverage a device that many subjects will already own and is already counting their steps: an iPhone. The Apple Health app is, by default, counting steps and distance traveled. Subjects own their own device, need not install any software and will likely remember to have it with them all the time. The difficult part in research studies is collecting and analyzing the data from the phone. Subjects can export the data to an xml file contained within a zip file that contains their movement data. 

The data is structured in time epochs of several minutes of step and distance data. This program extracts daily step and distance data from the exported zip file from the Apple Health app. In this version, a single zip file can be selected and analyzed. A loop can be written around the script to automate the extraction process in a batch. 

Instructions to retrieve the raw data from the app are in the pdf file.
  
Apple Health writes the data in epochs of various lengths of time. Data in epochs that pass through midnight local time are counted all in the second day.

The script produces two matrix variables: `steplist` and `distlist`. `steplist` is a two-column vector with the date in YYYYMMDD format as the first column and the number of steps recorded that day as the second. `distlist` is a two-column vector with the date in YYYYMMDD format as the second column and the distance traveled (in miles) recorded that day as the second. For visualization and spot-checking, the script will also produce histograms of the two metrics. 

An example file from an iPhone 6 running iOS 11.3 is included in the archive. 

- A summary describing the high-level functionality and purpose of the software
for a diverse, non-specialist audience
- A clear statement of need that illustrates the purpose of the software
- A list of key references including a link to the software archive
- Mentions (if applicable) of any ongoing research projects using the software
or recent scholarly publications enabled by it

Citations to entries in paper.bib should be in
[rMarkdown](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html)
format.

This is an example citation [@figshare_archive].

Figures can be included like this: ![Fidgit deposited in figshare.](hist.png)

# References