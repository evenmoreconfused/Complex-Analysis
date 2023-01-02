
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2/6/2019 custom lecture note class]
\LoadClass[twoside=false]{scrbook}


\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}

\usepackage[dvipsnames]{xcolor}
\usepackage{hyperref}
\usepackage{cleveref}

\usepackage{mathtools}
\usepackage{mathrsfs} 
\usepackage{commath}
\usepackage{stmaryrd}

\usepackage{enumerate}
\usepackage[shortlabels]{enumitem}
\usepackage{cancel}
\usepackage{braket}
\usepackage{faktor}
\usepackage[thinc]{esdiff}
\usepackage{stackengine}

\usepackage{pgfplots}
\pgfplotsset{compat=newest}

\usepackage{tikz}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{shapes.misc}
\usetikzlibrary {patterns.meta}
\usetikzlibrary{positioning}
\usetikzlibrary{cd}

\usetikzlibrary{calc}
\usetikzlibrary{patterns}
\usetikzlibrary{automata, positioning, arrows}

\tikzset{cross/.style={cross out, draw=black, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt},
%default radius will be 1pt. 
cross/.default={1pt}}

\tikzdeclarepattern{
name=mylines,
parameters={
\pgfkeysvalueof{/pgf/pattern keys/size},
\pgfkeysvalueof{/pgf/pattern keys/angle},
\pgfkeysvalueof{/pgf/pattern keys/line width},
},
bounding box={
(0,-0.5*\pgfkeysvalueof{/pgf/pattern keys/line width}) and
(\pgfkeysvalueof{/pgf/pattern keys/size},
0.5*\pgfkeysvalueof{/pgf/pattern keys/line width})},
tile size={(\pgfkeysvalueof{/pgf/pattern keys/size},
\pgfkeysvalueof{/pgf/pattern keys/size})},
tile transformation={rotate=\pgfkeysvalueof{/pgf/pattern keys/angle}},
defaults={
size/.initial=5pt,
angle/.initial=45,
line width/.initial=.4pt,
},
code={
\draw [line width=\pgfkeysvalueof{/pgf/pattern keys/line width}]
(0,0) -- (\pgfkeysvalueof{/pgf/pattern keys/size},0);
},
}

\usepackage{graphicx}


% \usepackage{mathrsfs} 
% \usepackage{commath}
% \usepackage{cancel}
% \usepackage{tikz}
% \usepackage[shortlabels]{enumitem}
% \usepackage{braket}
% \usepackage{stmaryrd}
% \usepackage{faktor}
% \usepackage[thinc]{esdiff}
% \usepackage{amsmath}
% \usepackage{graphicx}
% \usepackage{amsfonts}
% \usepackage{amssymb}

% \RequirePackage{mathtools,amssymb,bm,bbold,enumerate}
% \RequirePackage[dvipsnames]{xcolor}
% \RequirePackage{hyperref,cleveref}

\newcommand\myshade{90}
\colorlet{mylinkcolor}{NavyBlue}
\colorlet{mycitecolor}{Aquamarine}
\colorlet{myurlcolor}{Aquamarine}

