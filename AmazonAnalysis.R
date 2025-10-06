library(tidyverse)
library(tidymodels)
library(vroom)
library(embed) # for target encoding

amazon <- vroom("AmazonEmployeeAccess/AEA_data/train.csv")
train_data <- amazon # response var: ACTION
test_data <- vroom("AmazonEmployeeAccess/AEA_data/test.csv")


# --------------------------------------------------------------------------
## Recipe

my_recipe <- recipe(rFormula, data=trainData) %>%4
step_mutate_at(vars_I_want_to_mutate, fn = factor) %>% # turn all numeric features into factors5
  step_other(vars_I_want_other_cat_in, threshold = .001) %>% # combines categorical values that occur <.1% i6
  step_dummy(vars_I_want_to_dummy) %>% # dummy variable encoding7
  step_lencode_mixed(vars_I_want_to_target_encode, outcome = vars(target_var)) #target encoding (must be 2-f8
# also step_lencode_glm() and step_lencode_bayes()9
10
11
# NOTE: some of these step functions are not appropriate to use together12
13
# apply the recipe to your data14
prep <- prep(my_recipe)15
baked <- bake(prep, new_data = data_I_want_to_clean)



# 1050 columns - 1049 exp vars