# SED 命令

sed是一个很好的文件处理工具，本身是一个管道命令，主要是以行为单位进行处理，可以将数据行进行替换、删

除、新增、选取等特定工作

# 命令格式为

    `sed [-nefri] ‘command’ 文本名称`

1. 参数：

    a    在当前行后面加入一行文本

    b lable    分支到脚本中带有标记的地方，如果分支不存在则分支到脚本的末尾

    c    用新的文本改变本行的文本

    d    从模板块（Pattern space）位置删除行
    
    D    删除模板块的第一行

    i    在当前行上面插入文本

    h    拷贝模板块的内容到内存中的缓冲区

    H    追加模板块的内容到内存中的缓冲区

    g    获得内存缓冲区的内容，并替代当前模板块中的文本

    G    获得内存缓冲区的内容，并追加到当前模板块文本的后面

    l    列表不能打印字符的清单

    n    读取下一个输入行，用下一个命令处理新的行而不是用第一个命令

    N    追加下一个输入行到模板块后面并在二者间嵌入一个新行，改变当前行号码

    p    打印模板块的行

    P（大写）    打印模板块的第一行

    q    退出Sed

    r file    从file中读行

    t label    if分支，从最后一行开始，条件一旦满足或者T，t命令，将导致分支到带有标号的命令处
    或者到脚本的末尾

    T label    错误分支，从最后一行开始，一旦发生错误或者T，t命令，将导致分支到带有标号的命令处
    或者到脚本的末尾

    w file    写并追加模板块到file末尾

    W file    写并追加模板块的第一行到file末尾

    !    表示后面的命令对所有没有被选定的行发生作用

    s/re/string    用string替换正则表达式re

    =    打印当前行号码

# 把注释扩展到下一个换行符以前

    以下的是替换标记

        g表示行内全面替换

        p表示打印行

        w表示把行写入一个文件

        x表示互换模板块中的文本和缓冲区中的文本

        y表示把一个字符翻译为另外的字符（但是不用于正则表达式）

2. 选项

    -e command, –expression=command    允许多台编辑

    -h, –help    打印帮助，并显示bug列表的地址

    -n, –quiet, –silent    取消默认输出

    -f, –filer=script-file    引导sed脚本文件名

    -V, –version    打印版本和版权信息

3. 元字符集

    ^    锚定行的开始 如：/^sed/匹配所有以sed开头的行

    $    锚定行的结束 如：/sed$/匹配所有以sed结尾的行

    \    表示使用\ 对字符 进行转义 

    .    匹配一个非换行符的字符 如：/s.d/匹配s后接一个任意字符，然后是d
    
    *    匹配零或多个字符 如：/*sed/匹配所有模板是一个或多个空格后紧跟sed的行
    
    []    匹配一个指定范围内的字符，如/[Ss]ed/匹配sed和Sed

    [^]    匹配一个不在指定范围内的字符，如：/[^A-RT-Z]ed/匹配不包含A-R和T-Z的一个字母开头
    紧跟ed的行

    (..)    保存匹配的字符，如s/(love)able/1rs，loveable被替换成lovers

    &    保存搜索字符用来替换其他字符，如s/love/**&**/，love这成**love**

    <    锚定单词的开始，如:/<love/匹配包含以love开头的单词的行

    >    锚定单词的结束，如/love>/匹配包含以love结尾的单词的行

    x{m}    重复字符x，m次，如：/0{5}/匹配包含5个o的行

    x{m,}    重复字符x,至少m次，如：/o{5,}/匹配至少有5个o的行

    x{m,n}    重复字符x，至少m次，不多于n次，如：/o{5,10}/匹配5–10个o的行

# 示例解释

只是在屏幕输出/打印中显示更改，并不改变文件本身内容

    sed '作用范围行 插入行前/行后 插入内容' 文件名

*中间的空格也可省略*

    sed '作用范围行插入行前/行后插入内容' 文件名

*常常在插入内容前留空格*

    sed '作用范围行插入行前/行后 插入内容' 文件名

添加文本常常需要的是添加内容到文件里，更新文件，要在sed后面加 -i,是编辑文档选项

    sed -i '作用范围行 插入行前/行后 插入内容' 文件名

*插入行前/行后*

    sample.example文件第1行前面添加“hello”；实质就是插入内容到文件第1行

    sed -i '1 i hello' test.example

    sample.example文件第1行后面添加“hello”；实质就是插入内容到文件第2行

    sed -i '1 a hello' test.example


*行前用 i ，行后用a*

i比a常用 当然要插入内容到最后一行就得用a了 同样要插入内容到文件第一行需要用i

