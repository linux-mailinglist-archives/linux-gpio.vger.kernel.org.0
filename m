Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6EF2D5CCD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389838AbgLJOFW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:05:22 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5152 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389909AbgLJOFK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607609109; x=1639145109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ClvrNvc9ueVuR2BQ2Aez67Uy8hk5dNK+OucEci/qmOc=;
  b=Y0Vqiy9OIonyFP/YXgS+wQX5tVVQWNI1t841i5EcJq5QzwtC/JgKR3mD
   7fQHp9Jy4kktPW723o/ayCdB/kN74i1LZ2K2s0xJ9jOphlra9F63hTh6B
   RuEby6cXDSbGni8Z7XFUS28HiDqGsofZRMRZ3a+OaLRPzNcKWGUlWZTN9
   wjTX7/+9OZdP0bcABkoIeG6zjFUlOc/xsVVjdANVbHNa8ThR2l8H/STKL
   4p6Lhs/as4zXDnC+7MvBhNairEWSkVg7D7/5eRQCC3R0vXoUdvI7ijsjz
   csHuUbDLlyBxub2DaXpyju/R9ViWYeiSylOcF4LDUQ8xiMzX4KpOlqKTf
   Q==;
IronPort-SDR: nNrvllUzIBxmOUHQE3vU335tVZeC5q+jog3PKqOHIr9djviQfFEe5IQT1muhT3pVbPdROt7+w6
 CvVy1Ee8R8+QRQyMIwa/+QeuocQTV4rXJy7uOV6qe1PW9xhneDVB+axuFsZIo4g/3l6L6Db87x
 vJWYKcTbt/nRTA5ru0O1eLNXUOzKMe1vkZWSXNQchgo85tlh7o9VAMWsV1n5BTvSCSAScbfgH4
 H6lMxYfWViLuBEkiyRJLsGPbS0gVimGfTdnVb/AkDNPLa1KANaQDvvVk5kLEPmyakiiHmEUpv5
 5MM=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="159316703"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:03:30 +0800
IronPort-SDR: cJaFxutCwq2tROJVbbT+6y/z2hoiaCXni6XTzD6pElLS6aXZeil+r3EHNuO0oRI0VrLWGTP8px
 lSsACXo6vNw3VENORTATxnBRJ/PvMzYmY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:47:22 -0800
IronPort-SDR: ItKq3ICBZmu+X0Hgdri66yYBXuNZKT8bT8e/8+eyB0CTr50RZFPTn42bMqzJOPV7fWHND4IcZc
 MvisSQOwsmIA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:29 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v8 06/22] riscv: cleanup Canaan Kendryte K210 sysctl driver
Date:   Thu, 10 Dec 2020 23:02:57 +0900
Message-Id: <20201210140313.258739-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce the header file include/soc/canaan/k210-sysctl.h to have a
common definition of the Canaan Kendryte K210 SoC system controller
registers. Simplify the k210 system controller driver code by removing
unused register bits definition. The MAINTAINERS file is updated,
adding the entry "CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER"
with myself listed as maintainer for this driver.
This is a preparatory patch for introducing the K210 clock driver. No
functional changes are introduced.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 MAINTAINERS                      |  7 +++
 drivers/soc/canaan/k210-sysctl.c | 93 +++++++++-----------------------
 include/soc/canaan/k210-sysctl.h | 41 ++++++++++++++
 3 files changed, 74 insertions(+), 67 deletions(-)
 create mode 100644 include/soc/canaan/k210-sysctl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f474153dbec..6d06a5fda7ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3831,6 +3831,13 @@ W:	https://github.com/Cascoda/ca8210-linux.git
 F:	Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
 F:	drivers/net/ieee802154/ca8210.c
 
+CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
+M:	Damien Le Moal <damien.lemoal@wdc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/soc/canaan/
+F:	include/soc/canaan/
+
 CACHEFILES: FS-CACHE BACKEND FOR CACHING ON MOUNTED FILESYSTEMS
 M:	David Howells <dhowells@redhat.com>
 L:	linux-cachefs@redhat.com (moderated for non-subscribers)
diff --git a/drivers/soc/canaan/k210-sysctl.c b/drivers/soc/canaan/k210-sysctl.c
index 4608fbca20e1..60b474c33d45 100644
--- a/drivers/soc/canaan/k210-sysctl.c
+++ b/drivers/soc/canaan/k210-sysctl.c
@@ -12,74 +12,33 @@
 #include <linux/bitfield.h>
 #include <asm/soc.h>
 
+#include <soc/canaan/k210-sysctl.h>
+
 #define K210_SYSCTL_CLK0_FREQ		26000000UL
 
 /* Registers base address */
 #define K210_SYSCTL_SYSCTL_BASE_ADDR	0x50440000ULL
 
