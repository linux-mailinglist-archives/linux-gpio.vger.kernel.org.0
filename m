Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FAFEC1D1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbfKAL3s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:29:48 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45290 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKAL3s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:29:48 -0400
Received: by mail-lj1-f195.google.com with SMTP id q64so9852072ljb.12;
        Fri, 01 Nov 2019 04:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RO0XXySSDwpYalm9cQ/ZjfFroFK+QmxdooHaTcLNrEw=;
        b=ujieXCk25pPM09nCVHPu6a/Sbfwt2NwRDyRb+4kYdSzWPjFpb3dzeE/XA9I4HdIkMT
         8MEDy79prLONpto5oCjrwTGVskEFhI+/95pPyrt8s17h24geqPN2zlGNz3XkEvPsJ7be
         kq5aXd9qcC9yE7vyScdvW8dhBrdInyQ4W75uXqjS2CmITal0z54DYGM/WAsZ6e+bAoZY
         tJBuJ6kmM0161PQ8pWEWuY9zAP9rqqUvm20olgRfX3+sxofHOjfvGf126BlOkq60zE+0
         IaFGgaCwwdaF573GRuhodnqo90amriEOMsb8Hxxsbag7v4xp/PDGeuAeM063oVMhy7Gg
         L54Q==
X-Gm-Message-State: APjAAAXbi7M4IZFztB8DytIEkjF2VvR0ocMTLiOB6EbM0bq2Jgpn4NwK
        PGnlwzrIQo1nwBPvJvhaoSM=
X-Google-Smtp-Source: APXvYqwH0vr+6C4l/n2BNmnL7pXJFho7lCsFaZ1ElwZH1FbqaMixOI5J3rTzH7nriKY8SQ+5ldVHew==
X-Received: by 2002:a2e:98c1:: with SMTP id s1mr2423514ljj.215.1572607781905;
        Fri, 01 Nov 2019 04:29:41 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id i8sm2796543ljj.11.2019.11.01.04.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:29:41 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:29:33 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v3 01/15] mfd: bd71828: Support ROHM BD71828 PMIC - core
Message-ID: <9ce6f5810847422f4def629d30bae7b43dd4c6c6.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

BD71828GW is a single-chip power management IC for battery-powered portable
devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA
single-cell linear charger. Also included is a Coulomb counter, a real-time
clock (RTC), 3 GPO/regulator control pins, HALL input and a 32.768 kHz
clock gate.

Add MFD core driver providing interrupt controller facilities and i2c
access to sub device drivers.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

No changes compared to v2

 drivers/mfd/Kconfig              |  15 ++
 drivers/mfd/Makefile             |   2 +-
 drivers/mfd/rohm-bd71828.c       | 322 +++++++++++++++++++++++
 include/linux/mfd/rohm-bd71828.h | 425 +++++++++++++++++++++++++++++++
 include/linux/mfd/rohm-generic.h |   1 +
 5 files changed, 764 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mfd/rohm-bd71828.c
 create mode 100644 include/linux/mfd/rohm-bd71828.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ae24d3ea68ea..ff06e853f799 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1913,6 +1913,21 @@ config MFD_ROHM_BD70528
 	  10 bits SAR ADC for battery temperature monitor and 1S battery
 	  charger.
 
