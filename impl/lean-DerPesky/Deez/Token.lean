inductive Token where
  | illegal
  | eof
  -- Identifiers
  | ident : String → Token
  | int : String → Token
  -- Operators
  | assign
  | plus
  | minus
  | bang
  | asterisk
  | slash
  | lessThan
  | greaterThan
  | equal
  | notEqual
  -- Delimiters
  | comma
  | semicolon
  | lParen
  | rParen
  | lBrace
  | rBrace
  -- Keywords
  | function
  | let
  | true
  | false
  | if
  | else
  | return
deriving Repr

namespace Token

instance : ToString Token where
  toString : Token → String
    | illegal => "illegal"
    | eof => "eof"
    -- Identifiers
    | ident str => str
    | int n => n
    -- Operators
    | assign => "="
    | plus => "+"
    | minus => "-"
    | bang => "!"
    | asterisk => "*"
    | slash => "/"
    | lessThan => "<"
    | greaterThan => ">"
    | equal => "=="
    | notEqual => "!="
    -- Delimiters
    | comma => ","
    | semicolon => ";"
    | lParen => "("
    | rParen => ")"
    | lBrace => "{"
    | rBrace => "}"
    -- Keywords
    | function => "fn"
    | Token.let => "let"
    | true => "true"
    | false => "false"
    | Token.if => "if"
    | Token.else => "else"
    | Token.return => "return"

def fromString (str : String) : String → Token
  | "fn" => function
  | "let" => Token.let
  | "true" => Token.true
  | "false" => false
  | "if" => Token.if
  | "else" => Token.else
  | "return" => Token.return
  | _ => ident str

def fromChar (ch : Char) : Char → Token
  | '=' => equal
  | '+' => plus
  | ',' => comma
  | ';' => semicolon
  | '(' => lParen
  | ')' => rParen
  | '{' => lBrace
  | '}' => rBrace
  | '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' => int (ch.toString)
  | _ => illegal

end Token
