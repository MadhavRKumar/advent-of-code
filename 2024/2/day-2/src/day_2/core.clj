(ns day-2.core
  (:require [clojure.java.io :as io])
  (:require [clojure.string :as str])
  (:gen-class))

(defn split-line
  [line]
  (map #(Integer/parseInt %)(str/split line #"\s+")
  ))

(defn abs-diff
  [a b]
  (abs (- a b)))

(defn is-report-safe?
  [report]
  (and 
    (every? #{1,2,3} (map abs-diff (rest report) report))
    (or 
      (every? (fn [i] (> i 0)) (map - (rest report) report))
      (every? (fn [i] (< i 0)) (map - (rest report) report))
    )))


(defn -main
  "Day 2!"
  [file]
  (println (count (filter true? (map is-report-safe?  (with-open [rdr (io/reader file)]
    (mapv split-line (line-seq rdr))))))))

