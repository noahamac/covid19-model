view: uscounties {
  sql_table_name: covid.`us-counties` ;;

  measure: cases {
    type: sum
    sql: ${TABLE}.cases ;;
    drill_fields: [date, county]
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  measure: deaths {
    type: sum
    sql: ${TABLE}.deaths ;;
    drill_fields: [date, county]
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
