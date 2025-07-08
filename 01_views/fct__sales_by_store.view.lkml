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
    hidden: yes
    primary_key: yes
  }
  dimension: location_key {
    type: number
    sql: ${TABLE}.location_key ;;
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
  measure: sum_gross_sales_ly {
    type: sum
    sql: ${TABLE}.gross_sales_ly ;;
    hidden: yes
  }


  measure: combined_sum_gross_sales_cy {
      label: "€ Gross Sales CY"
      description: "The total gross sales amount for this year."
      group_label: "Sales"
      type:  number
      sql:
        {% if dim__employee._in_query %}
          ${fct__sales_by_employee.sum_gross_sales_cy}
        {% else %}
          ${fct__sales_by_store.sum_gross_sales_cy}
        {% endif %}
      ;;
      value_format:"€ #.00;($#.00)"
  }

  measure: combined_sum_gross_sales_py {
    label: "€ Gross Sales LY"
    description: "The total gross sales amount for the previous year."
    group_label: "Sales"
    type:  number
    sql:
        {% if dim__employee._in_query %}
          NULL
        {% else %}
          ${fct__sales_by_store.sum_gross_sales_ly}
        {% endif %}
      ;;
    value_format:"€ #.00;($#.00)"
  }

}
