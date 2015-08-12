(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[     13398,        385]
NotebookOptionsPosition[     13756,        376]
NotebookOutlinePosition[     14100,        391]
CellTagsIndexPosition[     14057,        388]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 StyleBox[
  RowBox[{
   RowBox[{"CIP", "-", 
    RowBox[{"CSL3", " ", "derivation"}]}], ";"}], "Section"]], "Input",
 CellChangeTimes->{{3.648346507687495*^9, 3.6483465130091047`*^9}}],

Cell[BoxData[
 StyleBox[
  RowBox[{
   StyleBox[
    RowBox[{"(", "*"}]], 
   RowBox[{
    RowBox[{"Reference", ":", "Xiao"}], ",", " ", 
    RowBox[{"2001", ";"}]}], 
   StyleBox[
    RowBox[{"*", ")"}]]}], "Subsection"]], "Input",
 CellChangeTimes->{{3.64834735057545*^9, 3.648347366064336*^9}, {
  3.6483475490588026`*^9, 3.6483475508979077`*^9}}],

Cell[BoxData[
 RowBox[{"ClearAll", "[", "\"\<Global`*\>\"", "]"}]], "Input",
 CellChangeTimes->{{3.6483474399805636`*^9, 3.6483474493791013`*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"FL", "[", "x_", "]"}], ":=", 
  RowBox[{"cl0", "+", 
   RowBox[{"cl1", 
    RowBox[{"(", 
     RowBox[{"x", "-", "\[Xi]"}], ")"}]}], "+", 
   RowBox[{"cl2", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"x", "-", "\[Xi]"}], ")"}], "2"]}], "+", 
   RowBox[{"cl3", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"x", "-", "\[Xi]"}], ")"}], "3"]}]}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"FR", "[", "x_", "]"}], ":=", 
  RowBox[{"cr0", "+", 
   RowBox[{"cr1", 
    RowBox[{"(", 
     RowBox[{"x", "-", "\[Xi]"}], ")"}]}], "+", 
   RowBox[{"cr2", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"x", "-", "\[Xi]"}], ")"}], "2"]}], "+", 
   RowBox[{"cr3", 
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{"x", "-", "\[Xi]"}], ")"}], "3"]}]}]}]}], "Input",
 CellChangeTimes->{{3.6483457257589626`*^9, 3.6483458371183324`*^9}, {
  3.6483459126484437`*^9, 3.648345936330285*^9}, {3.6483465504657707`*^9, 
  3.6483465646169953`*^9}, {3.6483468213769655`*^9, 3.6483468227519703`*^9}, {
  3.648346874385065*^9, 3.6483468869290867`*^9}}],

