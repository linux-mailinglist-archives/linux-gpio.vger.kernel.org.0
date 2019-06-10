Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F193BAB6
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfFJRNM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:13:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58126 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbfFJRNL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:13:11 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHD1FM110334;
        Mon, 10 Jun 2019 12:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186781;
        bh=2ZgA57Gdj2rwJ+EjwsPy+BIiDag1tZJkzLFveUqMaUM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Cu5p+NWBaoCwrtuF5r39XcfrFrcUgRIulAk4e0E7orQ65GtFS6rN9Wcc6gG4TF7ai
         2LOTBv79u/tAUhxwEhDCCgYwLZzMR1/ECinRqkLLcUTqPDmLMU8Kbl7tTARQnj7XkQ
         iKpGpe8zB0jCA0ZqWNCAuK6JFL9VBZweh+ZWiyr0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHD1Ya046872
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:13:01 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:13:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:13:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHD0v2039868;
        Mon, 10 Jun 2019 12:13:00 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Russell King <rmk@arm.linux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH-next 17/20] gpio: gpio-omap: constify register tables
Date:   Mon, 10 Jun 2019 20:11:00 +0300
Message-ID: <20190610171103.30903-18-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610171103.30903-1-grygorii.strashko@ti.com>
References: <20190610171103.30903-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>

We must never alter the register tables; these are read-only as far
as the driver is concerned.  Constify these tables.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c                | 12 ++++++------
 include/linux/platform_data/gpio-omap.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 1c5fa12bcf9f..039bbb1ae6cb 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -48,6 +48,8 @@ struct gpio_regs {
 
 struct gpio_bank {
 	void __iomem *base;
+	const struct omap_gpio_reg_offs *regs;
+
 	int irq;
 	u32 non_wakeup_gpios;
 	u32 enabled_non_wakeup_gpios;
@@ -75,8 +77,6 @@ struct gpio_bank {
 
 	void (*set_dataout)(struct gpio_bank *bank, unsigned gpio, int enable);
 	int (*get_context_loss_count)(struct device *dev);
-
-	struct omap_gpio_reg_offs *regs;
 };
 
 #define GPIO_MOD_CTRL_BIT	BIT(0)
@@ -1075,7 +1075,7 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 
 static void omap_gpio_init_context(struct gpio_bank *p)
 {
-	struct omap_gpio_reg_offs *regs = p->regs;
+	const struct omap_gpio_reg_offs *regs = p->regs;
 	void __iomem *base = p->base;
 
 	p->context.ctrl		= readl_relaxed(base + regs->ctrl);
@@ -1094,7 +1094,7 @@ static void omap_gpio_init_context(struct gpio_bank *p)
 
 static void omap_gpio_restore_context(struct gpio_bank *bank)
 {
-	struct omap_gpio_reg_offs *regs = bank->regs;
+	const struct omap_gpio_reg_offs *regs = bank->regs;
 	void __iomem *base = bank->base;
 
 	writel_relaxed(bank->context.wake_en, base + regs->wkup_en);
@@ -1267,7 +1267,7 @@ static int gpio_omap_cpu_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static struct omap_gpio_reg_offs omap2_gpio_regs = {
+static const struct omap_gpio_reg_offs omap2_gpio_regs = {
 	.revision =		OMAP24XX_GPIO_REVISION,
 	.direction =		OMAP24XX_GPIO_OE,
 	.datain =		OMAP24XX_GPIO_DATAIN,
@@ -1290,7 +1290,7 @@ static struct omap_gpio_reg_offs omap2_gpio_regs = {
 	.fallingdetect =	OMAP24XX_GPIO_FALLINGDETECT,
 };
 
-static struct omap_gpio_reg_offs omap4_gpio_regs = {
+static const struct omap_gpio_reg_offs omap4_gpio_regs = {
 	.revision =		OMAP4_GPIO_REVISION,
 	.direction =		OMAP4_GPIO_OE,
 	.datain =		OMAP4_GPIO_DATAIN,
diff --git a/include/linux/platform_data/gpio-omap.h b/include/linux/platform_data/gpio-omap.h
index 17edc43201d2..8b30b14b47d3 100644
--- a/include/linux/platform_data/gpio-omap.h
+++ b/include/linux/platform_data/gpio-omap.h
@@ -186,7 +186,7 @@ struct omap_gpio_platform_data {
 	bool is_mpuio;		/* whether the bank is of type MPUIO */
 	u32 non_wakeup_gpios;
 
-	struct omap_gpio_reg_offs *regs;
+	const struct omap_gpio_reg_offs *regs;
 
 	/* Return context loss count due to PM states changing */
 	int (*get_context_loss_count)(struct device *dev);
-- 
2.17.1