+config MFD_ROHM_BD71828
+	tristate "ROHM BD71828 Power Management IC"
+	depends on I2C=y
+	depends on OF
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	select MFD_CORE
+	help
+	  Select this option to get support for the ROHM BD71828 Power
+	  Management IC. BD71828GW is a single-chip power management IC for
+	  battery-powered portable devices. The IC integrates 7 buck
+	  converters, 7 LDOs, and a 1500 mA single-cell linear charger.
+	  Also included is a Coulomb counter, a real-time clock (RTC), and
+	  a 32.768 kHz clock gate.
+
 config MFD_STM32_LPTIMER
 	tristate "Support for STM32 Low-Power Timer"
 	depends on (ARCH_STM32 && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c1067ea46204..437c47ffd315 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -253,6 +253,6 @@ obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
 obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
 obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
 obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
+obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
 obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
 obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
-
diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
new file mode 100644
index 000000000000..b7de79e1fcdb
--- /dev/null
+++ b/drivers/mfd/rohm-bd71828.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Copyright (C) 2019 ROHM Semiconductors
+//
+// ROHM BD71828 PMIC driver
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/irq.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/rohm-bd71828.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+static const struct resource rtc_irqs[] = {
+	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
+	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
+	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd71828-rtc-alm-2"),
+};
+
+static struct mfd_cell bd71828_mfd_cells[] = {
+	{ .name = "bd71828-pmic", },
+	{ .name = "bd71828-gpio", },
+	{ .name = "bd71828-led", },
+	/*
+	 * We use BD71837 driver to drive the clock block. Only differences to
+	 * BD70528 clock gate are the register address and mask.
+	 */
+	{ .name = "bd718xx-clk", },
+	{
+		.name = "bd71827-power",
+	}, {
+		.name = "bd70528-rtc",
+		.resources = rtc_irqs,
+		.num_resources = ARRAY_SIZE(rtc_irqs),
+	},
+};
+
+static const struct regmap_range volatile_ranges[] = {
+	{
+		.range_min = BD71828_REG_PS_CTRL_1,
+		.range_max = BD71828_REG_PS_CTRL_1,
+	}, {
+		.range_min = BD71828_REG_PS_CTRL_3,
+		.range_max = BD71828_REG_PS_CTRL_3,
+	}, {
+		.range_min = BD71828_REG_RTC_SEC,
+		.range_max = BD71828_REG_RTC_YEAR,
+	}, {
+		/*
+		 * For now make all charger registers volatile because many
+		 * needs to be and because the charger block is not that
+		 * performance critical. TBD: Check which charger registers
+		 * could be cached
+		 */
+		.range_min = BD71828_REG_CHG_STATE,
+		.range_max = BD71828_REG_CHG_FULL,
+	}, {
+		.range_min = BD71828_REG_INT_MAIN,
+		.range_max = BD71828_REG_IO_STAT,
+	},
+};
+
+static const struct regmap_access_table volatile_regs = {
+	.yes_ranges = &volatile_ranges[0],
+	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
+};
+
+static struct regmap_config bd71828_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_table = &volatile_regs,
+	.max_register = BD71828_MAX_REGISTER,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+/*
+ * Mapping of main IRQ register bits to sub-IRQ register offsets so that we can
+ * access corect sub-IRQ registers based on bits that are set in main IRQ
+ * register.
+ */
+
+unsigned int bit0_offsets[] = {11};		/* RTC IRQ register */
+unsigned int bit1_offsets[] = {10};		/* TEMP IRQ register */
+unsigned int bit2_offsets[] = {6, 7, 8, 9};	/* BAT MON IRQ registers */
+unsigned int bit3_offsets[] = {5};		/* BAT IRQ register */
+unsigned int bit4_offsets[] = {4};		/* CHG IRQ register */
+unsigned int bit5_offsets[] = {3};		/* VSYS IRQ register */
+unsigned int bit6_offsets[] = {1, 2};		/* DCIN IRQ registers */
+unsigned int bit7_offsets[] = {0};		/* BUCK IRQ register */
+
+static struct regmap_irq_sub_irq_map bd71828_sub_irq_offsets[] = {
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit3_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit4_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit5_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit6_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
+};
+
+static struct regmap_irq bd71828_irqs[] = {
+	REGMAP_IRQ_REG(BD71828_INT_BUCK1_OCP, 0, BD71828_INT_BUCK1_OCP_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BUCK2_OCP, 0, BD71828_INT_BUCK2_OCP_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BUCK3_OCP, 0, BD71828_INT_BUCK3_OCP_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BUCK4_OCP, 0, BD71828_INT_BUCK4_OCP_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BUCK5_OCP, 0, BD71828_INT_BUCK5_OCP_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BUCK6_OCP, 0, BD71828_INT_BUCK6_OCP_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BUCK7_OCP, 0, BD71828_INT_BUCK7_OCP_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_PGFAULT, 0, BD71828_INT_PGFAULT_MASK),
+	/* DCIN1 interrupts */
+	REGMAP_IRQ_REG(BD71828_INT_DCIN_DET, 1, BD71828_INT_DCIN_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_DCIN_RMV, 1, BD71828_INT_DCIN_RMV_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CLPS_OUT, 1, BD71828_INT_CLPS_OUT_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CLPS_IN, 1, BD71828_INT_CLPS_IN_MASK),
+	/* DCIN2 interrupts */
+	REGMAP_IRQ_REG(BD71828_INT_DCIN_MON_RES, 2,
+		       BD71828_INT_DCIN_MON_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_DCIN_MON_DET, 2,
+		       BD71828_INT_DCIN_MON_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_LONGPUSH, 2, BD71828_INT_LONGPUSH_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_MIDPUSH, 2, BD71828_INT_MIDPUSH_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_SHORTPUSH, 2, BD71828_INT_SHORTPUSH_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_PUSH, 2, BD71828_INT_PUSH_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_WDOG, 2, BD71828_INT_WDOG_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_SWRESET, 2, BD71828_INT_SWRESET_MASK),
+	/* Vsys */
+	REGMAP_IRQ_REG(BD71828_INT_VSYS_UV_RES, 3,
+		       BD71828_INT_VSYS_UV_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_VSYS_UV_DET, 3,
+		       BD71828_INT_VSYS_UV_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_VSYS_LOW_RES, 3,
+		       BD71828_INT_VSYS_LOW_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_VSYS_LOW_DET, 3,
+		       BD71828_INT_VSYS_LOW_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_VSYS_HALL_IN, 3,
+		       BD71828_INT_VSYS_HALL_IN_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_VSYS_HALL_TOGGLE, 3,
+		       BD71828_INT_VSYS_HALL_TOGGLE_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_VSYS_MON_RES, 3,
+		       BD71828_INT_VSYS_MON_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_VSYS_MON_DET, 3,
+		       BD71828_INT_VSYS_MON_DET_MASK),
+	/* Charger */
+	REGMAP_IRQ_REG(BD71828_INT_CHG_DCIN_ILIM, 4,
+		       BD71828_INT_CHG_DCIN_ILIM_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CHG_TOPOFF_TO_DONE, 4,
+		       BD71828_INT_CHG_TOPOFF_TO_DONE_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CHG_WDG_TEMP, 4,
+		       BD71828_INT_CHG_WDG_TEMP_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CHG_WDG_TIME, 4,
+		       BD71828_INT_CHG_WDG_TIME_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CHG_RECHARGE_RES, 4,
+		       BD71828_INT_CHG_RECHARGE_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CHG_RECHARGE_DET, 4,
+		       BD71828_INT_CHG_RECHARGE_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CHG_RANGED_TEMP_TRANSITION, 4,
+		       BD71828_INT_CHG_RANGED_TEMP_TRANSITION_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_CHG_STATE_TRANSITION, 4,
+		       BD71828_INT_CHG_STATE_TRANSITION_MASK),
+	/* Battery */
+	REGMAP_IRQ_REG(BD71828_INT_BAT_TEMP_NORMAL, 5,
+		       BD71828_INT_BAT_TEMP_NORMAL_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_TEMP_ERANGE, 5,
+		       BD71828_INT_BAT_TEMP_ERANGE_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_TEMP_WARN, 5,
+		       BD71828_INT_BAT_TEMP_WARN_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_REMOVED, 5,
+		       BD71828_INT_BAT_REMOVED_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_DETECTED, 5,
+		       BD71828_INT_BAT_DETECTED_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_THERM_REMOVED, 5,
+		       BD71828_INT_THERM_REMOVED_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_THERM_DETECTED, 5,
+		       BD71828_INT_THERM_DETECTED_MASK),
+	/* Battery Mon 1 */
+	REGMAP_IRQ_REG(BD71828_INT_BAT_DEAD, 6, BD71828_INT_BAT_DEAD_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_SHORTC_RES, 6,
+		       BD71828_INT_BAT_SHORTC_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_SHORTC_DET, 6,
+		       BD71828_INT_BAT_SHORTC_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_LOW_VOLT_RES, 6,
+		       BD71828_INT_BAT_LOW_VOLT_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_LOW_VOLT_DET, 6,
+		       BD71828_INT_BAT_LOW_VOLT_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_VOLT_RES, 6,
+		       BD71828_INT_BAT_OVER_VOLT_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_VOLT_DET, 6,
+		       BD71828_INT_BAT_OVER_VOLT_DET_MASK),
+	/* Battery Mon 2 */
+	REGMAP_IRQ_REG(BD71828_INT_BAT_MON_RES, 7,
+		       BD71828_INT_BAT_MON_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_MON_DET, 7,
+		       BD71828_INT_BAT_MON_DET_MASK),
+	/* Battery Mon 3 (Coulomb counter) */
+	REGMAP_IRQ_REG(BD71828_INT_BAT_CC_MON1, 8,
+		       BD71828_INT_BAT_CC_MON1_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_CC_MON2, 8,
+		       BD71828_INT_BAT_CC_MON2_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_CC_MON3, 8,
+		       BD71828_INT_BAT_CC_MON3_MASK),
+	/* Battery Mon 4 */
+	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_1_RES, 9,
+		       BD71828_INT_BAT_OVER_CURR_1_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_1_DET, 9,
+		       BD71828_INT_BAT_OVER_CURR_1_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_2_RES, 9,
+		       BD71828_INT_BAT_OVER_CURR_2_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_2_DET, 9,
+		       BD71828_INT_BAT_OVER_CURR_2_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_3_RES, 9,
+		       BD71828_INT_BAT_OVER_CURR_3_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_3_DET, 9,
+		       BD71828_INT_BAT_OVER_CURR_3_DET_MASK),
+	/* Temperature */
+	REGMAP_IRQ_REG(BD71828_INT_TEMP_BAT_LOW_RES, 10,
+		       BD71828_INT_TEMP_BAT_LOW_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_TEMP_BAT_LOW_DET, 10,
+		       BD71828_INT_TEMP_BAT_LOW_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_TEMP_BAT_HI_RES, 10,
+		       BD71828_INT_TEMP_BAT_HI_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_TEMP_BAT_HI_DET, 10,
+		       BD71828_INT_TEMP_BAT_HI_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_TEMP_CHIP_OVER_125_RES, 10,
+		       BD71828_INT_TEMP_CHIP_OVER_125_RES_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_TEMP_CHIP_OVER_125_DET, 10,
+		       BD71828_INT_TEMP_CHIP_OVER_125_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_TEMP_CHIP_OVER_VF_DET, 10,
+		       BD71828_INT_TEMP_CHIP_OVER_VF_DET_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_TEMP_CHIP_OVER_VF_RES, 10,
+		       BD71828_INT_TEMP_CHIP_OVER_VF_RES_MASK),
+	/* RTC Alarm */
+	REGMAP_IRQ_REG(BD71828_INT_RTC0, 11, BD71828_INT_RTC0_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_RTC1, 11, BD71828_INT_RTC1_MASK),
+	REGMAP_IRQ_REG(BD71828_INT_RTC2, 11, BD71828_INT_RTC2_MASK),
+};
+
+static struct regmap_irq_chip bd71828_irq_chip = {
+	.name = "bd71828_irq",
+	.main_status = BD71828_REG_INT_MAIN,
+	.irqs = &bd71828_irqs[0],
+	.num_irqs = ARRAY_SIZE(bd71828_irqs),
+	.status_base = BD71828_REG_INT_BUCK,
+	.mask_base = BD71828_REG_INT_MASK_BUCK,
+	.ack_base = BD71828_REG_INT_BUCK,
+	.mask_invert = true,
+	.init_ack_masked = true,
+	.num_regs = 12,
+	.num_main_regs = 1,
+	.sub_reg_offsets = &bd71828_sub_irq_offsets[0],
+	.num_main_status_bits = 8,
+	.irq_reg_stride = 1,
+};
+
+static int bd71828_i2c_probe(struct i2c_client *i2c,
+			     const struct i2c_device_id *id)
+{
+	struct rohm_regmap_dev *chip;
+	struct regmap_irq_chip_data *irq_data;
+	int ret;
+
+	if (!i2c->irq) {
+		dev_err(&i2c->dev, "No IRQ configured\n");
+		return -EINVAL;
+	}
+
+	chip = devm_kzalloc(&i2c->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	dev_set_drvdata(&i2c->dev, chip);
+
+	chip->chip_type = ROHM_CHIP_TYPE_BD71828;
+	chip->regmap = devm_regmap_init_i2c(i2c, &bd71828_regmap);
+	if (IS_ERR(chip->regmap)) {
+		dev_err(&i2c->dev, "Failed to initialize Regmap\n");
+		return PTR_ERR(chip->regmap);
+	}
+
+	ret = devm_regmap_add_irq_chip(&i2c->dev, chip->regmap,
+				       i2c->irq, IRQF_ONESHOT, 0,
+				       &bd71828_irq_chip, &irq_data);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to add IRQ chip\n");
+		return ret;
+	}
+	dev_dbg(&i2c->dev, "Registered %d IRQs for chip\n",
+		bd71828_irq_chip.num_irqs);
+
+	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
+				   bd71828_mfd_cells,
+				   ARRAY_SIZE(bd71828_mfd_cells), NULL, 0,
+				   regmap_irq_get_domain(irq_data));
+	if (ret)
+		dev_err(&i2c->dev, "Failed to create subdevices\n");
+
+	return ret;
+}
+
+static const struct of_device_id bd71828_of_match[] = {
+	{ .compatible = "rohm,bd71828", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, bd71828_of_match);
+
+static struct i2c_driver bd71828_drv = {
+	.driver = {
+		.name = "rohm-bd71828",
+		.of_match_table = bd71828_of_match,
+	},
+	.probe = &bd71828_i2c_probe,
+};
+
+module_i2c_driver(bd71828_drv);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("ROHM BD71828 Power Management IC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
new file mode 100644
index 000000000000..eb0557eb5314
--- /dev/null
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -0,0 +1,425 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (C) 2019 ROHM Semiconductors */
+
+#ifndef __LINUX_MFD_BD71828_H__
+#define __LINUX_MFD_BD71828_H__
+
+#include <linux/mfd/rohm-generic.h>
+
+/* Regulator IDs */
+enum {
+	BD71828_BUCK1,
+	BD71828_BUCK2,
+	BD71828_BUCK3,
+	BD71828_BUCK4,
+	BD71828_BUCK5,
+	BD71828_BUCK6,
+	BD71828_BUCK7,
+	BD71828_LDO1,
+	BD71828_LDO2,
+	BD71828_LDO3,
+	BD71828_LDO4,
+	BD71828_LDO5,
+	BD71828_LDO6,
+	BD71828_LDO_SNVS,
+	BD71828_REGULATOR_AMOUNT,
+};
+
+#define BD71828_BUCK1267_VOLTS		0xEF
+#define BD71828_BUCK3_VOLTS		0x10
+#define BD71828_BUCK4_VOLTS		0x20
+#define BD71828_BUCK5_VOLTS		0x10
+#define BD71828_LDO_VOLTS		0x32
+/* LDO6 is fixed 1.8V voltage */
+#define BD71828_LDO_6_VOLTAGE		1800000
+
+/* Registers and masks*/
+
+/* MODE control */
+#define BD71828_REG_PS_CTRL_1		0x04
+#define BD71828_REG_PS_CTRL_2		0x05
+#define BD71828_REG_PS_CTRL_3		0x06
+
+//#define BD71828_REG_SWRESET		0x06
+#define BD71828_MASK_RUN_LVL_CTRL	0x30
+
+/* Regulator control masks */
+
+#define BD71828_MASK_RAMP_DELAY		0x6
+
+#define BD71828_MASK_RUN_EN		0x08
+#define BD71828_MASK_SUSP_EN		0x04
+#define BD71828_MASK_IDLE_EN		0x02
+#define BD71828_MASK_LPSR_EN		0x01
+
+#define BD71828_MASK_RUN0_EN		0x01
+#define BD71828_MASK_RUN1_EN		0x02
+#define BD71828_MASK_RUN2_EN		0x04
+#define BD71828_MASK_RUN3_EN		0x08
+
+#define BD71828_MASK_DVS_BUCK1_CTRL	0x10
+#define BD71828_DVS_BUCK1_CTRL_I2C	0
+#define BD71828_DVS_BUCK1_USE_RUNLVL	0x10
+
+#define BD71828_MASK_DVS_BUCK2_CTRL	0x20
+#define BD71828_DVS_BUCK2_CTRL_I2C	0
+#define BD71828_DVS_BUCK2_USE_RUNLVL	0x20
+
+#define BD71828_MASK_DVS_BUCK6_CTRL	0x40
+#define BD71828_DVS_BUCK6_CTRL_I2C	0
+#define BD71828_DVS_BUCK6_USE_RUNLVL	0x40
+
+#define BD71828_MASK_DVS_BUCK7_CTRL	0x80
+#define BD71828_DVS_BUCK7_CTRL_I2C	0
+#define BD71828_DVS_BUCK7_USE_RUNLVL	0x80
+
+#define BD71828_MASK_BUCK1267_VOLT	0xff
+#define BD71828_MASK_BUCK3_VOLT		0x1f
+#define BD71828_MASK_BUCK4_VOLT		0x3f
+#define BD71828_MASK_BUCK5_VOLT		0x1f
+#define BD71828_MASK_LDO_VOLT		0x3f
+
+/* Regulator control regs */
+#define BD71828_REG_BUCK1_EN		0x08
+#define BD71828_REG_BUCK1_CTRL		0x09
+#define BD71828_REG_BUCK1_MODE		0x0a
+#define BD71828_REG_BUCK1_IDLE_VOLT	0x0b
+#define BD71828_REG_BUCK1_SUSP_VOLT	0x0c
+#define BD71828_REG_BUCK1_VOLT		0x0d
+
+#define BD71828_REG_BUCK2_EN		0x12
+#define BD71828_REG_BUCK2_CTRL		0x13
+#define BD71828_REG_BUCK2_MODE		0x14
+#define BD71828_REG_BUCK2_IDLE_VOLT	0x15
+#define BD71828_REG_BUCK2_SUSP_VOLT	0x16
+#define BD71828_REG_BUCK2_VOLT		0x17
+
+#define BD71828_REG_BUCK3_EN		0x1c
+#define BD71828_REG_BUCK3_MODE		0x1d
+#define BD71828_REG_BUCK3_VOLT		0x1e
+
+#define BD71828_REG_BUCK4_EN		0x1f
+#define BD71828_REG_BUCK4_MODE		0x20
+#define BD71828_REG_BUCK4_VOLT		0x21
+
+#define BD71828_REG_BUCK5_EN		0x22
+#define BD71828_REG_BUCK5_MODE		0x23
+#define BD71828_REG_BUCK5_VOLT		0x24
+
+#define BD71828_REG_BUCK6_EN		0x25
+#define BD71828_REG_BUCK6_CTRL		0x26
+#define BD71828_REG_BUCK6_MODE		0x27
+#define BD71828_REG_BUCK6_IDLE_VOLT	0x28
+#define BD71828_REG_BUCK6_SUSP_VOLT	0x29
+#define BD71828_REG_BUCK6_VOLT		0x2a
+
+#define BD71828_REG_BUCK7_EN		0x2f
+#define BD71828_REG_BUCK7_CTRL		0x30
+#define BD71828_REG_BUCK7_MODE		0x31
+#define BD71828_REG_BUCK7_IDLE_VOLT	0x32
+#define BD71828_REG_BUCK7_SUSP_VOLT	0x33
+#define BD71828_REG_BUCK7_VOLT		0x34
+
+#define BD71828_REG_LDO1_EN		0x39
+#define BD71828_REG_LDO1_VOLT		0x3a
+#define BD71828_REG_LDO2_EN		0x3b
+#define BD71828_REG_LDO2_VOLT		0x3c
+#define BD71828_REG_LDO3_EN		0x3d
+#define BD71828_REG_LDO3_VOLT		0x3e
+#define BD71828_REG_LDO4_EN		0x3f
+#define BD71828_REG_LDO4_VOLT		0x40
+#define BD71828_REG_LDO5_EN		0x41
+#define BD71828_REG_LDO5_VOLT		0x43
+#define BD71828_REG_LDO5_VOLT_OPT	0x42
+#define BD71828_REG_LDO6_EN		0x44
+//#define BD71828_REG_LDO6_VOLT		0x4
+#define BD71828_REG_LDO7_EN		0x45
+#define BD71828_REG_LDO7_VOLT		0x46
+
+/* GPIO */
+
+#define BD71828_GPIO_DRIVE_MASK		0x2
+#define BD71828_GPIO_OPEN_DRAIN		0x0
+#define BD71828_GPIO_PUSH_PULL		0x2
+#define BD71828_GPIO_OUT_HI		0x1
+#define BD71828_GPIO_OUT_LO		0x0
+#define BD71828_GPIO_OUT_MASK		0x1
+
+#define BD71828_REG_GPIO_CTRL1		0x47
+#define BD71828_REG_GPIO_CTRL2		0x48
+#define BD71828_REG_GPIO_CTRL3		0x49
+#define BD71828_REG_IO_STAT		0xed
+
+/* RTC */
+#define BD71828_REG_RTC_SEC		0x4c
+#define BD71828_REG_RTC_MINUTE		0x4d
+#define BD71828_REG_RTC_HOUR		0x4e
+#define BD71828_REG_RTC_WEEK		0x4f
+#define BD71828_REG_RTC_DAY		0x50
+#define BD71828_REG_RTC_MONTH		0x51
+#define BD71828_REG_RTC_YEAR		0x52
+
+#define BD71828_REG_RTC_ALM0_SEC	0x53
+#define BD71828_REG_RTC_ALM0_MINUTE	0x54
+#define BD71828_REG_RTC_ALM0_HOUR	0x55
+#define BD71828_REG_RTC_ALM0_WEEK	0x56
+#define BD71828_REG_RTC_ALM0_DAY	0x57
+#define BD71828_REG_RTC_ALM0_MONTH	0x58
+#define BD71828_REG_RTC_ALM0_YEAR	0x59
+#define BD71828_REG_RTC_ALM0_MASK	0x61
+
+#define BD71828_REG_RTC_ALM1_SEC	0x5a
+#define BD71828_REG_RTC_ALM1_MINUTE	0x5b
+#define BD71828_REG_RTC_ALM1_HOUR	0x5c
+#define BD71828_REG_RTC_ALM1_WEEK	0x5d
+#define BD71828_REG_RTC_ALM1_DAY	0x5e
+#define BD71828_REG_RTC_ALM1_MONTH	0x5f
+#define BD71828_REG_RTC_ALM1_YEAR	0x60
+#define BD71828_REG_RTC_ALM1_MASK	0x62
+
+#define BD71828_REG_RTC_ALM2		0x63
+
+/* Charger/Battey */
+#define BD71828_REG_CHG_STATE		0x65
+#define BD71828_REG_CHG_FULL		0xd2
+
+/* CLK */
+#define BD71828_REG_OUT32K		0x4B
+
+/* LEDs */
+#define BD71828_REG_LED_CTRL		0x4A
+#define BD71828_MASK_LED_AMBER		0x80
+#define BD71828_MASK_LED_GREEN		0x40
+#define BD71828_LED_ON			0xff
+#define BD71828_LED_OFF			0x0
+
+/* IRQ registers */
+#define BD71828_REG_INT_MASK_BUCK	0xd3
+#define BD71828_REG_INT_MASK_DCIN1	0xd4
+#define BD71828_REG_INT_MASK_DCIN2	0xd5
+#define BD71828_REG_INT_MASK_VSYS	0xd6
+#define BD71828_REG_INT_MASK_CHG	0xd7
+#define BD71828_REG_INT_MASK_BAT	0xd8
+#define BD71828_REG_INT_MASK_BAT_MON1	0xd9
+#define BD71828_REG_INT_MASK_BAT_MON2	0xda
+#define BD71828_REG_INT_MASK_BAT_MON3	0xdb
+#define BD71828_REG_INT_MASK_BAT_MON4	0xdc
+#define BD71828_REG_INT_MASK_TEMP	0xdd
+#define BD71828_REG_INT_MASK_RTC	0xde
+
+
+#define BD71828_REG_INT_MAIN		0xdf
+#define BD71828_REG_INT_BUCK		0xe0
+#define BD71828_REG_INT_DCIN1		0xe1
+#define BD71828_REG_INT_DCIN2		0xe2
+#define BD71828_REG_INT_VSYS		0xe3
+#define BD71828_REG_INT_CHG		0xe4
+#define BD71828_REG_INT_BAT		0xe5
+#define BD71828_REG_INT_BAT_MON1	0xe6
+#define BD71828_REG_INT_BAT_MON2	0xe7
+#define BD71828_REG_INT_BAT_MON3	0xe8
+#define BD71828_REG_INT_BAT_MON4	0xe9
+#define BD71828_REG_INT_TEMP		0xea
+#define BD71828_REG_INT_RTC		0xeb
+#define BD71828_REG_INT_UPDATE		0xec
+
+#define BD71828_MAX_REGISTER BD71828_REG_IO_STAT
+
+/* Masks for main IRQ register bits */
+enum {
+	BD71828_INT_BUCK,
+#define BD71828_INT_BUCK_MASK BIT(BD71828_INT_BUCK)
+	BD71828_INT_DCIN,
+#define BD71828_INT_DCIN_MASK BIT(BD71828_INT_DCIN)
+	BD71828_INT_VSYS,
+#define BD71828_INT_VSYS_MASK BIT(BD71828_INT_VSYS)
+	BD71828_INT_CHG,
+#define BD71828_INT_CHG_MASK BIT(BD71828_INT_CHG)
+	BD71828_INT_BAT,
+#define BD71828_INT_BAT_MASK BIT(BD71828_INT_BAT)
+	BD71828_INT_BAT_MON,
+#define BD71828_INT_BAT_MON_MASK BIT(BD71828_INT_BAT_MON)
+	BD71828_INT_TEMP,
+#define BD71828_INT_TEMP_MASK BIT(BD71828_INT_TEMP)
+	BD71828_INT_RTC,
+#define BD71828_INT_RTC_MASK BIT(BD71828_INT_RTC)
+};
+
+/* Interrupts */
+enum {
+	/* BUCK reg interrupts */
+	BD71828_INT_BUCK1_OCP,
+	BD71828_INT_BUCK2_OCP,
+	BD71828_INT_BUCK3_OCP,
+	BD71828_INT_BUCK4_OCP,
+	BD71828_INT_BUCK5_OCP,
+	BD71828_INT_BUCK6_OCP,
+	BD71828_INT_BUCK7_OCP,
+	BD71828_INT_PGFAULT,
+	/* DCIN1 interrupts */
+	BD71828_INT_DCIN_DET,
+	BD71828_INT_DCIN_RMV,
+	BD71828_INT_CLPS_OUT,
+	BD71828_INT_CLPS_IN,
+	/* DCIN2 interrupts */
+	BD71828_INT_DCIN_MON_RES,
+	BD71828_INT_DCIN_MON_DET,
+	BD71828_INT_LONGPUSH,
+	BD71828_INT_MIDPUSH,
+	BD71828_INT_SHORTPUSH,
+	BD71828_INT_PUSH,
+	BD71828_INT_WDOG,
+	BD71828_INT_SWRESET,
+	/* Vsys */
+	BD71828_INT_VSYS_UV_RES,
+	BD71828_INT_VSYS_UV_DET,
+	BD71828_INT_VSYS_LOW_RES,
+	BD71828_INT_VSYS_LOW_DET,
+	BD71828_INT_VSYS_HALL_IN,
+	BD71828_INT_VSYS_HALL_TOGGLE,
+	BD71828_INT_VSYS_MON_RES,
+	BD71828_INT_VSYS_MON_DET,
+	/* Charger */
+	BD71828_INT_CHG_DCIN_ILIM,
+	BD71828_INT_CHG_TOPOFF_TO_DONE,
+	BD71828_INT_CHG_WDG_TEMP,
+	BD71828_INT_CHG_WDG_TIME,
+	BD71828_INT_CHG_RECHARGE_RES,
+	BD71828_INT_CHG_RECHARGE_DET,
+	BD71828_INT_CHG_RANGED_TEMP_TRANSITION,
+	BD71828_INT_CHG_STATE_TRANSITION,
+	/* Battery */
+	BD71828_INT_BAT_TEMP_NORMAL,
+	BD71828_INT_BAT_TEMP_ERANGE,
+	BD71828_INT_BAT_TEMP_WARN,
+	BD71828_INT_BAT_REMOVED,
+	BD71828_INT_BAT_DETECTED,
+	BD71828_INT_THERM_REMOVED,
+	BD71828_INT_THERM_DETECTED,
+	/* Battery Mon 1 */
+	BD71828_INT_BAT_DEAD,
+	BD71828_INT_BAT_SHORTC_RES,
+	BD71828_INT_BAT_SHORTC_DET,
+	BD71828_INT_BAT_LOW_VOLT_RES,
+	BD71828_INT_BAT_LOW_VOLT_DET,
+	BD71828_INT_BAT_OVER_VOLT_RES,
+	BD71828_INT_BAT_OVER_VOLT_DET,
+	/* Battery Mon 2 */
+	BD71828_INT_BAT_MON_RES,
+	BD71828_INT_BAT_MON_DET,
+	/* Battery Mon 3 (Coulomb counter) */
+	BD71828_INT_BAT_CC_MON1,
+	BD71828_INT_BAT_CC_MON2,
+	BD71828_INT_BAT_CC_MON3,
+	/* Battery Mon 4 */
+	BD71828_INT_BAT_OVER_CURR_1_RES,
+	BD71828_INT_BAT_OVER_CURR_1_DET,
+	BD71828_INT_BAT_OVER_CURR_2_RES,
+	BD71828_INT_BAT_OVER_CURR_2_DET,
+	BD71828_INT_BAT_OVER_CURR_3_RES,
+	BD71828_INT_BAT_OVER_CURR_3_DET,
+	/* Temperature */
+	BD71828_INT_TEMP_BAT_LOW_RES,
+	BD71828_INT_TEMP_BAT_LOW_DET,
+	BD71828_INT_TEMP_BAT_HI_RES,
+	BD71828_INT_TEMP_BAT_HI_DET,
+	BD71828_INT_TEMP_CHIP_OVER_125_RES,
+	BD71828_INT_TEMP_CHIP_OVER_125_DET,
+	BD71828_INT_TEMP_CHIP_OVER_VF_DET,
+	BD71828_INT_TEMP_CHIP_OVER_VF_RES,
+	/* RTC Alarm */
+	BD71828_INT_RTC0,
+	BD71828_INT_RTC1,
+	BD71828_INT_RTC2,
+};
+
+#define BD71828_INT_BUCK1_OCP_MASK			0x1
+#define BD71828_INT_BUCK2_OCP_MASK			0x2
+#define BD71828_INT_BUCK3_OCP_MASK			0x4
+#define BD71828_INT_BUCK4_OCP_MASK			0x8
+#define BD71828_INT_BUCK5_OCP_MASK			0x10
+#define BD71828_INT_BUCK6_OCP_MASK			0x20
+#define BD71828_INT_BUCK7_OCP_MASK			0x40
+#define BD71828_INT_PGFAULT_MASK			0x80
+
+#define BD71828_INT_DCIN_DET_MASK			0x1
+#define BD71828_INT_DCIN_RMV_MASK			0x2
+#define BD71828_INT_CLPS_OUT_MASK			0x4
+#define BD71828_INT_CLPS_IN_MASK			0x8
+	/* DCIN2 interrupts */
+#define BD71828_INT_DCIN_MON_RES_MASK			0x1
+#define BD71828_INT_DCIN_MON_DET_MASK			0x2
+#define BD71828_INT_LONGPUSH_MASK			0x4
+#define BD71828_INT_MIDPUSH_MASK			0x8
+#define BD71828_INT_SHORTPUSH_MASK			0x10
+#define BD71828_INT_PUSH_MASK				0x20
+#define BD71828_INT_WDOG_MASK				0x40
+#define BD71828_INT_SWRESET_MASK			0x80
+	/* Vsys */
+#define BD71828_INT_VSYS_UV_RES_MASK			0x1
+#define BD71828_INT_VSYS_UV_DET_MASK			0x2
+#define BD71828_INT_VSYS_LOW_RES_MASK			0x4
+#define BD71828_INT_VSYS_LOW_DET_MASK			0x8
+#define BD71828_INT_VSYS_HALL_IN_MASK			0x10
+#define BD71828_INT_VSYS_HALL_TOGGLE_MASK		0x20
+#define BD71828_INT_VSYS_MON_RES_MASK			0x40
+#define BD71828_INT_VSYS_MON_DET_MASK			0x80
+	/* Charger */
+#define BD71828_INT_CHG_DCIN_ILIM_MASK			0x1
+#define BD71828_INT_CHG_TOPOFF_TO_DONE_MASK		0x2
+#define BD71828_INT_CHG_WDG_TEMP_MASK			0x4
+#define BD71828_INT_CHG_WDG_TIME_MASK			0x8
+#define BD71828_INT_CHG_RECHARGE_RES_MASK		0x10
+#define BD71828_INT_CHG_RECHARGE_DET_MASK		0x20
+#define BD71828_INT_CHG_RANGED_TEMP_TRANSITION_MASK	0x40
+#define BD71828_INT_CHG_STATE_TRANSITION_MASK		0x80
+	/* Battery */
+#define BD71828_INT_BAT_TEMP_NORMAL_MASK		0x1
+#define BD71828_INT_BAT_TEMP_ERANGE_MASK		0x2
+#define BD71828_INT_BAT_TEMP_WARN_MASK			0x4
+#define BD71828_INT_BAT_REMOVED_MASK			0x10
+#define BD71828_INT_BAT_DETECTED_MASK			0x20
+#define BD71828_INT_THERM_REMOVED_MASK			0x40
+#define BD71828_INT_THERM_DETECTED_MASK			0x80
+	/* Battery Mon 1 */
+#define BD71828_INT_BAT_DEAD_MASK			0x2
+#define BD71828_INT_BAT_SHORTC_RES_MASK			0x4
+#define BD71828_INT_BAT_SHORTC_DET_MASK			0x8
+#define BD71828_INT_BAT_LOW_VOLT_RES_MASK		0x10
+#define BD71828_INT_BAT_LOW_VOLT_DET_MASK		0x20
+#define BD71828_INT_BAT_OVER_VOLT_RES_MASK		0x40
+#define BD71828_INT_BAT_OVER_VOLT_DET_MASK		0x80
+	/* Battery Mon 2 */
+#define BD71828_INT_BAT_MON_RES_MASK			0x1
+#define BD71828_INT_BAT_MON_DET_MASK			0x2
+	/* Battery Mon 3 (Coulomb counter) */
+#define BD71828_INT_BAT_CC_MON1_MASK			0x1
+#define BD71828_INT_BAT_CC_MON2_MASK			0x2
+#define BD71828_INT_BAT_CC_MON3_MASK			0x4
+	/* Battery Mon 4 */
+#define BD71828_INT_BAT_OVER_CURR_1_RES_MASK		0x1
+#define BD71828_INT_BAT_OVER_CURR_1_DET_MASK		0x2
+#define BD71828_INT_BAT_OVER_CURR_2_RES_MASK		0x4
+#define BD71828_INT_BAT_OVER_CURR_2_DET_MASK		0x8
+#define BD71828_INT_BAT_OVER_CURR_3_RES_MASK		0x10
+#define BD71828_INT_BAT_OVER_CURR_3_DET_MASK		0x20
+	/* Temperature */
+#define BD71828_INT_TEMP_BAT_LOW_RES_MASK		0x1
+#define BD71828_INT_TEMP_BAT_LOW_DET_MASK		0x2
+#define BD71828_INT_TEMP_BAT_HI_RES_MASK		0x4
+#define BD71828_INT_TEMP_BAT_HI_DET_MASK		0x8
+#define BD71828_INT_TEMP_CHIP_OVER_125_RES_MASK		0x10
+#define BD71828_INT_TEMP_CHIP_OVER_125_DET_MASK		0x20
+#define BD71828_INT_TEMP_CHIP_OVER_VF_RES_MASK		0x40
+#define BD71828_INT_TEMP_CHIP_OVER_VF_DET_MASK		0x80
+	/* RTC Alarm */
+#define BD71828_INT_RTC0_MASK				0x1
+#define BD71828_INT_RTC1_MASK				0x2
+#define BD71828_INT_RTC2_MASK				0x4
+
+#define BD71828_OUT32K_EN				0x1
+#define BD71828_OUT_TYPE_MASK				0x2
+#define BD71828_OUT_TYPE_OPEN_DRAIN			0x0
+#define BD71828_OUT_TYPE_CMOS				0x2
+
+#endif /* __LINUX_MFD_BD71828_H__ */
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index bff15ac26f2c..b280f3100d6c 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -8,6 +8,7 @@ enum {
 	ROHM_CHIP_TYPE_BD71837 = 0,
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD70528,
+	ROHM_CHIP_TYPE_BD71828,
 	ROHM_CHIP_TYPE_AMOUNT
 };
 
-- 
2.21.0


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
