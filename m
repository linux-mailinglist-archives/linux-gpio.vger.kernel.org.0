Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEEDC595B01
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Aug 2022 13:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbiHPL6i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 07:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235284AbiHPL6T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 07:58:19 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3292CDFFE;
        Tue, 16 Aug 2022 04:40:32 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxBOIogvtijqgCAA--.14646S2;
        Tue, 16 Aug 2022 19:40:24 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, tekkamanninja@gmail.com
Cc:     corbet@lwn.net, alexs@kernel.org, wu.xiangcheng@linux.dev,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2] docs/zh_CN: Update the translation of gpio to 6.0-rc1
Date:   Tue, 16 Aug 2022 19:40:25 +0800
Message-Id: <20220816114025.4180328-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOIogvtijqgCAA--.14646S2
X-Coremail-Antispam: 1UD129KBjvAXoWfWF18Ww4fZFy8Gr4ftr1DZFb_yoW5JF1rCo
        WFvw43ursrA343JF15GFsxJF1DCrsxCFykAws7CwnxuryUGF13X3W8Jw13GrW5AFWrGF1S
        q34SvF45WF4UAa4Dn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYe7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4k
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbLID7UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update to commit 5513b411ea5b ("Documentation: rename pinctl to
pin-control")
Move .../zh_CN/gpio.txt to .../zh_CN/driver-api/gpio/legacy.rst
Translate .../driver-api/index.rst into Chinese.
Translate .../driver-api/gpio/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
v2:
* Modify some words under Xiangcheng's advice.
* pinctrl -> 引脚控制
* Restore some lists.
 .../zh_CN/driver-api/gpio/index.rst           |  69 +++++++
 .../{gpio.txt => driver-api/gpio/legacy.rst}  | 184 +++++++++++-------
 .../translations/zh_CN/driver-api/index.rst   | 132 +++++++++++++
 Documentation/translations/zh_CN/index.rst    |   2 +-
 4 files changed, 316 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/driver-api/gpio/index.rst
 rename Documentation/translations/zh_CN/{gpio.txt => driver-api/gpio/legacy.rst} (89%)
 create mode 100644 Documentation/translations/zh_CN/driver-api/index.rst

diff --git a/Documentation/translations/zh_CN/driver-api/gpio/index.rst b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
new file mode 100644
index 000000000000..9ab64e94aced
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/gpio/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+=======================
+通用型输入/输出（GPIO）
+=======================
+
+目录:
+
+.. toctree::
+   :maxdepth: 2
+
+   legacy
+
+Todolist:
+
+*   intro
+*   using-gpio
+*   driver
+*   consumer
+*   board
+*   drivers-on-gpio
+*   bt8xxgpio
+
+核心
+====
+
+该API在以下内核代码中:
+
+include/linux/gpio/driver.h
+
+drivers/gpio/gpiolib.c
+
+ACPI支持
+========
+
+该API在以下内核代码中:
+
+drivers/gpio/gpiolib-acpi.c
+
+设备树支持
+==========
+
+该API在以下内核代码中:
+
+drivers/gpio/gpiolib-of.c
+
+设备管理支持
+============
+
+该API在以下内核代码中:
+
+drivers/gpio/gpiolib-devres.c
+
+sysfs帮助（函数）
+=================
+
+该API在以下内核代码中:
+
+drivers/gpio/gpiolib-sysfs.c
diff --git a/Documentation/translations/zh_CN/gpio.txt b/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
similarity index 89%
rename from Documentation/translations/zh_CN/gpio.txt
rename to Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
index a23ee14fc927..944cdc61cc03 100644
--- a/Documentation/translations/zh_CN/gpio.txt
+++ b/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
@@ -1,39 +1,28 @@
-Chinese translated version of Documentation/admin-guide/gpio
+.. SPDX-License-Identifier: GPL-2.0
 
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
+.. include:: ../../disclaimer-zh_CN.rst
 
-Maintainer: Grant Likely <grant.likely@secretlab.ca>
-		Linus Walleij <linus.walleij@linaro.org>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
----------------------------------------------------------------------
-Documentation/admin-guide/gpio 的中文翻译
+:Original: Documentation/driver-api/gpio/legacy.rst
 
-如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
-交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-译存在问题，请联系中文版维护者。
-英文版维护者： Grant Likely <grant.likely@secretlab.ca>
-		Linus Walleij <linus.walleij@linaro.org>
-中文版维护者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
-中文版翻译者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
-中文版校译者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
+:翻译:
 
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
-以下为正文
----------------------------------------------------------------------
-GPIO 接口
+:校译:
 
-本文档提供了一个在Linux下访问GPIO的公约概述。
+
+传统GPIO接口
+============
+
+本文档概述了Linux下的GPIO访问公约。
 
 这些函数以 gpio_* 作为前缀。其他的函数不允许使用这样的前缀或相关的
 __gpio_* 前缀。
 
 
-什么是GPIO?
-==========
+什么是GPIO？
+============
 "通用输入/输出口"(GPIO)是一个灵活的由软件控制的数字信号。他们可
 由多种芯片提供,且对于从事嵌入式和定制硬件的 Linux 开发者来说是
 比较熟悉。每个GPIO 都代表一个连接到特定引脚或球栅阵列(BGA)封装中
@@ -99,6 +88,7 @@ GPIO 公约
 
 标识 GPIO
 ---------
+
 GPIO 是通过无符号整型来标识的,范围是 0 到 MAX_INT。保留“负”数
 用于其他目的,例如标识信号“在这个板子上不可用”或指示错误。未接触底层
 硬件的代码会忽略这些整数。
@@ -115,7 +105,7 @@ FPGA 的特定板子上使用 80-95。编号不一定要连续,那些平台中
 
 如果你要初始化一个带有无效 GPIO 编号的结构体,可以使用一些负编码
 (如"-EINVAL")，那将使其永远不会是有效。来测试这样一个结构体中的编号
-是否关联一个 GPIO，你可使用以下断言:
+是否关联一个 GPIO，你可使用以下断言::
 
 	int gpio_is_valid(int number);
 
@@ -128,11 +118,12 @@ FPGA 的特定板子上使用 80-95。编号不一定要连续,那些平台中
 
 使用 GPIO
 ---------
+
 对于一个 GPIO，系统应该做的第一件事情就是通过 gpio_request()
 函数分配它，见下文。
 
 接下来是设置I/O方向，这通常是在板级启动代码中为所使用的 GPIO 设置
-platform_device 时完成。
+platform_device 时完成::
 
 	/* 设置为输入或输出, 返回 0 或负的错误代码 */
 	int gpio_direction_input(unsigned gpio);
@@ -157,12 +148,13 @@ get/set(获取/设置)函数调用没法返回错误,且有可能是配置错误
 
 
 访问自旋锁安全的 GPIO
--------------------
+---------------------
+
 大多数 GPIO 控制器可以通过内存读/写指令来访问。这些指令不会休眠,可以
 安全地在硬(非线程)中断例程和类似的上下文中完成。
 
 对于那些用 gpio_cansleep()测试总是返回失败的 GPIO(见下文)，使用
-以下的函数访问:
+以下的函数访问::
 
 	/* GPIO 输入:返回零或非零 */
 	int gpio_get_value(unsigned gpio);
@@ -188,17 +180,18 @@ GPIO值是布尔值，零表示低电平，非零表示高电平。当读取一
 
 
 访问可能休眠的 GPIO
------------------
+-------------------
+
 某些 GPIO 控制器必须通过基于总线(如 I2C 或 SPI)的消息访问。读或写这些
 GPIO 值的命令需要等待其信息排到队首才发送命令，再获得其反馈。期间需要
 休眠，这不能在 IRQ 例程(中断上下文)中执行。
 
 支持此类 GPIO 的平台通过以下函数返回非零值来区分出这种 GPIO。(此函数需要
-一个之前通过 gpio_request 分配到的有效 GPIO 编号):
+一个之前通过 gpio_request 分配到的有效 GPIO 编号)::
 
 	int gpio_cansleep(unsigned gpio);
 
