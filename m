Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC8C2EF338
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbhAHNi4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:38:56 -0500
Received: from mail-lf1-f53.google.com ([209.85.167.53]:45646 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbhAHNi4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 08:38:56 -0500
Received: by mail-lf1-f53.google.com with SMTP id x20so22864550lfe.12;
        Fri, 08 Jan 2021 05:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YFIMnx0/qh1yzmAUWRJuZfztiv2d/V/JwA5g7mOs9Wg=;
        b=qXmQ0y3wPSIwis5wbQZ7/Bxh2U/j8kW55Snbi0CKslCyTsfsuZUSojh4V/M9bTkxaB
         i/9drvacoy87inBHJg3JNG/aUsAjznjcoGbBNcBKNJCxdRz1DXuxcvxZXQ1H9LD1OvKU
         S3Wlfi8O8mDHQdCAag5Vuu9yLaPMNSmfjy2r+CnagXbRIIg8RLjkkdvVpZSN0AgbKPD8
         5E6CzdzRjNzQR/XAaySEj/5EVaSARFx/WA7KL/KjxQkxtJaepADUx2swMY3XVPiNXEYD
         R8B4H9julTR0JOIZpkAzF7+gi7ff0ksEA4piOXVuud63uSUZQAlV7C8IN8aznz3xsC+C
         y2Kg==
X-Gm-Message-State: AOAM533s/3gGYlhTrYHjMABNd/4QXyf0Pxf3RnauVl9F3N6g2w2EAZQZ
        bmOVsZbTQB2Q0oCfzwRkBGk=
X-Google-Smtp-Source: ABdhPJxT4px5BUGcrFjRoO/2MGscUjJdd3v403ZUwUjSAftM1TKVmY66J4/GMfRu2xp03e4S6I0JuA==
X-Received: by 2002:a19:e612:: with SMTP id d18mr1592400lfh.501.1610113088796;
        Fri, 08 Jan 2021 05:38:08 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id t25sm1986729lfl.105.2021.01.08.05.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:38:08 -0800 (PST)
Date:   Fri, 8 Jan 2021 15:37:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH 08/15] mfd: Support for ROHM BD71815 PMIC core
Message-ID: <40d797cc7de8d0bbde3daf5efabed9b6bb54c8c7.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add core support for ROHM BD71815 Power Management IC.

The IC integrates regulators, a battery charger with a coulomb counter,
a real-time clock (RTC), clock gate and general-purpose outputs (GPO).

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/mfd/Kconfig              |  15 +-
 drivers/mfd/rohm-bd71828.c       | 416 ++++++++++++++++++++--
 include/linux/mfd/rohm-bd71815.h | 584 +++++++++++++++++++++++++++++++
 include/linux/mfd/rohm-bd71828.h |   3 +
 4 files changed, 975 insertions(+), 43 deletions(-)
 create mode 100644 include/linux/mfd/rohm-bd71815.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 8b99a13669bf..eb8bfb663dfa 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1996,19 +1996,20 @@ config MFD_ROHM_BD70528
 	  charger.
 
 config MFD_ROHM_BD71828
-	tristate "ROHM BD71828 Power Management IC"
+	tristate "ROHM BD71828 and BD71815 Power Management IC"
 	depends on I2C=y
 	depends on OF
 	select REGMAP_I2C
 	select REGMAP_IRQ
 	select MFD_CORE
 	help
-	  Select this option to get support for the ROHM BD71828 Power
-	  Management IC. BD71828GW is a single-chip power management IC for
-	  battery-powered portable devices. The IC integrates 7 buck
-	  converters, 7 LDOs, and a 1500 mA single-cell linear charger.
-	  Also included is a Coulomb counter, a real-time clock (RTC), and
-	  a 32.768 kHz clock gate.
+	  Select this option to get support for the ROHM BD71828 and BD71815
+	  Power Management ICs. BD71828GW and BD71815AGW are single-chip power
+	  management ICs mainly for battery-powered portable devices.
+	  The BD71828 integrates 7 buck converters and 7 LDOs. The BD71815
+	  has 5 bucks, 7 LDOs, and a boost for driving LEDs. Both ICs provide
+	  also a single-cell linear charger, a Coulomb counter, a real-time
+	  clock (RTC), GPIOs and a 32.768 kHz clock gate.
 
 config MFD_STM32_LPTIMER
 	tristate "Support for STM32 Low-Power Timer"
diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 210261d026f2..28b82477ce4c 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -2,7 +2,7 @@
 //
 // Copyright (C) 2019 ROHM Semiconductors
 //
-// ROHM BD71828 PMIC driver
+// ROHM BD71828/BD71815 PMIC driver
 
 #include <linux/gpio_keys.h>
 #include <linux/i2c.h>
@@ -11,7 +11,9 @@
 #include <linux/ioport.h>
 #include <linux/irq.h>
 #include <linux/mfd/core.h>
+#include <linux/mfd/rohm-bd71815.h>
 #include <linux/mfd/rohm-bd71828.h>
+#include <linux/mfd/rohm-generic.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
@@ -29,12 +31,102 @@ static struct gpio_keys_platform_data bd71828_powerkey_data = {
 	.name = "bd71828-pwrkey",
 };
 
-static const struct resource rtc_irqs[] = {
+static const struct resource bd71815_rtc_irqs[] = {
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd71815-rtc-alm-0"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd71815-rtc-alm-1"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC2, "bd71815-rtc-alm-2"),
+};
+
+static const struct resource bd71828_rtc_irqs[] = {
 	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
 	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
 	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd71828-rtc-alm-2"),
 };
 
