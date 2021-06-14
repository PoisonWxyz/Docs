[图片!]https://raw.githubusercontent.com/PoisonWxyz/Docs/main/Images/code.png

主题色

您可以使用用户设置自定义您的活动 Visual Studio Code颜色主题。workbench.colorCustomizations

{
  "workbench.colorCustomizations": {
    "activityBar.background": "#00AA00"
  }
}

注意：如果您想使用现有的颜色主题，请参阅颜色主题，您将在其中了解如何通过首选项：颜色主题下拉菜单 ( ⌘K ⌘T )设置活动颜色主题。

主题颜色可作为webviews 中的CSS 变量使用，并且提供了一个为它们提供 IntelliSense的扩展。
颜色格式#

可以在 RGB 颜色模型中定义颜色值，并使用 alpha 通道来实现透明度。作为格式，下面的十六进制表示法支持：#RGB，#RGBA，#RRGGBB和#RRGGBBAA。R（红色）、G（绿色）、B（蓝色）和 A（字母）是十六进制字符（0-9、af 或 AF）。三位数表示法 ( #RGB) 是六位数形式 ( #RRGGBB)#RGBA的较短版本，四位数 RGB 表示法 ( ) 是八位数形式 ( #RRGGBBAA)的较短版本。例如#e35f与 相同的颜色#ee3355ff。

如果未定义 alpha 值，则默认为ff（不透明，不透明）。如果 alpha 设置为00，则颜色是完全透明的。

为了不覆盖其他注释，某些颜色不应是不透明的。检查颜色说明以了解这适用于哪些颜色。
对比色#

对比度颜色通常仅针对高对比度主题设置。如果设置，它们会在整个 UI 的项目周围添加额外的边框以增加对比度。

    contrastActiveBorder：围绕活动元素的额外边框将它们与其他元素分开以获得更大的对比度。
    contrastBorder：元素周围的额外边框将它们与其他元素分开以获得更大的对比度。

基色#

    focusBorder：聚焦元素的整体边框颜色。仅当未被组件覆盖时才使用此颜色。
    foreground：整体前景色。仅当未被组件覆盖时才使用此颜色。
    widget.shadow：在编辑器中查找/替换等小部件的阴影颜色。
    selection.background：工作台中文本选择的背景颜色（对于输入字段或文本区域，不适用于编辑器和终端中的选择）。
    descriptionForeground：提供附加信息的描述文本的前景色，例如标签。
    errorForeground：错误消息的整体前景色（此颜色仅在未被组件覆盖时才使用）。
    icon.foreground：工作台中图标的默认颜色。
    sash.hoverBorder：可拖动窗框的悬停边框颜色。

窗口边框#

VS Code 窗口边框的主题颜色。

    window.activeBorder：活动（聚焦）窗口的边框颜色。
    window.inactiveBorder：非活动（未聚焦）窗口的边框颜色。

文字颜色#

文本文档中的颜色，例如欢迎页面。

    textBlockQuote.background：文本中块引号的背景颜色。
    textBlockQuote.border：文本中块引号的边框颜色。
    textCodeBlock.background：文本中代码块的背景颜色。
    textLink.activeForeground：单击和鼠标悬停时文本中链接的前景色。
    textLink.foreground：文本中链接的前景色。
    textPreformat.foreground：预格式化文本段的前景色。
    textSeparator.foreground：文本分隔符的颜色。

动作颜色#

一组颜色，用于控制与工作台上的操作的交互。

    toolbar.hoverBackground：使用鼠标悬停在动作上时的工具栏背景
    toolbar.hoverOutline：使用鼠标悬停在动作上时的工具栏轮廓
    toolbar.activeBackground：将鼠标悬停在动作上时的工具栏背景

按钮控制#

按钮小部件的一组颜色，例如新窗口资源管理器中的“打开文件夹”按钮。

按钮控制

    button.background：按钮背景颜色。
    button.foreground：按钮前景色。
    button.border：按钮边框颜色。
    button.hoverBackground: 悬停时的按钮背景颜色。
    button.secondaryForeground：辅助按钮前景色。
    button.secondaryBackground：辅助按钮背景颜色。
    button.secondaryHoverBackground：悬停时的辅助按钮背景颜色。
    checkbox.background：复选框小部件的背景颜色。
    checkbox.foreground：复选框小部件的前景色。
    checkbox.border：复选框小部件的边框颜色。

下拉控件#

所有下拉小部件的一组颜色，例如在集成终端或输出面板中。请注意，目前在 macOS 上未使用 Dropdown 控件。

下拉控件

    dropdown.background: 下拉背景。
    dropdown.listBackground：下拉列表背景。
    dropdown.border: 下拉边框。
    dropdown.foreground: 下拉前景。

输入控制#

输入控件的颜色，例如“搜索”视图或“查找/替换”对话框中的颜色。

输入控制

    input.background: 输入框背景。
    input.border: 输入框边框。
    input.foreground: 输入框前景。
    input.placeholderForeground：占位符文本的输入框前景色。
    inputOption.activeBackground：输入字段中已激活选项的背景颜色。
    inputOption.activeBorder：输入字段中激活选项的边框颜色。
    inputOption.activeForeground：输入字段中激活选项的前景色。
    inputValidation.errorBackground：输入错误严重性的验证背景颜色。
    inputValidation.errorForeground：输入错误严重性的验证前景色。
    inputValidation.errorBorder：输入错误严重性的验证边框颜色。
    inputValidation.infoBackground：输入信息严重性的验证背景颜色。
    inputValidation.infoForeground：输入信息严重性的验证前景色。
    inputValidation.infoBorder：输入信息严重性的验证边框颜色。
    inputValidation.warningBackground: 输入信息警告的验证背景颜色。
    inputValidation.warningForeground：输入警告严重性的验证前景色。
    inputValidation.warningBorder：输入警告严重性的验证边框颜色。

滚动条控制#

    scrollbar.shadow: 滚动条滑块阴影表示视图被滚动。
    scrollbarSlider.activeBackground：单击时滚动条滑块的背景颜色。
    scrollbarSlider.background：滚动条滑块背景颜色。
    scrollbarSlider.hoverBackground：悬停时滚动条滑块的背景颜色。

徽章#

徽章是小信息标签，例如搜索结果计数。

    badge.foreground：徽章前景色。
    badge.background：徽章背景颜色。

进度条#

    progressBar.background：为长时间运行的操作显示的进度条的背景颜色。

列表和树#

