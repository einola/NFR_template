\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nfr}[2024/02/08 NFR template class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Page setup
\LoadClass[11pt,a4paper]{article}
\RequirePackage[left=2cm,top=2cm,bottom=2cm,right=2cm]{geometry}

\renewcommand{\maketitle}{
   {\centering\bfseries\LARGE
   \vspace{.25cm}
   \@title\par
   \vspace{.25cm}
   }
}

% Footer
\RequirePackage{fancyhdr}
\RequirePackage[table]{xcolor}

\fancyhf{} % clear all header and footer fields

\pagestyle{fancy}

\fancyfoot[C]{\textcolor{gray}{\thepage}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Hyperlinks and TOC for PDF
\RequirePackage[
        plainpages=false,%
        breaklinks,%
        colorlinks,%
        citecolor=black,%
        filecolor=black,%
        linkcolor=black,%
        urlcolor=black,%
        bookmarksopenlevel=2,%
        pdfpagemode=UseOutlines]{hyperref}
\AtBeginDocument{
    \hypersetup{
        pdftitle={\@title},%
        pdfauthor={\@author},%
        %pdfsubject={\@granttypeyear},%
        addtopdfcreator={using \csname ver@nfr.cls\endcsname~(https://github.com/einola/NFR\_template)}
    }
}

% Environments and counters for WPs, tasks, objectives, hypotheses, and research questions
% counters

% Work packages
\newcounter{wpCntr}
\newcommand{\workpackage}[1]%
    {\refstepcounter{wpCntr}%
        \belowpdfbookmark{WP\thewpCntr:~#1}{WP\thewpCntr}%
        \subsubsection*{WP\thewpCntr:~#1}}

% Tasks
\newcounter{taskCntr}[wpCntr]
\counterwithin{taskCntr}{wpCntr}
\newcommand{\task}[1]%
    {\refstepcounter{taskCntr}%
    \paragraph{Task~\thetaskCntr:~#1}}

% Deliverables
\newcounter{delivCntr}[wpCntr]
\counterwithin{delivCntr}{wpCntr}
\newcommand{\deliverable}[1]
    {\refstepcounter{delivCntr}%
    \emph{Deliverable~\thedelivCntr: #1}}

% Milestones
\newcounter{mlstnCntr}[wpCntr]
\counterwithin{mlstnCntr}{wpCntr}
\newcommand{\milestone}[1]
    {\refstepcounter{mlstnCntr}%
    \emph{Milestone~\themlstnCntr: #1}}

% Objectives (numbered and not)
\newcounter{objCntr}
\newenvironment{objective*}%
    {\begin{quote}\begin{bfseries}\begin{flushleft}}%
    {\end{flushleft}\end{bfseries}\end{quote}}

\newenvironment{objective}[1][Objective~]%
    {\refstepcounter{objCntr}\begin{objective*}#1\theobjCntr:}%
    {\end{objective*}}

% Hypothesis (numbered and not)
\newcounter{hypCntr}
\newenvironment{hypothesis*}%
    {\begin{quote}\begin{bfseries}\begin{flushleft}}%
    {\end{flushleft}\end{bfseries}\end{quote}}

\newenvironment{hypothesis}[1][Hypothesis~]%
    {\refstepcounter{hypCntr}\begin{hypothesis*}#1\thehypCntr:}%
    {\end{hypothesis*}\ignorespacesafterend}

% Research questions (numbered and not)
\newcounter{resqCntr}
\newenvironment{resq*}%
    {\begin{quote}\begin{bfseries}\begin{flushleft}}%
    {\end{flushleft}\end{bfseries}\end{quote}}

\newenvironment{resq}[1][Research~question~]%
    {\refstepcounter{resqCntr}\begin{resq*}#1\theresqCntr:}%
    {\end{resq*}}

% References
\newcommand{\wpref}[1]{WP\ref{#1}}
\newcommand{\tskref}[1]{T\ref{#1}}
\newcommand{\dref}[1]{D\ref{#1}}
\newcommand{\mref}[1]{M\ref{#1}}

% Bibliography with natbib
\RequirePackage[sort&compress]{natbib}
% The bibliography can use a 9pt font, which equates to \footnotesize when the
% main document font size is 11pts
\renewcommand{\bibfont}{\footnotesize}

\endinput