Cell[BoxData[
 FormBox[
  StyleBox[
   RowBox[{"Constrains", ";"}], "Subsection"], TraditionalForm]], "Input",
 CellChangeTimes->{{3.648346613419882*^9, 3.6483466230314984`*^9}}],

Cell[BoxData[{
 StyleBox[
  RowBox[{
   RowBox[{"Left", "-", "Bias"}], ";"}], 
  "Subsubsection"], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"LBiasEqn", "=", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       RowBox[{"FL", "[", "\[Xi]", "]"}], "\[Equal]", 
       SubscriptBox["f", "i"]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"FL", "[", 
        RowBox[{"\[Xi]", "-", "h"}], "]"}], "\[Equal]", 
       SubscriptBox["f", 
        RowBox[{"i", "-", "1"}]]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{
        SubsuperscriptBox["\[Integral]", 
         RowBox[{"\[Xi]", "-", "h"}], "\[Xi]"], 
        RowBox[{
         RowBox[{"FL", "[", "x", "]"}], 
         RowBox[{"\[DifferentialD]", "x"}]}]}], "\[Equal]", 
       SubscriptBox["\[Rho]", 
        RowBox[{"i", "-", 
         FractionBox["1", "2"]}]]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"D", "[", 
          RowBox[{
           RowBox[{"FL", "[", "x", "]"}], ",", "x"}], "]"}], "/.", 
         RowBox[{"x", "\[Rule]", 
          RowBox[{"\[Xi]", "-", 
           FractionBox["h", "2"]}]}]}], ")"}], "\[Equal]", 
       SubscriptBox["d", 
        RowBox[{"i", "-", 
         FractionBox["1", "2"]}]]}]}], "\[IndentingNewLine]", "}"}]}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 StyleBox[
  RowBox[{
   RowBox[{"Right", "-", "Bias"}], ";"}], 
  "Subsubsection"], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"RBiasEqn", "=", 
   RowBox[{"{", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{
      RowBox[{"FR", "[", "\[Xi]", "]"}], "\[Equal]", 
      SubscriptBox["f", "i"]}], ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"FR", "[", 
       RowBox[{"\[Xi]", "+", "h"}], "]"}], "\[Equal]", 
      SubscriptBox["f", 
       RowBox[{"i", "+", "1"}]]}], ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       SubsuperscriptBox["\[Integral]", "\[Xi]", 
        RowBox[{"\[Xi]", "+", "h"}]], 
       RowBox[{
        RowBox[{"FR", "[", "x", "]"}], 
        RowBox[{"\[DifferentialD]", "x"}]}]}], "\[Equal]", 
      SubscriptBox["\[Rho]", 
       RowBox[{"i", "+", 
        FractionBox["1", "2"]}]]}], ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"D", "[", 
         RowBox[{
          RowBox[{"FR", "[", "x", "]"}], ",", "x"}], "]"}], "/.", 
        RowBox[{"x", "\[Rule]", 
         RowBox[{"\[Xi]", "+", 
          FractionBox["h", "2"]}]}]}], ")"}], "\[Equal]", 
      SubscriptBox["d", 
       RowBox[{"i", "+", 
        FractionBox["1", "2"]}]]}]}], "\[IndentingNewLine]", "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"LBiasEqnSol", "=", 
   RowBox[{"Solve", "[", 
    RowBox[{"LBiasEqn", ",", 
     RowBox[{"{", 
      RowBox[{"cl0", ",", "cl1", ",", "cl2", ",", "cl3"}], "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"RBiasEqnSol", "=", 
   RowBox[{"Solve", "[", 
    RowBox[{"RBiasEqn", ",", 
     RowBox[{"{", 
      RowBox[{"cr0", ",", "cr1", ",", "cr2", ",", "cr3"}], "}"}]}], "]"}]}], 
  ";"}]}], "Input",
 CellChangeTimes->{{3.648346037470063*^9, 3.648346202737154*^9}, {
  3.648346241259622*^9, 3.6483462424452243`*^9}, {3.648346393272092*^9, 
  3.6483463983109007`*^9}, {3.648346585429432*^9, 3.6483466617547665`*^9}, {
  3.648346716076743*^9, 3.6483467243617587`*^9}, {3.6483468246129737`*^9, 
  3.6483468292709813`*^9}, {3.648346888890089*^9, 3.6483469076521254`*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Style", "[", 
   RowBox[{
    RowBox[{"Row", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{
         RowBox[{"Column", "[", 
          RowBox[{
           RowBox[{"LBiasEqnSol", "//", "Flatten"}], ",", 
           RowBox[{"Spacings", "\[Rule]", "2"}]}], "]"}], "//", "ExpandAll"}],
         ",", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"Column", "[", 
          RowBox[{
           RowBox[{"RBiasEqnSol", "//", "Flatten"}], ",", 
           RowBox[{"Spacings", "\[Rule]", "2"}]}], "]"}], "//", 
         "ExpandAll"}]}], "\[IndentingNewLine]", "}"}], ",", 
      RowBox[{"Spacer", "[", "20", "]"}]}], "]"}], ",", 
    RowBox[{"FontSize", "\[Rule]", "16"}]}], "]"}], "//", 
  "TraditionalForm"}]], "Input",
 CellChangeTimes->{{3.6483462468756323`*^9, 3.648346334916587*^9}, {
  3.6483464032717094`*^9, 3.64834645987661*^9}, {3.6483467301337767`*^9, 
  3.6483467688858647`*^9}, {3.648346980478483*^9, 3.6483469961495237`*^9}, {
  3.648347034097601*^9, 3.648347113758741*^9}, {3.648347191728881*^9, 
  3.6483473238441954`*^9}}],

