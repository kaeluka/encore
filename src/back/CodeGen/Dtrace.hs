module CodeGen.DTrace where

import CodeGen.Typeclasses
import CodeGen.CCodeNames
import CodeGen.Type
import qualified CodeGen.Context as Ctx

import qualified Parser.Parser as P -- for string interpolation in the embed expr
import qualified Text.Parsec as Parsec
import qualified Text.Parsec.String as PString

import CCode.Main

import qualified AST.AST as A
import qualified AST.Util as Util
import qualified AST.Meta as Meta
import qualified AST.PrettyPrinter as PP
import qualified Identifiers as ID
import qualified Types as Ty

import Control.Monad.State hiding (void)
import Data.List

encore_message_send sender reciever msg =
  Statement $ Call (Nam "ENCORE_MESSAGE_SEND") [Null, Int 0, Null, Int 0, Null, Int 0]