-/* Registers */
-#define K210_SYSCTL_PLL0		0x08
-#define K210_SYSCTL_PLL1		0x0c
-/* clkr: 4bits, clkf1: 6bits, clkod: 4bits, bwadj: 4bits */
-#define   PLL_RESET		(1 << 20)
-#define   PLL_PWR		(1 << 21)
-#define   PLL_INTFB		(1 << 22)
-#define   PLL_BYPASS		(1 << 23)
-#define   PLL_TEST		(1 << 24)
-#define   PLL_OUT_EN		(1 << 25)
-#define   PLL_TEST_EN		(1 << 26)
-#define K210_SYSCTL_PLL_LOCK		0x18
-#define   PLL0_LOCK1		(1 << 0)
-#define   PLL0_LOCK2		(1 << 1)
-#define   PLL0_SLIP_CLEAR	(1 << 2)
-#define   PLL0_TEST_CLK_OUT	(1 << 3)
-#define   PLL1_LOCK1		(1 << 8)
-#define   PLL1_LOCK2		(1 << 9)
-#define   PLL1_SLIP_CLEAR	(1 << 10)
-#define   PLL1_TEST_CLK_OUT	(1 << 11)
-#define   PLL2_LOCK1		(1 << 16)
-#define   PLL2_LOCK2		(1 << 16)
-#define   PLL2_SLIP_CLEAR	(1 << 18)
-#define   PLL2_TEST_CLK_OUT	(1 << 19)
-#define K210_SYSCTL_CLKSEL0	0x20
-#define   CLKSEL_ACLK		(1 << 0)
-#define K210_SYSCTL_CLKEN_CENT		0x28
-#define   CLKEN_CPU		(1 << 0)
-#define   CLKEN_SRAM0		(1 << 1)
-#define   CLKEN_SRAM1		(1 << 2)
-#define   CLKEN_APB0		(1 << 3)
-#define   CLKEN_APB1		(1 << 4)
-#define   CLKEN_APB2		(1 << 5)
-#define K210_SYSCTL_CLKEN_PERI		0x2c
-#define   CLKEN_ROM		(1 << 0)
-#define   CLKEN_DMA		(1 << 1)
-#define   CLKEN_AI		(1 << 2)
-#define   CLKEN_DVP		(1 << 3)
-#define   CLKEN_FFT		(1 << 4)
-#define   CLKEN_GPIO		(1 << 5)
-#define   CLKEN_SPI0		(1 << 6)
-#define   CLKEN_SPI1		(1 << 7)
-#define   CLKEN_SPI2		(1 << 8)
-#define   CLKEN_SPI3		(1 << 9)
-#define   CLKEN_I2S0		(1 << 10)
-#define   CLKEN_I2S1		(1 << 11)
-#define   CLKEN_I2S2		(1 << 12)
-#define   CLKEN_I2C0		(1 << 13)
-#define   CLKEN_I2C1		(1 << 14)
-#define   CLKEN_I2C2		(1 << 15)
-#define   CLKEN_UART1		(1 << 16)
-#define   CLKEN_UART2		(1 << 17)
-#define   CLKEN_UART3		(1 << 18)
-#define   CLKEN_AES		(1 << 19)
-#define   CLKEN_FPIO		(1 << 20)
-#define   CLKEN_TIMER0		(1 << 21)
-#define   CLKEN_TIMER1		(1 << 22)
-#define   CLKEN_TIMER2		(1 << 23)
-#define   CLKEN_WDT0		(1 << 24)
-#define   CLKEN_WDT1		(1 << 25)
-#define   CLKEN_SHA		(1 << 26)
-#define   CLKEN_OTP		(1 << 27)
-#define   CLKEN_RTC		(1 << 29)
+/* Register bits */
+/* K210_SYSCTL_PLL1: clkr: 4bits, clkf1: 6bits, clkod: 4bits, bwadj: 4bits */
+#define PLL_RESET		(1 << 20)
+#define PLL_PWR			(1 << 21)
+#define PLL_BYPASS		(1 << 23)
+#define PLL_OUT_EN		(1 << 25)
+/* K210_SYSCTL_PLL_LOCK */
+#define PLL1_LOCK1		(1 << 8)
+#define PLL1_LOCK2		(1 << 9)
+#define PLL1_SLIP_CLEAR		(1 << 10)
+/* K210_SYSCTL_SEL0 */
+#define CLKSEL_ACLK		(1 << 0)
+/* K210_SYSCTL_CLKEN_CENT */
+#define CLKEN_CPU		(1 << 0)
+#define CLKEN_SRAM0		(1 << 1)
+#define CLKEN_SRAM1		(1 << 2)
+/* K210_SYSCTL_EN_PERI */
+#define CLKEN_ROM		(1 << 0)
+#define CLKEN_TIMER0		(1 << 21)
+#define CLKEN_RTC		(1 << 29)
 
 struct k210_sysctl {
 	void __iomem		*regs;
@@ -140,7 +99,7 @@ static unsigned long k210_sysctl_clk_recalc_rate(struct clk_hw *hw,
 	 * If the clock selector is not set, use the base frequency.
 	 * Otherwise, use PLL0 frequency with a frequency divisor.
 	 */
-	clksel0 = readl(s->regs + K210_SYSCTL_CLKSEL0);
+	clksel0 = readl(s->regs + K210_SYSCTL_SEL0);
 	if (!(clksel0 & CLKSEL_ACLK))
 		return K210_SYSCTL_CLK0_FREQ;
 
@@ -237,11 +196,11 @@ static void __init k210_soc_early_init(const void *fdt)
 	k210_set_bits(PLL_OUT_EN, regs + K210_SYSCTL_PLL0);
 
 	k210_set_bits(CLKEN_CPU | CLKEN_SRAM0 | CLKEN_SRAM1,
-		      regs + K210_SYSCTL_CLKEN_CENT);
+		      regs + K210_SYSCTL_EN_CENT);
 	k210_set_bits(CLKEN_ROM | CLKEN_TIMER0 | CLKEN_RTC,
-		      regs + K210_SYSCTL_CLKEN_PERI);
+		      regs + K210_SYSCTL_EN_PERI);
 