列表和树的颜色，如文件资源管理器。活动列表/树有键盘焦点，非活动没有。

    list.activeSelectionBackground：当列表/树处于活动状态时，所选项目的列表/树背景颜色。
    list.activeSelectionForeground：当列表/树处于活动状态时，所选项目的列表/树前景色。
    list.dropBackground：使用鼠标移动项目时，列表/树拖放背景。
    list.focusBackground：当列表/树处于活动状态时，焦点项目的列表/树背景颜色。
    list.focusForeground：当列表/树处于活动状态时，焦点项目的列表/树前景色。活动列表/树有键盘焦点，非活动没有。
    list.focusHighlightForeground：在列表/树中搜索时，匹配项的列表/树前景色突出显示在主动聚焦的项目上。
    list.focusOutline：当列表/树处于活动状态时，焦点项目的列表/树轮廓颜色。活动列表/树有键盘焦点，非活动没有。
    list.highlightForeground：在列表/树中搜索时，匹配项的列表/树前景色突出显示。
    list.hoverBackground：使用鼠标悬停在项目上时的列表/树背景。
    list.hoverForeground：使用鼠标悬停在项目上时的列表/树前景。
    list.inactiveSelectionBackground：当列表/树处于非活动状态时，所选项目的列表/树背景颜色。
    list.inactiveSelectionForeground：当列表/树处于非活动状态时，所选项目的列表/树前景色。活动列表/树有键盘焦点，非活动没有。
    list.inactiveFocusBackground：当列表处于非活动状态时，焦点项目的列表背景颜色。活动列表具有键盘焦点，非活动列表没有。目前仅在列表中支持。
    list.inactiveFocusOutline：当列表/树处于非活动状态时，焦点项目的列表/树轮廓颜色。活动列表/树有键盘焦点，非活动没有。
    list.invalidItemForeground：无效项目的列表/树前景色，例如资源管理器中未解析的根。
    list.errorForeground：包含错误的列表项的前景色。
    list.warningForeground：包含警告的列表项的前景色。
    listFilterWidget.background：列表/树在列表/树中搜索时过滤键入文本的背景颜色。
    listFilterWidget.outline：在列表/树中搜索时，列表/树过滤器小部件的键入文本的轮廓颜色。
    listFilterWidget.noMatchesOutline：在列表/树中搜索时找不到匹配的键入文本时，列表/树过滤器小部件的轮廓颜色。
    list.filterMatchBackground：列表和树中过滤匹配项的背景颜色。
    list.filterMatchBorder：列表和树中过滤匹配项的边框颜色。
    list.deemphasizedForeground: 列表/树前景色被弱化的项目。
    tree.indentGuidesStroke：缩进指南的树小部件的笔触颜色。
    tree.tableColumnsBorder：缩进指南的树状笔触颜色。

活动栏#

活动栏显示在工作台的最左侧或最右侧，并允许在侧栏的视图之间快速切换。

    activityBar.background：活动栏背景颜色。
    activityBar.dropBorder：拖放活动栏项目的反馈颜色。活动栏显示在最左侧或最右侧，并允许在侧栏的视图之间切换。
    activityBar.foreground：活动栏前景色（例如用于图标）。
    activityBar.inactiveForeground：活动栏项目处于非活动状态时的前景色。
    activityBar.border：活动栏边框颜色与侧栏。
    activityBarBadge.background：活动通知徽章背景颜色。
    activityBarBadge.foreground：活动通知徽章前景色。
    activityBar.activeBorder：活动栏活动指示器边框颜色。
    activityBar.activeBackground：活动栏可选的活动元素背景颜色。
    activityBar.activeFocusBorder：活动项的活动栏焦点边框颜色。

侧边栏#

侧栏包含浏览器和搜索等视图。

    sideBar.background：侧边栏背景颜色。

    sideBar.foreground：侧边栏前景色。侧边栏是资源管理器和搜索等视图的容器。

    sideBar.border：分隔编辑器一侧的侧边栏边框颜色。

    sideBar.dropBackground：拖放侧栏部分的反馈颜色。颜色应该具有透明度，以便侧栏部分仍然可以透出。

    sideBarTitle.foreground：侧边栏标题前景色。

    sideBarSectionHeader.background：侧栏部分标题背景颜色。

    sideBarSectionHeader.foreground：侧栏部分标题前景色。

    sideBarSectionHeader.border：侧栏部分标题边框颜色。

小地图#

小地图显示当前文件的缩小版本。

    minimap.findMatchHighlight：突出显示文件中搜索匹配项的颜色。

    minimap.selectionHighlight：突出显示编辑器选择的颜色。

    minimap.errorHighlight：在编辑器中突出显示错误的颜色。

    minimap.warningHighlight：在编辑器中突出显示警告的颜色。

    minimap.background：小地图背景颜色。

    minimapSlider.background：小地图滑块背景颜色。

    minimapSlider.hoverBackground：悬停时的小地图滑块背景颜色。

    minimapSlider.activeBackground：点击时小地图滑块的背景颜色。

    minimapGutter.addedBackground：添加内容的小地图装订线颜色。

    minimapGutter.modifiedBackground：修改内容的小地图装订线颜色。

    minimapGutter.deletedBackground：已删除内容的小地图装订线颜色。

编辑器组和标签#

编辑器组是编辑器的容器。可以有许多编辑器组。Tab 是编辑器的容器。可以在一个编辑器组中打开多个选项卡。

    editorGroup.border：用于将多个编辑器组彼此分开的颜色。

    editorGroup.border

    editorGroup.dropBackground：拖动编辑器时的背景颜色。

    editorGroup.dropBackground

    editorGroupHeader.noTabsBackground：禁用选项卡时编辑器组标题标题的背景颜色（设置"workbench.editor.showTabs": false）。

    editorGroupHeader.noTabsBackground

    editorGroupHeader.tabsBackground：Tabs 容器的背景颜色。

    editorGroupHeader.tabsBackground

    editorGroupHeader.tabsBorder：启用选项卡时，编辑器选项卡控件下方的边框颜色。

    editorGroupHeader.tabsBorder

    editorGroupHeader.border：编辑器组标题和编辑器之间的边框颜色（如果启用，则在面包屑下方）。

    editorGroup.emptyBackground：空编辑器组的背景颜色。

    editorGroup.focusedEmptyBorder：聚焦的空编辑器组的边框颜色。

    tab.activeBackground：活动组中的活动选项卡背景颜色。

    tab.unfocusedActiveBackground：非活动编辑器组中的活动选项卡背景颜色。

    tab.activeForeground：活动组中的活动选项卡前景色。

    tab.border：用于将标签彼此分开的边框。

    tab.activeBorder：活动选项卡的底部边框。

    tab.unfocusedActiveBorder：非活动编辑器组中活动选项卡的底部边框。

    tab.activeBorderTop：活动选项卡的顶部边框。

    tab.unfocusedActiveBorderTop：非活动编辑器组中活动选项卡的顶部边框

    tab.lastPinnedBorder：最后一个固定编辑器右侧的边框以与未固定编辑器分开。

    tab.inactiveBackground：非活动标签背景颜色。

    tab.unfocusedInactiveBackground：未聚焦组中的非活动选项卡背景颜色

    tab.inactiveForeground：活动组中的非活动选项卡前景色。

    tab.unfocusedActiveForeground：非活动编辑器组中的活动选项卡前景色。

    tab.unfocusedInactiveForeground：非活动编辑器组中的非活动选项卡前景色。

    tab.hoverBackground: 悬停时的标签背景颜色

    tab.unfocusedHoverBackground：悬停时未聚焦组中的选项卡背景颜色

    tab.hoverForeground: 悬停时标签前景色

    tab.unfocusedHoverForeground：悬停时未聚焦组中的选项卡前景色

    tab.hoverBorder：悬停时突出显示选项卡的边框

    tab.unfocusedHoverBorder：悬停时突出显示未聚焦组中的选项卡的边框

    tab.activeModifiedBorder：活动组中已修改（脏）活动选项卡顶部的边框。

    tab.inactiveModifiedBorder：活动组中已修改（脏）的非活动选项卡顶部的边框。

    tab.unfocusedActiveModifiedBorder：未聚焦组中已修改（脏）活动选项卡顶部的边框。

    tab.unfocusedInactiveModifiedBorder：未聚焦组中已修改（脏）的非活动选项卡顶部的边框。

    editorPane.background：在居中编辑器布局的左侧和右侧可见的编辑器窗格的背景颜色。

