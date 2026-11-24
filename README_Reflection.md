README and GenAI Reflection
================
Grace Gould
2026-11-24

## Repository Description

This repository is for STAT545B Assignment B3. I created and documented
a custom R Shiny Dashboard to explore the US National Highway Traffic
Safety Administration (NHTSA) vehicle accident data for 2024. One year
was chosen as this is a very detailed and large database even for a
single year. If interested in another year, it can be downloaded here:
<https://www.nhtsa.gov/file-downloads>. I used the Fatality Analysis
Reporting System (FARS) data from 2024.

## Contents

The repository contains: \* .gitignore: text file for git to know what
files to ignore. We don’t touch this. \* app.R: Contains all R Shiny
code that allows the app to run. Edit this file to change the dashboard
function or UI. \* Assignment3Deliverables.Rproj: project file in
Rstudio \* README.Rmd : Contains the descriptions of all files in the
assignmentB3-Grace-Gould repository, as well as GenAI statement \*
README.md: static readable text file containing the information from
README.Rmd \* reflection.Rmd : Contains genAI reflection for this
assignment \* reflection.md: static readable text file containing the
information from relflection.Rmd

## Engagement Instructions

To explore this repository, clone the project to your personal github
and use the README file to familiarize yourself with the project files.
Run and edit app.R to explore the dashboard created in this repository.

## Generative AI Statement

Generative AI through ChatGPT was used to help me complete this
assignment in the following ways.

1.  I was geeting the error: State == input\$stateInput\`. I inputted
    this into ChatGPT and it said that the code could not find the
    “State” column in the original data. This made me realize that I had
    made errors in the data column names from my accident.csv that was
    causing the inputs to fail in the function section.

2.  I wanted to have a bar graph instead of point graph but everytime I
    used geom_bar() with ggplot it failed. So I had been sticking with
    geom_point(). I asked ChatGPT “This code is giving me a plot with
    points on it as instructed by geom_point() but I want to plot the
    sum of the FATALS on the plot not just the points: output\$plot \<-
    renderPlot({ggplot(filtered(), aes(x = MONTHNAME,y = FATALS)) +
    geom_point()})”. It suggested I use geom_col() instead of geom_bar()
    so that I could specify the column that I wanted the bars to be
    coming from. This allowed me to plot specifically the fatals instead
    of just the count of the rows per month which was not accurate as
    for some rows there was more than one fatality.

3.  As I was building the app, it stopped being able to parse. I
    inputted the error :“All of a sudden by app has this error: Error in
    value[\[3L\]](cond) : and then says error sources”**my file path**””
    . From it’s answer, I was instructed to use “parse(app.R)” and that
    provided me with details on what exactly was failing. This pointed
    me to an error in the filtering of my function and an extra comma,
    which fixed the issue upon correction.

4.  I wanted to order the data in my list by month since it was mixed up
    in the table displayed on the dashboard. When I used arrange(), it
    would just arrange alphabetically, which I expected. However, I
    wanted to know if there was a different way to specify the order
    without specifying the order of all 12 months in a vector. I asked
    “How would I order by month after or before select?”. It recommended
    using the month order that is built into R called month.name. This
    was used to match the months to the order of month.name within
    arrange() to order the months in the table.

R Shiny was also used to help with some errors around the reactive
coding of the plots and tables. Most of the errors had stemmed from
column renaming issues. However, the Shiny Assistant does not save
previous work if you close the browser so I lost all prompts and
responses. This will be discussed with Professor Thompson.

I affirm that Generative AI was not used to generate text, code, or
comments for my assessments.

## GenAI Reflection

For the application of R Shiny, I think the use of GenAI is a great tool
because there are so many functions and small elements such as a comma
that can cause massive errors in the code. I don’t believe that spending
large amounts of time on the identification of tiny errors such as a
comma are beneficial to learning. Additionally, I have discovered so
many useful functions in this course through the use of GenAI as a
search engine. When I was coding prior to AI and stuck, I would spend
long amounts of time scouring Stack Overflow for people that had a
similar question. While I think it is important to not use genAI when
learning the fundamentals, I think for application based scenarios such
as finding particular functions it is very beneficial. For myself in
this course using it as an error search and function search, I believe
it benefited my learning.
