Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35E22D2480
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgLHHgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:36:14 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58686 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgLHHgO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607412973; x=1638948973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MDkmFUEKJBDPBV8k8pNfLkUIGvXmb9uGh25aZkSnZo4=;
  b=Ou4Z/Mtq+/Ei4NC4SHtibzj9froT7/YInC6D+kv37uJDl48fOUpf1iMj
   B16Mmc3VYnuBaaxYliX0OpigzOQZY5JgerkJsU45C2+ODaMxuNFFe+c18
   iUDqEF5eJ2DD1fLRC55q8CaLx2dAGnGQDMDYm+tch0QkcY+M8L7Q4coOE
   iVkAbKo/C/6DL1IXR+mHZ9K6IokDdFZie9KhetinoWgPQVfNe1hLeV7Zc
   xVgzHsqBvQLfIq9eRkw4rls3AMkzK/i8qFwUg0grVasSdbq6IbUHCYsO/
   rIS+Qcsg1uQuanceraFaPwpo2XIV7IstcLBB/Z7aQSwl5K/uVcB9VuDEP
   Q==;
IronPort-SDR: ezyyUCbCPbmnFbso0G4KvkueP6cZI0+nAzPgZ6iOA0Up3QXYYSLbQhCKBNgYNn7UX3F3YF+1NL
 n7ryzwAohe8rLyX6KxWO8bdifU9o05PKDMJ+3Pjm9SJGoQLoeE3Z+xdpv2z5cFRhLqziHJW6fR
 n41VeSeYj9pKcgSj//L81g64SqB/nR3QQmWkL+DSbru0PrK4ttjtde22ZgjDf/mSGEPcbKq3yh
 yWuiIQD93PaUAWpvkSUjERxjz5X9+u+hQeecux392dZY7UqwKQAk2YqBcRW+G2at0rwakXKa6Q
 geA=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876637"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:10 +0800
IronPort-SDR: 4nZpVlz5qG9kcvnRn9f4QKwLVlgHJRd7YmfW5iwHu4iqd59a9rn8l3Dhe2bk0i3OBzNGYRTQ4y
 VxLG7SruFYHez17P5EnnjkprKV9itCkoM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:11 -0800
IronPort-SDR: AGvVi7tKk0vJpQNlRu+ypCrSOJ80PY7z2nz8ujd6U3Q44TtssdASj71VQMjjb/w6CJzOuzNUmx
 uxtgMPgvw9GA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:09 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 05/21] riscv: Use vendor name for K210 SoC support
Date:   Tue,  8 Dec 2020 16:33:39 +0900
Message-Id: <20201208073355.40828-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename configuration options and directories related to the Kendryte
K210 SoC to use the SoC vendor name (canaan) instead of the "kendryte"
branding name.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs                       | 24 +++++++++----------
 arch/riscv/Makefile                           |  2 +-
 arch/riscv/boot/dts/Makefile                  |  2 +-
 arch/riscv/boot/dts/canaan/Makefile           |  5 ++++
 .../boot/dts/{kendryte => canaan}/k210.dts    |  0
 .../boot/dts/{kendryte => canaan}/k210.dtsi   |  0
 arch/riscv/boot/dts/kendryte/Makefile         |  5 ----
 arch/riscv/configs/nommu_k210_defconfig       |  2 +-
 drivers/soc/Kconfig                           |  2 +-
 drivers/soc/Makefile                          |  2 +-
 drivers/soc/{kendryte => canaan}/Kconfig      |  4 ++--
 drivers/soc/{kendryte => canaan}/Makefile     |  0
 .../soc/{kendryte => canaan}/k210-sysctl.c    |  0
 13 files changed, 24 insertions(+), 24 deletions(-)
 create mode 100644 arch/riscv/boot/dts/canaan/Makefile
 rename arch/riscv/boot/dts/{kendryte => canaan}/k210.dts (100%)
 rename arch/riscv/boot/dts/{kendryte => canaan}/k210.dtsi (100%)
 delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
 rename drivers/soc/{kendryte => canaan}/Kconfig (79%)
 rename drivers/soc/{kendryte => canaan}/Makefile (100%)
 rename drivers/soc/{kendryte => canaan}/k210-sysctl.c (100%)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 0bc3e28581f2..88ac0d1a5da4 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,21 +22,21 @@ config SOC_VIRT
 	help
 	  This enables support for QEMU Virt Machine.
 
-config SOC_KENDRYTE
-	bool "Kendryte K210 SoC"
+config SOC_CANAAN
+	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU
 	select CLINT_TIMER if RISCV_M_MODE
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select SIFIVE_PLIC
 	help
-	  This enables support for Kendryte K210 SoC platform hardware.
+	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
-if SOC_KENDRYTE
+if SOC_CANAAN
 
