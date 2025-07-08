view: dim__employee {
  sql_table_name: `looker_test.dim__employee` ;;

  dimension_group: contract_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.contract_start ;;
  }
  dimension: contract_type {
    type: string
    sql: ${TABLE}.contract_type ;;
  }
  dimension: employee_key {
    type: number
    sql: ${TABLE}.employee_key ;;
  }
  dimension: employee_number {
    type: string
    sql: ${TABLE}.employee_number ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    hidden: yes
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    hidden: yes
  }
  measure: count {
    type: count
    drill_fields: [last_name, first_name]
    hidden: yes
  }

  dimension: full_name {
    type: string
    sql: ${first_name} || " " || ${last_name};;
  }

}
