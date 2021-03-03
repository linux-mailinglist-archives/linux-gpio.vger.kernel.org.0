Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071B932C7A1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355661AbhCDAcX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380291AbhCCN3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:29:09 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC2CC06121F
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by michel.telenet-ops.be with bizsmtp
        id bpSR2400E4huzR806pSRhk; Wed, 03 Mar 2021 14:26:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWD-004Ps3-7K; Wed, 03 Mar 2021 14:26:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWC-00GWVG-OC; Wed, 03 Mar 2021 14:26:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/6] pinctrl: renesas: Factor out common R-Mobile bias handling
Date:   Wed,  3 Mar 2021 14:26:16 +0100
Message-Id: <20210303132619.3938128-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303132619.3938128-1-geert+renesas@glider.be>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pin control sub-drivers for SH/R-Mobile SoCs contain almost
identical bias handling.  The only SoC-specific part is the mapping from
pin numbers to PORTnCR registers.

Reduce code duplication by factoring out the bias handling to the common
pinctrl.c code.  Use a callback to handle the pin/register mapping.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a73a4.c | 48 +++------------------------
 drivers/pinctrl/renesas/pfc-r8a7740.c | 46 +++----------------------
 drivers/pinctrl/renesas/pfc-sh73a0.c  | 46 +++----------------------
 drivers/pinctrl/renesas/pinctrl.c     | 40 ++++++++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h      |  5 +++
 5 files changed, 59 insertions(+), 126 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a73a4.c b/drivers/pinctrl/renesas/pfc-r8a73a4.c
index b21f5afe610fb430..b26ff9d6ead4bb6c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a73a4.c
+++ b/drivers/pinctrl/renesas/pfc-r8a73a4.c
@@ -2649,59 +2649,21 @@ static const struct pinmux_irq pinmux_irqs[] = {
 	PINMUX_IRQ(329),	/* IRQ57 */
 };
 
-#define PORTCR_PULMD_OFF (0 << 6)
-#define PORTCR_PULMD_DOWN (2 << 6)
-#define PORTCR_PULMD_UP (3 << 6)
-#define PORTCR_PULMD_MASK (3 << 6)
-
 static const unsigned int r8a73a4_portcr_offsets[] = {
 	0x00000000, 0x00001000, 0x00000000, 0x00001000,
 	0x00001000, 0x00002000, 0x00002000, 0x00002000,
 	0x00002000, 0x00003000, 0x00003000,
 };
 
-static unsigned int r8a73a4_pinmux_get_bias(struct sh_pfc *pfc,
-					    unsigned int pin)
-{
-	void __iomem *addr;
-
-	addr = pfc->windows->virt + r8a73a4_portcr_offsets[pin >> 5] + pin;
-
-	switch (ioread8(addr) & PORTCR_PULMD_MASK) {
-	case PORTCR_PULMD_UP:
-		return PIN_CONFIG_BIAS_PULL_UP;
-	case PORTCR_PULMD_DOWN:
-		return PIN_CONFIG_BIAS_PULL_DOWN;
-	case PORTCR_PULMD_OFF:
-	default:
-		return PIN_CONFIG_BIAS_DISABLE;
-	}
-}
-
-static void r8a73a4_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				   unsigned int bias)
+static void __iomem *r8a73a4_pin_to_portcr(struct sh_pfc *pfc, unsigned int pin)
 {
-	void __iomem *addr;
-	u32 value;
-
-	addr = pfc->windows->virt + r8a73a4_portcr_offsets[pin >> 5] + pin;
-	value = ioread8(addr) & ~PORTCR_PULMD_MASK;
-
-	switch (bias) {
-	case PIN_CONFIG_BIAS_PULL_UP:
-		value |= PORTCR_PULMD_UP;
-		break;
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-		value |= PORTCR_PULMD_DOWN;
-		break;
-	}
-
-	iowrite8(value, addr);
+	return pfc->windows->virt + r8a73a4_portcr_offsets[pin >> 5] + pin;
 }
 
 static const struct sh_pfc_soc_operations r8a73a4_pfc_ops = {
-	.get_bias = r8a73a4_pinmux_get_bias,
-	.set_bias = r8a73a4_pinmux_set_bias,
+	.get_bias = rmobile_pinmux_get_bias,
+	.set_bias = rmobile_pinmux_set_bias,
+	.pin_to_portcr = r8a73a4_pin_to_portcr,
 };
 
 const struct sh_pfc_soc_info r8a73a4_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
