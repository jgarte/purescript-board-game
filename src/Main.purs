module Main where

import Prelude
import App.Board as Board
import Data.Time.Duration (Milliseconds(..))
import Data.Vec (vec2)
import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main =
  HA.runHalogenAff do
    body <- HA.awaitBody
    runUI Board.component input body
  where
  input :: Board.Input
  input =
    { backgroundUrl: 
        Board.Svg "/assets/romania.svg"
        -- Board.Bitmap "/assets/clouds.bmp"
    , backgroundSize: vec2 600.0 400.0
    , cellSize: 50.0
    , mapPadding: vec2 50.0 50.0
    , size: vec2 700.0 700.0
    , stackedPieceOffset: 4.0
    , borderScrollAreaSize: 100.0
    , borderScrollSpeed: 20.0
    , borderScrollInterval: Milliseconds 50.0
    , zoomFactor: 1.1
    }