-为了访问这种 GPIO,内核定义了一套不同的函数:
+为了访问这种 GPIO,内核定义了一套不同的函数::
 
 	/* GPIO 输入:返回零或非零 ,可能会休眠 */
 	int gpio_get_value_cansleep(unsigned gpio);
@@ -214,25 +207,26 @@ GPIO 值的命令需要等待其信息排到队首才发送命令，再获得其
 事实，这些处理例程实际上和自旋锁安全的函数是一样的。
 
 ** 除此之外 ** 调用设置和配置此类 GPIO 的函数也必须在允许休眠的上下文中，
-因为它们可能也需要访问 GPIO 控制器芯片: (这些设置函数通常在板级启动代码或者
-驱动探测/断开代码中，所以这是一个容易满足的约束条件。)
+因为它们可能也需要访问 GPIO 控制器芯片 (这些设置函数通常在板级启动代码或者
+驱动探测/断开代码中，所以这是一个容易满足的约束条件。) ::
 
-	gpio_direction_input()
-	gpio_direction_output()
-	gpio_request()
+                gpio_direction_input()
+                gpio_direction_output()
+                gpio_request()
 
-## 	gpio_request_one()
-##	gpio_request_array()
-## 	gpio_free_array()
+        ## 	gpio_request_one()
+        ##	gpio_request_array()
+        ## 	gpio_free_array()
 
