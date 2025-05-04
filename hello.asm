.MEMORYMAP
  DEFAULTSLOT 1
  SLOTSIZE $8000
  SLOT 0 $0000
  SLOT 1 $4000
.ENDME

.ROMBANKMAP
  BANKSTOTAL 1
  BANKSIZE $8000
  BANKS 1
.ENDRO

.org $4000
  .dw 0x4241
  .dw 0x4010 ; init
  .dw 0
  .dw 0
  .dw 0
  .dw 0
  .dw 0
  .dw 0

init:
  call cls

  ld hl, message
  call puts

Loop:
  jr Loop

width32:
  ld a, 32     ;WIDTH=32
  ld ($F3AF), a
  ret

cls:
  call width32 ; width 32
  ld a, 1
  call $005F   ; CHGMOD - スクリーンモード切替
  call $00C3   ; CLS - 画面全体をクリア
  ret

puts:
  ld a, (hl)
  or a
  ret z
  call $00A2   ; BIOSの CHPUT
  inc hl
  jr puts

message:
  .db "HELLO!", 13, 10, 0
