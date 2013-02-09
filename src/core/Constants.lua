Constants = {}

Constants.SAVE_FILE_NAME = "save.json"

Constants.NUM_LIVES = 3
-- add to score when player hit beaver
Constants.HIT_POINT = 500
-- coefficient which increase difficulty (SHOW_INTERVAL and HIDE_INTERVAL) every DIFF_INCREASE_TIME
Constants.DIFF_COEFF = 2
-- every SHOW_INTERVAL ms beaver will appear
Constants.SHOW_INTERVAL = 2000
-- beaver will be outside hole HIDE_INTERVAL ms
Constants.HIDE_INTERVAL = 2000
-- every  DIFF_INCREASE_TIME ms difficulty (SHOW_INTERVAL and HIDE_INTERVAL) will be divided by DIFF_COEFF
Constants.DIFF_INCREASE_TIME = 20*1000

-- level init phases
Constants.LEVEL_INIT_STATES = {
  [1] = "READY",
  [2] = "STADY",
  [3] = "GO",
  [4] = nil
}

--coords for each hole in level (left to right by rows)
Constants.HOLES_POSITIONS = {
  [1] = {46, 118},
  [2] = {140, 118},
  [3] = {234, 118},
  [4] = {330, 118},
  [5] = {425, 118},

  [6] = {46, 192},
  [7] = {141, 192},
  [8] = {236, 192},
  [9] = {331, 192},
  [10] = {426, 192},

  [11] = {46, 272},
  [12] = {141, 272},
  [13] = {236, 272},
  [14] = {331, 272},
  [15] = {426, 272}
}