-	gpio_free()
-	gpio_set_debounce()
+                gpio_free()
+                gpio_set_debounce()
 
 
 
 声明和释放 GPIO
-----------------------------
-为了有助于捕获系统配置错误,定义了两个函数。
+----------------
+
+为了有助于捕获系统配置错误,定义了两个函数::
 
 	/* 申请 GPIO, 返回 0 或负的错误代码.
 	 * 非空标签可能有助于诊断.
@@ -256,9 +250,9 @@ GPIO 值的命令需要等待其信息排到队首才发送命令，再获得其
 某些平台可能也使用 GPIO 作为电源管理激活信号(例如通过关闭未使用芯片区和
 简单地关闭未使用时钟)。
 
-对于 GPIO 使用 pinctrl 子系统已知的引脚，子系统应该被告知其使用情况；
+对于 GPIO 使用引脚控制子系统已知的引脚，子系统应该被告知其使用情况；
 一个 gpiolib 驱动的 .request()操作应调用 pinctrl_gpio_request()，
-而 gpiolib 驱动的 .free()操作应调用 pinctrl_gpio_free()。pinctrl
+而 gpiolib 驱动的 .free()操作应调用 pinctrl_gpio_free()。引脚控制
 子系统允许 pinctrl_gpio_request()在某个引脚或引脚组以复用形式“属于”
 一个设备时都成功返回。
 
@@ -270,7 +264,7 @@ GPIO 值的命令需要等待其信息排到队首才发送命令，再获得其
 
 某些平台允许部分或所有 GPIO 信号使用不同的引脚。类似的，GPIO 或引脚的
 其他方面也需要配置，如上拉/下拉。平台软件应该在对这些 GPIO 调用
-gpio_request()前将这类细节配置好，例如使用 pinctrl 子系统的映射表，
+gpio_request()前将这类细节配置好，例如使用引脚控制子系统的映射表，
 使得 GPIO 的用户无须关注这些细节。
 
 还有一个值得注意的是在释放 GPIO 前，你必须停止使用它。
@@ -278,7 +272,7 @@ gpio_request()前将这类细节配置好，例如使用 pinctrl 子系统的映
 
 注意:申请一个 GPIO 并没有以任何方式配置它，只不过标识那个 GPIO 处于使用
 状态。必须有另外的代码来处理引脚配置(如控制 GPIO 使用的引脚、上拉/下拉)。
-考虑到大多数情况下声明 GPIO 之后就会立即配置它们,所以定义了以下三个辅助函数:
+考虑到大多数情况下声明 GPIO 之后就会立即配置它们,所以定义了以下三个辅助函数::
 
 	/* 申请一个 GPIO 信号, 同时通过特定的'flags'初始化配置,
 	 * 其他和 gpio_request()的参数和返回值相同
@@ -326,7 +320,7 @@ gpio_request()前将这类细节配置好，例如使用 pinctrl 子系统的映
 将来这些标志可能扩展到支持更多的属性。
 
 更进一步,为了更简单地声明/释放多个 GPIO,'struct gpio'被引进来封装所有
-这三个领域:
+这三个领域::
 
 	struct gpio {
 		unsigned	gpio;
@@ -334,7 +328,7 @@ gpio_request()前将这类细节配置好，例如使用 pinctrl 子系统的映
 		const char	*label;
 	};
 
-一个典型的用例:
+一个典型的用例::
 
 	static struct gpio leds_gpios[] = {
 		{ 32, GPIOF_OUT_INIT_HIGH, "Power LED" }, /* 默认开启 */
