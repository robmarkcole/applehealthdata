---
title: 'Apple Health Data Extractor (Matlab)'
tags:
- health
- step counting
- pedometry  
- pedometer 
authors:
- name: Joseph M. Mahoney
  orcid: 0000-0002-8098-0170
  affiliation: 1
affiliations:
- name: The Pennsylvania State University, Berks College
  index: 1

date: 17 April 2018
bibliography: paper.bib
---

# Summary

`Apple Health Data Extractor` is a MATLAB script for extracting step and distance information from the Apple Health app into a usable form for data analysis. The software creates daily step count and distance measurements from the data being collected by the Health app. 

With the increased interest in activity monitoring, especially step counting, the ability to accurately measure and record steps is imperative. Commonly-available commercial products such as FitBit, Jawbone and ActiGraph can be worn to measure steps in addition to other activitys [@tudor2008revisiting]. These devices have been shown to be accurate in step-counting studies [@veerabhadrappa2018tracking]. However, they require that 

- subjects remember to wear the device at all times, 
- researchers purchase and maintain enough devices to run a large-scale study
- subjects periodically upload their data in a long-term study

A solution to these problems is to leverage a device that many subjects will already own and is already counting their steps: an iPhone. The Apple Health app is, by default, counting steps and distance traveled. Subjects own their own device, need not install any software and will likely remember to have it with them all the time. The difficult part in research studies is collecting and analyzing the data from the phone. Subjects can export the data to an xml file contained within a zip file that contains their movement data. 

The data is structured in time epochs of several minutes of step and distance data. This program extracts daily step and distance data from the exported zip file from the Apple Health app. In this version, a single zip file can be selected and analyzed. A loop can be written around the script to automate the extraction process in a batch. 

Documentation, source code, and an example file can be found on the [Apple Health Extractor Github page](https://github.com/drjmm84/applehealthdata).

# References