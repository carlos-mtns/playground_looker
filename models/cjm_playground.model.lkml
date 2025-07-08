connection: "cmartins_bq"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: cjm_playground_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cjm_playground_default_datagroup

explore: fct__sales_by_store {}

explore: fct__sales_by_employee {}

explore: dim__employee {}