@@ -356,9 +350,10 @@ gpio_request()前将这类细节配置好，例如使用 pinctrl 子系统的映
 
 
 GPIO 映射到 IRQ
---------------------
+----------------
+
 GPIO 编号是无符号整数;IRQ 编号也是。这些构成了两个逻辑上不同的命名空间
-(GPIO 0 不一定使用 IRQ 0)。你可以通过以下函数在它们之间实现映射:
+(GPIO 0 不一定使用 IRQ 0)。你可以通过以下函数在它们之间实现映射::
 
 	/* 映射 GPIO 编号到 IRQ 编号 */
 	int gpio_to_irq(unsigned gpio);
@@ -384,7 +379,8 @@ irq_to_gpio()返回的非错误值大多数通常可以被 gpio_get_value()所
 
 
 模拟开漏信号
-----------------------------
+------------
+
 有时在只有低电平信号作为实际驱动结果(译者注:多个输出连接于一点，逻辑电平
 结果为所有输出的逻辑与)的时候,共享的信号线需要使用“开漏”信号。(该术语
 适用于 CMOS 管；而 TTL 用“集电极开路”。)一个上拉电阻使信号为高电平。这
@@ -408,9 +404,44 @@ irq_to_gpio()返回的非错误值大多数通常可以被 gpio_get_value()所
 这不一定是错误的。一个常见的例子就是 I2C 时钟的延长：一个需要较慢时钟的
 从设备延迟 SCK 的上升沿，而 I2C 主设备相应地调整其信号传输速率。
 
+GPIO控制器和引脚控制子系统
+--------------------------
+
+SOC上的GPIO控制器可能与引脚控制子系统紧密结合，即引脚可以与可选的gpio功
+能一起被其他功能使用。我们已经涵盖了这样的情况，例如一个GPIO控制器需要保
+留一个引脚或通过调用以下任何一个引脚来设置其方向::
+
+  pinctrl_gpio_request()
+  pinctrl_gpio_free()
+  pinctrl_gpio_direction_input()
+  pinctrl_gpio_direction_output()
+
+但是，引脚控制子系统是如何将GPIO号码（这是一个全局事项）与某个引脚控制器
+上的某个引脚交叉关联的？
+
+这是通过注册引脚的“范围”来实现的，这基本上是交叉参考表。这些描述是在
+Documentation/driver-api/pin-control.rst
+
+虽然引脚分配完全由引脚控制子系统管理，但gpio（在gpiolib下）仍由gpio驱动
+维护。可能发生的情况是，SoC中的不同引脚范围由不同的gpio驱动器管理。
+
+这使得在调用 "pinctrl_gpio_request" 之前，让gpio驱动向pin ctrl子系
+统宣布它们的引脚范围是合理的，以便在使用任何gpio之前要求引脚控制子系统准
+备相应的引脚。
+
+为此，gpio控制器可以用引脚控制子系统注册其引脚范围。目前有两种方法：有或
+无DT。
+
+关于对DT的支持，请参考 Documentation/devicetree/bindings/gpio/gpio.txt.
+
+对于非DT支持，用户可以用适当的参数调用gpiochip_add_pin_range()，将一
+系列的gpio引脚注册到引脚控制驱动上。为此，必须将引脚控制设备的名称字符串
+作为参数之一传给这个程序。
+
+
+这些公约忽略了什么？
+====================
 
-这些公约忽略了什么?
-================
 这些公约忽略的最大一件事就是引脚复用，因为这属于高度芯片特定的属性且
 没有可移植性。某个平台可能不需要明确的复用信息；有的对于任意给定的引脚
 可能只有两个功能选项；有的可能每个引脚有八个功能选项；有的可能可以将
