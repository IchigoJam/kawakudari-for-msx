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
  call initscreen

  call putchars2
  ;call putchars

  call keyloop
  

end:
  jr end

LINWID:
  ;equ $F3AF ; WIDTHで設定する1行の幅が格納されているアドレス
width32:
  ld a, 32     ;WIDTH=32
  ld ($F3AF), a
  ret

hello:
  ; 1. VRAMアドレスを $1800（画面左上）に設定
  LD A, $00    ; 下位アドレスバイト
  OUT ($99), A
  LD A, $98    ; 上位アドレス + Write flag
  OUT ($99), A

  ; 2. 文字を1バイトずつ送信
  LD A, 'H'
  OUT ($98), A
  LD A, 'E'
  OUT ($98), A
  LD A, 'L'
  OUT ($98), A
  LD A, 'L'
  OUT ($98), A
  LD A, 'O'
  OUT ($98), A
  LD A, '!'
  OUT ($98), A
  ret

initscreen:
  call width32
  
  LD A, 1
  CALL $005F   ; CHGMOD - スクリーンモード切替

  CALL $00C3   ; CLS - 画面全体をクリア

  LD H, 1 ; X
  LD L, 1 ; Y
  CALL $00D8   ; POSIT（カーソル表示と位置制御に関わる）

  ld a, 1
  ld ($FCA9H), a ; カーソル表示

  ld a, 1
  ld ($FCAAH), a ; カーソル形状挿入

  ld a, 1
  ld ($FCA8H), a ; 挿入モード

  call width32
  ret


widt32x:
  LD A, $01
  OUT ($99), A
  LD A, $89
  OUT ($99), A

  LD A, $36
  OUT ($99), A
  LD A, $82
  OUT ($99), A
  ret

keyloop:
  call $009f ; CHGET キーボードバッファから1文字入力
  call $00A2   ; BIOSの CHPUT
  jr keyloop

putchars:
  ; 1. VRAMアドレスを $1800（画面左上）に設定
  LD A, $00    ; 下位アドレスバイト
  OUT ($99), A
  nop
  LD A, $98    ; 上位アドレス + Write flag
  OUT ($99), A
  nop

  ld a, $0
loop:
  OUT ($98), A
  inc a
  ;cp 32
  jr nz, loop
  ret

putchars2:
  ld a, $0
putchars2_loop:
  call $00A2   ; BIOSの CHPUT
  inc a
  jr nz, putchars2_loop
  ret
