Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D732362E91
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Apr 2021 10:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhDQIjM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Apr 2021 04:39:12 -0400
Received: from muru.com ([72.249.23.125]:55482 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229631AbhDQIjL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 17 Apr 2021 04:39:11 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 411D980CD;
        Sat, 17 Apr 2021 08:40:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [PATCHv2] gpio: omap: Save and restore sysconfig
Date:   Sat, 17 Apr 2021 11:38:39 +0300
Message-Id: <20210417083839.46985-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As we are using cpu_pm to save and restore context, we must also save and
restore the GPIO sysconfig register. This is needed because we are not
calling PM runtime functions at all with cpu_pm.

We need to save the sysconfig on idle as it's value can get reconfigured by
PM runtime and can be different from the init time value. Device specific
flags like "ti,no-idle-on-init" can affect the init value.

Fixes: b764a5863fd8 ("gpio: omap: Remove custom PM calls and use cpu_pm instead")
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Adam Ford <aford173@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpio/gpio-omap.c                | 9 +++++++++
 include/linux/platform_data/gpio-omap.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -29,6 +29,7 @@
 #define OMAP4_GPIO_DEBOUNCINGTIME_MASK 0xFF
 
 struct gpio_regs {
+	u32 sysconfig;
 	u32 irqenable1;
 	u32 irqenable2;
 	u32 wake_en;
@@ -1069,6 +1070,7 @@ static void omap_gpio_init_context(struct gpio_bank *p)
 	const struct omap_gpio_reg_offs *regs = p->regs;
 	void __iomem *base = p->base;
 
+	p->context.sysconfig	= readl_relaxed(base + regs->sysconfig);
 	p->context.ctrl		= readl_relaxed(base + regs->ctrl);
 	p->context.oe		= readl_relaxed(base + regs->direction);
 	p->context.wake_en	= readl_relaxed(base + regs->wkup_en);
@@ -1088,6 +1090,7 @@ static void omap_gpio_restore_context(struct gpio_bank *bank)
 	const struct omap_gpio_reg_offs *regs = bank->regs;
 	void __iomem *base = bank->base;
 
+	writel_relaxed(bank->context.sysconfig, base + regs->sysconfig);
 	writel_relaxed(bank->context.wake_en, base + regs->wkup_en);
 	writel_relaxed(bank->context.ctrl, base + regs->ctrl);
 	writel_relaxed(bank->context.leveldetect0, base + regs->leveldetect0);
@@ -1115,6 +1118,10 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
 
 	bank->saved_datain = readl_relaxed(base + bank->regs->datain);
 
+	/* Save syconfig, it's runtime value can be different from init value */
+	if (bank->loses_context)
+		bank->context.sysconfig = readl_relaxed(base + bank->regs->sysconfig);
+
 	if (!bank->enabled_non_wakeup_gpios)
 		goto update_gpio_context_count;
 
@@ -1279,6 +1286,7 @@ static int gpio_omap_cpu_notifier(struct notifier_block *nb,
 
 static const struct omap_gpio_reg_offs omap2_gpio_regs = {
 	.revision =		OMAP24XX_GPIO_REVISION,
+	.sysconfig =		OMAP24XX_GPIO_SYSCONFIG,
 	.direction =		OMAP24XX_GPIO_OE,
 	.datain =		OMAP24XX_GPIO_DATAIN,
 	.dataout =		OMAP24XX_GPIO_DATAOUT,
@@ -1302,6 +1310,7 @@ static const struct omap_gpio_reg_offs omap2_gpio_regs = {
 
 static const struct omap_gpio_reg_offs omap4_gpio_regs = {
 	.revision =		OMAP4_GPIO_REVISION,
+	.sysconfig =		OMAP4_GPIO_SYSCONFIG,
 	.direction =		OMAP4_GPIO_OE,
 	.datain =		OMAP4_GPIO_DATAIN,
 	.dataout =		OMAP4_GPIO_DATAOUT,
diff --git a/include/linux/platform_data/gpio-omap.h b/include/linux/platform_data/gpio-omap.h
--- a/include/linux/platform_data/gpio-omap.h
+++ b/include/linux/platform_data/gpio-omap.h
@@ -85,6 +85,7 @@
  * omap2+ specific GPIO registers
  */
 #define OMAP24XX_GPIO_REVISION		0x0000
+#define OMAP24XX_GPIO_SYSCONFIG		0x0010
 #define OMAP24XX_GPIO_IRQSTATUS1	0x0018
 #define OMAP24XX_GPIO_IRQSTATUS2	0x0028
 #define OMAP24XX_GPIO_IRQENABLE2	0x002c
@@ -108,6 +109,7 @@
 #define OMAP24XX_GPIO_SETDATAOUT	0x0094
 
 #define OMAP4_GPIO_REVISION		0x0000
+#define OMAP4_GPIO_SYSCONFIG		0x0010
 #define OMAP4_GPIO_EOI			0x0020
 #define OMAP4_GPIO_IRQSTATUSRAW0	0x0024
 #define OMAP4_GPIO_IRQSTATUSRAW1	0x0028
@@ -148,6 +150,7 @@
 #ifndef __ASSEMBLER__
 struct omap_gpio_reg_offs {
 	u16 revision;
+	u16 sysconfig;
 	u16 direction;
 	u16 datain;
 	u16 dataout;
-- 
2.31.1