@@ -433,8 +464,9 @@ Linux 的系统。)
 当前，动态定义 GPIO 并不是标准的，例如作为配置一个带有某些 GPIO 扩展器的
 附加电路板的副作用。
 
-GPIO 实现者的框架 (可选)
-=====================
+GPIO 实现者的框架（可选）
+=========================
+
 前面提到了，有一个可选的实现框架，让平台使用相同的编程接口，更加简单地支持
 不同种类的 GPIO 控制器。这个框架称为"gpiolib"。
 
@@ -444,15 +476,16 @@ GPIO 实现者的框架 (可选)
 
 
 控制器驱动: gpio_chip
--------------------
+---------------------
+
 在框架中每个 GPIO 控制器都包装为一个 "struct gpio_chip"，他包含了
 该类型的每个控制器的常用信息:
 
- - 设置 GPIO 方向的方法
- - 用于访问 GPIO 值的方法
- - 告知调用其方法是否可能休眠的标志
- - 可选的 debugfs 信息导出方法 (显示类似上拉配置一样的额外状态)
- - 诊断标签
+	设置 GPIO 方向的方法
+	用于访问 GPIO 值的方法
+	告知调用其方法是否可能休眠的标志
+	可选的 debugfs 信息导出方法 (显示类似上拉配置一样的额外状态)
+	诊断标签
 
 也包含了来自 device.platform_data 的每个实例的数据：它第一个 GPIO 的
 编号和它可用的 GPIO 的数量。
@@ -471,7 +504,8 @@ GPIO 实现者的框架 (可选)
 
 
 平台支持
--------
+--------
+
 为了支持这个框架，一个平台的 Kconfig 文件将会 "select"(选择)
 ARCH_REQUIRE_GPIOLIB 或 ARCH_WANT_OPTIONAL_GPIOLIB，并让它的
 <asm/gpio.h> 包含 <asm-generic/gpio.h>，同时定义三个方法:
@@ -489,7 +523,7 @@ ARCH_WANT_OPTIONAL_GPIOLIB 意味着 gpiolib 核心默认关闭,且用户可以
 如果这些选项都没被选择,该平台就不通过 GPIO-lib 支持 GPIO,且代码不可以
 被用户使能。
 
-以下这些方法的实现可以直接使用框架代码,并总是通过 gpio_chip 调度:
+以下这些方法的实现可以直接使用框架代码,并总是通过 gpio_chip 调度::
 
   #define gpio_get_value	__gpio_get_value
   #define gpio_set_value	__gpio_set_value
@@ -508,7 +542,8 @@ arch_initcall()或者更早的地方集成进平台初始化代码，使这些 G
 且他们通常可以作为 IRQ 使用。
 
 板级支持
--------
+--------
+
 对于外部 GPIO 控制器(例如 I2C 或 SPI 扩展器、专用芯片、多功能器件、FPGA
 或 CPLD)，大多数常用板级特定代码都可以注册控制器设备，并保证他们的驱动知道
 gpiochip_add()所使用的 GPIO 编号。他们的起始编号通常跟在平台特定的 GPIO
@@ -526,8 +561,9 @@ GPIO 可以工作之后才可被注册。解决这类依赖的的一种方法是
 设备变成无效时移除它们。
 
 
-用户空间的 Sysfs 接口(可选)
-========================
+用户空间的 Sysfs 接口（可选）
+=============================
+
 使用“gpiolib”实现框架的平台可以选择配置一个 GPIO 的 sysfs 用户接口。
 这不同于 debugfs 接口，因为它提供的是对 GPIO方向和值的控制，而不只显示
 一个GPIO 的状态摘要。此外,它可以出现在没有调试支持的产品级系统中。
@@ -548,6 +584,7 @@ GPIO 可以工作之后才可被注册。解决这类依赖的的一种方法是
 
 Sysfs 中的路径
 --------------
+
 在/sys/class/gpio 中有 3 类入口:
 
    -	用于在用户空间控制 GPIO 的控制接口;
