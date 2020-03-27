view: usstates {
  sql_table_name: covid.`us-states` ;;

  measure: cases {
    type: sum
    sql: ${TABLE}.cases ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: fips {
    map_layer_name: us_counties_fips
    sql: ${TABLE}.fips ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

}
