(ns clojure-course.core)

;; Extras
(def high-seven                   ["2H" "3S" "4C" "5C" "7D"])
(def pair-hand                    ["2H" "2S" "4C" "5C" "7D"])
(def two-pairs-hand               ["2H" "2S" "4C" "4D" "7D"])
(def three-of-a-kind-hand         ["2H" "2S" "2C" "4D" "7D"])
(def four-of-a-kind-hand          ["2H" "2S" "2C" "2D" "7D"])
(def straight-hand                ["2H" "3S" "6C" "5D" "4D"])
(def low-ace-straight-hand        ["2H" "3S" "4C" "5D" "AD"])
(def high-ace-straight-hand       ["TH" "AS" "QC" "KD" "JD"])
(def flush-hand                   ["2H" "4H" "5H" "9H" "7H"])
(def full-house-hand              ["2H" "5D" "2D" "2C" "5S"])
(def straight-flush-hand          ["2H" "3H" "6H" "5H" "4H"])
(def low-ace-straight-flush-hand  ["2D" "3D" "4D" "5D" "AD"])
(def high-ace-straight-flush-hand ["TS" "AS" "QS" "KS" "JS"])
(def replacements       {\A 14, \K 13, \Q 12, \J 11, \T 10 })


;; Exercise 1
(defn suit
  "Takes a single card and returns the suit of the card"
  [card]
  (let [[_ snd] card]
    (str snd))
)

;; Exercise 2
(defn rank
  "Takes a single card and returns the rank of the card"
  [card]
  (let [[frst __] card]
  (if (Character/isDigit frst)
    (Integer/valueOf (str frst))
    (replacements frst)
))
)

;; Exercise 3
(defn pair?
  "Return true if there is a pair in the hand and
  false if there isnt"
  [hand]
  (if (= 2 (apply max 
                (vals (frequencies (map rank hand)))))
    true
    false
    )
)

;; Exercise 4
(defn three-of-a-kind?
  "Return true if the hand contains three of a hand"
  [hand]
  (if (= 3 (apply max 
                (vals (frequencies (map rank hand)))))
    true
    false
    )
)

;; Exercise 5
(defn four-of-a-kind?
  "Return true if the hand contains four of a hand"
  [hand]
  (if (= 4 (apply max 
                (vals (frequencies (map rank hand)))))
    true
    false
    )
)

;; Exercise 6
(defn flush?
  "Return true if the hand is a flush"
  [hand]
  (if  (= 1 (count (into []
                    (keys (frequencies (map suit hand))))))
    true
    false
    )
)

;; Exercise 7
(defn full-house?
  "Return true if the hand is a full-house"
  [hand]
  (if (= [2 3] (sort (vals (frequencies (map rank hand)))))
    true
    false)
 )

;; Exercise 8
(defn two-pairs?
  "Return true if the hand have two-pairs"
  [hand]
  (let [hand_val (sort (vals (frequencies (map rank hand))))]
    (if (or (= [1 2 2] hand_val) (= [1 4] hand_val))
            true
            false))
 )

;; Exercise 9
(defn straight?
  "Return true if the hand is straight"
  [hand]
  (let [hand_down (replace {14 1} (map rank hand)),
        hand_up (replace {14 14} (map rank hand))]
    (if (= (range (first (sort hand_down)) (+ (first (sort hand_down)) 5)) (sort hand_down))
      true 
      (if (= (range (first (sort hand_up)) (+ (first (sort hand_up)) 5)) (sort hand_up))
        true
        false))
   )
 )

;; Exercise 10
(defn straight-flush?
  "Return true if the hand is straight and flush"
  [hand]
  (let [hand_down (replace {14 1} (map rank hand)),
        hand_up (replace {14 14} (map rank hand))]
    (if (= (range (first (sort hand_down)) (+ (first (sort hand_down)) 5)) (sort hand_down))
      (if (flush? hand)
        true
        false)
      (if (= (range (first (sort hand_up)) (+ (first (sort hand_up)) 5)) (sort hand_up))
        (if (flush? hand)
          true 
          false)
        false))
   )
 )
(defn high-card? [hand]
  true) ; All hands have a high card.

;; Exercise 11
(defn value
  "Return the max value of a hand"
  [hand]
  (let [checkers #{[high-card? 0]  [pair? 1]
                 [two-pairs? 2]  [three-of-a-kind? 3]
                 [straight? 4]   [flush? 5]
                 [full-house? 6] [four-of-a-kind? 7]
                 [straight-flush? 8]}]
    (let [funcs (map first checkers)]
      (map #(filter % hand) funcs)))
  )