所以这个插入操作要注意行号的变化 下面的内容多次添加文本时注意具体写了注意的内容
作用范围行

注意如果是刚建好的空文件是写不进内容的，因为空文件没有行号。
（sed是不能处理空文件的，可参考这篇文章  链接：sed不能处理空文件）

最后一行用$表示 

    插入内容到某行，直接写指定行号 

把内容插入到某行应该是最常用的  也是本文题目所指 

*把"hello"插入到第2行*

    sed -i '2i hello' test.example

*把"hello"插入到最后一行*

    sed -i '$a hello' test.example

    行号位置为空，即不写行号，就是作用范围在全文每一行

    sed -i 'i hello' test.example

    效果如下

    $ cat test.example 
    a
    b
    c
    d

    （不写行号，作用在每一行）

    $ sed 'i hello' test.example
    hello
    a
    hello
    b
    hello
    c
    hello
    d

    注意这一点这vim中的作用范围不太一样，vim中不写作用范围的话是作用于光标所在的当前行
    
    而sed是指全文范围

*指定某行到某行，用逗号连接行号*

    $ sed '2,4 i hello' test.example 

    效果如下

    $ cat test.example 
    a
    b
    c
    d

    （作用在原本的第2行到第4行）

    $ sed '2,4 i hello' test.example 
    a
    hello
    b
    hello
    c
    hello
    d

*多次添加文本时注意*

插入方法，就像上面讲的，插入的是指定行的行前/行后，也就是是相对位置，比如

*把"hello"插入到第2行*

    sed -i '2i hello' test.example

这个例子里的插入到第2行，实际上插入到原来的第2行前面取代了第2行，之前的第2行在插入内容后就变成了第3行

    （如果多次插入内容，要注意行号是随着内容的更新而更新的）

比如这个失败的例子，想要把hello1写到第1行，hello2写到第2行。

**失败的例子**

    文件原本的内容
    $ cat test.example 
    happy,happy,c
    a,cat,c

    $ sed -i '2i hello2' test.example

*此时的确将hello2 插入到了第二行*

    $ cat test.example 
    happy,happy,c
    hello2
    a,cat,c

    $ sed -i '1i hello1' test.example

    这时虽然将hello1插入第2行，但是hello2就不再是在第2行，而跑去了第3行

    $ cat test.example 
    hello1
    happy,happy,c
    hello2
    a,cat,c


按行号顺序插入是一个解决方法 如果是要求将内容绝对地插入指定行，应该考虑文本替换

*文本替换是绝对的指定行*

    例 设定第3行内容为hello3

    sed '3s/.*/hello3/' test.example

# 细解

example：（假设我们有一文件名为natural）

    （1）删除某行

    # sed '1d' natural              #删除第一行 

    # sed '$d' natural              #删除最后一行

    # sed '1,2d' natural           #删除第一行到第二行

    # sed '2,$d' natural           #删除第二行到最后一行

    （2）显示某行

    # sed -n '1p' natural           #显示第一行 

    # sed -n '$p' natural           #显示最后一行

    # sed -n '1,2p' natural        #显示第一行到第二行

    # sed -n '2,$p' natural        #显示第二行到最后一行

    （3）使用模式进行查询

    # sed -n '/Blue sky/p' natural    #查询包括关键字Blue sky所在所有行

    # sed -n '/\$/p' natural        #查询包括关键字$所在所有行，使用反斜线\屏蔽特殊含义

    （4）增加一行或多行字符串

    # cat natural

    Hello!
    Blue sky is me,welcome to my blog.
    end

    # sed '1a deep sea' natural  #第一行后增加字符串"deep sea"

    Hello!
    deep sea
    Blue sky is me,welcome to my blog. 
    end

    # sed '1,3a deep sea' natural #第一行到第三行后增加字符串"deep sea"

    Hello!
    deep sea
    Blue sky is me,welcome to my blog.
    deep sea
    end
    deep sea

    # sed '1a deep sea\nor coffee' natural  #第一行后增加多行，使用换行符\n

    Hello!
    deep sea
    or coffee
    Blue sky is me,welcome to my blog.
    end

