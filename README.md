# Food Prices and Public Health

## Background
There are many studies that show that food prices have an impact on public health. In the case of obesity, the literature shows that while there are usually small impacts of food prices on weight, there can be larger impacts on people of lower socioeconomic status and people who are on the borderline of being overweight. [(Powell & Chaloupka, 2009)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2879182/) That said, the impact of prices remain consistent and are statistically significant even when comparing lower-end versus higher-end grocery stores. The prices for healthy and junk food matter more than the type of store. It also holds for store distance. [Ghosh-Dastidar et al., 2014](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4205193/) The lowering in food prices for calorie-dense meals can even increase body fat percentage even if body weight itself does not change much. [Lu & Goldman, 2010] (https://www.nber.org/system/files/working_papers/w15720/w15720.pdf) In the case of diabetes, there are not as many studies that examine th eimpact of prices on diabetes. One study found that the high prices of healthy food led to higher blood sugar, more so for low-income people; dairy was especially associated with high blood sugar. [Anekwe & Rahkovsky, 2018] (https://ajph.aphapublications.org/doi/full/10.2105/AJPH.2013.301661r) Taxes on unhealthy food and subsidies on healthy food can even be effective in preventing deaths from diabetes, strokes, and coronary heart disease. [Penevalo et al., 2017] (https://link.springer.com/article/10.1186/s12916-017-0971-9) The impacts were more pronounced depending on how big of price change as well. Evem the most recent studies have looked at data from before 2017. Thus, this study hopes to provide an update with more recent 2018 data to examine if the trends hold true for diabetes and obesity with food prices.

## Data Description

This data uses self-report data from the long running BRFSS study administered by the Center for Disease Control (CDC). It uses 1998, 2008, and 2018 data including the control variables for sex, income, education, employment, physical activity, race, and ethnicity. I have also repeated the regressions with diabetes and obesity as the dependent variables. The independent variable, food and beverages purchased for off-premises consumption in millions of dollars, comes from the United States Department of Agriculture's (USDA) long running ERS study. The USDA data comes at the state level whereas the BRFSS data had to be aggregated manually to the state level. 

### BRFSS Codebooks

Here are the BRFSS Codebooks for this study: 
- [1998](https://www.cdc.gov/brfss/annual_data/1998/pdf/Codebook_98.pdf) 
- [2008](https://www.cdc.gov/brfss/annual_data/2008/pdf/codebook08.pdf) 
- [2018](https://www.cdc.gov/brfss/annual_data/2018/pdf/codebook18_llcp-v2-508.pdf).

### USDA Raw Data

Here is the data from the [Quarterly Food-at-Home Price Database] (https://www.ers.usda.gov/data-products/quarterly-food-at-home-price-database/) from the USDA ERS.

## Methodology
I first had to make all of my BRFSS variables categorical, binary variables. I then used the _svyset_ to set the appropriate weights and let STATA know that I was working with survey data. After that, I used _svy: proportion_ to make proportions of all of my variables from the BRFSS dataset to aggreggate them at the state level. I then exported my output to excel to use excel to combine the USDA and CDC datasets at the state level. I then ran _kdensity_, _histogram_, and _tabstat_ to generate descriptive data. Next, for my regressions, I used OLS and panel data random effects and fixed effects. Lastly I ran the _Hausman_ test.

## Results

```markdown
Syntax highlighted code block

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text
```


![](https://github.com/bakeralexan/Pepperdine-2020-Econometrics/blob/main/Screen%20Shot%202020-11-25%20at%205.27.00%20AM.jpg)

https://github.com/bakeralexan/Pepperdine-2020-Econometrics/blob/main/Race%20%26%20Ethnicity%20by%20Year.png





<div class='tableauPlaceholder' id='viz1606301456209' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Di&#47;DiabetesbyStateinPercent&#47;Diabetes&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='DiabetesbyStateinPercent&#47;Diabetes' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Di&#47;DiabetesbyStateinPercent&#47;Diabetes&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1606301456209');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>

<div class='tableauPlaceholder' id='viz1606301374169' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ob&#47;ObesitybyStateinPercent&#47;Obesity&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ObesitybyStateinPercent&#47;Obesity' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ob&#47;ObesitybyStateinPercent&#47;Obesity&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1606301374169');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>

<div class='tableauPlaceholder' id='viz1606301430900' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Fo&#47;FoodandBeveragesPurchasedbyStateinMillionsofDollars&#47;FoodandBeverage&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='FoodandBeveragesPurchasedbyStateinMillionsofDollars&#47;FoodandBeverage' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Fo&#47;FoodandBeveragesPurchasedbyStateinMillionsofDollars&#47;FoodandBeverage&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1606301430900');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