编辑器颜色#

最突出的编辑器颜色是用于语法突出显示的标记颜色，并且基于安装的语言语法。这些颜色由颜色主题定义，但也可以通过editor.tokenColorCustomizations设置进行自定义。有关更新颜色主题和可用标记类型的详细信息，请参阅自定义颜色主题。

此处列出了所有其他编辑器颜色：

    editor.background：编辑器背景颜色。
    editor.foreground: 编辑器默认前景色。
    editorLineNumber.foreground: 编辑器行号的颜色。
    editorLineNumber.activeForeground：活动编辑器行号的颜色。
    editorCursor.background: 编辑器光标的背景颜色。允许自定义与块光标重叠的字符的颜色。
    editorCursor.foreground：编辑器光标的颜色。

选择一个或多个字符时，选择颜色可见。除了选择之外，所有具有相同内容的区域也会突出显示。

选择亮点

    editor.selectionBackground：编辑器选择的颜色。
    editor.selectionForeground: 所选文本的高对比度颜色。
    editor.inactiveSelectionBackground：非活动编辑器中选择的颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editor.selectionHighlightBackground：与选择内容相同的区域的颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editor.selectionHighlightBorder：与选择内容相同的区域的边框颜色。

当光标位于符号或单词内时，单词突出显示颜色可见。根据文件类型可用的语言支持，所有匹配的引用和声明都被突出显示，并且读写访问获得不同的颜色。如果文档符号语言支持不可用，则返回到单词突出显示。

发生

    editor.wordHighlightBackground：读取访问期间符号的背景颜色，例如读取变量时。颜色不能是不透明的，以免隐藏下面的装饰。
    editor.wordHighlightBorder：读取访问期间符号的边框颜色，例如读取变量时。
    editor.wordHighlightStrongBackground：写访问期间符号的背景颜色，例如写入变量时。颜色不能是不透明的，以免隐藏下面的装饰。
    editor.wordHighlightStrongBorder：写访问期间符号的边框颜色，例如写入变量时。

查找颜色取决于“查找/替换”对话框中的当前查找字符串。

查找匹配项

    editor.findMatchBackground：当前搜索匹配的颜色。
    editor.findMatchHighlightBackground：其他搜索匹配的颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editor.findRangeHighlightBackground：为限制搜索的范围着色（在查找小部件中启用“在选择中查找”）。颜色不能是不透明的，以免隐藏下面的装饰。
    editor.findMatchBorder：当前搜索匹配的边框颜色。
    editor.findMatchHighlightBorder：其他搜索匹配的边框颜色。
    editor.findRangeHighlightBorder：边框颜色限制搜索的范围（在查找小部件中启用“在选择中查找”）。

搜索编辑器颜色突出显示搜索编辑器中的结果。这可以与其他查找匹配分开配置，以便更好地区分同一编辑器中不同类别的匹配。

搜索编辑器匹配

    searchEditor.findMatchBackground：编辑器结果的颜色。
    searchEditor.findMatchBorder：编辑器结果的边框颜色。
    searchEditor.textInputBorder: 搜索编辑器文本输入框边框。

悬停高亮显示在显示悬停的符号后面。

悬停高亮

    editor.hoverHighlightBackground：在显示悬停的单词下方突出显示。颜色不能是不透明的，以免隐藏下面的装饰。

当前行通常显示为背景突出显示或边框（不是两者）。

线条高亮

    editor.lineHighlightBackground: 光标所在行突出显示的背景色。
    editor.lineHighlightBorder: 光标位置线周围边框的背景颜色。

单击链接时，链接颜色可见。

关联

    editorLink.activeForeground：活动链接的颜色。

选择搜索结果时，范围突出显示是可见的。

范围突出显示

    editor.rangeHighlightBackground：突出显示范围的背景颜色，用于快速打开、文件中的符号和查找功能。颜色不能是不透明的，以免隐藏下面的装饰。
    editor.rangeHighlightBorder：突出显示范围周围边框的背景颜色。

通过诸如Go to Definition 之类的命令导航到符号时，符号突出显示是可见的。

    editor.symbolHighlightBackground：高亮符号的背景颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editor.symbolHighlightBorder：突出显示符号周围边框的背景颜色。

要查看编​​辑器空白，请启用Toggle Render Whitespace。

    editorWhitespace.foreground：编辑器中空白字符的颜色。

要查看编​​辑器缩进指南，请设置"editor.renderIndentGuides": true.

    editorIndentGuide.background：编辑器缩进指南的颜色。
    editorIndentGuide.activeBackground：活动编辑器缩进指南的颜色。

要查看编​​辑器标尺，请定义它们的位置 "editor.rulers"

    editorRuler.foreground：编辑器标尺的颜色。

    editor.linkedEditingBackground：编辑器处于链接编辑模式时的背景颜色。

代码镜头：

代码镜头

    editorCodeLens.foreground：编辑器 CodeLens 的前景色。

灯泡：

    editorLightBulb.foreground：用于灯泡动作图标的颜色。
    editorLightBulbAutoFix.foreground：用于灯泡自动修复操作图标的颜色。

括号匹配：

括号颜色

    editorBracketMatch.background：匹配括号后面的背景颜色。
    editorBracketMatch.border：匹配括号框的颜色。

