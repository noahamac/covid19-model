view: uscounties {
  sql_table_name: covid.`us-counties` ;;

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: fips {
    map_layer_name: us_counties_fips
    sql: ${TABLE}.fips ;;
  }

  measure: cases {
    type: max
    sql: ${TABLE}.cases ;;
    drill_fields: [date_raw, state, case]
  }

  dimension: case {
    type: number
    hidden: yes
    sql: ${TABLE}.cases ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw,date,month,year,day_of_year]
    sql: ${TABLE}.date ;;
  }

  measure: deaths {
    type: max
    sql: ${TABLE}.deaths ;;
    drill_fields: [date_raw, state, death]
  }

  dimension: death {
    type: number
    hidden: yes
    sql: ${TABLE}.deaths ;;
  }

  dimension: state {
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: concat(${date_date}, "-", ${county}, "-", ${state}) ;;
  }

}