　（5）代替一行或多行

    # sed '1c Hi' natural               #第一行代替为Hi
    Hi
    Blue sky is me,welcome to my blog.
    end

    # sed '1,2c Hi' natural            #第一行到第二行代替为Hi
    Hi
    end

    sed 's/^/添加的头部&/g'   //在所有行首添加

    sed 's/$/&添加的尾部/g'    //在所有行末添加

    sed '2s/原字符串/替换字符串/g'    //替换第2行

    sed '$s/原字符串/替换字符串/g'    //替换最后一行

    sed '2,5s/原字符串/替换字符串/g'    //替换2到5行

    sed '2,$s/原字符串/替换字符串/g'    //替换2到最后一行

    sed '.,$s/原字符串/替换字符串/g'    //替换当前行到最后一行

    （6）替换一行中的某部分

    格式：sed 's/要替换的字符串/新的字符串/g'   （要替换的字符串可以用正则表达式，末尾加g替换每一个
    
    匹配的关键字,否则只替换每行的第一个）

    sed -n '/Blue sky/p' natural | sed 's/Blue sky/Clouds/g'    #替换Blue sky为Clouds

    sed -n '/Blue sky/p' natural | sed 's/Blue sky//g'        #删除Blue sky

    替换样式可以多个在同一条命令中执行,用分号”;”分隔：

    sed 's/^/添加的头部&/g；s/$/&添加的尾部/g'    //同时执行两个替换规则

    （7）插入

    sed -i '$a bye' natural        #在文件natural中最后一行直接输入"bye"
    
    sed -i '1i'$first natural#在文件natural中第一行插入变量$first作为一行，这里注意1和i之间可
    
    以有空格，但是$first前不能有空格

    （8）删除匹配行

    sed -i '/匹配字符串/d'  filename  （注：若匹配字符串是变量，则需要“”，而不是‘’。记得好像是）

    （9） 替换匹配行中的某个字符串：

    sed -i '/匹配字符串/s/替换源字符串/替换目标字符串/g' filename

    （10）sed处理过的输出是直接输出到屏幕上的,要保存可以将输出重定向,或者使用参数”i”直接在文件中替换

    sed -i 's/原字符串/替换字符串/g' filename    //替换文件中的所有匹配项

**为了避免/的歧义。可以使用？、#、+等其他字符来代替/作为命令的分隔符**

4. 附vim常用命令

*光标控制命令*

    命令                                    移动
      k                                  向上移一行
      j                                  向下移一行
      h                                  向左移一个字符
      l                                  向右移一个字符
      gg                                 移到文件的首行
      G                                  移到文件的末行
      H                                  移到屏幕的第一行
      w                                  移到下一个字的开头
      W                                  移到下一个字的开头，忽略标点符号
      e                                  移到下一个字的结尾
      E                                  移到下一个字的结尾，忽略标点符号
      ^                                  移到当前行首
      $                                  移到当前行尾
      {                                  移到上一段开头
      }                                  移到上一段结尾
      Enter                              移到下一行行首

*在 vim 中添加文本*
    命令                                  插入
      i                                  在光标前插入文本
      I                                   在当前行首插入文本
      a                                  在光标后插入文本
      A                                  在当前行末插入文本
      o                                  在当前行的下边插入新行
      O                                  在当前行的上边插入新行
      s                                  删除光标所在处字符，并进入插入模式
      S                                  删除光标所在的行，并进入插入模式
      :r filename                        读入指定文件内容，并插在当前行后
      :nrfile                            读入文件 file 内容，并插在第 n 行后
      Esc                                回到命令模式

*在 vim 中删除文本*
      命令                                删除
        x                                删除光标处的字符
        db                               删除光标前面的字
        dw                               删至下一个字的开头
        dd                               删除整行
        :n,md                            从第 m 行开始往前删除 n 行
        d$                               从光标处删除到行尾
        d^                               从光标处删除到行首

在 vim 中查找与替换
    命令                                  查找与替换
        /target                          在文件中向前查找 target
        ?target                          在文件中向后查找 target
        n                                查找下一个
        N                                查找上一个
        :setic                           查找时忽略大小写
        :setnoic                         查找时对大小写敏感
        %s/text1/text2/g                 在整个文件中查找text1并且替换为text2

*在 vim 中复制文本*
    命令                                          复制
        yy                                复制当前行
        nyy                               从当前开始复制n行
        p                                 粘贴至光标前
        P                                 粘贴至光标后
        u                                 撤消上一次修改
        U                                 撤消所有修改

*保存与退出vim*
      命令                                 保存或退出
        :w                                保存文件但不退出
        :wfile                            将修改保存在 file 中但不退出
        :wq 或 ZZ或:x                      保存文件并退出
        :q!                                不保存文件,强制退出
        :e!                                放弃所有修改，从上次保存文件开始再编辑

*其他选项*
        选项                                          作用
        :setall                            查看所有选项
        :setnu                             设置行号
        :setshowmode                       显示是输入模式还是替换模式
        :set ts=4                          为文本输入设置 tnatural stops
        :setnonumber                       取消显示行数
        :.=                                查看当前行的行号
        :=                                 查看总行数
        ctrl+g                        显示文件名、当前的行号、文件的总行数和文件位置的百分比