折叠式的：

    editor.foldBackground：折叠范围的背景颜色。颜色不能是不透明的，以免隐藏下面的装饰。

概览标尺：

此标尺位于编辑器右侧边缘的滚动条下方，可概述编辑器中的装饰。

    editorOverviewRuler.background：编辑器概览标尺的背景颜色。仅在启用小地图并放置在编辑器右侧时使用。
    editorOverviewRuler.border：概览标尺边框的颜色。
    editorOverviewRuler.findMatchForeground：查找匹配的概览标尺标记颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editorOverviewRuler.rangeHighlightForeground：概述突出显示范围的标尺标记颜色，例如快速打开、文件中的符号和查找功能。颜色不能是不透明的，以免隐藏下面的装饰。
    editorOverviewRuler.selectionHighlightForeground：概览标尺标记颜色，用于选择高亮显示。颜色不能是不透明的，以免隐藏下面的装饰。
    editorOverviewRuler.wordHighlightForeground：符号高亮的概览标尺标记颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editorOverviewRuler.wordHighlightStrongForeground：用于写访问符号突出显示的概述标尺标记颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editorOverviewRuler.modifiedForeground：修改内容的概览标尺标记颜色。
    editorOverviewRuler.addedForeground：添加内容的概览标尺标记颜色。
    editorOverviewRuler.deletedForeground：已删除内容的概览标尺标记颜色。
    editorOverviewRuler.errorForeground：概述错误的标尺标记颜色。
    editorOverviewRuler.warningForeground：警告的概述标尺标记颜色。
    editorOverviewRuler.infoForeground：概述信息的标尺标记颜色。
    editorOverviewRuler.bracketMatchForeground：用于匹配括号的概述标尺标记颜色。

错误和警告：

    editorError.foreground：编辑器中错误曲线的前景色。
    editorError.border：编辑器中错误框的边框颜色。
    editorError.background：编辑器中错误文本的背景颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editorWarning.foreground：编辑器中警告波浪线的前景色。
    editorWarning.border：编辑器中警告框的边框颜色。
    editorWarning.background：编辑器中警告文本的背景颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editorInfo.foreground：信息的前景色在编辑器中呈波浪线状。
    editorInfo.border：编辑器中信息框的边框颜色。
    editorInfo.background：编辑器中信息文本的背景颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    editorHint.foreground：编辑器中提示的前景色。
    editorHint.border：编辑器中提示框的边框颜色。
    problemsErrorIcon.foreground：用于问题错误图标的颜色。
    problemsWarningIcon.foreground：用于问题警告图标的颜色。
    problemsInfoIcon.foreground：用于问题信息图标的颜色。

未使用的源代码：

    editorUnnecessaryCode.border：编辑器中不必要（未使用）源代码的边框颜色。
    editorUnnecessaryCode.opacity：编辑器中不必要（未使用）源代码的不透明度。例如，"#000000c0"将以 75% 的不透明度呈现代码。对于高对比度主题，请使用"editorUnnecessaryCode.border"主题颜色为不必要的代码加下划线，而不是将其淡出。

装订线包含字形边距和行号：

    editorGutter.background：编辑器装订线的背景颜色。装订线包含字形边距和行号。
    editorGutter.modifiedBackground：已修改行的编辑器装订线背景颜色。
    editorGutter.addedBackground：添加的行的编辑器装订线背景颜色。
    editorGutter.deletedBackground：已删除行的编辑器装订线背景颜色。
    editorGutter.commentRangeForeground：评论范围的编辑器装订线装饰颜色。
    editorGutter.foldingControlForeground：编辑器装订线中折叠控件的颜色。

Diff 编辑器颜色#

对于插入和删除的文本着色，请使用背景或边框颜色，但不要同时使用两者。

    diffEditor.insertedTextBackground：插入的文本的背景颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    diffEditor.insertedTextBorder：插入的文本的轮廓颜色。
    diffEditor.removedTextBackground：被删除的文本的背景颜色。颜色不能是不透明的，以免隐藏下面的装饰。
    diffEditor.removedTextBorder：已删除文本的轮廓颜色。
    diffEditor.border：两个文本编辑器之间的边框颜色。
    diffEditor.diagonalFill：差异编辑器对角线填充的颜色。对角线填充用于并排差异视图。

编辑器小部件颜色#

编辑器小部件显示在编辑器内容的前面。例如查找/替换对话框、建议小部件和编辑器悬停。

    editorWidget.foreground：编辑器小部件的前景色，例如查找/替换。

    editorWidget.background：编辑器小部件的背景颜色，例如查找/替换。

    editorWidget.border：编辑器小部件的边框颜色，除非小部件不包含边框或定义自己的边框颜色。

    editorWidget.resizeBorder：编辑器小部件调整大小栏的边框颜色。仅当小部件选择具有调整大小的边框并且颜色未被小部件覆盖时才使用该颜色。

    editorSuggestWidget.background：建议小部件的背景颜色。

    editorSuggestWidget.border：建议小部件的边框颜色。

    editorSuggestWidget.foreground：建议小部件的前景色。

    editorSuggestWidget.focusHighlightForeground：当一个项目被聚焦时，匹配的颜色在建议小部件中突出显示。

    editorSuggestWidget.highlightForeground：匹配的颜色在建议小部件中突出显示。

    editorSuggestWidget.selectedBackground：建议小部件中所选条目的背景颜色。

    editorSuggestWidget.selectedForeground：建议小部件中所选条目的前景色。

    editorHoverWidget.foreground：编辑器悬停的前景色。

    editorHoverWidget.background：编辑器悬停的背景颜色。

    editorHoverWidget.border：编辑器悬停的边框颜色。

    editorHoverWidget.statusBarBackground：编辑器悬停状态栏的背景颜色。

    editorGhostText.border：内联完成提供程序和建议预览显示的幻影文本的边框颜色。

    editorGhostText.foreground：内联完成提供程序和建议预览显示的幻影文本的前景色。

调试异常小部件是一个预览视图，当调试在异常处停止时显示在编辑器中。

    debugExceptionWidget.background：异常小部件背景颜色。
    debugExceptionWidget.border：异常小部件边框颜色。

当导航到编辑器中的错误和警告（转到下一个错误或警告命令）时，将显示编辑器标记视图。

    editorMarkerNavigation.background：编辑器标记导航小部件背景。
    editorMarkerNavigationError.background：编辑器标记导航小部件错误颜色。
    editorMarkerNavigationWarning.background：编辑器标记导航小部件警告颜色。
    editorMarkerNavigationInfo.background：编辑器标记导航小部件信息颜色。

透视视图颜色#

Peek 视图用于将引用和声明显示为编辑器内的视图。

