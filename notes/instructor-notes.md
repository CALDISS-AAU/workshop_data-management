## Instructor notes for workshop in Data management with Open Refine and Pandas



[TOC]

## Preparations



### Mac issues

- If user cannot unpack OpenRefine DMG file, go to system settings --> General and unlock administrator rights (padlock icon in the bottom)
  - Then the option to "Open anyway" should appear in the same window
- Repeat steps for the OpenRefine app itself, if necessary



## Introduction

- Mention format: Live demonstration - encourage to follow along. Exercises along the way

- Pauses to check for questions along the way

  - Use raise hand
  - Interrupt if I miss your question

- Use HackMD doc for questions, showing exercises, screenshots: https://hackmd.io/@MAImM-CyTZ6l1ucg0lZCbQ/HyA2auigt

  



## Working with OpenRefine



### Creating projects

- Note that projects are created with a data file
- Preview is to make sure data is imported correctly: Point out the defaults set
- Mention that they can change name of project before creating (defaults to name of data)



### Using facets

- "Facets" are essentially groupby that allow you to edit and combine the values as well
- Both used for getting an overview, exploring and making changes
- DO NOT make changes to village here - only demonstrate that you can (will be changed with clustering) 
- Date columns are formatted as text by default

- More on facets: https://docs.openrefine.org/manual/facets



### Using clustering

- Used for grouping values - NOT for analysis
- AVOID going into technical details about what clustering actually is 
  - Short answer: different algorithms to group values based on similarity
  - If interested: https://github.com/OpenRefine/OpenRefine/wiki/Clustering-In-Depth
- Do not use the "radius" and "block chars" options to find the last clusters. Manually edit "Chirdozo" and "Ruaca-Nhamuenda"
- Why use clustering instead of manual? Imagine 20 alternative spellings instead of 4
- Mention that "49" will be solved later



### Transforming data (split values)

- NOTE: There is both `items_owned` and `items_owned_other`
- ASK: What is the problem with this variable? (fx if we want to table the items owned)
- FLIP: Show the `value.split` first, as this shows why the replacing is necessary
- Stick to GREL - No Python!
- Has to be done one by one
- If time enough for last exercise, remember to introduce "History", where commands can be reused



### Undo / redo

- [no comment]



### Trim Leading and Trailing Whitespace

- Whitespace can often be overlooked but will make text values be treated differently
- Can easily be corrected in OpenRefine



## Filtering and sorting

- Note: So far we have worked with the values; keeping all observations
  - No changes so far have excluded any observations from the data



### Filtering

- Filtering: Used to make subsets (specific parts of the dataset meeting some criteria)



### Excluding entries

- A way of using facets as filters
- Notice that filters compound/stay active (the filter from before is still active in the facet)



### Sort

- Can also be used to identify errors
- Note when sorting, that you can change order of errors and blanks (before or after valid values)
- When trying to sort on same column, new options appear (like reverse)
- Use "years_farm" as example



#### Sort by multiple columns

- When sorting by another column, it will usually be added to existing sort
- Reset by either removing sort from previous column or use "sort by this column alone" option
- Add "no_membrs" as exampe
- Note that we still don't know what village "49" is - the gps information can help us with that



## Examining numbers in OpenRefine



### Numbers

- All columns are imported as text - can be sorted as numbers but that does not change the content to numbers
  - Very relevant in analysis
- Changing to numbers gives new options
- Make sure they do the exercise (transforming columns to numbers) so they have options for next exercise



### Numeric facet

- A histogram
- Can be used as filter
- Notice that the exercise involves changing a column back to text, edit, and then back to numeric
- Notice that non-numeric are kept - can be used to identify troublesome values
- Remember to undo the edits after the exercise



## Using script

- Demonstrate only



## Saving and exporting



### Exporting

- Projects can be exported
- NOTE: Project files include the data



### Exporting data

- NOTE: When exporting data, is exported with all current active changes - including active filters!