+static struct resource bd71815_power_irqs[] = {
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_RMV, "bd71815-dcin-rmv"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_OUT, "bd71815-clps-out"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_IN, "bd71815-clps-in"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_OVP_RES, "bd71815-dcin-ovp-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_OVP_DET, "bd71815-dcin-ovp-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_MON_RES, "bd71815-dcin-mon-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_MON_DET, "bd71815-dcin-mon-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_UV_RES, "bd71815-vsys-uv-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_UV_DET, "bd71815-vsys-uv-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_LOW_RES, "bd71815-vsys-low-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_LOW_DET, "bd71815-vsys-low-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_MON_RES, "bd71815-vsys-mon-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_MON_RES, "bd71815-vsys-mon-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_WDG_TEMP, "bd71815-chg-wdg-temp"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_WDG_TIME, "bd71815-chg-wdg"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RECHARGE_RES, "bd71815-rechg-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RECHARGE_DET, "bd71815-rechg-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RANGED_TEMP_TRANSITION,
+			     "bd71815-ranged-temp-transit"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_STATE_TRANSITION,
+			     "bd71815-chg-state-change"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_TEMP_NORMAL,
+			     "bd71815-bat-temp-normal"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_TEMP_ERANGE,
+			     "bd71815-bat-temp-erange"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_REMOVED, "bd71815-bat-rmv"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_DETECTED, "bd71815-bat-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_THERM_REMOVED, "bd71815-therm-rmv"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_THERM_DETECTED, "bd71815-therm-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_DEAD, "bd71815-bat-dead"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_SHORTC_RES,
+			     "bd71815-bat-short-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_SHORTC_DET,
+			     "bd71815-bat-short-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_LOW_VOLT_RES,
+			     "bd71815-bat-low-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_LOW_VOLT_DET,
+			     "bd71815-bat-low-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_VOLT_RES,
+			     "bd71815-bat-over-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_VOLT_DET,
+			     "bd71815-bat-over-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_MON_RES, "bd71815-bat-mon-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_MON_DET, "bd71815-bat-mon-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_CC_MON1, "bd71815-bat-cc-mon1"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_CC_MON2, "bd71815-bat-cc-mon2"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_CC_MON3, "bd71815-bat-cc-mon3"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_1_RES,
+			     "bd71815-bat-oc1-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_1_DET,
+			     "bd71815-bat-oc1-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_2_RES,
+			     "bd71815-bat-oc2-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_2_DET,
+			     "bd71815-bat-oc2-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_3_RES,
+			     "bd71815-bat-oc3-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_3_DET,
+			     "bd71815-bat-oc3-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_LOW_RES,
+			     "bd71815-bat-low-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_LOW_DET,
+			     "bd71815-bat-low-det"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_HI_RES, "bd71815-bat-hi-res"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_HI_DET, "bd71815-bat-hi-det"),
+};
+
+static struct mfd_cell bd71815_mfd_cells[] = {
+	{ .name = "bd71815-pmic", },
+	{ .name = "bd71815-clk", },
+	{ .name = "bd71815-gpo", },
+	{
+		.name = "bd71815-power",
+		.num_resources = ARRAY_SIZE(bd71815_power_irqs),
+		.resources = &bd71815_power_irqs[0],
+	},
+	{
+		.name = "bd71815-rtc",
+		.num_resources = ARRAY_SIZE(bd71815_rtc_irqs),
+		.resources = &bd71815_rtc_irqs[0],
+	},
+};
+
 static struct mfd_cell bd71828_mfd_cells[] = {
 	{ .name = "bd71828-pmic", },
 	{ .name = "bd71828-gpio", },
@@ -47,8 +139,8 @@ static struct mfd_cell bd71828_mfd_cells[] = {
 	{ .name = "bd71827-power", },
 	{
 		.name = "bd71828-rtc",
-		.resources = rtc_irqs,
-		.num_resources = ARRAY_SIZE(rtc_irqs),
+		.resources = bd71828_rtc_irqs,
+		.num_resources = ARRAY_SIZE(bd71828_rtc_irqs),
 	}, {
 		.name = "gpio-keys",
 		.platform_data = &bd71828_powerkey_data,
@@ -56,7 +148,35 @@ static struct mfd_cell bd71828_mfd_cells[] = {
 	},
 };
 
-static const struct regmap_range volatile_ranges[] = {
+static const struct regmap_range bd71815_volatile_ranges[] = {
+	{
+		.range_min = BD71815_REG_SEC,
+		.range_max = BD71815_REG_YEAR,
+	}, {
+		.range_min = BD71815_REG_CONF,
+		.range_max = BD71815_REG_BAT_TEMP,
+	}, {
+		.range_min = BD71815_REG_VM_IBAT_U,
+		.range_max = BD71815_REG_CC_CTRL,
+	}, {
+		.range_min = BD71815_REG_CC_STAT,
+		.range_max = BD71815_REG_CC_CURCD_L,
+	}, {
+		.range_min = BD71815_REG_VM_BTMP_MON,
+		.range_max = BD71815_REG_VM_BTMP_MON,
+	}, {
+		.range_min = BD71815_REG_INT_STAT,
+		.range_max = BD71815_REG_INT_UPDATE,
+	}, {
+		.range_min = BD71815_REG_VM_VSYS_U,
+		.range_max = BD71815_REG_REX_CTRL_1,
+	}, {
+		.range_min = BD71815_REG_FULL_CCNTD_3,
+		.range_max = BD71815_REG_CCNTD_CHG_2,
+	},
+};
+
+static const struct regmap_range bd71828_volatile_ranges[] = {
 	{
 		.range_min = BD71828_REG_PS_CTRL_1,
 		.range_max = BD71828_REG_PS_CTRL_1,
@@ -80,15 +200,28 @@ static const struct regmap_range volatile_ranges[] = {
 	},
 };
 
-static const struct regmap_access_table volatile_regs = {
-	.yes_ranges = &volatile_ranges[0],
-	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
+static const struct regmap_access_table bd71815_volatile_regs = {
+	.yes_ranges = &bd71815_volatile_ranges[0],
+	.n_yes_ranges = ARRAY_SIZE(bd71815_volatile_ranges),
+};
+
+static const struct regmap_access_table bd71828_volatile_regs = {
+	.yes_ranges = &bd71828_volatile_ranges[0],
+	.n_yes_ranges = ARRAY_SIZE(bd71828_volatile_ranges),
+};
+
+static const struct regmap_config bd71815_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_table = &bd71815_volatile_regs,
+	.max_register = BD71815_MAX_REGISTER - 1,
+	.cache_type = REGCACHE_RBTREE,
 };
 
-static struct regmap_config bd71828_regmap = {
+static const struct regmap_config bd71828_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.volatile_table = &volatile_regs,
+	.volatile_table = &bd71828_volatile_regs,
 	.max_register = BD71828_MAX_REGISTER,
 	.cache_type = REGCACHE_RBTREE,
 };
@@ -96,7 +229,7 @@ static struct regmap_config bd71828_regmap = {
 /*
  * Mapping of main IRQ register bits to sub-IRQ register offsets so that we can
  * access corect sub-IRQ registers based on bits that are set in main IRQ
- * register.
+ * register. BD71815 and BD71828 have same sub-register-block offests.
  */
 
 static unsigned int bit0_offsets[] = {11};		/* RTC IRQ */
@@ -108,7 +241,7 @@ static unsigned int bit5_offsets[] = {3};		/* VSYS IRQ */
 static unsigned int bit6_offsets[] = {1, 2};		/* DCIN IRQ */
 static unsigned int bit7_offsets[] = {0};		/* BUCK IRQ */
 
-static struct regmap_irq_sub_irq_map bd71828_sub_irq_offsets[] = {
+static struct regmap_irq_sub_irq_map bd718xx_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
@@ -119,6 +252,130 @@ static struct regmap_irq_sub_irq_map bd71828_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
 };
 
+static const struct regmap_irq bd71815_irqs[] = {
+	REGMAP_IRQ_REG(BD71815_INT_BUCK1_OCP, 0, BD71815_INT_BUCK1_OCP_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BUCK2_OCP, 0, BD71815_INT_BUCK2_OCP_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BUCK3_OCP, 0, BD71815_INT_BUCK3_OCP_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BUCK4_OCP, 0, BD71815_INT_BUCK4_OCP_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BUCK5_OCP, 0, BD71815_INT_BUCK5_OCP_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_LED_OVP, 0, BD71815_INT_LED_OVP_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_LED_OCP, 0, BD71815_INT_LED_OCP_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_LED_SCP, 0, BD71815_INT_LED_SCP_MASK),
+	/* DCIN1 interrupts */
+	REGMAP_IRQ_REG(BD71815_INT_DCIN_RMV, 1, BD71815_INT_DCIN_RMV_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_CLPS_OUT, 1, BD71815_INT_CLPS_OUT_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_CLPS_IN, 1, BD71815_INT_CLPS_IN_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_DCIN_OVP_RES, 1,
+		       BD71815_INT_DCIN_OVP_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_DCIN_OVP_DET, 1,
+		       BD71815_INT_DCIN_OVP_DET_MASK),
+	/* DCIN2 interrupts */
+	REGMAP_IRQ_REG(BD71815_INT_DCIN_MON_RES, 2,
+		       BD71815_INT_DCIN_MON_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_DCIN_MON_DET, 2,
+		       BD71815_INT_DCIN_MON_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_WDOG, 2, BD71815_INT_WDOG_MASK),
+	/* Vsys */
+	REGMAP_IRQ_REG(BD71815_INT_VSYS_UV_RES, 3,
+		       BD71815_INT_VSYS_UV_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_VSYS_UV_DET, 3,
+		       BD71815_INT_VSYS_UV_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_VSYS_LOW_RES, 3,
+		       BD71815_INT_VSYS_LOW_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_VSYS_LOW_DET, 3,
+		       BD71815_INT_VSYS_LOW_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_VSYS_MON_RES, 3,
+		       BD71815_INT_VSYS_MON_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_VSYS_MON_DET, 3,
+		       BD71815_INT_VSYS_MON_DET_MASK),
+	/* Charger */
+	REGMAP_IRQ_REG(BD71815_INT_CHG_WDG_TEMP, 4,
+		       BD71815_INT_CHG_WDG_TEMP_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_CHG_WDG_TIME, 4,
+		       BD71815_INT_CHG_WDG_TIME_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_CHG_RECHARGE_RES, 4,
+		       BD71815_INT_CHG_RECHARGE_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_CHG_RECHARGE_DET, 4,
+		       BD71815_INT_CHG_RECHARGE_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_CHG_RANGED_TEMP_TRANSITION, 4,
+		       BD71815_INT_CHG_RANGED_TEMP_TRANSITION_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_CHG_STATE_TRANSITION, 4,
+		       BD71815_INT_CHG_STATE_TRANSITION_MASK),
+	/* Battery */
+	REGMAP_IRQ_REG(BD71815_INT_BAT_TEMP_NORMAL, 5,
+		       BD71815_INT_BAT_TEMP_NORMAL_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_TEMP_ERANGE, 5,
+		       BD71815_INT_BAT_TEMP_ERANGE_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_REMOVED, 5,
+		       BD71815_INT_BAT_REMOVED_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_DETECTED, 5,
+		       BD71815_INT_BAT_DETECTED_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_THERM_REMOVED, 5,
+		       BD71815_INT_THERM_REMOVED_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_THERM_DETECTED, 5,
+		       BD71815_INT_THERM_DETECTED_MASK),
+	/* Battery Mon 1 */
+	REGMAP_IRQ_REG(BD71815_INT_BAT_DEAD, 6, BD71815_INT_BAT_DEAD_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_SHORTC_RES, 6,
+		       BD71815_INT_BAT_SHORTC_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_SHORTC_DET, 6,
+		       BD71815_INT_BAT_SHORTC_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_LOW_VOLT_RES, 6,
+		       BD71815_INT_BAT_LOW_VOLT_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_LOW_VOLT_DET, 6,
+		       BD71815_INT_BAT_LOW_VOLT_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_OVER_VOLT_RES, 6,
+		       BD71815_INT_BAT_OVER_VOLT_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_OVER_VOLT_DET, 6,
+		       BD71815_INT_BAT_OVER_VOLT_DET_MASK),
+	/* Battery Mon 2 */
+	REGMAP_IRQ_REG(BD71815_INT_BAT_MON_RES, 7,
+		       BD71815_INT_BAT_MON_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_MON_DET, 7,
+		       BD71815_INT_BAT_MON_DET_MASK),
+	/* Battery Mon 3 (Coulomb counter) */
+	REGMAP_IRQ_REG(BD71815_INT_BAT_CC_MON1, 8,
+		       BD71815_INT_BAT_CC_MON1_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_CC_MON2, 8,
+		       BD71815_INT_BAT_CC_MON2_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_CC_MON3, 8,
+		       BD71815_INT_BAT_CC_MON3_MASK),
+	/* Battery Mon 4 */
+	REGMAP_IRQ_REG(BD71815_INT_BAT_OVER_CURR_1_RES, 9,
+		       BD71815_INT_BAT_OVER_CURR_1_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_OVER_CURR_1_DET, 9,
+		       BD71815_INT_BAT_OVER_CURR_1_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_OVER_CURR_2_RES, 9,
+		       BD71815_INT_BAT_OVER_CURR_2_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_OVER_CURR_2_DET, 9,
+		       BD71815_INT_BAT_OVER_CURR_2_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_OVER_CURR_3_RES, 9,
+		       BD71815_INT_BAT_OVER_CURR_3_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_BAT_OVER_CURR_3_DET, 9,
+		       BD71815_INT_BAT_OVER_CURR_3_DET_MASK),
+	/* Temperature */
+	REGMAP_IRQ_REG(BD71815_INT_TEMP_BAT_LOW_RES, 10,
+		       BD71815_INT_TEMP_BAT_LOW_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_TEMP_BAT_LOW_DET, 10,
+		       BD71815_INT_TEMP_BAT_LOW_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_TEMP_BAT_HI_RES, 10,
+		       BD71815_INT_TEMP_BAT_HI_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_TEMP_BAT_HI_DET, 10,
+		       BD71815_INT_TEMP_BAT_HI_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_TEMP_CHIP_OVER_125_RES, 10,
+		       BD71815_INT_TEMP_CHIP_OVER_125_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_TEMP_CHIP_OVER_125_DET, 10,
+		       BD71815_INT_TEMP_CHIP_OVER_125_DET_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_TEMP_CHIP_OVER_VF_RES, 10,
+		       BD71815_INT_TEMP_CHIP_OVER_VF_RES_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_TEMP_CHIP_OVER_VF_DET, 10,
+		       BD71815_INT_TEMP_CHIP_OVER_VF_DET_MASK),
+	/* RTC Alarm */
+	REGMAP_IRQ_REG(BD71815_INT_RTC0, 11, BD71815_INT_RTC0_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_RTC1, 11, BD71815_INT_RTC1_MASK),
+	REGMAP_IRQ_REG(BD71815_INT_RTC2, 11, BD71815_INT_RTC2_MASK),
+};
+
 static struct regmap_irq bd71828_irqs[] = {
 	REGMAP_IRQ_REG(BD71828_INT_BUCK1_OCP, 0, BD71828_INT_BUCK1_OCP_MASK),
 	REGMAP_IRQ_REG(BD71828_INT_BUCK2_OCP, 0, BD71828_INT_BUCK2_OCP_MASK),
@@ -267,57 +524,138 @@ static struct regmap_irq_chip bd71828_irq_chip = {
 	.init_ack_masked = true,
 	.num_regs = 12,
 	.num_main_regs = 1,
-	.sub_reg_offsets = &bd71828_sub_irq_offsets[0],
+	.sub_reg_offsets = &bd718xx_sub_irq_offsets[0],
+	.num_main_status_bits = 8,
+	.irq_reg_stride = 1,
+};
+
+static struct regmap_irq_chip bd71815_irq_chip = {
+	.name = "bd71815_irq",
+	.main_status = BD71815_REG_INT_STAT,
+	.irqs = &bd71815_irqs[0],
+	.num_irqs = ARRAY_SIZE(bd71815_irqs),
+	.status_base = BD71815_REG_INT_STAT_01,
+	.mask_base = BD71815_REG_INT_EN_01,
+	.ack_base = BD71815_REG_INT_STAT_01,
+	.mask_invert = true,
+	.init_ack_masked = true,
+	.num_regs = 12,
+	.num_main_regs = 1,
+	.sub_reg_offsets = &bd718xx_sub_irq_offsets[0],
 	.num_main_status_bits = 8,
 	.irq_reg_stride = 1,
 };
 
+static int set_clk_mode(struct device *dev, struct regmap *regmap,
+			int clkmode_reg)
+{
+	int ret;
+	const char *mode;
+
+	ret = of_property_read_string_index(dev->of_node, "rohm,clkout-mode", 0,
+					    &mode);
+	if (ret) {
+		if (ret == -EINVAL)
+			return 0;
+		return ret;
+	}
+	if (!strncmp(mode, "open-drain", 10)) {
+		dev_dbg(dev, "configuring clk32kout as open-drain");
+		ret = regmap_update_bits(regmap, clkmode_reg, OUT32K_MODE,
+					 OUT32K_MODE_OPEN_DRAIN);
+	} else if (!strncmp(mode, "cmos", 4)) {
+		dev_dbg(dev, "configuring clk32kout as cmos");
+		ret = regmap_update_bits(regmap, clkmode_reg, OUT32K_MODE,
+					 OUT32K_MODE_CMOS);
+	} else {
+		dev_err(dev, "bad clk32kout mode configuration");
+		return -EINVAL;
+	}
+	return ret;
+}
+
 static int bd71828_i2c_probe(struct i2c_client *i2c)
 {
-	struct rohm_regmap_dev *chip;
 	struct regmap_irq_chip_data *irq_data;
 	int ret;
+	struct regmap *regmap;
+	const struct regmap_config *regmap_config;
+	struct regmap_irq_chip *irqchip;
+	unsigned int chip_type;
+	struct mfd_cell *mfd;
+	int cells;
+	int button_irq;
+	int clkmode_reg;
 
 	if (!i2c->irq) {
 		dev_err(&i2c->dev, "No IRQ configured\n");
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(&i2c->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	dev_set_drvdata(&i2c->dev, chip);
+	chip_type = (unsigned int)(uintptr_t)
+		    of_device_get_match_data(&i2c->dev);
+	switch (chip_type) {
+	case ROHM_CHIP_TYPE_BD71828:
+		mfd = bd71828_mfd_cells;
+		cells = ARRAY_SIZE(bd71828_mfd_cells);
+		regmap_config = &bd71828_regmap;
+		irqchip = &bd71828_irq_chip;
+		clkmode_reg = BD71815_REG_OUT32K;
+		button_irq = BD71828_INT_SHORTPUSH;
+		dev_info(&i2c->dev, "BD71828 found\n");
+		break;
+	case ROHM_CHIP_TYPE_BD71815:
+		mfd = bd71815_mfd_cells;
+		cells = ARRAY_SIZE(bd71815_mfd_cells);
+		regmap_config = &bd71815_regmap;
+		irqchip = &bd71815_irq_chip;
+		clkmode_reg = BD71828_REG_OUT32K;
+		/*
+		 * If BD71817 support is needed we should be able to handle it
+		 * with proper DT configs + BD71815 drivers + power-button.
+		 * BD71815 data-sheet does not list the power-button IRQ so we
+		 * don't use it.
+		 */
+		button_irq = 0;
+		dev_info(&i2c->dev, "BD71815 found\n");
+		break;
+	default:
+		dev_err(&i2c->dev, "Unknown device type");
+		return -EINVAL;
+	}
 
-	chip->regmap = devm_regmap_init_i2c(i2c, &bd71828_regmap);
-	if (IS_ERR(chip->regmap)) {
+	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+	if (IS_ERR(regmap)) {
 		dev_err(&i2c->dev, "Failed to initialize Regmap\n");
-		return PTR_ERR(chip->regmap);
+		return PTR_ERR(regmap);
 	}
 
-	ret = devm_regmap_add_irq_chip(&i2c->dev, chip->regmap,
-				       i2c->irq, IRQF_ONESHOT, 0,
-				       &bd71828_irq_chip, &irq_data);
+	ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, i2c->irq,
+				       IRQF_ONESHOT, 0, irqchip, &irq_data);
 	if (ret) {
 		dev_err(&i2c->dev, "Failed to add IRQ chip\n");
 		return ret;
 	}
 
 	dev_dbg(&i2c->dev, "Registered %d IRQs for chip\n",
-		bd71828_irq_chip.num_irqs);
+		irqchip->num_irqs);
 
-	ret = regmap_irq_get_virq(irq_data, BD71828_INT_SHORTPUSH);
-	if (ret < 0) {
-		dev_err(&i2c->dev, "Failed to get the power-key IRQ\n");
-		return ret;
+	if (button_irq) {
+		ret = regmap_irq_get_virq(irq_data, button_irq);
+		if (ret < 0) {
+			dev_err(&i2c->dev, "Failed to get the power-key IRQ\n");
+			return ret;
+		}
+
+		button.irq = ret;
 	}
 
-	button.irq = ret;
+	ret = set_clk_mode(&i2c->dev, regmap, clkmode_reg);
+	if (ret)
+		return ret;
 
-	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
-				   bd71828_mfd_cells,
-				   ARRAY_SIZE(bd71828_mfd_cells), NULL, 0,
-				   regmap_irq_get_domain(irq_data));
+	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, mfd, cells,
+				   NULL, 0, regmap_irq_get_domain(irq_data));
 	if (ret)
 		dev_err(&i2c->dev, "Failed to create subdevices\n");
 
@@ -325,7 +663,13 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct of_device_id bd71828_of_match[] = {
-	{ .compatible = "rohm,bd71828", },
+	{
+		.compatible = "rohm,bd71828",
+		.data = (void *)ROHM_CHIP_TYPE_BD71828,
+	}, {
+		.compatible = "rohm,bd71815",
+		.data = (void *)ROHM_CHIP_TYPE_BD71815,
+	 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, bd71828_of_match);
diff --git a/include/linux/mfd/rohm-bd71815.h b/include/linux/mfd/rohm-bd71815.h
new file mode 100644
index 000000000000..ae5b8a99de2d
--- /dev/null
+++ b/include/linux/mfd/rohm-bd71815.h
@@ -0,0 +1,584 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright 2014 Embest Technology Co. Ltd. Inc.
+ *
+ * Author: yanglsh@embest-tech.com
+ *
+ * 2020, 2021 Heavily modified by:
+ *	 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+ */
+
+#ifndef _MFD_BD71815_H
+#define _MFD_BD71815_H
+
+#include <linux/regmap.h>
+
+enum {
+	BD71815_BUCK1	=	0,
+	BD71815_BUCK2,
+	BD71815_BUCK3,
+	BD71815_BUCK4,
+	BD71815_BUCK5,
+	/* General Purpose */
+	BD71815_LDO1,
+	BD71815_LDO2,
+	BD71815_LDO3,
+	/* LDOs for SD Card and SD Card Interface */
+	BD71815_LDO4,
+	BD71815_LDO5,
+	/* LDO for DDR Reference Voltage */
+	BD71815_LDODVREF,
+	/* LDO for Low-Power State Retention */
+	BD71815_LDOLPSR,
+	BD71815_WLED,
+	BD71815_REGULATOR_CNT,
+};
+
+#define BD71815_SUPPLY_STATE_ENABLED    0x1
+
+enum {
+	BD71815_REG_DEVICE		=	0,
+	BD71815_REG_PWRCTRL,
+	BD71815_REG_BUCK1_MODE,
+	BD71815_REG_BUCK2_MODE,
+	BD71815_REG_BUCK3_MODE,
+	BD71815_REG_BUCK4_MODE,
+	BD71815_REG_BUCK5_MODE,
+	BD71815_REG_BUCK1_VOLT_H,
+	BD71815_REG_BUCK1_VOLT_L,
+	BD71815_REG_BUCK2_VOLT_H,
+	BD71815_REG_BUCK2_VOLT_L,
+	BD71815_REG_BUCK3_VOLT,
+	BD71815_REG_BUCK4_VOLT,
+	BD71815_REG_BUCK5_VOLT,
+	BD71815_REG_LED_CTRL,
+	BD71815_REG_LED_DIMM,
+	BD71815_REG_LDO_MODE1,
+	BD71815_REG_LDO_MODE2,
+	BD71815_REG_LDO_MODE3,
+	BD71815_REG_LDO_MODE4,
+	BD71815_REG_LDO1_VOLT,
+	BD71815_REG_LDO2_VOLT,
+	BD71815_REG_LDO3_VOLT,
+	BD71815_REG_LDO4_VOLT,
+	BD71815_REG_LDO5_VOLT_H,
+	BD71815_REG_LDO5_VOLT_L,
+	BD71815_REG_BUCK_PD_DIS,
+	BD71815_REG_LDO_PD_DIS,
+	BD71815_REG_GPO,
+	BD71815_REG_OUT32K,
+	BD71815_REG_SEC,
+	BD71815_REG_MIN,
+	BD71815_REG_HOUR,
+	BD71815_REG_WEEK,
+	BD71815_REG_DAY,
+	BD71815_REG_MONTH,
+	BD71815_REG_YEAR,
+	BD71815_REG_ALM0_SEC,
+
+	BD71815_REG_ALM1_SEC		=	0x2C,
+
+	BD71815_REG_ALM0_MASK		=	0x33,
+	BD71815_REG_ALM1_MASK,
+	BD71815_REG_ALM2,
+	BD71815_REG_TRIM,
+	BD71815_REG_CONF,
+	BD71815_REG_SYS_INIT,
+	BD71815_REG_CHG_STATE,
+	BD71815_REG_CHG_LAST_STATE,
+	BD71815_REG_BAT_STAT,
+	BD71815_REG_DCIN_STAT,
+	BD71815_REG_VSYS_STAT,
+	BD71815_REG_CHG_STAT,
+	BD71815_REG_CHG_WDT_STAT,
+	BD71815_REG_BAT_TEMP,
+	BD71815_REG_IGNORE_0,
+	BD71815_REG_INHIBIT_0,
+	BD71815_REG_DCIN_CLPS,
+	BD71815_REG_VSYS_REG,
+	BD71815_REG_VSYS_MAX,
+	BD71815_REG_VSYS_MIN,
+	BD71815_REG_CHG_SET1,
+	BD71815_REG_CHG_SET2,
+	BD71815_REG_CHG_WDT_PRE,
+	BD71815_REG_CHG_WDT_FST,
+	BD71815_REG_CHG_IPRE,
+	BD71815_REG_CHG_IFST,
+	BD71815_REG_CHG_IFST_TERM,
+	BD71815_REG_CHG_VPRE,
+	BD71815_REG_CHG_VBAT_1,
+	BD71815_REG_CHG_VBAT_2,
+	BD71815_REG_CHG_VBAT_3,
+	BD71815_REG_CHG_LED_1,
+	BD71815_REG_VF_TH,
+	BD71815_REG_BAT_SET_1,
+	BD71815_REG_BAT_SET_2,
+	BD71815_REG_BAT_SET_3,
+	BD71815_REG_ALM_VBAT_TH_U,
+	BD71815_REG_ALM_VBAT_TH_L,
+	BD71815_REG_ALM_DCIN_TH,
+	BD71815_REG_ALM_VSYS_TH,
+	BD71815_REG_VM_IBAT_U,
+	BD71815_REG_VM_IBAT_L,
+	BD71815_REG_VM_VBAT_U,
+	BD71815_REG_VM_VBAT_L,
+	BD71815_REG_VM_BTMP,
+	BD71815_REG_VM_VTH,
+	BD71815_REG_VM_DCIN_U,
+	BD71815_REG_VM_DCIN_L,
+	BD71815_REG_VM_VSYS,
+	BD71815_REG_VM_VF,
+	BD71815_REG_VM_OCI_PRE_U,
+	BD71815_REG_VM_OCI_PRE_L,
+	BD71815_REG_VM_OCV_PRE_U,
+	BD71815_REG_VM_OCV_PRE_L,
+	BD71815_REG_VM_OCI_PST_U,
+	BD71815_REG_VM_OCI_PST_L,
+	BD71815_REG_VM_OCV_PST_U,
+	BD71815_REG_VM_OCV_PST_L,
+	BD71815_REG_VM_SA_VBAT_U,
+	BD71815_REG_VM_SA_VBAT_L,
+	BD71815_REG_VM_SA_IBAT_U,
+	BD71815_REG_VM_SA_IBAT_L,
+	BD71815_REG_CC_CTRL,
+	BD71815_REG_CC_BATCAP1_TH_U,
+	BD71815_REG_CC_BATCAP1_TH_L,
+	BD71815_REG_CC_BATCAP2_TH_U,
+	BD71815_REG_CC_BATCAP2_TH_L,
+	BD71815_REG_CC_BATCAP3_TH_U,
+	BD71815_REG_CC_BATCAP3_TH_L,
+	BD71815_REG_CC_STAT,
+	BD71815_REG_CC_CCNTD_3,
+	BD71815_REG_CC_CCNTD_2,
+	BD71815_REG_CC_CCNTD_1,
+	BD71815_REG_CC_CCNTD_0,
+	BD71815_REG_CC_CURCD_U,
+	BD71815_REG_CC_CURCD_L,
+	BD71815_REG_VM_OCUR_THR_1,
+	BD71815_REG_VM_OCUR_DUR_1,
+	BD71815_REG_VM_OCUR_THR_2,
+	BD71815_REG_VM_OCUR_DUR_2,
+	BD71815_REG_VM_OCUR_THR_3,
+	BD71815_REG_VM_OCUR_DUR_3,
+	BD71815_REG_VM_OCUR_MON,
+	BD71815_REG_VM_BTMP_OV_THR,
+	BD71815_REG_VM_BTMP_OV_DUR,
+	BD71815_REG_VM_BTMP_LO_THR,
+	BD71815_REG_VM_BTMP_LO_DUR,
+	BD71815_REG_VM_BTMP_MON,
+	BD71815_REG_INT_EN_01,
+
+	BD71815_REG_INT_EN_11		=	0x95,
+	BD71815_REG_INT_EN_12,
+	BD71815_REG_INT_STAT,
+	BD71815_REG_INT_STAT_01,
+	BD71815_REG_INT_STAT_02,
+	BD71815_REG_INT_STAT_03,
+	BD71815_REG_INT_STAT_04,
+	BD71815_REG_INT_STAT_05,
+	BD71815_REG_INT_STAT_06,
+	BD71815_REG_INT_STAT_07,
+	BD71815_REG_INT_STAT_08,
+	BD71815_REG_INT_STAT_09,
+	BD71815_REG_INT_STAT_10,
+	BD71815_REG_INT_STAT_11,
+	BD71815_REG_INT_STAT_12,
+	BD71815_REG_INT_UPDATE,
+
+	BD71815_REG_VM_VSYS_U		=	0xC0,
+	BD71815_REG_VM_VSYS_L,
+	BD71815_REG_VM_SA_VSYS_U,
+	BD71815_REG_VM_SA_VSYS_L,
+
+	BD71815_REG_VM_SA_IBAT_MIN_U	=	0xD0,
+	BD71815_REG_VM_SA_IBAT_MIN_L,
+	BD71815_REG_VM_SA_IBAT_MAX_U,
+	BD71815_REG_VM_SA_IBAT_MAX_L,
+	BD71815_REG_VM_SA_VBAT_MIN_U,
+	BD71815_REG_VM_SA_VBAT_MIN_L,
+	BD71815_REG_VM_SA_VBAT_MAX_U,
+	BD71815_REG_VM_SA_VBAT_MAX_L,
+	BD71815_REG_VM_SA_VSYS_MIN_U,
+	BD71815_REG_VM_SA_VSYS_MIN_L,
+	BD71815_REG_VM_SA_VSYS_MAX_U,
+	BD71815_REG_VM_SA_VSYS_MAX_L,
+	BD71815_REG_VM_SA_MINMAX_CLR,
+
+	BD71815_REG_REX_CCNTD_3		=	0xE0,
+	BD71815_REG_REX_CCNTD_2,
+	BD71815_REG_REX_CCNTD_1,
+	BD71815_REG_REX_CCNTD_0,
+	BD71815_REG_REX_SA_VBAT_U,
+	BD71815_REG_REX_SA_VBAT_L,
+	BD71815_REG_REX_CTRL_1,
+	BD71815_REG_REX_CTRL_2,
+	BD71815_REG_FULL_CCNTD_3,
+	BD71815_REG_FULL_CCNTD_2,
+	BD71815_REG_FULL_CCNTD_1,
+	BD71815_REG_FULL_CCNTD_0,
+	BD71815_REG_FULL_CTRL,
+
+	BD71815_REG_CCNTD_CHG_3		=	0xF0,
+	BD71815_REG_CCNTD_CHG_2,
+
+	BD71815_REG_TEST_MODE		=	0xFE,
+	BD71815_MAX_REGISTER,
+};
+
+/* BD71815_REG_BUCK1_MODE bits */
+#define BD71815_BUCK_RAMPRATE_MASK	0xC0
+#define BD71815_BUCK_RAMPRATE_10P00MV	0x0
+#define BD71815_BUCK_RAMPRATE_5P00MV	0x01
+#define BD71815_BUCK_RAMPRATE_2P50MV	0x02
+#define BD71815_BUCK_RAMPRATE_1P25MV	0x03
+
+#define BD71815_BUCK_PWM_FIXED			BIT(4)
+#define BD71815_BUCK_SNVS_ON			BIT(3)
+#define BD71815_BUCK_RUN_ON			BIT(2)
+#define BD71815_BUCK_LPSR_ON			BIT(1)
+#define BD71815_BUCK_SUSP_ON			BIT(0)
+
+/* BD71815_REG_BUCK1_VOLT_H bits */
+#define BD71815_BUCK_DVSSEL			0x80
+#define BD71815_BUCK_STBY_DVS			0x40
+#define BD71815_VOLT_MASK			0x3F
+#define BD71815_BUCK1_H_DEFAULT			0x14
+#define BD71815_BUCK1_L_DEFAULT			0x14
+
+/* BD71815_REG_BUCK2_VOLT_H bits */
+#define BD71815_BUCK2_H_DEFAULT			0x14
+#define BD71815_BUCK2_L_DEFAULT			0x14
+
+/* WLED output */
+/* current register mask */
+#define LED_DIMM_MASK			0x3f
+/* LED enable bits at LED_CTRL reg */
+#define LED_CHGDONE_EN			BIT(4)
+#define LED_RUN_ON			BIT(2)
+#define LED_LPSR_ON			BIT(1)
+#define LED_SUSP_ON			BIT(0)
+
+/* BD71815_REG_LDO1_CTRL bits */
+#define LDO1_EN				0x01
+#define LDO2_EN				0x02
+#define LDO3_EN				0x04
+#define DVREF_EN			0x08
+#define VOSNVS_SW_EN			0x10
+
+/* LDO_MODE1_register */
+#define LDO1_SNVS_ON			BIT(7)
+#define LDO1_RUN_ON			BIT(6)
+#define LDO1_LPSR_ON			BIT(5)
+#define LDO1_SUSP_ON			BIT(4)
+/* set => register control, unset => GPIO control */
+#define LDO4_MODE_MASK			BIT(3)
+#define LDO4_MODE_I2C			BIT(3)
+#define LDO4_MODE_GPIO			0
+/* set => register control, unset => start when DCIN connected */
+#define LDO3_MODE_MASK			BIT(2)
+#define LDO3_MODE_I2C			BIT(2)
+#define LDO3_MODE_DCIN			0
+
+/* LDO_MODE2 register */
+#define LDO3_SNVS_ON			BIT(7)
+#define LDO3_RUN_ON			BIT(6)
+#define LDO3_LPSR_ON			BIT(5)
+#define LDO3_SUSP_ON			BIT(4)
+#define LDO2_SNVS_ON			BIT(3)
+#define LDO2_RUN_ON			BIT(2)
+#define LDO2_LPSR_ON			BIT(1)
+#define LDO2_SUSP_ON			BIT(0)
+
+
+/* LDO_MODE3 register */
+#define LDO5_SNVS_ON			BIT(7)
+#define LDO5_RUN_ON			BIT(6)
+#define LDO5_LPSR_ON			BIT(5)
+#define LDO5_SUSP_ON			BIT(4)
+#define LDO4_SNVS_ON			BIT(3)
+#define LDO4_RUN_ON			BIT(2)
+#define LDO4_LPSR_ON			BIT(1)
+#define LDO4_SUSP_ON			BIT(0)
+
+/* LDO_MODE4 register */
+#define DVREF_SNVS_ON			BIT(7)
+#define DVREF_RUN_ON			BIT(6)
+#define DVREF_LPSR_ON			BIT(5)
+#define DVREF_SUSP_ON			BIT(4)
+#define LDO_LPSR_SNVS_ON		BIT(3)
+#define LDO_LPSR_RUN_ON			BIT(2)
+#define LDO_LPSR_LPSR_ON		BIT(1)
+#define LDO_LPSR_SUSP_ON		BIT(0)
+
+/* BD71815_REG_OUT32K bits */
+#define OUT32K_EN			BIT(0)
+#define OUT32K_MODE			BIT(1)
+#define OUT32K_MODE_CMOS		BIT(1)
+#define OUT32K_MODE_OPEN_DRAIN		0
+
+/* BD71815_REG_BAT_STAT bits */
+#define BAT_DET				0x20
+#define BAT_DET_OFFSET			5
+#define BAT_DET_DONE			0x10
+#define VBAT_OV				0x08
+#define DBAT_DET			0x01
+
+/* BD71815_REG_VBUS_STAT bits */
+#define VBUS_DET			0x01
+
+#define BD71815_REG_RTC_START BD71815_REG_SEC
+#define BD71815_REG_RTC_ALM_START BD71815_REG_ALM0_SEC
+
+/* BD71815_REG_ALM0_MASK bits */
+#define A0_ONESEC			0x80
+
+/* BD71815_REG_INT_EN_00 bits */
+#define ALMALE				0x1
+
+/* BD71815_REG_INT_STAT_03 bits */
+#define DCIN_MON_DET			0x02
+#define DCIN_MON_RES			0x01
+#define POWERON_LONG			0x04
+#define POWERON_MID			0x08
+#define POWERON_SHORT			0x10
+#define POWERON_PRESS			0x20
+
+
+/* BD71805_REG_INT_STAT_08 bits */
+#define VBAT_MON_DET			0x02
+#define VBAT_MON_RES			0x01
+
+/* BD71805_REG_INT_STAT_11 bits */
+#define	INT_STAT_11_VF_DET		0x80
+#define	INT_STAT_11_VF_RES		0x40
+#define	INT_STAT_11_VF125_DET		0x20
+#define	INT_STAT_11_VF125_RES		0x10
+#define	INT_STAT_11_OVTMP_DET		0x08
+#define	INT_STAT_11_OVTMP_RES		0x04
+#define	INT_STAT_11_LOTMP_DET		0x02
+#define	INT_STAT_11_LOTMP_RES		0x01
+
+#define VBAT_MON_DET			0x02
+#define VBAT_MON_RES			0x01
+
+/* BD71815_REG_PWRCTRL bits */
+#define RESTARTEN			0x01
+
+/* BD71815_REG_GPO bits */
+#define READY_FORCE_LOW			BIT(2)
+#define BD71815_GPIO_DRIVE_MASK		BIT(4)
+#define BD71815_GPIO_OPEN_DRAIN		0
+#define BD71815_GPIO_CMOS		BIT(4)
+
+/* BD71815_REG_CHG_SET1 bits */
+#define CHG_EN				BIT(0)
+
+/* BD71815 interrupt masks */
+enum {
+	BD71815_INT_EN_01_BUCKAST_MASK	=	0x0F,
+	BD71815_INT_EN_02_DCINAST_MASK	=	0x3E,
+	BD71815_INT_EN_03_DCINAST_MASK	=	0x3F,
+	BD71815_INT_EN_04_VSYSAST_MASK	=	0xCF,
+	BD71815_INT_EN_05_CHGAST_MASK	=	0xFC,
+	BD71815_INT_EN_06_BATAST_MASK	=	0xF3,
+	BD71815_INT_EN_07_BMONAST_MASK	=	0xFE,
+	BD71815_INT_EN_08_BMONAST_MASK	=	0x03,
+	BD71815_INT_EN_09_BMONAST_MASK	=	0x07,
+	BD71815_INT_EN_10_BMONAST_MASK	=	0x3F,
+	BD71815_INT_EN_11_TMPAST_MASK	=	0xFF,
+	BD71815_INT_EN_12_ALMAST_MASK	=	0x07,
+};
+/* BD71815 interrupt irqs */
+enum {
+	/* BUCK reg interrupts */
+	BD71815_INT_BUCK1_OCP,
+	BD71815_INT_BUCK2_OCP,
+	BD71815_INT_BUCK3_OCP,
+	BD71815_INT_BUCK4_OCP,
+	BD71815_INT_BUCK5_OCP,
+	BD71815_INT_LED_OVP,
+	BD71815_INT_LED_OCP,
+	BD71815_INT_LED_SCP,
+	/* DCIN1 interrupts */
+	BD71815_INT_DCIN_RMV,
+	BD71815_INT_CLPS_OUT,
+	BD71815_INT_CLPS_IN,
+	BD71815_INT_DCIN_OVP_RES,
+	BD71815_INT_DCIN_OVP_DET,
+	/* DCIN2 interrupts */
+	BD71815_INT_DCIN_MON_RES,
+	BD71815_INT_DCIN_MON_DET,
+	BD71815_INT_WDOG,
+	/* Vsys INT_STAT_04 */
+	BD71815_INT_VSYS_UV_RES,
+	BD71815_INT_VSYS_UV_DET,
+	BD71815_INT_VSYS_LOW_RES,
+	BD71815_INT_VSYS_LOW_DET,
+	BD71815_INT_VSYS_MON_RES,
+	BD71815_INT_VSYS_MON_DET,
+	/* Charger INT_STAT_05 */
+	BD71815_INT_CHG_WDG_TEMP,
+	BD71815_INT_CHG_WDG_TIME,
+	BD71815_INT_CHG_RECHARGE_RES,
+	BD71815_INT_CHG_RECHARGE_DET,
+	BD71815_INT_CHG_RANGED_TEMP_TRANSITION,
+	BD71815_INT_CHG_STATE_TRANSITION,
+	/* Battery  INT_STAT_06 */
+	BD71815_INT_BAT_TEMP_NORMAL,
+	BD71815_INT_BAT_TEMP_ERANGE,
+	BD71815_INT_BAT_REMOVED,
+	BD71815_INT_BAT_DETECTED,
+	BD71815_INT_THERM_REMOVED,
+	BD71815_INT_THERM_DETECTED,
+	/* Battery Mon 1 INT_STAT_07 */
+	BD71815_INT_BAT_DEAD,
+	BD71815_INT_BAT_SHORTC_RES,
+	BD71815_INT_BAT_SHORTC_DET,
+	BD71815_INT_BAT_LOW_VOLT_RES,
+	BD71815_INT_BAT_LOW_VOLT_DET,
+	BD71815_INT_BAT_OVER_VOLT_RES,
+	BD71815_INT_BAT_OVER_VOLT_DET,
+	/* Battery Mon 2 INT_STAT_08 */
+	BD71815_INT_BAT_MON_RES,
+	BD71815_INT_BAT_MON_DET,
+	/* Battery Mon 3 (Coulomb counter) INT_STAT_09 */
+	BD71815_INT_BAT_CC_MON1,
+	BD71815_INT_BAT_CC_MON2,
+	BD71815_INT_BAT_CC_MON3,
+	/* Battery Mon 4 INT_STAT_10 */
+	BD71815_INT_BAT_OVER_CURR_1_RES,
+	BD71815_INT_BAT_OVER_CURR_1_DET,
+	BD71815_INT_BAT_OVER_CURR_2_RES,
+	BD71815_INT_BAT_OVER_CURR_2_DET,
+	BD71815_INT_BAT_OVER_CURR_3_RES,
+	BD71815_INT_BAT_OVER_CURR_3_DET,
+	/* Temperature INT_STAT_11 */
+	BD71815_INT_TEMP_BAT_LOW_RES,
+	BD71815_INT_TEMP_BAT_LOW_DET,
+	BD71815_INT_TEMP_BAT_HI_RES,
+	BD71815_INT_TEMP_BAT_HI_DET,
+	BD71815_INT_TEMP_CHIP_OVER_125_RES,
+	BD71815_INT_TEMP_CHIP_OVER_125_DET,
+	BD71815_INT_TEMP_CHIP_OVER_VF_RES,
+	BD71815_INT_TEMP_CHIP_OVER_VF_DET,
+	/* RTC Alarm INT_STAT_12 */
+	BD71815_INT_RTC0,
+	BD71815_INT_RTC1,
+	BD71815_INT_RTC2,
+};
+
+#define BD71815_INT_BUCK1_OCP_MASK			BIT(0)
+#define BD71815_INT_BUCK2_OCP_MASK			BIT(1)
+#define BD71815_INT_BUCK3_OCP_MASK			BIT(2)
+#define BD71815_INT_BUCK4_OCP_MASK			BIT(3)
+#define BD71815_INT_BUCK5_OCP_MASK			BIT(4)
+#define BD71815_INT_LED_OVP_MASK			BIT(5)
+#define BD71815_INT_LED_OCP_MASK			BIT(6)
+#define BD71815_INT_LED_SCP_MASK			BIT(7)
+
+#define BD71815_INT_DCIN_RMV_MASK			BIT(1)
+#define BD71815_INT_CLPS_OUT_MASK			BIT(2)
+#define BD71815_INT_CLPS_IN_MASK			BIT(3)
+#define BD71815_INT_DCIN_OVP_RES_MASK			BIT(4)
+#define BD71815_INT_DCIN_OVP_DET_MASK			BIT(5)
+
+#define BD71815_INT_DCIN_MON_RES_MASK			BIT(0)
+#define BD71815_INT_DCIN_MON_DET_MASK			BIT(1)
+#define BD71815_INT_WDOG_MASK				BIT(6)
+
+#define BD71815_INT_VSYS_UV_RES_MASK			BIT(0)
+#define BD71815_INT_VSYS_UV_DET_MASK			BIT(1)
+#define BD71815_INT_VSYS_LOW_RES_MASK			BIT(2)
+#define BD71815_INT_VSYS_LOW_DET_MASK			BIT(3)
+#define BD71815_INT_VSYS_MON_RES_MASK			BIT(6)
+#define BD71815_INT_VSYS_MON_DET_MASK			BIT(7)
+
+#define BD71815_INT_CHG_WDG_TEMP_MASK			BIT(2)
+#define BD71815_INT_CHG_WDG_TIME_MASK			BIT(3)
+#define BD71815_INT_CHG_RECHARGE_RES_MASK		BIT(4)
+#define BD71815_INT_CHG_RECHARGE_DET_MASK		BIT(5)
+#define BD71815_INT_CHG_RANGED_TEMP_TRANSITION_MASK	BIT(6)
+#define BD71815_INT_CHG_STATE_TRANSITION_MASK		BIT(7)
+
+#define BD71815_INT_BAT_TEMP_NORMAL_MASK		BIT(0)
+#define BD71815_INT_BAT_TEMP_ERANGE_MASK		BIT(1)
+#define BD71815_INT_BAT_REMOVED_MASK			BIT(4)
+#define BD71815_INT_BAT_DETECTED_MASK			BIT(5)
+#define BD71815_INT_THERM_REMOVED_MASK			BIT(6)
+#define BD71815_INT_THERM_DETECTED_MASK			BIT(7)
+
+#define BD71815_INT_BAT_DEAD_MASK			BIT(1)
+#define BD71815_INT_BAT_SHORTC_RES_MASK			BIT(2)
+#define BD71815_INT_BAT_SHORTC_DET_MASK			BIT(3)
+#define BD71815_INT_BAT_LOW_VOLT_RES_MASK		BIT(4)
+#define BD71815_INT_BAT_LOW_VOLT_DET_MASK		BIT(5)
+#define BD71815_INT_BAT_OVER_VOLT_RES_MASK		BIT(6)
+#define BD71815_INT_BAT_OVER_VOLT_DET_MASK		BIT(7)
+
+#define BD71815_INT_BAT_MON_RES_MASK			BIT(0)
+#define BD71815_INT_BAT_MON_DET_MASK			BIT(1)
+
+#define BD71815_INT_BAT_CC_MON1_MASK			BIT(0)
+#define BD71815_INT_BAT_CC_MON2_MASK			BIT(1)
+#define BD71815_INT_BAT_CC_MON3_MASK			BIT(2)
+
+#define BD71815_INT_BAT_OVER_CURR_1_RES_MASK		BIT(0)
+#define BD71815_INT_BAT_OVER_CURR_1_DET_MASK		BIT(1)
+#define BD71815_INT_BAT_OVER_CURR_2_RES_MASK		BIT(2)
+#define BD71815_INT_BAT_OVER_CURR_2_DET_MASK		BIT(3)
+#define BD71815_INT_BAT_OVER_CURR_3_RES_MASK		BIT(4)
+#define BD71815_INT_BAT_OVER_CURR_3_DET_MASK		BIT(5)
+
+#define BD71815_INT_TEMP_BAT_LOW_RES_MASK		BIT(0)
+#define BD71815_INT_TEMP_BAT_LOW_DET_MASK		BIT(1)
+#define BD71815_INT_TEMP_BAT_HI_RES_MASK		BIT(2)
+#define BD71815_INT_TEMP_BAT_HI_DET_MASK		BIT(3)
+#define BD71815_INT_TEMP_CHIP_OVER_125_RES_MASK		BIT(4)
+#define BD71815_INT_TEMP_CHIP_OVER_125_DET_MASK		BIT(5)
+#define BD71815_INT_TEMP_CHIP_OVER_VF_RES_MASK		BIT(6)
+#define BD71815_INT_TEMP_CHIP_OVER_VF_DET_MASK		BIT(7)
+
+#define BD71815_INT_RTC0_MASK				BIT(0)
+#define BD71815_INT_RTC1_MASK				BIT(1)
+#define BD71815_INT_RTC2_MASK				BIT(2)
+
+/* BD71815_REG_CC_CTRL bits */
+#define CCNTRST					0x80
+#define CCNTENB					0x40
+#define CCCALIB					0x20
+
+/* BD71815_REG_CHG_SET1 bits */
+#define WDT_AUTO				0x40
+
+/* BD71815_REG_CC_CURCD */
+#define CURDIR_Discharging			0x8000
+
+/* BD71815_REG_VM_SA_IBAT */
+#define IBAT_SA_DIR_Discharging			0x8000
+
+/* BD71815_REG_VM_SA_MINMAX_CLR bits */
+#define VSYS_SA_MIN_CLR				0x10
+#define VBAT_SA_MIN_CLR				0x01
+
+/* BD71815_REG_REX_CTRL_1 bits */
+#define REX_CLR					0x10
+
+/* BD71815_REG_REX_CTRL_1 bits */
+#define REX_PMU_STATE_MASK			0x04
+
+/* BD71815_REG_FULL_CTRL bits */
+#define FULL_CLR				0x10
+
+/* BD71815_REG_LED_CTRL bits */
+#define CHGDONE_LED_EN				0x10
+
+enum CHG_STATE {
+	CHG_STATE_SUSPEND = 0x0,		/**< suspend state */
+	CHG_STATE_TRICKLE_CHARGE,		/**< trickle charge state */
+	CHG_STATE_PRE_CHARGE,			/**< precharge state */
+	CHG_STATE_FAST_CHARGE,			/**< fast charge state */
+	CHG_STATE_TOP_OFF,			/**< top off state */
+	CHG_STATE_DONE,				/**< charge complete */
+};
+
+#endif /* __LINUX_MFD_BD71815_H */
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index 017a4c01cb31..c7ab69c87ee8 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -151,6 +151,9 @@ enum {
 #define BD71828_REG_GPIO_CTRL3		0x49
 #define BD71828_REG_IO_STAT		0xed
 
+/* clk */
+#define BD71828_REG_OUT32K		0x4b
+
 /* RTC */
 #define BD71828_REG_RTC_SEC		0x4c
 #define BD71828_REG_RTC_MINUTE		0x4d
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