窥视

    peekView.border：透视图边框和箭头的颜色。
    peekViewEditor.background：查看视图编辑器的背景颜色。
    peekViewEditorGutter.background：透视视图编辑器中装订线的背景颜色。
    peekViewEditor.matchHighlightBackground：在预览视图编辑器中匹配高亮颜色。
    peekViewEditor.matchHighlightBorder：在预览视图编辑器中匹配高亮边框颜色。
    peekViewResult.background：预览视图结果列表的背景颜色。
    peekViewResult.fileForeground: 预览视图结果列表中文件节点的前景色。
    peekViewResult.lineForeground: 透视视图结果列表中线节点的前景色。
    peekViewResult.matchHighlightBackground：匹配预览视图结果列表中的高亮颜色。
    peekViewResult.selectionBackground：预览视图结果列表中所选条目的背景颜色。
    peekViewResult.selectionForeground：预览视图结果列表中所选条目的前景色。
    peekViewTitle.background：预览视图标题区域的背景颜色。
    peekViewTitleDescription.foreground：查看视图标题信息的颜色。
    peekViewTitleLabel.foreground：预览视图标题的颜色。

合并冲突颜色#

当编辑器包含特殊的差异范围时，会显示合并冲突装饰。

合并范围

    merge.currentHeaderBackground：内联合并冲突中的当前标题背景。颜色不能是不透明的，以免隐藏下面的装饰。
    merge.currentContentBackground：内联合并冲突中的当前内容背景。颜色不能是不透明的，以免隐藏下面的装饰。
    merge.incomingHeaderBackground: 内联合并冲突中的传入标题背景。颜色不能是不透明的，以免隐藏下面的装饰。
    merge.incomingContentBackground：内联合并冲突中的传入内容背景。颜色不能是不透明的，以免隐藏下面的装饰。
    merge.border：标题上的边框颜色和内联合并冲突中的拆分器。
    merge.commonContentBackground：内联合并冲突中的共同祖先内容背景。颜色不能是不透明的，以免隐藏下面的装饰。
    merge.commonHeaderBackground：内联合并冲突中的共同祖先标题背景。颜色不能是不透明的，以免隐藏下面的装饰。
    editorOverviewRuler.currentContentForeground：内联合并冲突的当前概览标尺前景。
    editorOverviewRuler.incomingContentForeground：内联合并冲突的传入概览标尺前景。
    editorOverviewRuler.commonContentForeground：内联合并冲突的共同祖先概览标尺前景。

面板颜色#

面板显示在编辑器区域下方，包含输出和集成终端等视图。

    panel.background：面板背景颜色。
    panel.border：面板边框颜色以将面板与编辑器分开。
    panel.dropBorder：拖放面板标题的反馈颜色。面板显示在编辑器区域下方，包含输出和集成终端等视图。
    panelTitle.activeBorder：活动面板标题的边框颜色。
    panelTitle.activeForeground：活动面板的标题颜色。
    panelTitle.inactiveForeground：非活动面板的标题颜色。
    panelInput.border：面板中输入的输入框边框。
    panelSection.border：当面板中水平堆叠多个视图时使用的面板部分边框颜色。面板显示在编辑器区域下方，包含输出和集成终端等视图。
    panelSection.dropBackground：拖放面板部分的反馈颜色。颜色应该具有透明度，以便面板部分仍然可以透光。面板显示在编辑器区域下方，包含输出和集成终端等视图。
    panelSectionHeader.background：面板部分标题背景颜色。面板显示在编辑器区域下方，包含输出和集成终端等视图。
    panelSectionHeader.foreground：面板部分标题前景色。面板显示在编辑器区域下方，包含输出和集成终端等视图。
    panelSectionHeader.border：当多个视图在面板中垂直堆叠时使用的面板部分标题边框颜色。面板显示在编辑器区域下方，包含输出和集成终端等视图。

状态栏颜色#

状态栏显示在工作台的底部。

    statusBar.background：标准状态栏背景颜色。
    statusBar.foreground：状态栏前景色。
    statusBar.border：状态栏边框颜色分隔状态栏和编辑器。
    statusBar.debuggingBackground: 调试程序时的状态栏背景颜色。
    statusBar.debuggingForeground: 调试程序时的状态栏前景色。
    statusBar.debuggingBorder：在调试程序时，状态栏边框颜色将状态栏和编辑器分开。
    statusBar.noFolderForeground：未打开文件夹时的状态栏前景色。
    statusBar.noFolderBackground：未打开文件夹时的状态栏背景颜色。
    statusBar.noFolderBorder：当没有打开文件夹时，状态栏边框颜色将状态栏和编辑器分开。
    statusBarItem.activeBackground: 单击时状态栏项目的背景颜色。
    statusBarItem.hoverBackground：悬停时的状态栏项目背景颜色。
    statusBarItem.prominentForeground：状态栏突出项目的前景色。
    statusBarItem.prominentBackground：状态栏突出项目的背景颜色。
    statusBarItem.prominentHoverBackground：悬停时状态栏突出项目的背景颜色。
    statusBarItem.remoteBackground：状态栏上远程指示器的背景颜色。
    statusBarItem.remoteForeground：状态栏上远程指示器的前景色。
    statusBarItem.errorBackground：状态栏错误项背景颜色。错误项目从其他状态栏条目中脱颖而出以指示错误情况。
    statusBarItem.errorForeground：状态栏错误项目前景色。错误项目从其他状态栏条目中脱颖而出以指示错误情况。

突出的项目从其他状态栏条目中脱颖而出以表明重要性。一个例子是Toggle Tab Key Moves Focus命令改变模式指示器。
标题栏颜色#

    titleBar.activeBackground：窗口处于活动状态时的标题栏背景。
    titleBar.activeForeground：当窗口处于活动状态时标题栏前景。
    titleBar.inactiveBackground: 窗口处于非活动状态时的标题栏背景。
    titleBar.inactiveForeground：当窗口处于非活动状态时标题栏前景。
    titleBar.border：标题栏边框颜色。

菜单栏颜色#

    menubar.selectionForeground：菜单栏中所选菜单项的前景色。
    menubar.selectionBackground：菜单栏中所选菜单项的背景颜色。
    menubar.selectionBorder：菜单栏中所选菜单项的边框颜色。
    menu.foreground：菜单项的前景色。
    menu.background：菜单项的背景颜色。
    menu.selectionForeground：菜单中所选菜单项的前景色。
    menu.selectionBackground：菜单中所选菜单项的背景颜色。
    menu.selectionBorder：菜单中所选菜单项的边框颜色。
    menu.separatorBackground：菜单中分隔符菜单项的颜色。
    menu.border：菜单的边框颜色。

通知颜色#

通知 Toast 从工作台的右下角向上滑动。

通知吐司

在通知中心打开后，它们会显示在带有标题的列表中：

