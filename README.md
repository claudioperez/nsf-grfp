# Latex Template for 2020 NSF GRFP

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

The workflow of this project is designed to consolidate content files in the `src/` directory. Any file in this directory with a `.md` extension will be used as a target when Make is invoked.

### Building a PDF from Markdown

Running the following command from the project root will generate final PDF files in the `build/` directory from the Markdown files in `src/`.

```bash
make final pdf
```

Including the `final` target when invoking Make will cause all of the typeset equations to automatically be converted to PNGs. This is done in order to pass through the automatic format checker in the application portal.

Run the following command from the project root directory will create a PDF **draft** in the `build/` directory with the same name as it's source Markdown file. This draft will include a timestamp in the header and equations will not be converted to PNGs for a quicker build, but otherwise the typesetting should be represent the final version.

```bash
make pdf
```

### Building a PDF from Latex



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