index fdf1b0f09f57e693..4eac3899d69bc488 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7740.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7740.c
@@ -3672,11 +3672,6 @@ static const struct pinmux_irq pinmux_irqs[] = {
 	PINMUX_IRQ(41,  167),	/* IRQ31A */
 };
 
-#define PORTnCR_PULMD_OFF	(0 << 6)
-#define PORTnCR_PULMD_DOWN	(2 << 6)
-#define PORTnCR_PULMD_UP	(3 << 6)
-#define PORTnCR_PULMD_MASK	(3 << 6)
-
 struct r8a7740_portcr_group {
 	unsigned int end_pin;
 	unsigned int offset;
@@ -3686,7 +3681,7 @@ static const struct r8a7740_portcr_group r8a7740_portcr_offsets[] = {
 	{ 83, 0x0000 }, { 114, 0x1000 }, { 209, 0x2000 }, { 211, 0x3000 },
 };
 
-static void __iomem *r8a7740_pinmux_portcr(struct sh_pfc *pfc, unsigned int pin)
+static void __iomem *r8a7740_pin_to_portcr(struct sh_pfc *pfc, unsigned int pin)
 {
 	unsigned int i;
 
@@ -3701,43 +3696,10 @@ static void __iomem *r8a7740_pinmux_portcr(struct sh_pfc *pfc, unsigned int pin)
 	return NULL;
 }
 
-static unsigned int r8a7740_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
-{
-	void __iomem *addr = r8a7740_pinmux_portcr(pfc, pin);
-	u32 value = ioread8(addr) & PORTnCR_PULMD_MASK;
-
-	switch (value) {
-	case PORTnCR_PULMD_UP:
-		return PIN_CONFIG_BIAS_PULL_UP;
-	case PORTnCR_PULMD_DOWN:
-		return PIN_CONFIG_BIAS_PULL_DOWN;
-	case PORTnCR_PULMD_OFF:
-	default:
-		return PIN_CONFIG_BIAS_DISABLE;
-	}
-}
-
-static void r8a7740_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				   unsigned int bias)
-{
-	void __iomem *addr = r8a7740_pinmux_portcr(pfc, pin);
-	u32 value = ioread8(addr) & ~PORTnCR_PULMD_MASK;
-
-	switch (bias) {
-	case PIN_CONFIG_BIAS_PULL_UP:
-		value |= PORTnCR_PULMD_UP;
-		break;
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-		value |= PORTnCR_PULMD_DOWN;
-		break;
-	}
-
-	iowrite8(value, addr);
-}
-
 static const struct sh_pfc_soc_operations r8a7740_pfc_ops = {
-	.get_bias = r8a7740_pinmux_get_bias,
-	.set_bias = r8a7740_pinmux_set_bias,
+	.get_bias = rmobile_pinmux_get_bias,
+	.set_bias = rmobile_pinmux_set_bias,
+	.pin_to_portcr = r8a7740_pin_to_portcr,
 };
 
 const struct sh_pfc_soc_info r8a7740_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index 96b91e95b1e14de1..ed6db809e80de3b7 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -13,7 +13,6 @@
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CPU_ALL_PORT(fn, pfx, sfx)					\
@@ -4310,50 +4309,14 @@ static const struct regulator_init_data sh73a0_vccq_mc0_init_data = {
  * Pin bias
  */
 
-#define PORTnCR_PULMD_OFF	(0 << 6)
-#define PORTnCR_PULMD_DOWN	(2 << 6)
-#define PORTnCR_PULMD_UP	(3 << 6)
-#define PORTnCR_PULMD_MASK	(3 << 6)
-
 static const unsigned int sh73a0_portcr_offsets[] = {
 	0x00000000, 0x00001000, 0x00001000, 0x00002000, 0x00002000,
 	0x00002000, 0x00002000, 0x00003000, 0x00003000, 0x00002000,
 };
 
-static unsigned int sh73a0_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
+static void __iomem *sh73a0_pin_to_portcr(struct sh_pfc *pfc, unsigned int pin)
 {
-	void __iomem *addr = pfc->windows->virt
-			   + sh73a0_portcr_offsets[pin >> 5] + pin;
-	u32 value = ioread8(addr) & PORTnCR_PULMD_MASK;
-
-	switch (value) {
-	case PORTnCR_PULMD_UP:
-		return PIN_CONFIG_BIAS_PULL_UP;
-	case PORTnCR_PULMD_DOWN:
-		return PIN_CONFIG_BIAS_PULL_DOWN;
-	case PORTnCR_PULMD_OFF:
-	default:
-		return PIN_CONFIG_BIAS_DISABLE;
-	}
-}
-
-static void sh73a0_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-				   unsigned int bias)
-{
-	void __iomem *addr = pfc->windows->virt
-			   + sh73a0_portcr_offsets[pin >> 5] + pin;
-	u32 value = ioread8(addr) & ~PORTnCR_PULMD_MASK;
-
-	switch (bias) {
-	case PIN_CONFIG_BIAS_PULL_UP:
-		value |= PORTnCR_PULMD_UP;
-		break;
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-		value |= PORTnCR_PULMD_DOWN;
-		break;
-	}
-
-	iowrite8(value, addr);
+	return pfc->windows->virt + sh73a0_portcr_offsets[pin >> 5] + pin;
 }
 
 /* -----------------------------------------------------------------------------
@@ -4383,8 +4346,9 @@ static int sh73a0_pinmux_soc_init(struct sh_pfc *pfc)
 
 static const struct sh_pfc_soc_operations sh73a0_pfc_ops = {
 	.init = sh73a0_pinmux_soc_init,
-	.get_bias = sh73a0_pinmux_get_bias,
-	.set_bias = sh73a0_pinmux_set_bias,
+	.get_bias = rmobile_pinmux_get_bias,
+	.set_bias = rmobile_pinmux_set_bias,
+	.pin_to_portcr = sh73a0_pin_to_portcr,
 };
 
 const struct sh_pfc_soc_info sh73a0_pinmux_info = {
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 963d217b940372b9..b7ebbc877b544305 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
@@ -902,3 +903,42 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 
 	sh_pfc_write(pfc, reg->puen, enable);
 }
+
+#define PORTnCR_PULMD_OFF	(0 << 6)
+#define PORTnCR_PULMD_DOWN	(2 << 6)
+#define PORTnCR_PULMD_UP	(3 << 6)
+#define PORTnCR_PULMD_MASK	(3 << 6)
+
+unsigned int rmobile_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
+{
+	void __iomem *reg = pfc->info->ops->pin_to_portcr(pfc, pin);
+	u32 value = ioread8(reg) & PORTnCR_PULMD_MASK;
+
+	switch (value) {
+	case PORTnCR_PULMD_UP:
+		return PIN_CONFIG_BIAS_PULL_UP;
+	case PORTnCR_PULMD_DOWN:
+		return PIN_CONFIG_BIAS_PULL_DOWN;
+	case PORTnCR_PULMD_OFF:
+	default:
+		return PIN_CONFIG_BIAS_DISABLE;
+	}
+}
+
+void rmobile_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
+			     unsigned int bias)
+{
+	void __iomem *reg = pfc->info->ops->pin_to_portcr(pfc, pin);
+	u32 value = ioread8(reg) & ~PORTnCR_PULMD_MASK;
+
+	switch (bias) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		value |= PORTnCR_PULMD_UP;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		value |= PORTnCR_PULMD_DOWN;
+		break;
+	}
+
+	iowrite8(value, reg);
+}
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 2d511c7280fa49e3..8dc0fbb012b0c970 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -273,6 +273,7 @@ struct sh_pfc_soc_operations {
 	void (*set_bias)(struct sh_pfc *pfc, unsigned int pin,
 			 unsigned int bias);
 	int (*pin_to_pocctrl)(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl);
+	void __iomem * (*pin_to_portcr)(struct sh_pfc *pfc, unsigned int pin);
 };
 
 struct sh_pfc_soc_info {
@@ -780,4 +781,8 @@ unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
 void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 			  unsigned int bias);
 
+unsigned int rmobile_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
+void rmobile_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
+			     unsigned int bias);
+
 #endif /* __SH_PFC_H */
-- 
2.25.1