通知中心

    notificationCenter.border：通知中心边框颜色。
    notificationCenterHeader.foreground：通知中心标题前景色。
    notificationCenterHeader.background：通知中心标题背景颜色。
    notificationToast.border：通知吐司边框颜色。
    notifications.foreground：通知前景色。
    notifications.background：通知背景颜色。
    notifications.border：通知边框颜色与通知中心中的其他通知分开。
    notificationLink.foreground：通知链接前景色。
    notificationsErrorIcon.foreground：用于通知错误图标的颜色。
    notificationsWarningIcon.foreground：用于通知警告图标的颜色。
    notificationsInfoIcon.foreground：用于通知信息图标的颜色。

横幅颜色#

横幅出现在标题栏下方并在可见时跨越工作台的整个宽度。

    banner.background：横幅背景颜色。
    banner.foreground：横幅前景色。
    banner.iconForeground：横幅文本前面图标的颜色。

扩展颜色#

    extensionButton.prominentForeground：扩展视图按钮前景色（例如安装按钮）。
    extensionButton.prominentBackground：扩展视图按钮背景颜色。
    extensionButton.prominentHoverBackground：扩展视图按钮背景悬停颜色。
    extensionBadge.remoteBackground：扩展视图中远程徽章的背景颜色。
    extensionBadge.remoteForeground：扩展视图中远程徽章的前景色。
    extensionIcon.starForeground：扩展评级的图标颜色。

快速选择器颜色#

    pickerGroup.border：用于分组边框的快速选择器（快速打开）颜色。
    pickerGroup.foreground：用于分组标签的快速选择器（快速打开）颜色。
    quickInput.background：快速输入背景颜色。快速输入小部件是颜色主题选择器等视图的容器。
    quickInput.foreground：快速输入前景色。快速输入小部件是颜色主题选择器等视图的容器。
    quickInputList.focusBackground：聚焦项目的快速选择器背景颜色。
    quickInputList.focusForeground：聚焦项目的快速选择器前景色。
    quickInputTitle.background：快速选择器标题背景颜色。快速选择器小部件是命令面板等选择器的容器。

键绑定标签颜色#

当存在与命令关联的键绑定时，会显示键绑定标签。可以在命令面板中看到键绑定标签的示例： 按键绑定标签

按键绑定标签的用途包括（但不限于）：

    命令调色板
    键盘快捷键编辑器
    键盘快捷键记录器模式
    扩展程序市场页面的“功能贡献”部分

以下自定义可用：

    keybindingLabel.background：键绑定标签背景颜色。键绑定标签用于表示键盘快捷键。
    keybindingLabel.foreground：键绑定标签前景色。键绑定标签用于表示键盘快捷键。
    keybindingLabel.border：键绑定标签边框颜色。键绑定标签用于表示键盘快捷键。
    keybindingLabel.bottomBorder：键绑定标签边框底部颜色。键绑定标签用于表示键盘快捷键。

集成终端颜色#

    terminal.background：综合终端视口的背景。
    terminal.border：在终端内分隔拆分窗格的边框颜色。这默认为 panel.border。
    terminal.foreground：集成终端的默认前景色。
    terminal.ansiBlack：终端中的“黑色”ANSI 颜色。
    terminal.ansiBlue：终端中的“蓝色”ANSI 颜色。
    terminal.ansiBrightBlack: 'BrightBlack' 终端中的 ANSI 颜色。
    terminal.ansiBrightBlue: 'BrightBlue' 终端中的 ANSI 颜色。
    terminal.ansiBrightCyan: 'BrightCyan' 终端中的 ANSI 颜色。
    terminal.ansiBrightGreen：终端中的“BrightGreen”ANSI 颜色。
    terminal.ansiBrightMagenta: 'BrightMagenta' 终端中的 ANSI 颜色。
    terminal.ansiBrightRed: 'BrightRed' 终端中的 ANSI 颜色。
    terminal.ansiBrightWhite: 'BrightWhite' 终端中的 ANSI 颜色。
    terminal.ansiBrightYellow: 'BrightYellow' 终端中的 ANSI 颜色。
    terminal.ansiCyan：终端中的“青色”ANSI 颜色。
    terminal.ansiGreen：终端中的“绿色”ANSI 颜色。
    terminal.ansiMagenta: 'Magenta' 终端中的 ANSI 颜色。
    terminal.ansiRed：终端中的“红色”ANSI 颜色。
    terminal.ansiWhite：终端中的“白色”ANSI 颜色。
    terminal.ansiYellow：终端中的“黄色”ANSI 颜色。
    terminal.selectionBackground：终端的选择背景色。
    terminalCursor.background：终端光标的背景色。允许自定义与块光标重叠的字符的颜色。
    terminalCursor.foreground：终端光标的前景色。
    terminal.dropBackground: 在终端上拖动时的背景颜色。颜色应该具有透明度，以便终端内容仍然可以透出。

调试颜色#

    debugToolBar.background: 调试工具栏背景颜色。
    debugToolBar.border: 调试工具栏边框颜色。
    editor.stackFrameHighlightBackground：编辑器中顶部堆栈帧高亮的背景颜色。
    editor.focusedStackFrameHighlightBackground：编辑器中聚焦堆栈帧高亮的背景颜色。
    editor.inlineValuesForeground：调试内联值文本的颜色。
    editor.inlineValuesBackground：调试内联值背景的颜色。
    debugView.exceptionLabelForeground：当调试器因异常而中断时，CALL STACK 视图中显示的标签的前景色
    debugView.exceptionLabelBackground：当调试器因异常而中断时，CALL STACK 视图中显示的标签的背景颜色
    debugView.stateLabelForeground：显示当前会话或线程状态的 CALL STACK 视图中标签的前景色
    debugView.stateLabelBackground：显示当前会话或线程状态的 CALL STACK 视图中标签的背景颜色
    debugView.valueChangedHighlight：用于在调试视图中突出显示值更改的颜色（即在变量视图中）
    debugTokenExpression.name：在调试视图（即变量或观察视图）中显示的令牌名称的前景色
    debugTokenExpression.value：调试视图中显示的令牌值的前景色
    debugTokenExpression.string: 调试视图中字符串的前景色
    debugTokenExpression.boolean：调试视图中布尔值的前景色
    debugTokenExpression.number: 调试视图中数字的前景色
    debugTokenExpression.error: 调试视图中表达式错误的前景色

