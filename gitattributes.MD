# Git的gitattributes文件详解

.gitattributes 是一个文本文件，文件中的一行定义一个路径的若干个属性，主要用于定义每种文件的属性，以方便 git 帮我们统一管理

# .gitattributes 文件格式如下

    要匹配的文件模式 属性1 属性2 ...

# 在.gitattributes文件的一行中，一个属性（以text属性为例）可能有4种状态：

    设置text
    不设置-text
    设置值text=string
    未声明，通常不出现该属性即可；但是为了覆盖其他文件中的声明，也可以!text

# gitattributes文件示例：

    *               text=auto
    *.txt		text
    *.jpg		-text
    *.vcproj	text eol=crlf
    *.sh		text eol=lf
    *.py		eol=lf

说明：

    第1行，对任何文件，设置text=auto，表示文件的行尾自动转换。如果是文本文件，则在文件入Git库时，行尾自动转换为LF。如果已经在入Git库中的文件的行尾为CRLF，则该文件在入Git库时，不再转换为LF。

    第2行，对于txt文件，标记为文本文件，并进行行尾规范化。

    第3行，对于jpg文件，标记为非文本文件，不进行任何的行尾转换。

    第4行，对于vcproj文件，标记为文本文件，在文件入Git库时进行规范化，即行尾为LF。但是在检出到工作目录时，行尾自动转换为CRLF。

    第5行，对于sh文件，标记为文本文件，在文件入Git库时进行规范化，即行尾为LF。在检出到工作目录时，行尾也不会转换为CRLF（即保持LF）。

    第6行，对于py文件，只针对工作目录中的文件，行尾为LF。

# . gitattributes文件中可以定义的属性：

    text，控制行尾的规范性。

如果一个文本文件是规范的，则Git库中该文件的行尾总是LF。

对于工作目录，除了text属性之外，还可以设置eol属性，或core.eol配置变量。

    eol，设置行末字符
        eol=lf，入库时将行尾规范为LF，检出时禁止将行尾转换为CRLF
        eol=crlf，入库时将行尾规范为CRLF，检出时将行尾转换为CRLF
    crlf，已过时，类似于text
    ident，为路径设置ident属性，路径中的blob对象中的$Id$将会被替换为$Id:char_40_hexadecimal_name
    filter
    CRLF 和 LF都是用来表示文本换行的方式。CR代表回车，对应字符 \r。LF 表示换行，对应字符 \n。不同操作系统文本使用的换行符各不相同。Windows系统使用的是 CRLF，Unix系统（包括Linux，MacOS近些年的版本）使用的是 LF.为了使得不同系统环境的开发者能开发同一个git项目，便出现了这个

利用命令clean,smudge

    diff
    merge，与merge.default配置变量一起确定如何合并文件

在执行git merge, git revert和git cherry-pick时，如何考虑文件的版本
Git内置的merge驱动：

        merge=text
        merge=binary
        merge=union
    whitespace，对应core.whitespace配置变量

在执行git diff, git apply时是否考虑空格。

    export-ignore,export-subst，打包相关的属性
    delta，即Delta压缩

对于delta=false的路径中的blob对象，不会进行Delta压缩

    encoding，为GUI工具（如gitk, git-gui）设置字符编码，以正确显示匹配的文件内容

如果该属性未设置，或设置了无效值，则GUI工具会使用配置变量gui.encoding的值。 

# .gitattributes生效顺序

在一个Git库中可以有多个.gitattributes 文件，不同.gitattributes 文件中，属性设置的优先级(从高到低)如下：

    /myproj/info/attributes 文件
    /myproj/my_path/.gitattributes 文件
    /myproj/.gitattributes 文件
    同一个.gitattributes 文件中，遵循覆盖原则，即后面的行会覆盖前面的设置，如果一个文件的某个属性被多次设置，则后设置的优先，类似 int a = 1; a = 2; 最终结果 a == 2

# 使用

为新的Git库设置统一的.gitattributes文件：

    在仓库的根目录下创建名为 .gitattributes 的文件。

    touch .gitattributes
    vi .gitattributes

    编辑这个文件并输入希望的设置，demo 如下：

    *.sh text eol=lf

    把该文件提交并推送到服务器上。

    git add .
    git commit -m "add.gitattributes"
    git push

为已有Git库设置统一的.gitattributes文件（重置 GitAttributes）：

在上一步的基础上（确保仓库根目录下已经存在.gitattributes文件）

    git rm --cached -r
    git reset --hard

上面的命令就会根据文件 .gitattributes 中的定义，更新文件的结尾行。

任何变更都会自动使用指定文件的文件结尾行格式。

下一步，可以通知团队成员或者协作者去执行 Git 属性重置的命令即可。
为所有Git库设置统一的.gitattributes文件：

    git config --get core.attributesFile
    git config --global --get core.attributesFile