-config SOC_KENDRYTE_K210_DTB_BUILTIN
-	bool "Builtin device tree for the Kendryte K210"
-	depends on SOC_KENDRYTE
+config SOC_CANAAN_K210_DTB_BUILTIN
+	bool "Builtin device tree for the Canaan Kendryte K210"
+	depends on SOC_CANAAN
 	default y
 	select OF
 	select BUILTIN_DTB
@@ -45,13 +45,13 @@ config SOC_KENDRYTE_K210_DTB_BUILTIN
 	  This option should be selected if no bootloader is being used.
 	  If unsure, say Y.
 
-config SOC_KENDRYTE_K210_DTB_SOURCE
-	string "Source file for the Kendryte K210 builtin DTB"
-	depends on SOC_KENDRYTE
-	depends on SOC_KENDRYTE_K210_DTB_BUILTIN
+config SOC_CANAAN_K210_DTB_SOURCE
+	string "Source file for the Canaan Kendryte K210 builtin DTB"
+	depends on SOC_CANAAN
+	depends on SOC_CANAAN_K210_DTB_BUILTIN
 	default "k210"
 	help
-	  Base name (without suffix, relative to arch/riscv/boot/dts/kendryte)
+	  Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
 	  for the DTS file that will be used to produce the DTB linked into the
 	  kernel.
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0289a97325d1..cd08dc40e8d8 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -83,7 +83,7 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
 
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_KENDRYTE),yy)
+ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
 KBUILD_IMAGE := $(boot)/loader.bin
 else
 KBUILD_IMAGE := $(boot)/Image.gz
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 21e3905f1c44..4da40691c55b 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-$(CONFIG_SOC_KENDRYTE) += kendryte
+subdir-$(CONFIG_SOC_CANAAN) += canaan
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
new file mode 100644
index 000000000000..9ee7156c0c31
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+ifneq ($(CONFIG_SOC_CANAAN_K210_DTB_SOURCE),"")
+dtb-y += $(strip $(shell echo $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))).dtb
+obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+endif
diff --git a/arch/riscv/boot/dts/kendryte/k210.dts b/arch/riscv/boot/dts/canaan/k210.dts
similarity index 100%
rename from arch/riscv/boot/dts/kendryte/k210.dts
rename to arch/riscv/boot/dts/canaan/k210.dts
diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
similarity index 100%
rename from arch/riscv/boot/dts/kendryte/k210.dtsi
rename to arch/riscv/boot/dts/canaan/k210.dtsi
diff --git a/arch/riscv/boot/dts/kendryte/Makefile b/arch/riscv/boot/dts/kendryte/Makefile
deleted file mode 100644
index 83636693166d..000000000000
--- a/arch/riscv/boot/dts/kendryte/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-ifneq ($(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE),"")
-dtb-y += $(strip $(shell echo $(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE))).dtb
-obj-$(CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
-endif
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index cd1df62b13c7..368a28cf1467 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -27,7 +27,7 @@ CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 # CONFIG_MMU is not set
-CONFIG_SOC_KENDRYTE=y
+CONFIG_SOC_CANAAN=y
 CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 425ab6f7e375..f43886fec32b 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -6,6 +6,7 @@ source "drivers/soc/amlogic/Kconfig"
 source "drivers/soc/aspeed/Kconfig"
 source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
+source "drivers/soc/canaan/Kconfig"
 source "drivers/soc/fsl/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
@@ -22,6 +23,5 @@ source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
 source "drivers/soc/zte/Kconfig"
-source "drivers/soc/kendryte/Kconfig"
 
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 36452bed86ef..dec90fca120b 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -28,4 +28,4 @@ obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
 obj-y				+= xilinx/
 obj-$(CONFIG_ARCH_ZX)		+= zte/
-obj-$(CONFIG_SOC_KENDRYTE)	+= kendryte/
+obj-$(CONFIG_SOC_CANAAN)	+= canaan/
diff --git a/drivers/soc/kendryte/Kconfig b/drivers/soc/canaan/Kconfig
similarity index 79%
rename from drivers/soc/kendryte/Kconfig
rename to drivers/soc/canaan/Kconfig
index 49785b1b0217..5232d13f07e5 100644
--- a/drivers/soc/kendryte/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-if SOC_KENDRYTE
+if SOC_CANAAN
 
 config K210_SYSCTL
-	bool "Kendryte K210 system controller"
+	bool "Canaan Kendryte K210 SoC system controller"
 	default y
 	depends on RISCV
 	help
diff --git a/drivers/soc/kendryte/Makefile b/drivers/soc/canaan/Makefile
similarity index 100%
rename from drivers/soc/kendryte/Makefile
rename to drivers/soc/canaan/Makefile
diff --git a/drivers/soc/kendryte/k210-sysctl.c b/drivers/soc/canaan/k210-sysctl.c
similarity index 100%
rename from drivers/soc/kendryte/k210-sysctl.c
rename to drivers/soc/canaan/k210-sysctl.c
-- 
2.28.0