测试视图颜色#

    testing.iconFailed：测试资源管理器中“失败”图标的颜色。
    testing.iconErrored：测试资源管理器中“错误”图标的颜色。
    testing.iconPassed：测试资源管理器中“通过”图标的颜色。
    testing.runAction：编辑器中“运行”图标的颜色。
    testing.iconQueued：测试资源管理器中“排队”图标的颜色。
    testing.iconUnset：测试资源管理器中“未设置”图标的颜色。
    testing.iconSkipped：测试资源管理器中“跳过”图标的颜色。
    testing.peekBorder：透视图边框和箭头的颜色。
    testing.message.error.decorationForeground：在编辑器中内嵌显示的测试错误消息的文本颜色。
    testing.message.error.lineBackground：编辑器中内嵌显示的错误消息旁边的边距颜色。
    testing.message.warning.decorationForeground：在编辑器中内嵌显示的测试警告消息的文本颜色。
    testing.message.warning.lineBackground：编辑器中内嵌显示的警告消息旁边的边距颜色。
    testing.message.info.decorationForeground：在编辑器中内联显示的测试信息消息的文本颜色。
    testing.message.info.lineBackground：在编辑器中内联显示的信息消息旁边的边距颜色。
    testing.message.hint.decorationForeground：在编辑器中内联显示的测试提示消息的文本颜色。
    testing.message.hint.lineBackground：编辑器中内联显示的提示消息旁边的边距颜色。

欢迎页面颜色#

    welcomePage.background：欢迎页面的背景颜色。

    welcomePage.buttonBackground：欢迎页面上按钮的背景颜色。

    welcomePage.buttonHoverBackground：将“欢迎”页面上的按钮悬停在背景颜色上。

    welcomePage.progress.background：欢迎页面进度条的前景色。

    welcomePage.progress.foreground：欢迎页面进度条的背景颜色。

    welcomePage.tileBackground：“入门”页面上磁贴的背景颜色。

    welcomePage.tileHoverBackground：将鼠标悬停在“入门”上的图块的背景颜色。

    welcomePage.tileShadow.：欢迎页面演练类别按钮的阴影颜色。

    walkThrough.embeddedEditorBackground：交互式游乐场上嵌入式编辑器的背景颜色。

源代码控制颜色#

    scm.providerBorder: SCM Provider 分隔符边框。

Git颜色#

    gitDecoration.addedResourceForeground：添加的 Git 资源的颜色。用于文件标签和 SCM 视图。
    gitDecoration.modifiedResourceForeground：修改后的 Git 资源的颜色。用于文件标签和 SCM 视图。
    gitDecoration.deletedResourceForeground：已删除 Git 资源的颜色。用于文件标签和 SCM 视图。
    gitDecoration.renamedResourceForeground：重命名或复制的 Git 资源的颜色。用于文件标签和 SCM 视图。
    gitDecoration.stageModifiedResourceForeground：用于分阶段修改 git 装饰的颜色。用于文件标签和 SCM 视图。
    gitDecoration.stageDeletedResourceForeground：用于分阶段删除 git 装饰的颜色。用于文件标签和 SCM 视图。
    gitDecoration.untrackedResourceForeground：未跟踪的 Git 资源的颜色。用于文件标签和 SCM 视图。
    gitDecoration.ignoredResourceForeground：忽略的 Git 资源的颜色。用于文件标签和 SCM 视图。
    gitDecoration.conflictingResourceForeground：冲突 Git 资源的颜色。用于文件标签和 SCM 视图。
    gitDecoration.submoduleResourceForeground：子模块资源的颜色。

设置编辑器颜色#

注意：这些颜色用于可以使用Preferences: Open Settings (UI)命令打开的 GUI 设置编辑器。

    settings.headerForeground：节标题或活动标题的前景色。
    settings.modifiedItemIndicator：表示修改设置的行。
    settings.dropdownBackground: 下拉背景。
    settings.dropdownForeground: 下拉前景。
    settings.dropdownBorder: 下拉边框。
    settings.dropdownListBorder：下拉列表边框。
    settings.checkboxBackground: 复选框背景。
    settings.checkboxForeground：复选框前景。
    settings.checkboxBorder: 复选框边框。
    settings.textInputBackground: 文本输入框背景。
    settings.textInputForeground：文本输入框前景。
    settings.textInputBorder: 文本输入框边框。
    settings.numberInputBackground: 数字输入框背景。
    settings.numberInputForeground：数字输入框前景。
    settings.numberInputBorder: 数字输入框边框。
    settings.focusedRowBackground：聚焦设置行的背景颜色。
    notebook.focusedRowBorder：焦点设置行的边框。
    notebook.rowHoverBackground：悬停设置行的边框颜色。

面包屑颜色#

面包屑导航的主题颜色：

    breadcrumb.foreground：面包屑项目的颜色。
    breadcrumb.background：面包屑项目的背景颜色。
    breadcrumb.focusForeground：聚焦面包屑项目的颜色。
    breadcrumb.activeSelectionForeground：所选面包屑项目的颜色。
    breadcrumbPicker.background：面包屑项目选择器的背景颜色。

片段颜色#

片段的主题颜色：

    editor.snippetTabstopHighlightBackground：突出显示片段制表符的背景颜色。
    editor.snippetTabstopHighlightBorder：突出显示片段制表位的边框颜色。
    editor.snippetFinalTabstopHighlightBackground：突出显示片段最后一个制表符的背景颜色。
    editor.snippetFinalTabstopHighlightBorder：突出显示片段最后一个制表符的边框颜色。

符号图标颜色#

出现在大纲视图、面包屑导航和建议小部件中的符号图标的主题颜色：

    symbolIcon.arrayForeground：数组符号的前景色。
    symbolIcon.booleanForeground：布尔符号的前景色。
    symbolIcon.classForeground：类符号的前景色。
    symbolIcon.colorForeground：颜色符号的前景色。
    symbolIcon.constantForeground：常量符号的前景色。
    symbolIcon.constructorForeground：构造函数符号的前景色。
    symbolIcon.enumeratorForeground：枚举器符号的前景色。
    symbolIcon.enumeratorMemberForeground：枚举成员符号的前景色。
    symbolIcon.eventForeground：事件符号的前景色。
    symbolIcon.fieldForeground：字段符号的前景色。
    symbolIcon.fileForeground：文件符号的前景色。
    symbolIcon.folderForeground：文件夹符号的前景色。
    symbolIcon.functionForeground：功能符号的前景色。
    symbolIcon.interfaceForeground：界面符号的前景色。
    symbolIcon.keyForeground：关键符号的前景色。
    symbolIcon.keywordForeground：关键字符号的前景色。
    symbolIcon.methodForeground：方法符号的前景色。
    symbolIcon.moduleForeground：模块符号的前景色。
    symbolIcon.namespaceForeground：命名空间符号的前景色。
    symbolIcon.nullForeground：空符号的前景色。
    symbolIcon.numberForeground：数字符号的前景色。
    symbolIcon.objectForeground：对象符号的前景色。
    symbolIcon.operatorForeground：运算符符号的前景色。
    symbolIcon.packageForeground：包装符号的前景色。
    symbolIcon.propertyForeground：属性符号的前景色。
    symbolIcon.referenceForeground：参考符号的前景色。
    symbolIcon.snippetForeground：片段符号的前景色。
    symbolIcon.stringForeground：字符串符号的前景色。
    symbolIcon.structForeground：结构符号的前景色。
    symbolIcon.textForeground：文本符号的前景色。
    symbolIcon.typeParameterForeground：类型参数符号的前景色。
    symbolIcon.unitForeground：单位符号的前景色。
    symbolIcon.variableForeground：变量符号的前景色。