-	k210_set_bits(CLKSEL_ACLK, regs + K210_SYSCTL_CLKSEL0);
+	k210_set_bits(CLKSEL_ACLK, regs + K210_SYSCTL_SEL0);
 
 	iounmap(regs);
 }
diff --git a/include/soc/canaan/k210-sysctl.h b/include/soc/canaan/k210-sysctl.h
new file mode 100644
index 000000000000..2e037db68f35
--- /dev/null
+++ b/include/soc/canaan/k210-sysctl.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef K210_SYSCTL_H
+#define K210_SYSCTL_H
+
+/*
+ * Kendryte K210 SoC system controller registers offsets.
+ * Taken from Kendryte SDK (kendryte-standalone-sdk).
+ */
+#define K210_SYSCTL_GIT_ID	0x00 /* Git short commit id */
+#define K210_SYSCTL_UART_BAUD	0x04 /* Default UARTHS baud rate */
+#define K210_SYSCTL_PLL0	0x08 /* PLL0 controller */
+#define K210_SYSCTL_PLL1	0x0C /* PLL1 controller */
+#define K210_SYSCTL_PLL2	0x10 /* PLL2 controller */
+#define K210_SYSCTL_PLL_LOCK	0x18 /* PLL lock tester */
+#define K210_SYSCTL_ROM_ERROR	0x1C /* AXI ROM detector */
+#define K210_SYSCTL_SEL0	0x20 /* Clock select controller 0 */
+#define K210_SYSCTL_SEL1	0x24 /* Clock select controller 1 */
+#define K210_SYSCTL_EN_CENT	0x28 /* Central clock enable */
+#define K210_SYSCTL_EN_PERI	0x2C /* Peripheral clock enable */
+#define K210_SYSCTL_SOFT_RESET	0x30 /* Soft reset ctrl */
+#define K210_SYSCTL_PERI_RESET	0x34 /* Peripheral reset controller */
+#define K210_SYSCTL_THR0	0x38 /* Clock threshold controller 0 */
+#define K210_SYSCTL_THR1	0x3C /* Clock threshold controller 1 */
+#define K210_SYSCTL_THR2	0x40 /* Clock threshold controller 2 */
+#define K210_SYSCTL_THR3	0x44 /* Clock threshold controller 3 */
+#define K210_SYSCTL_THR4	0x48 /* Clock threshold controller 4 */
+#define K210_SYSCTL_THR5	0x4C /* Clock threshold controller 5 */
+#define K210_SYSCTL_THR6	0x50 /* Clock threshold controller 6 */
+#define K210_SYSCTL_MISC	0x54 /* Miscellaneous controller */
+#define K210_SYSCTL_PERI	0x58 /* Peripheral controller */
+#define K210_SYSCTL_SPI_SLEEP	0x5C /* SPI sleep controller */
+#define K210_SYSCTL_RESET_STAT	0x60 /* Reset source status */
+#define K210_SYSCTL_DMA_SEL0	0x64 /* DMA handshake selector 0 */
+#define K210_SYSCTL_DMA_SEL1	0x68 /* DMA handshake selector 1 */
+#define K210_SYSCTL_POWER_SEL	0x6C /* IO Power Mode Select controller */
+
+#endif
-- 
2.29.2