@@ -625,8 +662,9 @@ GPIO 控制器的路径类似 /sys/class/gpio/gpiochip42/ (对于从#42 GPIO
 
 
 从内核代码中导出
--------------
-内核代码可以明确地管理那些已通过 gpio_request()申请的 GPIO 的导出:
+----------------
+
+内核代码可以明确地管理那些已通过 gpio_request()申请的 GPIO 的导出::
 
 	/* 导出 GPIO 到用户空间 */
 	int gpio_export(unsigned gpio, bool direction_may_change);
@@ -648,3 +686,9 @@ GPIO 控制器的路径类似 /sys/class/gpio/gpiochip42/ (对于从#42 GPIO
 在 GPIO 被导出之后，gpio_export_link()允许在 sysfs 文件系统的任何地方
 创建一个到这个 GPIO sysfs 节点的符号链接。这样驱动就可以通过一个描述性的
 名字，在 sysfs 中他们所拥有的设备下提供一个(到这个 GPIO sysfs 节点的)接口。
+
+
+API参考
+=======
+
+本节中列出的函数已被废弃。在新的代码中应该使用基于GPIO描述符的API。
diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
new file mode 100644
index 000000000000..24eb2198e5f1
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/index.rst
@@ -0,0 +1,132 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========================
+Linux驱动实现者的API指南
+========================
+
+内核提供了各种各样的接口来支持设备驱动的开发。这份文档只是对其中一些接口进行了
+一定程度的整理——希望随着时间的推移，它能变得更好！可用的小节可以在下面看到。
+
+.. class:: toc-title
+
+	   目录列表：
+
+.. toctree::
+   :maxdepth: 2
+
+   gpio/index
+
+Todolist:
+
+*   driver-model/index
+*   basics
+*   infrastructure
+*   ioctl
+*   early-userspace/index
+*   pm/index
+*   clk
+*   device-io
+*   dma-buf
+*   device_link
+*   component
+*   message-based
+*   infiniband
+*   aperture
+*   frame-buffer
+*   regulator
+*   reset
+*   iio/index
+*   input
+*   usb/index
+*   firewire
+*   pci/index
+*   cxl/index
+*   spi
+*   i2c
+*   ipmb
+*   ipmi
+*   i3c/index
+*   interconnect
+*   devfreq
+*   hsi
+*   edac
+*   scsi
+*   libata
+*   target
+*   mailbox
+*   mtdnand
+*   miscellaneous
+*   mei/index
+*   mtd/index
+*   mmc/index
+*   nvdimm/index
+*   w1
+*   rapidio/index
+*   s390-drivers
+*   vme
+*   80211/index
+*   uio-howto
+*   firmware/index
+*   pin-control
+*   md/index
+*   media/index
+*   misc_devices
+*   nfc/index
+*   dmaengine/index
+*   slimbus
+*   soundwire/index
+*   thermal/index
+*   fpga/index
+*   acpi/index
+*   auxiliary_bus
+*   backlight/lp855x-driver.rst
+*   connector
+*   console
+*   dcdbas
+*   eisa
+*   isa
+*   isapnp
+*   io-mapping
+*   io_ordering
+*   generic-counter
+*   memory-devices/index
+*   men-chameleon-bus
+*   ntb
+*   nvmem
+*   parport-lowlevel
+*   pps
+*   ptp
+*   phy/index
+*   pwm
+*   pldmfw/index
+*   rfkill
+*   serial/index
+*   sm501
+*   surface_aggregator/index
+*   switchtec
+*   sync_file
+*   tty/index
+*   vfio-mediated-device
+*   vfio
+*   vfio-pci-device-specific-driver-acceptance
+*   xilinx/index
+*   xillybus
+*   zorro
+*   hte/index
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index bf85baca8b3e..4f04367a4c5e 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -108,6 +108,7 @@ TODOList:
    :maxdepth: 2
 
    core-api/index
+   driver-api/index
    locking/index
    accounting/index
    cpu-freq/index
@@ -123,7 +124,6 @@ TODOList:
 
 TODOList:
 
-* driver-api/index
 * block/index
 * cdrom/index
 * ide/index
-- 
2.31.1