调试图标颜色#

    debugIcon.breakpointForeground：断点的图标颜色。

    debugIcon.breakpointDisabledForeground：禁用断点的图标颜色。

    debugIcon.breakpointUnverifiedForeground：未验证断点的图标颜色。

    debugIcon.breakpointCurrentStackframeForeground：当前断点堆栈帧的图标颜色。

    debugIcon.breakpointStackframeForeground：所有断点堆栈帧的图标颜色。

    debugIcon.startForeground：用于开始调试的调试工具栏图标。

    debugIcon.pauseForeground：用于暂停的调试工具栏图标。

    debugIcon.stopForeground：用于停止的调试工具栏图标。

    debugIcon.disconnectForeground：用于断开连接的调试工具栏图标。

    debugIcon.restartForeground：用于重新启动的调试工具栏图标。

    debugIcon.stepOverForeground：用于单步调试的调试工具栏图标。

    debugIcon.stepIntoForeground：用于单步调试的调试工具栏图标。

    debugIcon.stepOutForeground：用于单步调试的调试工具栏图标。

    debugIcon.continueForeground：用于继续的调试工具栏图标。

    debugIcon.stepBackForeground：用于后退的调试工具栏图标。

    debugConsole.infoForeground：调试 REPL 控制台中信息消息的前景色。

    debugConsole.warningForeground：调试 REPL 控制台中警告消息的前景色。

    debugConsole.errorForeground：调试 REPL 控制台中错误消息的前景色。

    debugConsole.sourceForeground：调试 REPL 控制台中源文件名的前景色。

    debugConsoleInputIcon.foreground：调试控制台输入标记图标的前景色。

笔记本颜色#

    notebook.cellBorderColor：笔记本单元格的边框颜色。
    notebook.cellHoverBackground：单元格悬停时单元格的背景颜色。
    notebook.cellInsertionIndicator：笔记本电池插入指示灯的颜色。
    notebook.cellStatusBarItemHoverBackground：笔记本单元格状态栏项目的背景颜色。
    notebook.cellToolbarSeparator：单元格底部工具栏中分隔符的颜色
    notebook.cellEditorBackground：笔记本单元格编辑器背景的颜色
    notebook.focusedCellBackground：单元格聚焦时单元格的背景颜色。
    notebook.focusedCellBorder：单元格聚焦时单元格上下边框的颜色。
    notebook.focusedCellShadow：单元格聚焦时单元格阴影的颜色。
    notebook.focusedEditorBorder：笔记本单元格编辑器边框的颜色。
    notebook.focusedRowBorder：当行被聚焦时行的顶部和底部边框的颜色。
    notebook.inactiveFocusedCellBorder：当主焦点在编辑器之外时单元格获得焦点时单元格顶部和底部边框的颜色。
    notebook.inactiveSelectedCellBorder：选择多个单元格时单元格边框的颜色。
    notebook.outputContainerBackgroundColor：笔记本输出容器背景的颜色。
    notebook.rowHoverBackground：悬停时设置行的背景颜色。
    notebook.selectedCellBackground：选中单元格时单元格的背景颜色。
    notebook.selectedCellBorder: 单元格被选中但未聚焦时单元格上下边框的颜色。
    notebook.symbolHighlightBackground：突出显示单元格的背景颜色
    notebookScrollbarSlider.activeBackground：单击时笔记本滚动条滑块的背景颜色。
    notebookScrollbarSlider.background：笔记本滚动条滑块背景颜色。
    notebookScrollbarSlider.hoverBackground：悬停时笔记本滚动条滑块的背景颜色。
    notebookStatusErrorIcon.foreground：单元格状态栏中笔记本单元格的错误图标颜色。
    notebookStatusRunningIcon.foreground：单元格状态栏中笔记本单元格的运行图标颜色。
    notebookStatusSuccessIcon.foreground：单元格状态栏中笔记本单元格的成功图标颜色。

图表颜色#

    charts.foreground：图表中文本的对比色。
    charts.lines：图表中线条的颜色。
    charts.red：图表中红色元素的颜色。
    charts.blue：图表中蓝色元素的颜色。
    charts.yellow：图表中黄色元素的颜色。
    charts.orange：图表中橙色元素的颜色。
    charts.green：图表中绿色元素的颜色。
    charts.purple：图表中紫色元素的颜色。

测试颜色#

    testing.iconFailed：测试资源管理器中“失败”图标的颜色。
    testing.iconErrored：测试资源管理器中“错误”图标的颜色。
    testing.iconPassed：测试资源管理器中“通过”图标的颜色。
    testing.runAction：编辑器中“运行”图标的颜色。
    testing.iconQueued：测试资源管理器中“排队”图标的颜色。
    testing.iconUnset：测试资源管理器中“未设置”图标的颜色。
    testing.iconSkipped：测试资源管理器中“跳过”图标的颜色。
    testing.peekBorder：透视图边框和箭头的颜色。
    testing.message.error.decorationForeground：在编辑器中内嵌显示的测试错误消息的文本颜色。
    testing.message.error.lineBackground：编辑器中内嵌显示的错误消息旁边的边距颜色。
    testing.message.warning.decorationForeground：在编辑器中内嵌显示的测试警告消息的文本颜色。
    testing.message.warning.lineBackground：编辑器中内嵌显示的警告消息旁边的边距颜色。
    testing.message.info.decorationForeground：在编辑器中内联显示的测试信息消息的文本颜色。
    testing.message.info.lineBackground：在编辑器中内联显示的信息消息旁边的边距颜色。
    testing.message.hint.decorationForeground：在编辑器中内联显示的测试提示消息的文本颜色。
    testing.message.hint.lineBackground：编辑器中内联显示的提示消息旁边的边距颜色。

端口颜色#

    ports.iconRunningProcessForeground：具有关联正在运行的进程的端口的图标颜色。

扩展颜色#

颜色 ID 也可以通过颜色贡献点由扩展提供。在workbench.colorCustomizations设置和颜色主题定义文件中使用完整代码时，也会出现这些颜色。用户可以在扩展贡献选项卡中查看扩展定义的颜色。