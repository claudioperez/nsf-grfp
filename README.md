# Latex Template for 2020 NSF GRFP

**Table of Contents**
  - [How to Use](#how-to-use)
    - [Building a PDF](#building-a-pdf)
  - [Style Documentation](#style-documentation)
    - [Required](#required)
    - [Other](#other)
  - [Sources, inspirations and alternatives:](#sources-inspirations-and-alternatives)


> In order to construct a pdf that will be accepted by the style checker you must add the `final` target when invoking Make, as follows:
>
>```bash
>make final pdf
>```
> See [Building a PDF](#building-a-pdf) section of this README for details.

## How to Use

### Building a PDF

## Style Documentation

### Required

- Margins
- Font
  - **11pt** \
    Configured in [`style/conf.yaml`](style/conf.yaml)
  - **Times New Roman** \
    Configured in [`style/nsf-grfp.tex`](style/nsf-grfp.tex)
  - **Cambria Math** \
    Configured in [`style/nsf-grfp.tex`](style/nsf-grfp.tex)
- Single spacing
- Equations/symbols as images

### Other

- **Citation style** \
  Configured in [`style/citestyle.csl`](style/citestyle.csl)

## Sources, inspirations and alternatives:

  - https://gist.github.com/kristopherjohnson/7466917
  - https://gist.github.com/bertvv/e77e3a5d24d8c2a9bcc4
  - https://keleshev.com/my-book-writing-setup/
