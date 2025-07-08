view: fct__sales_by_employee {
  sql_table_name: `looker_test.fct__sales_by_employee` ;;

  dimension_group: calendar {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_date ;;
    hidden: yes
  }
  dimension: employee_key {
    type: number
    sql: ${TABLE}.employee_key ;;
    hidden: yes
  }
  dimension: generated_pk {
    type: number
    sql: ${TABLE}.generated_pk ;;
    primary_key: yes
    hidden: yes
  }
  dimension: gross_sales_cy {
    type: number
    sql: ${TABLE}.gross_sales_cy ;;
    hidden: yes
  }
  dimension: location_key {
    type: number
    sql: ${TABLE}.location_key ;;
    hidden: yes
  }
  measure: count {
    type: count
    hidden: yes
  }
  measure: sum_gross_sales_cy {
    type: sum
    sql: ${TABLE}.gross_sales_cy ;;
    hidden: yes
  }
}
