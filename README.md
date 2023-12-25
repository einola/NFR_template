# LaTeX templates for ERC (CoG, 2024)

This repository contains **_unofficial_** LaTeX templates for Norges Forskningsråd (NFR) applications. It consists of three files:

 1. nfr.cls
 2. Template for project description - Researcher project for experienced scientists and early career scientists.tex
 3. README.md (this file)
 4. license.txt (the CC-BY-4.0 license)

The class file (nfr.cls) contains the `nfr` LaTeX class. This is used in the "Template" file, which is a reproduction of the official NFR templates. The "Template" file is a conversion of the official file "Template for project description - Researcher project for experienced scientists and early career scientists.docx", converted to LaTeX by pandoc. I modified the "Template" file, to use the nfr document class, so that section A of that document is the actual structure, using the \section and \subsection commands, and the other sections are treated as an appendix.

In addition to general formatting, then the class file also contains counters and commands for work packages (`\workpackage`) and tasks (`\task`), as well as reference commands (`\wpref` and `\tskref`). There are also counters and environments for objectives (`objective`), hypothesises (`hypothesis`), and research questions (`resq`). The environments have starred (`*`) alternatives which are not numbered. The number prefix can be changed by passing an alternative prefix to the environment.

These templates are based on my ERC LaTeX class, available [here](https://github.com/einola/ERC_template).