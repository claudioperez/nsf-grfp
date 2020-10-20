# Latex Template for 2020 NSF GRFP

A Latex template and Markdown/Pandoc workflow for the NSF GRFP application that is accepted by the application portal.

**Table of Contents**
  - [How to Use](#how-to-use)
  - [Style Documentation](#style-documentation)
  - [Sources, inspirations and alternatives:](#sources-inspirations-and-alternatives)


> In order to construct a pdf that will be accepted by the style checker you must add the `final` target when invoking Make, as follows:
>
>```bash
>make final pdf
>```
> See [Building a PDF](#building-a-pdf) section of this README for details.

## How to Use

The workflow of this project is designed to consolidate content files in the `src/` directory. Any file in this directory with a `.md` extension will be used to generate a PDF when Make is invoked. PDFs can be generated in two manners: one for a quick draft build, and another for final submission.

### Building Submission PDFs from Markdown

Running the following terminal commands from the project root will generate final PDF files in the `build/` directory from a Markdown file in `src/`.

```bash
# Build build/filename.tex from src/filename.md
$ pandoc src/filename.md -o build/filename.tex \
    --defaults style/conf.yaml \
    --template style/temp.tex \
    -H style/nsf-grfp.tex 
    -F pandoc-citeproc 
    -V timestampFlag=false

# Build build/filename.pdf from build/filename.tex
$ cd build
$ lualatex --shell-escape \
    --interaction=nonstopmode \
    ../build/filename.tex -o filename.pdf
```

or on systems with Make:

```shell
make final pdf
```

Including the `final` target when invoking Make will cause all of the typeset equations to automatically be converted to PNGs. This is done in order to pass through the automatic format checker in the application portal.

### Building draft PDFs

Running the following command from the project root directory will create a PDF **draft** in the `build/` directory with the same name as it's source Markdown file. This draft will include a timestamp in the header and equations will not be converted to PNGs for a quicker build, but otherwise the typesetting should be represent the final version.

```bash
make pdf
```

## Style Documentation

### Requirements

- Margins, 1" \
  Configured in [`style/conf.yaml`](style/conf.yaml)
- Font
  - **11pt** \
    Configured in [`style/conf.yaml`](style/conf.yaml)
  - **Times New Roman** \
    Configured in [`style/nsf-grfp.tex`](style/nsf-grfp.tex)
  - **Cambria Math** \
    Configured in [`style/nsf-grfp.tex`](style/nsf-grfp.tex)
- Single spacing
- Equations/symbols as images \
  Handled by [`style/imageeqn.sty`](style/imageeqn.sty)

### Other

- **Citation style** \
  Configured in [`style/citestyle.csl`](style/citestyle.csl)

## Dependencies

- [Pandoc](https://pandoc.org) >= 2.11
- LuaLatex (XeTeX may work with minor tweaks)


## Sources, inspirations and alternatives:

  - https://github.com/tompollard/phd_thesis_markdown
  - https://gist.github.com/kristopherjohnson/7466917
  - https://gist.github.com/bertvv/e77e3a5d24d8c2a9bcc4
  - https://keleshev.com/my-book-writing-setup/