Cell[BoxData[
 FormBox[
  StyleBox[
   TemplateBox[{InterpretationBox[
      StyleBox[
       GraphicsBox[{}, ImageSize -> {20, 0}, BaselinePosition -> Baseline], 
       "CacheGraphics" -> False], 
      Spacer[20]],TagBox[
      GridBox[{{
         RowBox[{"cl0", "\[Rule]", 
           SubscriptBox["f", "i"]}]}, {
         RowBox[{"cl1", "\[Rule]", 
           RowBox[{
             RowBox[{"-", 
               RowBox[{"2", " ", 
                 SubscriptBox["d", 
                  RowBox[{"i", "-", 
                    FractionBox["1", "2"]}]]}]}], "+", 
             FractionBox[
              RowBox[{"6", " ", 
                SubscriptBox["f", "i"]}], "h"], "-", 
             FractionBox[
              RowBox[{"6", " ", 
                SubscriptBox["\[Rho]", 
                 RowBox[{"i", "-", 
                   FractionBox["1", "2"]}]]}], 
              SuperscriptBox["h", "2"]]}]}]}, {
         RowBox[{"cl2", "\[Rule]", 
           RowBox[{
             RowBox[{"-", 
               FractionBox[
                RowBox[{"6", " ", 
                  SubscriptBox["d", 
                   RowBox[{"i", "-", 
                    FractionBox["1", "2"]}]]}], "h"]}], "-", 
             FractionBox[
              RowBox[{"3", " ", 
                SubscriptBox["f", 
                 RowBox[{"i", "-", "1"}]]}], 
              SuperscriptBox["h", "2"]], "+", 
             FractionBox[
              RowBox[{"9", " ", 
                SubscriptBox["f", "i"]}], 
              SuperscriptBox["h", "2"]], "-", 
             FractionBox[
              RowBox[{"6", " ", 
                SubscriptBox["\[Rho]", 
                 RowBox[{"i", "-", 
                   FractionBox["1", "2"]}]]}], 
              SuperscriptBox["h", "3"]]}]}]}, {
         RowBox[{"cl3", "\[Rule]", 
           RowBox[{
             RowBox[{"-", 
               FractionBox[
                RowBox[{"4", " ", 
                  SubscriptBox["d", 
                   RowBox[{"i", "-", 
                    FractionBox["1", "2"]}]]}], 
                SuperscriptBox["h", "2"]]}], "-", 
             FractionBox[
              RowBox[{"4", " ", 
                SubscriptBox["f", 
                 RowBox[{"i", "-", "1"}]]}], 
              SuperscriptBox["h", "3"]], "+", 
             FractionBox[
              RowBox[{"4", " ", 
                SubscriptBox["f", "i"]}], 
              SuperscriptBox["h", "3"]]}]}]}}, DefaultBaseStyle -> "Column", 
       GridBoxAlignment -> {"Columns" -> {{Left}}}, 
       GridBoxItemSize -> {
        "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
       GridBoxSpacings -> {"Columns" -> {{Automatic}}, "Rows" -> {{2}}}], 
      "Column"],TagBox[
      GridBox[{{
         RowBox[{"cr0", "\[Rule]", 
           SubscriptBox["f", "i"]}]}, {
         RowBox[{"cr1", "\[Rule]", 
           RowBox[{
             RowBox[{"-", 
               RowBox[{"2", " ", 
                 SubscriptBox["d", 
                  RowBox[{"i", "+", 
                    FractionBox["1", "2"]}]]}]}], "-", 
             FractionBox[
              RowBox[{"6", " ", 
                SubscriptBox["f", "i"]}], "h"], "+", 
             FractionBox[
              RowBox[{"6", " ", 
                SubscriptBox["\[Rho]", 
                 RowBox[{"i", "+", 
                   FractionBox["1", "2"]}]]}], 
              SuperscriptBox["h", "2"]]}]}]}, {
         RowBox[{"cr2", "\[Rule]", 
           RowBox[{
             FractionBox[
              RowBox[{"6", " ", 
                SubscriptBox["d", 
                 RowBox[{"i", "+", 
                   FractionBox["1", "2"]}]]}], "h"], "+", 
             FractionBox[
              RowBox[{"9", " ", 
                SubscriptBox["f", "i"]}], 
              SuperscriptBox["h", "2"]], "-", 
             FractionBox[
              RowBox[{"3", " ", 
                SubscriptBox["f", 
                 RowBox[{"i", "+", "1"}]]}], 
              SuperscriptBox["h", "2"]], "-", 
             FractionBox[
              RowBox[{"6", " ", 
                SubscriptBox["\[Rho]", 
                 RowBox[{"i", "+", 
                   FractionBox["1", "2"]}]]}], 
              SuperscriptBox["h", "3"]]}]}]}, {
         RowBox[{"cr3", "\[Rule]", 
           RowBox[{
             RowBox[{"-", 
               FractionBox[
                RowBox[{"4", " ", 
                  SubscriptBox["d", 
                   RowBox[{"i", "+", 
                    FractionBox["1", "2"]}]]}], 
                SuperscriptBox["h", "2"]]}], "-", 
             FractionBox[
              RowBox[{"4", " ", 
                SubscriptBox["f", "i"]}], 
              SuperscriptBox["h", "3"]], "+", 
             FractionBox[
              RowBox[{"4", " ", 
                SubscriptBox["f", 
                 RowBox[{"i", "+", "1"}]]}], 
              SuperscriptBox["h", "3"]]}]}]}}, DefaultBaseStyle -> "Column", 
       GridBoxAlignment -> {"Columns" -> {{Left}}}, 
       GridBoxItemSize -> {
        "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
       GridBoxSpacings -> {"Columns" -> {{Automatic}}, "Rows" -> {{2}}}], 
      "Column"]},
    "RowWithSeparator"],
   StripOnInput->False,
   FontSize->16], TraditionalForm]], "Output",
 CellChangeTimes->{{3.648346255582447*^9, 3.648346335524988*^9}, {
   3.6483464007133055`*^9, 3.6483464605318108`*^9}, {3.648346738397793*^9, 
   3.6483467695258656`*^9}, {3.648346883778082*^9, 3.6483469258681602`*^9}, {
   3.6483469827364864`*^9, 3.6483469968215256`*^9}, {3.6483470349576025`*^9, 
   3.648347114408742*^9}, {3.6483471965448885`*^9, 3.648347324224196*^9}, 
   3.6483474537133493`*^9, 3.648347555400165*^9}]
}, Open  ]]
},
WindowSize->{1064, 810},
WindowMargins->{{Automatic, 0}, {Automatic, 21}},
FrontEndVersion->"9.0 for Microsoft Windows (64-bit) (January 25, 2013)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1463, 33, 199, 5, 54, "Input"],
Cell[1665, 40, 350, 11, 44, "Input"],
Cell[2018, 53, 146, 2, 31, "Input"],
Cell[2167, 57, 1096, 32, 52, "Input"],
Cell[3266, 91, 178, 4, 44, "Input"],
Cell[3447, 97, 3511, 98, 468, "Input"],
Cell[CellGroupData[{
Cell[6983, 199, 1126, 27, 92, "Input"],
Cell[8112, 228, 5628, 145, 293, "Output"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 9up#7YdKxUFtaBwOcxsxuOfi *)
