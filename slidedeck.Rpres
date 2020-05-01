Next Word Prediction
========================================================
author: Avnish
date: 20-04-2020
autosize: true

Introduction and Help
========================================================

- A text prediction app to predict the next word following a phrase of input text
- Prediction model uses n-grams( 2-, 3- and 4-grams) developed from training data
- The application is hosted on shinyapps.io at: https://avnishsingh.shinyapps.io/NextWordPrediction/
- To use - type in an incomplete phrase of text and press the Predict button
- next three possible word which will follow will show up on the screen

Algorithm
========================================================
- The prediction model uses 4-grams, 3-grams and 2-grams tokenized from cleaned training data
- The Maximum Likelihood Estimate (MLE) of the next probable word following the input phrase is calculated using back off of occurrences of the matching n-gram phrases in the training data
- Interpolation of the MLEs for matching 4-grams (if any), 3-grams (if any) and 2-grams (if any) is used 
-If no match n-grams found then it will output "it"
- In case no matching n-grams exist, the model simply predicts the 3 most common words which will follow if there aren't 3 words then it will replace it with NA.

Accuracy and Memory Usage
========================================================
- Accuracy:15.5%
- Memory usage :27 MB
- Average prediction time : 60s

Data Used
========================================================
- Only the final/en_US data files with blog, news and twitter data were used
- 5% random sample of lines from each of the blogs, news and twitter data files was taken (to ensure similar coverage of all genres) and combined
- Preprocessing included cleaning text - lower case, removed numbers, various special characters and punctuation.
- To reduce memory usage, 3- and 4- grams occurring only once, 2-grams occurring less than 3 times were omitted.

Shiny App
========================================================

https://avnishsingh.shinyapps.io/NextWordPrediction/

<img src="C:\Users\Administrator\Downloads\Swiftkeytextprediction\slidedeck-figure\Capture.png"; style="max-width:800px;float:center;">
