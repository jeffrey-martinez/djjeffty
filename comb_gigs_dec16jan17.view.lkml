view: comb_gigs_dec16jan17 {
  derived_table: {
    sql: SELECT ROW_NUMBER() OVER() overallid, * FROM (
      SELECT *
            FROM
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_09_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_09_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_09_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_10_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_10_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_10_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_14_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_14_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_14_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_15_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_15_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_15_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_16_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_16_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_16_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_16_3` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_16_3`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_16_3`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_17_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_17_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_17_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_22_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_22_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_22_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2016_12_23_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_23_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2016_12_23_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_05_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_05_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_05_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_06_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_06_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_06_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_07_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_07_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_07_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_13_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_13_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_13_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_15_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_15_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_15_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_19_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_19_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_19_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_20_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_20_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_20_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_21_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_21_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_21_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_22_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_22_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_22_`)
          UNION ALL
        (SELECT PARSE_DATE("%D",(SELECT name FROM `lkr-thesis-project.IKYL.gig_2017_01_28_` LIMIT 1)) gig_date,
          (SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2017_01_28_`) songcount, ROW_NUMBER() OVER() playlistid, * FROM `lkr-thesis-project.IKYL.gig_2017_01_28_`)

          )
       ;;
    persist_for: "24 hours"
  }

  dimension: overallid {
    type: string
    sql: ${TABLE}.overallid ;;
  }

  dimension: album {
    type: string
    sql: ${TABLE}.album ;;
  }

  dimension: playlist_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.playlistid ;;
  }

  dimension: song_number {
    type: number
    sql: ${TABLE}.songcount ;;
  }

  dimension: playlist_position {
    type: number
    sql: ROUND(${playlist_id}*1.0/${song_number}, 4) ;;
    value_format: "0.000"
  }

  dimension: playlist_tier {
    type: tier
    style: interval
    tiers: [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
    sql: ${playlist_position} ;;
  }

  dimension: gig_date {
    type: string
    sql: ${TABLE}.gig_date ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
  }

  dimension: bitrate {
    type: string
    sql: ${TABLE}.bitrate ;;
  }

  dimension: bpm {
    label: "Beats Per Minute"
    type: number
    sql: ${TABLE}.bpm ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: composer {
    type: string
    sql: ${TABLE}.composer ;;
  }

  dimension: deck {
    type: string
    sql: ${TABLE}.deck ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.filename ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: grouping {
    type: string
    sql: ${TABLE}.`grouping` ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: length {
    type: string
    sql: ${TABLE}.length ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: playtime {
    type: string
    sql: ${TABLE}.playtime ;;
  }

  dimension: remixer {
    type: string
    sql: ${TABLE}.remixer ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [filename, name]
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }
#
#   dimension: overallid {
#     type: string
#     sql: ${TABLE}.overallid ;;
#   }
#
#   dimension: gig_date {
#     type: date
#     sql: ${TABLE}.gig_date ;;
#   }
#
#   dimension: songcount {
#     type: string
#     sql: ${TABLE}.songcount ;;
#   }
#
#   dimension: playlistid {
#     type: string
#     sql: ${TABLE}.playlistid ;;
#   }
#
#   dimension: name {
#     type: string
#     sql: ${TABLE}.name ;;
#   }
#
#   dimension: start_time {
#     type: string
#     sql: ${TABLE}.start_time ;;
#   }
#
#   dimension: end_time {
#     type: string
#     sql: ${TABLE}.end_time ;;
#   }
#
#   dimension: bpm {
#     type: string
#     sql: ${TABLE}.bpm ;;
#   }
#
#   dimension: playtime {
#     type: string
#     sql: ${TABLE}.playtime ;;
#   }
#
#   dimension: deck {
#     type: string
#     sql: ${TABLE}.deck ;;
#   }
#
#   dimension: notes {
#     type: string
#     sql: ${TABLE}.notes ;;
#   }
#
#   dimension: artist {
#     type: string
#     sql: ${TABLE}.artist ;;
#   }
#
#   dimension: album {
#     type: string
#     sql: ${TABLE}.album ;;
#   }
#
#   dimension: bitrate {
#     type: string
#     sql: ${TABLE}.bitrate ;;
#   }
#
#   dimension: comment {
#     type: string
#     sql: ${TABLE}.comment ;;
#   }
#
#   dimension: composer {
#     type: string
#     sql: ${TABLE}.composer ;;
#   }
#
#   dimension: filename {
#     type: string
#     sql: ${TABLE}.filename ;;
#   }
#
#   dimension: genre {
#     type: string
#     sql: ${TABLE}.genre ;;
#   }
#
#   dimension: grouping {
#     type: string
#     sql: ${TABLE}.`grouping` ;;
#   }
#
#   dimension: key {
#     type: string
#     sql: ${TABLE}.key ;;
#   }
#
#   dimension: label {
#     type: string
#     sql: ${TABLE}.label ;;
#   }
#
#   dimension: length {
#     type: string
#     sql: ${TABLE}.length ;;
#   }
#
#   dimension: location {
#     type: string
#     sql: ${TABLE}.location ;;
#   }
#
#   dimension: remixer {
#     type: string
#     sql: ${TABLE}.remixer ;;
#   }
#
#   dimension: year {
#     type: string
#     sql: ${TABLE}.year ;;
#   }
#
#   set: detail {
#     fields: [
#       overallid,
#       gig_date,
#       songcount,
#       playlistid,
#       name,
#       start_time,
#       end_time,
#       bpm,
#       playtime,
#       deck,
#       notes,
#       artist,
#       album,
#       bitrate,
#       comment,
#       composer,
#       filename,
#       genre,
#       grouping,
#       key,
#       label,
#       length,
#       location,
#       remixer,
#       year
#     ]
#   }
}
