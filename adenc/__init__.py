from typing import Literal

import pydantic

from rendercv.themes.common_options import LaTeXDimension, ThemeOptions


class AdencThemeOptions(ThemeOptions):
    """This class is the data model of the theme options for the `sb2nov` theme."""

    theme: Literal["adenc"]
    font: Literal[
        "Latin Modern Serif",
        "Latin Modern Sans Serif",
        "Latin Modern Mono",
        "Source Sans 3",
        "Charter",
    ] = pydantic.Field(
        default="Latin Modern Serif",
        title="Font",
        description=(
            "The font family of the CV. The default value is Latin Modern Serif."
        ),
    )
    header_font_size: LaTeXDimension = pydantic.Field(
        default="24 pt",
        title="Header Font Size",
        description=(
            "The font size of the header (the name of the person). The default value is"
            " 24 pt. Unfortunately, sb2nov does not support font sizes bigger than"
            " 24 pt."
        ),
    )
    font_size: Literal["9pt", "10pt", "11pt", "12pt"] = pydantic.Field(
        default="10pt",
        title="Font Size",
        description='The font size of the CV. The default value is "10pt".',
        examples=["9pt", "10pt", "11pt", "12pt"],
    )
