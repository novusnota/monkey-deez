import Deez.Token

structure Lexer where
  (pos readPos : Nat := 0)
  ch : Char := Char.ofNat 0
  input : ByteArray

namespace Lexer

def readChar (l : Lexer) : Lexer :=
  let ch := if l.pos + 1 >= l.input.size then
              Char.ofNat 0
            else
              Char.ofNat (l.input.get! l.pos + 1).toNat
  { l with ch, pos := l.pos + 1 }


partial def skipWhitespace (l : Lexer) : Lexer :=
  if l.ch.isWhitespace || l.ch = '\x0c' then
    l.readChar.skipWhitespace
  else
    l

partial def readIdent (l : Lexer) (pos : Nat) : String :=
  if l.ch.isAlpha || l.ch = '_' then
    l.readChar.readIdent l.pos
  else
    String.fromUTF8Unchecked (l.input.extract pos l.pos)

partial def readInt (l : Lexer) (pos : Nat) : String :=
  if l.ch.isDigit then
    l.readChar.readInt l.pos
  else
    String.fromUTF8Unchecked (l.input.extract pos l.pos)

def nextToken (l : Lexer) : Lexer × Token :=
  let l := l.skipWhitespace

  let tok := match l.ch with
  | '{' => Token.lBrace
  | '}' => Token.rBrace
  | '(' => Token.lParen
  | ')' => Token.rParen
  | ',' => Token.comma
  | ';' => Token.semicolon
  | '+' => Token.plus
  | '=' => Token.equal
  | _ =>
    if l.ch.isAlpha || l.ch = '_' then
      let ident := l.readIdent l.pos
      match ident with
      | "fn" => Token.function
      | "let" => Token.let
      | _ => Token.ident ident
    else if l.ch.isDigit then
      Token.int (l.readInt l.pos)
    else
      Token.illegal

  ⟨ { l with ch := l.ch }, tok ⟩

end Lexer
