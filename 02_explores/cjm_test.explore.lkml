include: "/01_views/dim__employee.view.lkml"
include: "/01_views/fct__sales_by_employee.view.lkml"
include: "/01_views/fct__sales_by_store.view.lkml"

explore: fct__sales_by_store {
  group_label: "Demo"
  label: "CJM Looker test"
  from: fct__sales_by_store
  view_label: "Sales - Metrics"

  join: fct__sales_by_employee {
      view_label: "Sales - Metrics"
      from: fct__sales_by_employee
      sql_on: ${fct__sales_by_store.location_key} = ${fct__sales_by_employee.location_key} AND
        ${fct__sales_by_store.calendar_date} = ${fct__sales_by_employee.calendar_date};;
      relationship: many_to_many
      type: left_outer
  }

  join: dim__employee {
      view_label: "Sales - Employee"
      from: dim__employee
      type: left_outer
      sql_on: ${fct__sales_by_employee.employee_key} = ${dim__employee.employee_key} ;;
      relationship: many_to_one
  }

}
