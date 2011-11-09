" Vim syntax file
" Language: FontForge script
" Maintainer: Bernard Massot <bmassot@free.fr>
" Last Change: Nov 09, 2011

if exists("b:current_syntax")
    finish
endif


""" Comment
syn keyword ffsTodo contained TODO FIXME XXX
syn match ffsComment /#.*$/ contains=ffsTodo
syn match ffsComment "//.*$" contains=ffsTodo
syn region ffsComment start="/\*" end="\*/" contains=ffsTodo

""" Variable
syn match ffsGlobalVar /_[a-zA-Z0-9$_.@]\+/
syn match ffsFontVar /@[a-zA-Z0-9$_.@]\+/
syn match ffsLocalVar /[a-zA-Z][a-zA-Z0-9$_.@]*/
syn match ffsBuiltInVarError /\$.*/
syn match ffsBuiltInVar /\$\d\+\>/
syn match ffsBuiltInVar /\$\(argc\|argv\|curfont\|firstfont\|nextfont\|fontchanged\|fontname\|familyname\|fullname\|fondname\|weight\|copyright\|filename\|fontversion\|iscid\|cidfontname\|cidfamilyname\|cidfullname\|cidweight\|cidcopyright\|mmcount\|italicangle\|loadState\|privateState\|curcid\|firstcid\|nextcid\|macstyle\|bitmaps\|order\|em\|ascent\|descent\|selection\|panose\|trace\|version\|haspython\)\>/
" Preference Item
syn match ffsBuiltInVar /\$\(ResourceFile\|HelpDir\|OtherSubrsFile\|FreeTypeInFontView\|SplashScreen\|UseCairoDrawing\|UsePangoDrawing\|NewCharset\|NewEmSize\|NewFontsQuadratic\|LoadedFontsAsNew\|PreferCJKEncoding\|AskUserForCMap\|PreserveTables\|SeekCharacter\|CompactOnOpen\|GlyphAutoGoto\|OpenCharsInNewWindow\|ItalicConstrained\|ArrowMoveSize\|ArrowAccelFactor\|SnapDistance\|SnapToInt\|JoinSnap\|StopAtJoin\|CopyMetaData\|UndoDepth\|UpdateFlex\|AutoKernDialog\|AutoWidthSync\|AutoLBearingSync\|ClearInstrsBigChanges\|CopyTTFInstrs\|AccentOffsetPercent\|AccentCenterLowest\|CharCenterHighest\|PreferSpacingAccents\|PreferPotrace\|AutotraceArgs\|AutotraceAsk\|MfArgs\|MfClearBg\|MfShowErr\|FoundryName\|TTFFoundry\|NewFontNameList\|RecognizePUANames\|UnicodeGlyphNames\|AddCharToNameList\|AskBDFResolution\|AutoHint\|StandardSlopeError\|SerifSlopeError\|HintBoundingBoxes\|HintDiagonalInter\|HintDiagonalEnds\|DetectDiagonalStems\|InstructDiagonalStems\|InstructSerifs\|InstructBallTerminals\|InterpolateStrongPoints\|CounterControl\|UseNewIndicScripts\)\>/

""" Number
syn case ignore
" Decimal
syn match ffsDecimal display /\<\d\+\>/
" Hexadecimal
syn match ffsHexadecimal display /\<0x\x\+\>/
" Octal
syn match ffsOctalError display /\<0[0-7]*[89]\d*\>/

""" Unicode code point
syn match ffsUnicodeCodePoint display /\<0u\x\+\>/