\newcommand\vertarrowbox[3][6ex]{%
  \begin{array}[t]{@{}c@{}} #2 \\
  \left\uparrow\vcenter{\hrule height #1}\right.\kern-\nulldelimiterspace\\
  \makebox[0pt]{\scriptsize#3}
  \end{array}%
}

\hypersetup{
  linkcolor  = mylinkcolor!\myshade!black,
  citecolor  = mycitecolor!\myshade!black,
  urlcolor   = myurlcolor!\myshade!black,
  colorlinks = true,
}



 
\usetikzlibrary{decorations.markings}
\usetikzlibrary{patterns}
\usetikzlibrary{calc}

%\usepackage{pgfplots}

\tikzset{%
  view top right/.style={
    x={(0.866cm,0.5cm)},
    y={(0,1cm)},
    z={(-0.939cm,0.342cm)}
  },
}

% title page



% define university 
\def\@university{no university}
\newcommand{\university}[1]{
  \def\@university{#1}
}
% define course id
\def\@courseid{CS 000}
\newcommand{\courseid}[1]{
  \def\@courseid{#1}
}
% define version
\def\@version{Great Year}
\newcommand{\version}[1]{
  \def\@version{#1}
}
% define instructor info
\def\@instructor{Instructor}
\newcommand{\instructor}[1]{
  \def\@instructor{#1}
}
% make title
\renewcommand{\maketitle}{
    \centering
    {\scshape{\Large  \@university, \@courseid} \par}
    \vspace{1.5cm}
    {\huge\bfseries{\@title} \par}
    \vspace{2cm}
    \@instructor
    \vspace{2cm}
    \includegraphics[width=0.25\textwidth]{figures/McGill_logo.png}
    \vfill
    % Bottom of the page
    {\Large\itshape \@author \par}
    {\large \@version \par}
}

%=================================
% add current instructor info 
% on the right
\newcommand{\curinstructor}[1]{
    % instructor info
    \vfill
    \begin{flushright}
    Instructor: #1
    \end{flushright}
}



%
% The following commands set up the lecnum (lecture number)
% counter and make various numbering schemes work relative
% to the lecture number.
%
\newcounter{lecnum}
\renewcommand{\thepage}{\thelecnum-\arabic{page}}
\renewcommand{\thesection}{\thelecnum.\arabic{section}}
\renewcommand{\theequation}{\thelecnum.\arabic{equation}}
\renewcommand{\thefigure}{\thelecnum.\arabic{figure}}
\renewcommand{\thetable}{\thelecnum.\arabic{table}}

%
% The following macro is used to generate the header.
%

%
% Convention for citations is authors' initials followed by the year.
% For example, to cite a paper by Leighton and Maggs you would type
% \cite{LM89}, and to cite a paper by Strassen you would type \cite{S69}.
% (To avoid bibliography problems, for now we redefine the \cite command.)
% Also commands that create a suitable format for the reference list.
\renewcommand{\cite}[1]{[#1]}
\def\beginrefs{\begin{list}%
        {[\arabic{equation}]}{\usecounter{equation}
         \setlength{\leftmargin}{2.0truecm}\setlength{\labelsep}{0.4truecm}%
         \setlength{\labelwidth}{1.6truecm}}}
\def\endrefs{\end{list}}
\def\bibentry#1{\item[\hbox{[#1]}]}

%Use this command for a figure; it puts a figure in wherever you want it.
%usage: \fig{NUMBER}{SPACE-IN-INCHES}{CAPTION}
\newcommand{\fig}[3]{
			\vspace{#2}
			\begin{center}
			Figure \thelecnum.#1:~#3
			\end{center}
	}
% Use these for theorems, lemmas, proofs, etc.
\newtheorem{theorem}{Theorem}[lecnum]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{notation}[theorem]{Notation}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\newtheorem{counterexample}[theorem]{Counterexample}
\newtheorem{note}[theorem]{Note}
\newtheorem{exercise}[theorem]{Exercise}
\newtheorem{hypothesis}[theorem]{Hypothesis}
\newenvironment{proof}{\textbf{Proof:}}{\hfill\rule{2mm}{2mm}}

% **** IF YOU WANT TO DEFINE ADDITIONAL MACROS FOR YOURSELF, PUT THEM HERE:

\newcommand\E{\mathbb{E}}


\newcommand{\lecture}[2]{
   \pagestyle{myheadings}
   \thispagestyle{plain}
   \newpage
   \setcounter{lecnum}{#1}
   \setcounter{page}{1}
   \noindent
   \begin{center}
   \framebox{
      \vbox{\vspace{2mm}


    \hbox to 6.28in { \textbf{ \@courseid
	\hfill \@version} }
       \vspace{4mm}
       \hbox to 6.28in { {\Large \hfill Lecture #1: #2  \hfill} }
       \vspace{2mm}
       \hbox to 6.28in { \textit{ \@instructor \hfill Scribe: \@author} }
      \vspace{2mm}}
   }
   \end{center}
   \markboth{Lecture #1: #2}{Lecture #1: #2}


   \vspace*{4mm}
}

\makeatletter
\newcommand{\unchapter}[1]{%
  \begingroup
  \let\@makechapterhead\@gobble % make \@makechapterhead do nothing
  \chapter{#1}
  \endgroup
}
\makeatother




%copied for riemmann projection below here
\newcommand\pgfmathsinandcos[3]{%
  \pgfmathsetmacro#1{sin(#3)}%
  \pgfmathsetmacro#2{cos(#3)}%
}
\newcommand\LongitudePlane[3][current plane]{%
  \pgfmathsinandcos\sinEl\cosEl{#2} % elevation
  \pgfmathsinandcos\sint\cost{#3} % azimuth
  \tikzset{#1/.style={cm={\cost,\sint*\sinEl,0,\cosEl,(0,0)}}}
}
\newcommand\LatitudePlane[3][current plane]{%
  \pgfmathsinandcos\sinEl\cosEl{#2} % elevation
  \pgfmathsinandcos\sint\cost{#3} % latitude
  \pgfmathsetmacro\yshift{\cosEl*\sint}
  \tikzset{#1/.style={cm={\cost,0,0,\cost*\sinEl,(0,\yshift)}}} %
}
\newcommand\DrawLatitudeCircle[2][1]{
  \LatitudePlane{\angEl}{#2}
  \tikzset{current plane/.prefix style={scale=#1}}
  \pgfmathsetmacro\sinVis{sin(#2)/cos(#2)*sin(\angEl)/cos(\angEl)}
  % angle of "visibility"
  \pgfmathsetmacro\angVis{asin(min(1,max(\sinVis,-1)))}
  \draw[current plane] (\angVis:1) arc (\angVis:-\angVis-180:1);
  \draw[current plane,dashed] (180-\angVis:1) arc (180-\angVis:\angVis:1);
}
\newcommand\DrawLatitudeCircleF[2][1]{
  \LatitudePlane{\angEl}{#2}
  \tikzset{current plane/.prefix style={scale=#1}}
  \pgfmathsetmacro\sinVis{sin(#2)/cos(#2)*sin(\angEl)/cos(\angEl)}
  % angle of "visibility"
  \pgfmathsetmacro\angVis{asin(min(1,max(\sinVis,-1)))}
  \draw[current plane][fill=white] (\angVis:1) arc (\angVis:-\angVis-180:1);
  \draw[current plane,dashed][fill=white] (180-\angVis:1) arc (180-\angVis:\angVis:1);
  \draw[current plane][fill=gray,fill opacity=0.25] (\angVis:1) arc (\angVis:-\angVis-180:1);
  \draw[current plane,dashed][fill=gray,fill opacity=0.25] (180-\angVis:1) arc (180-\angVis:\angVis:1);
}
\newcommand\DrawLatitudeCircleShiftOne[2][1]{
  \LatitudePlane{\angEl}{#2}
  \tikzset{current plane/.prefix style={scale=#1}}
  \pgfmathsetmacro\sinVis{sin(#2)/cos(#2)*sin(\angEl)/cos(\angEl)}
  % angle of "visibility"
  \pgfmathsetmacro\angVis{asin(min(1,max(\sinVis,-1)))}
  %\draw[current plane] (\angVis:1) arc (\angVis:-\angVis-180:1);
  \draw[xyplane] node (A) at ($ (3,0) + (0,{-3*sin(\angAz)})$) {};
  \draw[current plane] ($ (0,28/3) + (A)+(\angVis:1) $) arc (\angVis:-\angVis-180:1);
  \draw[current plane,dashed] ($ (0,28/3) + (A)+(180-\angVis:1)$) arc (180-\angVis:\angVis:1);

}

\newcommand\DrawLatitudeCircleShiftTwo[2][1]{
  \LatitudePlane{\angEl}{#2}
  \tikzset{current plane/.prefix style={scale=#1}}
  \pgfmathsetmacro\sinVis{sin(#2)/cos(#2)*sin(\angEl)/cos(\angEl)}
  % angle of "visibility"
  \pgfmathsetmacro\angVis{asin(min(1,max(\sinVis,-1)))}
  %\draw[current plane] (\angVis:1) arc (\angVis:-\angVis-180:1);

  %\draw node at (0,0) {#3};
  
  \draw[xyplane] node (A) at ($ (17,0) + (0,{-17*sin(\angAz)})$) {};
  \draw[current plane] ($ (0,28/3) + (A)+(\angVis:1) $) arc (\angVis:-\angVis-180:1);
  \draw[current plane,dashed] ($ (0,28/3) + (A)+(180-\angVis:1)$) arc (180-\angVis:\angVis:1);
  
}
\tikzset{%
  >=latex, % option for nice arrows
  inner sep=0pt,%
  outer sep=2pt,%
  mark coordinate/.style={inner sep=0pt,outer sep=0pt,minimum size=3pt,
    fill=black,circle}%
}
%copied for riemmann projection above here


\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\HH}{\mathbb{H}}
\newcommand{\N}{\mathbb{N}}




\newcommand\isection[1]{%
  \refstepcounter{section}%
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}%
  \sectionmark{#1}}
  
\newcommand\isubsection[1]{%
  \refstepcounter{subsection}%
  \addcontentsline{toc}{subsection}{\protect\numberline{\thesection}#1}%
  \sectionmark{#1}}
  
\newcommand{\ssubset}{\subset\joinrel\subset}



\newcommand{\foc}{f:\Omega \rightarrow \mathbb{C}}


\newcommand{\om}{\Omega}
\newcommand{\oic}{\Omega \subset \mathbb{C}}

\newcommand{\F}{\mathscr{F}}
\newcommand{\nequiv}{\not\equiv}
\newcommand{\DP}{D \setminus \{ z_0 \} }

\newcommand{\DrP}[2]{D_#1 (#2) \setminus \{ #2 \}}

%\newcommand{\DrP}{D_r(z_0) \setminus \{ z_0 \} }


\newcommand{\omP}{\Omega \setminus \{ z_0 \} }

\newcommand{\tou}{\xrightarrow[]{u}}


\newcommand{\interior}[1]{%
  {\kern0pt#1}^{\mathrm{o}}%
}

\newcommand{\res}[2]{Res_{#1} \left( #2 \right)}

\newcommand{\defas}{\vcentcolon =}


 \newcommand{\br}[1]{\left( #1 \right)}

\newcommand{\id}{\mathrm{Id}}

\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=2pt] (char) {#1};}}
