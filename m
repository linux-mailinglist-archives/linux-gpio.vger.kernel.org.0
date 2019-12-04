Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BB61128FD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 11:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfLDKLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 05:11:07 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:56790 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbfLDKLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 05:11:05 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id B6A3827E1512;
        Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id QBr2ZZHpmmH9; Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E5BD327E1514;
        Wed,  4 Dec 2019 11:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E5BD327E1514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1575454262;
        bh=f9BmQnKca9zYSdX+q4rJqbMj658y7CcwGNmmAXtMQP4=;
        h=From:To:Date:Message-Id;
        b=iHGSY+G9emUlkNeDaTTBswj7Q7yfNOOse6jfttP/Vx4D3tYs7OZbMwqw56ktsOQms
         ELMwCEKi3KEoPhi3O1oc3USspOScjEK1YUn8lJ2HsObNvhJBA+Ztp6LSBP9g3fkcQh
         mB2IkpnMfAwGR6oas1suOSSMxDeNrTJuNfw8GkZI=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id tofpMMaoXJ43; Wed,  4 Dec 2019 11:11:02 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id C94F627E1512;
        Wed,  4 Dec 2019 11:11:02 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     linux-kernel@vger.kernel.org
Cc:     Clement Leger <cleger@kalray.eu>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 2/5] pinctrl: dw: move gpio-dwapb.c to pinctrl folder
Date:   Wed,  4 Dec 2019 11:10:36 +0100
Message-Id: <20191204101042.4275-3-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

dwapb-gpio block also have alternate function selection possibility.
In order to convert it pinctrl support, move it to pinctrl folder.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 MAINTAINERS                                               | 4 ++--
 drivers/gpio/Kconfig                                      | 8 --------
 drivers/gpio/Makefile                                     | 1 -
 drivers/pinctrl/Kconfig                                   | 1 +
 drivers/pinctrl/Makefile                                  | 1 +
 drivers/pinctrl/dw/Kconfig                                | 9 +++++++++
 drivers/pinctrl/dw/Makefile                               | 4 ++++
 drivers/{gpio/gpio-dwapb.c => pinctrl/dw/pinctrl-dwapb.c} | 3 ---
 8 files changed, 17 insertions(+), 14 deletions(-)
 create mode 100644 drivers/pinctrl/dw/Kconfig
 create mode 100644 drivers/pinctrl/dw/Makefile
 rename drivers/{gpio/gpio-dwapb.c => pinctrl/dw/pinctrl-dwapb.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f9a81b9de40a..35b90ad9f594 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15868,11 +15868,11 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 S:	Maintained
 F:	drivers/tty/serial/8250/8250_dw.c
 
-SYNOPSYS DESIGNWARE APB GPIO DRIVER
+SYNOPSYS DESIGNWARE APB PINCTRL & GPIO DRIVER
 M:	Hoan Tran <hoan@os.amperecomputing.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	drivers/gpio/gpio-dwapb.c
+F:	drivers/pinctrl/dw/pinctrl-dwapb.c
 F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 
 SYNOPSYS DESIGNWARE AXI DMAC DRIVER
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8adffd42f8cb..982583615d11 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -195,14 +195,6 @@ config GPIO_DAVINCI
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
-config GPIO_DWAPB
-	tristate "Synopsys DesignWare APB GPIO driver"
-	select GPIO_GENERIC
-	select GENERIC_IRQ_CHIP
-	help
-	  Say Y or M here to build support for the Synopsys DesignWare APB
-	  GPIO block.
-
 config GPIO_EIC_SPRD
 	tristate "Spreadtrum EIC support"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 34eb8b2b12dd..2ceb7eb2bf18 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -49,7 +49,6 @@ obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
 obj-$(CONFIG_GPIO_DA9055)		+= gpio-da9055.o
 obj-$(CONFIG_GPIO_DAVINCI)		+= gpio-davinci.o
 obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
-obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
 obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
 obj-$(CONFIG_GPIO_EP93XX)		+= gpio-ep93xx.o
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 3bfbf2ff6e2b..70d7329c2942 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -388,6 +388,7 @@ source "drivers/pinctrl/actions/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
 source "drivers/pinctrl/berlin/Kconfig"
+source "drivers/pinctrl/dw/Kconfig"
 source "drivers/pinctrl/freescale/Kconfig"
 source "drivers/pinctrl/intel/Kconfig"
 source "drivers/pinctrl/mvebu/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 879f312bfb75..ceed62c6f784 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -52,6 +52,7 @@ obj-y				+= actions/
 obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
 obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
+obj-y				+= dw/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
 obj-y				+= mvebu/
diff --git a/drivers/pinctrl/dw/Kconfig b/drivers/pinctrl/dw/Kconfig
new file mode 100644
index 000000000000..8b57c27eab1f
--- /dev/null
+++ b/drivers/pinctrl/dw/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config GPIO_DWAPB
+	tristate "Synopsys DesignWare APB GPIO driver"
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select GPIO_GENERIC
+	help
+	  Say Y or M here to build support for the Synopsys DesignWare APB
+	  GPIO block.
diff --git a/drivers/pinctrl/dw/Makefile b/drivers/pinctrl/dw/Makefile
new file mode 100644
index 000000000000..6bda37902e23
--- /dev/null
+++ b/drivers/pinctrl/dw/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+# DesignWare pinctrl support
+
+obj-$(CONFIG_PINCTRL_DWAPB)	+= pinctrl-dwapb.o
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/pinctrl/dw/pinctrl-dwapb.c
similarity index 99%
rename from drivers/gpio/gpio-dwapb.c
rename to drivers/pinctrl/dw/pinctrl-dwapb.c
index 92e127e74813..62e598bdd9ff 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/pinctrl/dw/pinctrl-dwapb.c
@@ -26,9 +26,6 @@
 #include <linux/platform_data/gpio-dwapb.h>
 #include <linux/slab.h>
 
-#include "gpiolib.h"
-#include "gpiolib-acpi.h"
-
 #define GPIO_SWPORTA_DR		0x00
 #define GPIO_SWPORTA_DDR	0x04
 #define GPIO_SWPORTB_DR		0x0c
-- 
2.15.0.276.g89ea799