""" Real number
syn match ffsReal display /\d+\.\d*\(e[-+]\=\d\+\)\=/
syn match ffsReal display /\.\d\+\(e[-+]\=\d\+\)\=/
syn match ffsReal display /\d\+e[-+]\=\d\+/

syn case match

""" String
syn match ffsBackslashSequence /\\[n"'\\]/ contained
syn region ffsString start=/"/ end=/"/ contains=ffsBackslashSequence
syn region ffsString start=/'/ end=/'/ contains=ffsBackslashSequence

"""" Operator
"syn match ffsOperator /[-+!~\*\/%><&|^=()[\];,]/
"syn match ffsOperator /--\|++/
"syn match ffsOperator /&&\|||/
"syn match ffsOperator /[-+!*\/%><=]=/
syn match ffsPathOperator /:[htre]\>/
syn match ffsOperatorError /:[^htre]/
syn match ffsOperatorError /:[htre]\w/

""" Statement
syn keyword ffsConditional if elseif else endif
syn keyword ffsRepeat while foreach endloop
syn keyword ffsStatement break return shift

"""" Built-in procedure
" Built-in procedures that act like the File Menu 
syn keyword ffsProcedure Close Export FontsInFile Generate GenerateFamily Import MergeKern MergeFeature New Open PrintFont PrintSetup Quit Revert RevertToBackup Save
" File Manipulation 
syn keyword ffsProcedure FileAccess FontImage LoadStringFromFile WriteStringToFile
" Built-in procedures that act like the Edit Menu 
syn keyword ffsProcedure Clear ClearBackground Copy CopyAnchors CopyFgToBg CopyLBearing CopyRBearing CopyReference CopyUnlinked CopyVWidth CopyWidth Cut Join Paste PasteInto PasteWithOffset ReplaceWithReference SameGlyphAs UnlinkReference
" Built-in procedures that act like the Select Menu 
syn keyword ffsProcedure Select SelectAll SelectAllInstancesOf SelectBitmap SelectByPosSub SelectChanged SelectFewer SelectFewerSingletons SelectHintingNeeded SelectIf SelectInvert SelectMore SelectMoreIf SelectMoreSingletons SelectMoreSingletonsIf SelectNone SelectSingletons SelectSingletonsIf SelectWorthOutputting
" Built-in procedures that act like the Element Menu 
syn keyword ffsProcedure AddAccent AddExtrema ApplySubstitution AutoTrace BitmapsAvail BitmapsRegen BuildAccented BuildComposite BuildDuplicate CanonicalContours CanonicalStart CompareFonts CompareGlyphs CorrectDirection DefaultRoundToGrid DefaultUseMyMetrics ExpandStroke FindIntersections HFlip Inline InterpolateFonts MergeFonts Move MoveReference NearlyHvCps NearlyHvLines NearlyLines NonLinearTransform Outline OverlapIntersect PositionReference RemoveOverlap Rotate RoundToCluster RoundToInt Scale ScaleToEm Shadow Simplify Skew Transform VFlip Wireframe
" Font Info 
syn keyword ffsProcedure AddSizeFeature ChangePrivateEntry ClearPrivateEntry GetFontBoundingBox GetMaxpValue GetOS2Value GetPrivateEntry GetTeXParam GetTTFName HasPrivateEntry ScaleToEm SetFondName SetFontHasVerticalMetrics SetFontNames SetFontOrder SetGasp SetItalicAngle SetMacStyle SetMaxpValue SetOS2Value SetPanose SetTeXParams SetTTFName SetUniqueID
" Glyph Info 
syn keyword ffsProcedure DrawsSomething GetPosSub GlyphInfo SetGlyphColor SetGlyphComment SetGlyphChanged SetGlyphClass SetGlyphName SetUnicodeValue SetGlyphTeX WorthOutputting
" Built-in procedures that handle Advanced Typography
syn keyword ffsProcedure AddAnchorClass AddAnchorPoint AddLookup AddPosSub AddSizeFeature ApplySubstitution CheckForAnchorClass GetAnchorPoints GetLookupInfo GetLookups GetLookupSubtables GetLookupOfSubtable GetPosSub GetSubtableOfAnchor GenerateFeatureFile HasPreservedTable LoadTableFromFile LookupStoreLigatureInAfm LookupSetFeatureList MergeLookups MergeLookupSubtables RemoveAnchorClass RemoveLookup RemoveLookupSubtable RemovePosSub RemovePreservedTable SaveTableToFile
" Built-in procedures that act like the Encoding Menu 
syn keyword ffsProcedure CharCnt DetachGlyphs DetachAndRemoveGlyphs LoadEncodingFile MultipleEncodingsToReferences Reencode RemoveDetachedGlyphs RenameGlyphs SameGlyphAs SetCharCnt
" Built-in procedures that act like the Hint Menu 
syn keyword ffsProcedure AddDHint AddHHint AddInstrs AddVHint AutoCounter AutoHint AutoInstr ChangePrivateEntry ClearGlyphCounterMasks ClearHints ClearInstrs ClearPrivateEntry ClearTable DontAutoHint FindOrAddCvtIndex GetCvtAt GetPrivateEntry HasPrivateEntry ReplaceGlyphCounterMasks ReplaceCvtAt SetGlyphCounterMask SubstitutionPoints
" Built-in procedures that act like the Metrics Menu
syn keyword ffsProcedure AutoKern AutoWidth CenterInWidth SetKern RemoveAllKerns RemoveAllVKerns SetLBearing SetRBearing SetVKern SetVWidth SetWidth VKernFromHKern
" Multiple master routines 
syn keyword ffsProcedure MMAxisBounds MMAxisNames MMBlendToNewFont MMChangeInstance MMChangeWeight MMInstanceNames MMWeightedName
" CID routines
syn keyword ffsProcedure CIDChangeSubFont CIDFlatten CIDFlattenByCMap CIDSetFontNames ConvertToCID ConvertByCMap PreloadCidmap
" User Interaction
syn keyword ffsProcedure AskUser Error PostNotice Print
" Preferences
syn keyword ffsProcedure DefaultOtherSubrs GetPref LoadEncodingFile LoadNamelist LoadNamelistDir LoadPlugin LoadPluginDir LoadPrefs ReadOtherSubrsFile SavePrefs SetPref
" Math
syn keyword ffsProcedure ATan2 Ceil Chr Cos Exp Floor Int IsFinite IsNan Log Ord Pow Rand Real Round Sin Sqrt Strskipint Strtod Strtol Tan ToString UCodePoint
" Unicode
syn keyword ffsProcedure NameFromUnicode UCodePoint UnicodeFromName Ucs4 Utf8
" String manipulation
syn keyword ffsProcedure Chr GetEnv NameFromUnicode Ord Strcasecmp Strcasestr Strftime StrJoin Strlen Strrstr Strskipint StrSplit Strstr Strsub Strtod Strtol ToString UnicodeFromName
" Character Manipulation
syn keyword ffsProcedure IsAlNum IsAlpha IsDigit IsHexDigit IsLower IsSpace IsUpper ToLower ToMirror ToUpper
" Arrays
syn keyword ffsProcedure Array SizeOf
" Miscellaneous
syn keyword ffsProcedure InFont TypeOf
" Deprecated Names
syn keyword ffsProcedure ClearCharCounterMasks CharInfo ReplaceCharCounterMasks SetCharColor SetCharComment SetCharCounterMask SetCharName

let b:current_syntax = "fontforge_script"

hi def link ffsTodo Todo
hi def link ffsComment Comment
hi def link ffsBuiltInVar Identifier
hi def link ffsBuiltInVarError Error
hi def link ffsDecimal Number
hi def link ffsOctal Number
hi def link ffsHexadecimal Number
hi def link ffsReal Number
hi def link ffsUnicodeCodePoint Number
hi def link ffsBackslashSequence SpecialChar
hi def link ffsString String
hi def link ffsPathOperator Operator
hi def link ffsOctalError Error
hi def link ffsOperatorError Error
hi def link ffsConditional Conditional
hi def link ffsRepeat Repeat
hi def link ffsStatement Statement
hi def link ffsProcedure Function
