;;; this is the qwerty layout
;; copy this file to layout.scm and build

;; we have to declare this up front and set it later because of circularity
(define layers #f)
(define current-layer #f)
(define momentary-layer #f)

(define (fn on?) (set! momentary-layer (and on? (vector-ref layers 1))))

(define (set-layer n)
  (lambda (_) (set! current-layer (vector-ref layers n))))

(define (reset _) (call-c-func "reset"))

;;;; layers

(define base-layer
 (vector key-q key-w key-e key-r key-t key-backslash
         key-y key-u key-i key-o key-p

         key-a key-s key-d key-f key-g key-backtick
         key-h key-j key-k key-l key-semicolon

         key-z key-x key-c key-v key-b mod-ctrl
         key-n key-m key-comma key-period key-slash

         key-esc key-tab mod-super mod-shift key-backspace mod-alt
         key-space fn key-dash key-quote key-enter))

(define fn-layer
 (vector (sft key-1) (sft key-2) key-up (sft key-left-bracket) (sft key-right-bracket) 0
         key-page-up key-7 key-8 key-9 (sft key-8)

         (sft key-3) key-left key-down key-right (sft key-4) 0
         key-page-down key-4 key-5 key-6 (sft key-equal)

         key-left-bracket key-right-bracket (sft key-0) (sft key-7) mod-ctrl
         key-backtick key-1 key-2 key-3 key-backslash

         (set-layer 2) key-insert mod-super mod-shift key-backspace mod-alt
         key-space fn key-e key-0 key-right-bracket))

(define l2-layer
 (vector key-insert key-home key-up key-end key-page-up 0
         key-up key-f7 key-f8 key-f9 key-f10

         key-delete key-left key-down key-right key-page-down 0
         key-down key-f4 key-f5 key-f6 key-f11

         (set-layer 0) key-vol-up 0 0 reset mod-ctrl
         0 key-f1 key-f2 key-f3 key-f12

         0 key-vol-down mod-super mod-shift key-backspace mod-alt
         key-space (set-layer 0) key-printscreen key-scroll-lock key-pause))
