view: fct__sales_by_store {
  sql_table_name: `looker_test.fct__sales_by_store` ;;

  dimension_group: calendar {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_date ;;
  }
  dimension: generated_pk {
    type: number
    sql: ${TABLE}.generated_pk ;;
  }
  dimension: gross_sales_cy {
    type: number
    sql: ${TABLE}.gross_sales_cy ;;
  }
  dimension: gross_sales_ly {
    type: number
    sql: ${TABLE}.gross_sales_ly ;;
  }
  dimension: location_key {
    type: number
    sql: ${TABLE}.location_key ;;
  }
  measure: count {
    type: count
  }
}
