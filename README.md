# Soda Tax and Public Health

<a href="page1.html">Page 2</a>
## Executive summary
Given the national public health crisis in the US with soaring public health obesity cases, interventions aimed at influencing consumers to make healthy food choices have arisen. This can be done via price manipulation through taxes on unhealthy food and subsidies on healthy food. The implementation tests their efficacy in lessening preventable lifestyle diseases such as obesity and diabetes. This study used 2008 and 2018 data from the BRFSS survey by the CDC and ERS survey by the USDA, aggregated to the state level, to examine the impact of soda taxes on diabetes and obesity outcomes. OLS and panel data regressions were conducted. In this study, the soda taxes did not have any impact on the diabetes or obesity outcomes with coefficients close to zero and no statistical significance. The results of this study imply that a soda tax might not be a sufficient intervention to influence consumer choice in the US to limit unhealthy food choices and effect public health.


## Background
There are many studies that show that food prices have an impact on public health. In the case of obesity, the literature shows that while there are usually small impacts of food prices on weight, there can be larger impacts on people of lower socioeconomic status and people who are on the borderline of being overweight. [(Powell & Chaloupka, 2009)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2879182/) That said, the impact of prices remains consistent and is statistically significant even when comparing lower-end versus higher-end grocery stores. The price of healthy and junk food matter more than the type of store. It also holds true for store distance. [Ghosh-Dastidar et al., 2014](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4205193/) The lowering in food prices for calorie-dense meals can increase body fat percentage even if body weight itself does not change much. [Lu & Goldman, 2010] (https://www.nber.org/system/files/working_papers/w15720/w15720.pdf) In the case of diabetes, there are not as many studies that examine the impact of prices. One study found that high prices of healthy food led to higher blood sugar, especially for low-income people; dairy was particularly associated with high blood sugar. [Anekwe & Rahkovsky, 2018] (https://ajph.aphapublications.org/doi/full/10.2105/AJPH.2013.301661r) Taxes on unhealthy food and subsidies on healthy food can even be effective in preventing deaths from diabetes, strokes, and coronary heart disease. [Penevalo et al., 2017] (https://link.springer.com/article/10.1186/s12916-017-0971-9) The impacts were more pronounced depending on the magnitude of the price change.

Although the most recent studies have looked at data from before 2017, this study hopes to provide an update on prior knowledge, with more recent 2018 data, to examine if the trends hold true for diabetes and obesity with food prices.

## Data Description

This study uses self-report data from the long running BRFSS study administered by the Center for Disease Control (CDC). It uses 1998, 2008, and 2018 data including the control variables for sex, income, education, employment, physical activity, race, and ethnicity. I have also repeated the regressions with diabetes and obesity as the dependent variables. The independent variable, food and beverages purchased for off-premises consumption in millions of dollars, comes from the United States Department of Agriculture's (USDA) long running ERS study. The USDA data comes at the state level whereas the BRFSS data had to be aggregated manually at the state level. 

### BRFSS Codebooks

The datasets themselves for BRFSS require too much data to download. Instead, here are the BRFSS Codebooks for this study: 
- [**1998**](https://www.cdc.gov/brfss/annual_data/1998/pdf/Codebook_98.pdf) 
- [**2008**](https://www.cdc.gov/brfss/annual_data/2008/pdf/codebook08.pdf) 
- [**2018**](https://www.cdc.gov/brfss/annual_data/2018/pdf/codebook18_llcp-v2-508.pdf)

### USDA Raw Data

Here is the data from the [Quarterly Food-at-Home Price Database] (https://www.ers.usda.gov/data-products/quarterly-food-at-home-price-database/) from the USDA ERS.

### Cleaned Data
[Here is the cleaned data log output](BRFSSproportionsv2.smcl)

[Here is the cleaned data Do file](https://github.com/bakeralexan/Pepperdine-2020-Econometrics/blob/main/BRFSS%20proportionsv2.do)

[Here is the cleaned data](https://github.com/bakeralexan/Pepperdine-2020-Econometrics/blob/main/BRFSS%20proportionsv2.dta)

## Methodology
I first had to make all of my BRFSS variables categorical and binary. I then used the _svyset_ to set the appropriate weights and let STATA know that I was working with survey data. After that, I used _svy: proportion_ to make proportions of all of my variables from the BRFSS dataset to aggreggate them at the state level. I then exported my output to excel to use excel to combine the USDA and CDC datasets at the state level. I then ran _kdensity_, _histogram_, and _tabstat_ to generate descriptive data. Next, for my regressions, I used OLS and panel data random effects and fixed effects. Lastly I ran the _Hausman_ test.

## Results

### Visualizations

![](https://github.com/bakeralexan/Pepperdine-2020-Econometrics/blob/main/Race%20%26%20Ethnicity%20by%20Year.jpg)


<div class='tableauPlaceholder' id='viz1606301456209' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Di&#47;DiabetesbyStateinPercent&#47;Diabetes&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='DiabetesbyStateinPercent&#47;Diabetes' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Di&#47;DiabetesbyStateinPercent&#47;Diabetes&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en' /><param name='filter' value='publish=yes' /></object></div>
https://public.tableau.com/profile/alexandra.baker#!/vizhome/DiabetesbyStateinPercent/Diabetes?publish=yes


<div class='tableauPlaceholder' id='viz1606301374169' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ob&#47;ObesitybyStateinPercent&#47;Obesity&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ObesitybyStateinPercent&#47;Obesity' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ob&#47;ObesitybyStateinPercent&#47;Obesity&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en' /><param name='filter' value='publish=yes' /></object></div>
https://public.tableau.com/profile/alexandra.baker#!/vizhome/ObesitybyStateinPercent/Obesity?publish=yes


<div class='tableauPlaceholder' id='viz1606301430900' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Fo&#47;FoodandBeveragesPurchasedbyStateinMillionsofDollars&#47;FoodandBeverage&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='FoodandBeveragesPurchasedbyStateinMillionsofDollars&#47;FoodandBeverage' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Fo&#47;FoodandBeveragesPurchasedbyStateinMillionsofDollars&#47;FoodandBeverage&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en' /><param name='filter' value='publish=yes' /></object></div>
https://public.tableau.com/views/FoodandBeveragesPurchasedbyStateinMillionsofDollars/FoodandBeverage?:language=en&:display_count=y&publish=yes&:origin=viz_share_link


### Regressions

I failed to reject the Hausman test for either diabetes (**0.9102**) or obesity ( **0.0935**), as such the random effects can be fine to use.

![](https://github.com/bakeralexan/Pepperdine-2020-Econometrics/blob/main/Screen%20Shot%202020-11-25%20at%205.27.00%20AM.jpg)

![](https://github.com/bakeralexan/Pepperdine-2020-Econometrics/blob/main/Screen%20Shot%202020-11-25%20at%205.30.27%20AM.jpg)

