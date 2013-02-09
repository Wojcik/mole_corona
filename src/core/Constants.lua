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
Constants.DIFF_INCREASE_TIME = 10*1000

-- level init phases
Constants.LEVEL_INIT_STATES = {
  [1] = "READY",
  [2] = "STADY",
  [3] = "GO",
  [4] = nil
}

--coords for each hole in level (left to right by rows)
Constants.HOLES_POSITIONS = {
  [1] = {44, 116},
  [2] = {138, 116},
  [3] = {232, 116},
  [4] = {328, 116},
  [5] = {423, 116},

  [6] = {44, 190},
  [7] = {138, 190},
  [8] = {232, 190},
  [9] = {328, 190},
  [10] = {423, 190},

  [11] = {44, 270},
  [12] = {138, 270},
  [13] = {232, 270},
  [14] = {328, 270},
  [15] = {423, 270}
}