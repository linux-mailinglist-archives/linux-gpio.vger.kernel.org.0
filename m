Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB8823298F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 09:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfFCH2h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 03:28:37 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43233 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfFCH2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 03:28:37 -0400
Received: by mail-lf1-f66.google.com with SMTP id d7so3209211lfb.10;
        Mon, 03 Jun 2019 00:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QtgMFqA126eYpqYj/gS6GgFMmnEQU0ie9ciJ4JlHlKM=;
        b=Xq++wD2xsKD44Z+D9rJdoyEgyInOLvwqIOJCcgzXU3fB09DIgZro/T6uLN7BmVvvV3
         KknUX45vn7O8t6vtEmUL3PsF/tvZ92e1A1YlJHYcYJD0xRMQ5Sme4tWNwBOUzDKHYkcq
         v2eqnao6hWFKJqde7kAuiVvrJ9tgKddGjiCgEdELHuo7Z9YOJpY8GF8IWO1n12cmLHwd
         reCnB3yoeq2Cmsudgty+8cteV6stAEVJ/Vy44VIoe5YEWYo/cJoCxtQNVh0Ahd2KFA3G
         3vetSbkvLdLwG3vuX5h8mP4xSLY4NVtVtUr6asdnEshxIbX2P1hg7D3OIiTi6/hiflLA
         LDEA==
X-Gm-Message-State: APjAAAUvFWu5DUx4ALm3vzQNpvpx68KCmBC/kmdcoA44EN3JARg+fLec
        qzOCwhINqc+PQvHPWbZJFgY=
X-Google-Smtp-Source: APXvYqxXnHbK1r0zVin6Tm9egP0NeVCKVmbttzBbqOWfePGC67RjwJB8wAOKC+DM8kZECl8IoEpnzA==
X-Received: by 2002:ac2:4202:: with SMTP id y2mr6746834lfh.178.1559546912041;
        Mon, 03 Jun 2019 00:28:32 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id r10sm1053603lja.29.2019.06.03.00.28.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 00:28:31 -0700 (PDT)
Date:   Mon, 3 Jun 2019 10:28:20 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v15 7/7] power: supply: Initial support for ROHM BD70528 PMIC
 charger block
Message-ID: <7a4907473bc763b01bcfd20422786d1e1c7d3c33.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ROHM BD70528 PMIC includes battery charger block. Support charger
staus queries and doing few basic settings like input current limit
and charging current.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Staticized the const array to move it to RO section as suggested by
Sebastian

 drivers/power/supply/Kconfig           |   9 +
 drivers/power/supply/Makefile          |   1 +
 drivers/power/supply/bd70528-charger.c | 743 +++++++++++++++++++++++++
 3 files changed, 753 insertions(+)
 create mode 100644 drivers/power/supply/bd70528-charger.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index dd7da41f230c..4a3cd679295b 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -689,4 +689,13 @@ config CHARGER_UCS1002
 	  Say Y to enable support for Microchip UCS1002 Programmable
 	  USB Port Power Controller with Charger Emulation.
 
+config CHARGER_BD70528
+	tristate "ROHM bd70528 charger driver"
+	depends on MFD_ROHM_BD70528
+	default n
+	help
+	 Say Y here to enable support for getting battery status
+	 information and altering charger configurations from charger
+	 block of the ROHM BD70528 Power Management IC.
+
 endif # POWER_SUPPLY
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index f208273f9686..346a8ef5f348 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -90,3 +90,4 @@ obj-$(CONFIG_CHARGER_CROS_USBPD)	+= cros_usbpd-charger.o
 obj-$(CONFIG_CHARGER_SC2731)	+= sc2731_charger.o
 obj-$(CONFIG_FUEL_GAUGE_SC27XX)	+= sc27xx_fuel_gauge.o
 obj-$(CONFIG_CHARGER_UCS1002)	+= ucs1002_power.o
+obj-$(CONFIG_CHARGER_BD70528)	+= bd70528-charger.o
diff --git a/drivers/power/supply/bd70528-charger.c b/drivers/power/supply/bd70528-charger.c
new file mode 100644
index 000000000000..1bb32b7226d7
--- /dev/null
+++ b/drivers/power/supply/bd70528-charger.c
@@ -0,0 +1,743 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Copyright (C) 2018 ROHM Semiconductors
+//
+// power-supply driver for ROHM BD70528 PMIC
+
+/*
+ * BD70528 charger HW state machine.
+ *
+ * The thermal shutdown state is not drawn. From any other state but
+ * battery error and suspend it is possible to go to TSD/TMP states
+ * if temperature is out of bounds.
+ *
+ *  CHG_RST = H
+ *  or CHG_EN=L
+ *  or (DCIN2_UVLO=L && DCIN1_UVLO=L)
+ *  or (DCIN2_OVLO=H & DCIN1_UVKLO=L)
+ *
+ *  +--------------+         +--------------+
+ *  |              |         |              |
+ *  |  Any state   +-------> |    Suspend   |
+ *  |              |         |              |
+ *  +--------------+         +------+-------+
+ *                                  |
+ *  CHG_EN = H && BAT_DET = H &&    |
+ *  No errors (temp, bat_ov, UVLO,  |
+ *  OVLO...)                        |
+ *                                  |
+ *  BAT_OV or             +---------v----------+
+ *  (DBAT && TTRI)        |                    |
+ *      +-----------------+   Trickle Charge   | <---------------+
+ *      |                 |                    |                 |
+ *      |                 +-------+------------+                 |
+ *      |                         |                              |
+ *      |                         |     ^                        |
+ *      |        V_BAT > VTRI_TH  |     |  VBAT < VTRI_TH - 50mV |
+ *      |                         |     |                        |
+ *      |                         v     |                        |
+ *      |                               |                        |
+ *      |     BAT_OV or      +----------+----+                   |
+ *      |     (DBAT && TFST) |               |                   |
+ *      |   +----------------+  Fast Charge  |                   |
+ *      |   |                |               |                   |
+ *      v   v                +----+----------+                   |
+ *                                |                              |
+ *+----------------+   ILIM_DET=L |    ^ ILIM_DET                |
+ *|                |   & CV_DET=H |    | or CV_DET=L             |
+ *|  Battery Error |   & VBAT >   |    | or VBAT < VRECHG_TH     |
+ *|                |   VRECHG_TH  |    | or IBAT  > IFST/x       |
+ *+----------------+   & IBAT <   |    |                         |
+ *                     IFST/x     v    |                         |
+ *       ^                             |                         |
+ *       |                   +---------+-+                       |
+ *       |                   |           |                       |
+ *       +-------------------+  Top OFF  |                       |
+ *  BAT_OV = H or            |           |                       |
+ *  (DBAT && TFST)           +-----+-----+                       |
+ *                                 |                             |
+ *           Stay top-off for 15s  |                             |
+ *                                 v                             |
+ *                                                               |
+ *                            +--------+                         |
+ *                            |        |                         |
+ *                            |  Done  +-------------------------+
+ *                            |        |
+ *                            +--------+   VBAT < VRECHG_TH
+ */
+
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/rohm-bd70528.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+
+#define CHG_STAT_SUSPEND	0x0
+#define CHG_STAT_TRICKLE	0x1
+#define CHG_STAT_FAST		0x3
+#define CHG_STAT_TOPOFF		0xe
+#define CHG_STAT_DONE		0xf
+#define CHG_STAT_OTP_TRICKLE	0x10
+#define CHG_STAT_OTP_FAST	0x11
+#define CHG_STAT_OTP_DONE	0x12
+#define CHG_STAT_TSD_TRICKLE	0x20
+#define CHG_STAT_TSD_FAST	0x21
+#define CHG_STAT_TSD_TOPOFF	0x22
+#define CHG_STAT_BAT_ERR	0x7f
+
+static const char *bd70528_charger_model = "BD70528";
+static const char *bd70528_charger_manufacturer = "ROHM Semiconductors";
+
+#define BD_ERR_IRQ_HND(_name_, _wrn_)					\
+static irqreturn_t bd0528_##_name_##_interrupt(int irq, void *arg)	\
+{									\
+	struct power_supply *psy = (struct power_supply *)arg;		\
+									\
+	power_supply_changed(psy);					\
+	dev_err(&psy->dev, (_wrn_));					\
+									\
+	return IRQ_HANDLED;						\
+}
+
+#define BD_INFO_IRQ_HND(_name_, _wrn_)					\
+static irqreturn_t bd0528_##_name_##_interrupt(int irq, void *arg)	\
+{									\
+	struct power_supply *psy = (struct power_supply *)arg;		\
+									\
+	power_supply_changed(psy);					\
+	dev_dbg(&psy->dev, (_wrn_));					\
+									\
+	return IRQ_HANDLED;						\
+}
+
+#define BD_IRQ_HND(_name_) bd0528_##_name_##_interrupt
+
+struct bd70528_psy {
+	struct regmap *regmap;
+	struct device *dev;
+	struct power_supply *psy;
+};
+
+BD_ERR_IRQ_HND(BAT_OV_DET, "Battery overvoltage detected\n");
+BD_ERR_IRQ_HND(DBAT_DET, "Dead battery detected\n");
+BD_ERR_IRQ_HND(COLD_DET, "Battery cold\n");
+BD_ERR_IRQ_HND(HOT_DET, "Battery hot\n");
+BD_ERR_IRQ_HND(CHG_TSD, "Charger thermal shutdown\n");
+BD_ERR_IRQ_HND(DCIN2_OV_DET, "DCIN2 overvoltage detected\n");
+
+BD_INFO_IRQ_HND(BAT_OV_RES, "Battery voltage back to normal\n");
+BD_INFO_IRQ_HND(COLD_RES, "Battery temperature back to normal\n");
+BD_INFO_IRQ_HND(HOT_RES, "Battery temperature back to normal\n");
+BD_INFO_IRQ_HND(BAT_RMV, "Battery removed\n");
+BD_INFO_IRQ_HND(BAT_DET, "Battery detected\n");
+BD_INFO_IRQ_HND(DCIN2_OV_RES, "DCIN2 voltage back to normal\n");
+BD_INFO_IRQ_HND(DCIN2_RMV, "DCIN2 removed\n");
+BD_INFO_IRQ_HND(DCIN2_DET, "DCIN2 detected\n");
+BD_INFO_IRQ_HND(DCIN1_RMV, "DCIN1 removed\n");
+BD_INFO_IRQ_HND(DCIN1_DET, "DCIN1 detected\n");
+
+struct irq_name_pair {
+	const char *n;
+	irqreturn_t (*h)(int irq, void *arg);
+};
+
+static int bd70528_get_irqs(struct platform_device *pdev,
+			    struct bd70528_psy *bdpsy)
+{
+	int irq, i, ret;
+	unsigned int mask;
+	static const struct irq_name_pair bd70528_chg_irqs[] = {
+		{ .n = "bd70528-bat-ov-res", .h = BD_IRQ_HND(BAT_OV_RES) },
+		{ .n = "bd70528-bat-ov-det", .h = BD_IRQ_HND(BAT_OV_DET) },
+		{ .n = "bd70528-bat-dead", .h = BD_IRQ_HND(DBAT_DET) },
+		{ .n = "bd70528-bat-warmed", .h = BD_IRQ_HND(COLD_RES) },
+		{ .n = "bd70528-bat-cold", .h = BD_IRQ_HND(COLD_DET) },
+		{ .n = "bd70528-bat-cooled", .h = BD_IRQ_HND(HOT_RES) },
+		{ .n = "bd70528-bat-hot", .h = BD_IRQ_HND(HOT_DET) },
+		{ .n = "bd70528-chg-tshd", .h = BD_IRQ_HND(CHG_TSD) },
+		{ .n = "bd70528-bat-removed", .h = BD_IRQ_HND(BAT_RMV) },
+		{ .n = "bd70528-bat-detected", .h = BD_IRQ_HND(BAT_DET) },
+		{ .n = "bd70528-dcin2-ov-res", .h = BD_IRQ_HND(DCIN2_OV_RES) },
+		{ .n = "bd70528-dcin2-ov-det", .h = BD_IRQ_HND(DCIN2_OV_DET) },
+		{ .n = "bd70528-dcin2-removed", .h = BD_IRQ_HND(DCIN2_RMV) },
+		{ .n = "bd70528-dcin2-detected", .h = BD_IRQ_HND(DCIN2_DET) },
+		{ .n = "bd70528-dcin1-removed", .h = BD_IRQ_HND(DCIN1_RMV) },
+		{ .n = "bd70528-dcin1-detected", .h = BD_IRQ_HND(DCIN1_DET) },
+	};
+
+	for (i = 0; i < ARRAY_SIZE(bd70528_chg_irqs); i++) {
+		irq = platform_get_irq_byname(pdev, bd70528_chg_irqs[i].n);
+		if (irq < 0) {
+			dev_err(&pdev->dev, "Bad IRQ information for %s (%d)\n",
+				bd70528_chg_irqs[i].n, irq);
+			return irq;
+		}
+		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+						bd70528_chg_irqs[i].h,
+						IRQF_ONESHOT,
+						bd70528_chg_irqs[i].n,
+						bdpsy->psy);
+
+		if (ret)
+			return ret;
+	}
+	/*
+	 * BD70528 irq controller is not touching the main mask register.
+	 * So enable the charger block interrupts at main level. We can just
+	 * leave them enabled as irq-controller should disable irqs
+	 * from sub-registers when IRQ is disabled or freed.
+	 */
+	mask = BD70528_REG_INT_BAT1_MASK | BD70528_REG_INT_BAT2_MASK;
+	ret = regmap_update_bits(bdpsy->regmap,
+				 BD70528_REG_INT_MAIN_MASK, mask, 0);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to enable charger IRQs\n");
+
+	return ret;
+}
+
+static int bd70528_get_charger_status(struct bd70528_psy *bdpsy, int *val)
+{
+	int ret;
+	unsigned int v;
+
+	ret = regmap_read(bdpsy->regmap, BD70528_REG_CHG_CURR_STAT, &v);
+	if (ret) {
+		dev_err(bdpsy->dev, "Charger state read failure %d\n",
+			ret);
+		return ret;
+	}
+
+	switch (v & BD70528_MASK_CHG_STAT) {
+	case CHG_STAT_SUSPEND:
+	/* Maybe we should check the CHG_TTRI_EN? */
+	case CHG_STAT_OTP_TRICKLE:
+	case CHG_STAT_OTP_FAST:
+	case CHG_STAT_OTP_DONE:
+	case CHG_STAT_TSD_TRICKLE:
+	case CHG_STAT_TSD_FAST:
+	case CHG_STAT_TSD_TOPOFF:
+	case CHG_STAT_BAT_ERR:
+		*val = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
+	case CHG_STAT_DONE:
+		*val = POWER_SUPPLY_STATUS_FULL;
+		break;
+	case CHG_STAT_TRICKLE:
+	case CHG_STAT_FAST:
+	case CHG_STAT_TOPOFF:
+		*val = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	default:
+		*val = POWER_SUPPLY_STATUS_UNKNOWN;
+		break;
+	}
+
+	return 0;
+}
+
+static int bd70528_get_charge_type(struct bd70528_psy *bdpsy, int *val)
+{
+	int ret;
+	unsigned int v;
+
+	ret = regmap_read(bdpsy->regmap, BD70528_REG_CHG_CURR_STAT, &v);
+	if (ret) {
+		dev_err(bdpsy->dev, "Charger state read failure %d\n",
+			ret);
+		return ret;
+	}
+
+	switch (v & BD70528_MASK_CHG_STAT) {
+	case CHG_STAT_TRICKLE:
+		*val = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+		break;
+	case CHG_STAT_FAST:
+	case CHG_STAT_TOPOFF:
+		*val = POWER_SUPPLY_CHARGE_TYPE_FAST;
+		break;
+	case CHG_STAT_DONE:
+	case CHG_STAT_SUSPEND:
+	/* Maybe we should check the CHG_TTRI_EN? */
+	case CHG_STAT_OTP_TRICKLE:
+	case CHG_STAT_OTP_FAST:
+	case CHG_STAT_OTP_DONE:
+	case CHG_STAT_TSD_TRICKLE:
+	case CHG_STAT_TSD_FAST:
+	case CHG_STAT_TSD_TOPOFF:
+	case CHG_STAT_BAT_ERR:
+		*val = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		break;
+	default:
+		*val = POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
+		break;
+	}
+
+	return 0;
+}
+
+static int bd70528_get_battery_health(struct bd70528_psy *bdpsy, int *val)
+{
+	int ret;
+	unsigned int v;
+
+	ret = regmap_read(bdpsy->regmap, BD70528_REG_CHG_BAT_STAT, &v);
+	if (ret) {
+		dev_err(bdpsy->dev, "Battery state read failure %d\n",
+			ret);
+		return ret;
+	}
+	/* No battery? */
+	if (!(v & BD70528_MASK_CHG_BAT_DETECT))
+		*val = POWER_SUPPLY_HEALTH_DEAD;
+	else if (v & BD70528_MASK_CHG_BAT_OVERVOLT)
+		*val = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
+	else if (v & BD70528_MASK_CHG_BAT_TIMER)
+		*val = POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE;
+	else
+		*val = POWER_SUPPLY_HEALTH_GOOD;
+
+	return 0;
+}
+
+static int bd70528_get_online(struct bd70528_psy *bdpsy, int *val)
+{
+	int ret;
+	unsigned int v;
+
+	ret = regmap_read(bdpsy->regmap, BD70528_REG_CHG_IN_STAT, &v);
+	if (ret) {
+		dev_err(bdpsy->dev, "DC1 IN state read failure %d\n",
+			ret);
+		return ret;
+	}
+
+	*val = (v & BD70528_MASK_CHG_DCIN1_UVLO) ? 1 : 0;
+
+	return 0;
+}
+
+static int bd70528_get_present(struct bd70528_psy *bdpsy, int *val)
+{
+	int ret;
+	unsigned int v;
+
+	ret = regmap_read(bdpsy->regmap, BD70528_REG_CHG_BAT_STAT, &v);
+	if (ret) {
+		dev_err(bdpsy->dev, "Battery state read failure %d\n",
+			ret);
+		return ret;
+	}
+
+	*val = (v & BD70528_MASK_CHG_BAT_DETECT) ? 1 : 0;
+
+	return 0;
+}
+
+struct linear_range {
+	int min;
+	int step;
+	int vals;
+	int low_sel;
+};
+
+static const struct linear_range current_limit_ranges[] = {
+	{
+		.min = 5,
+		.step = 1,
+		.vals = 36,
+		.low_sel = 0,
+	},
+	{
+		.min = 40,
+		.step = 5,
+		.vals = 5,
+		.low_sel = 0x23,
+	},
+	{
+		.min = 60,
+		.step = 20,
+		.vals = 8,
+		.low_sel = 0x27,
+	},
+	{
+		.min = 200,
+		.step = 50,
+		.vals = 7,
+		.low_sel = 0x2e,
+	}
+};
+
+/*
+ * BD70528 would support setting and getting own charge current/
+ * voltage for low temperatures. The driver currently only reads
+ * the charge current at room temperature. We do set both though.
+ */
+static const struct linear_range warm_charge_curr[] = {
+	{
+		.min = 10,
+		.step = 10,
+		.vals = 20,
+		.low_sel = 0,
+	},
+	{
+		.min = 200,
+		.step = 25,
+		.vals = 13,
+		.low_sel = 0x13,
+	},
+};
+
+/*
+ * Cold charge current selectors are identical to warm charge current
+ * selectors. The difference is that only smaller currents are available
+ * at cold charge range.
+ */
+#define MAX_COLD_CHG_CURR_SEL 0x15
+#define MAX_WARM_CHG_CURR_SEL 0x1f
+#define MIN_CHG_CURR_SEL 0x0
+
+static int find_value_for_selector_low(const struct linear_range *r,
+				       int selectors, unsigned int sel,
+				       unsigned int *val)
+{
+	int i;
+
+	for (i = 0; i < selectors; i++) {
+		if (r[i].low_sel <= sel && r[i].low_sel + r[i].vals >= sel) {
+			*val = r[i].min + (sel - r[i].low_sel) * r[i].step;
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+
+/*
+ * For BD70528 voltage/current limits we happily accept any value which
+ * belongs the range. We could check if value matching the selector is
+ * desired by computing the range min + (sel - sel_low) * range step - but
+ * I guess it is enough if we use voltage/current which is closest (below)
+ * the requested?
+ */
+static int find_selector_for_value_low(const struct linear_range *r,
+				       int selectors, unsigned int val,
+				       unsigned int *sel, bool *found)
+{
+	int i;
+	int ret = -EINVAL;
+
+	*found = false;
+	for (i = 0; i < selectors; i++) {
+		if (r[i].min <= val) {
+			if (r[i].min + r[i].step * r[i].vals >= val) {
+				*found = true;
+				*sel = r[i].low_sel + (val - r[i].min) /
+				       r[i].step;
+				ret = 0;
+				break;
+			}
+			/*
+			 * If the range max is smaller than requested
+			 * we can set the max supported value from range
+			 */
+			*sel = r[i].low_sel + r[i].vals;
+			ret = 0;
+		}
+	}
+	return ret;
+}
+
+static int get_charge_current(struct bd70528_psy *bdpsy, int *ma)
+{
+	unsigned int sel;
+	int ret;
+
+	ret = regmap_read(bdpsy->regmap, BD70528_REG_CHG_CHG_CURR_WARM,
+			  &sel);
+	if (ret) {
+		dev_err(bdpsy->dev,
+			"Charge current reading failed (%d)\n", ret);
+		return ret;
+	}
+
+	sel &= BD70528_MASK_CHG_CHG_CURR;
+
+	ret = find_value_for_selector_low(&warm_charge_curr[0],
+					  ARRAY_SIZE(warm_charge_curr), sel,
+					  ma);
+	if (ret) {
+		dev_err(bdpsy->dev,
+			"Unknown charge current value 0x%x\n",
+			sel);
+	}
+
+	return ret;
+}
+
+static int get_current_limit(struct bd70528_psy *bdpsy, int *ma)
+{
+	unsigned int sel;
+	int ret;
+
+	ret = regmap_read(bdpsy->regmap, BD70528_REG_CHG_DCIN_ILIM,
+			  &sel);
+
+	if (ret) {
+		dev_err(bdpsy->dev,
+			"Input current limit reading failed (%d)\n", ret);
+		return ret;
+	}
+
+	sel &= BD70528_MASK_CHG_DCIN_ILIM;
+
+	ret = find_value_for_selector_low(&current_limit_ranges[0],
+					  ARRAY_SIZE(current_limit_ranges), sel,
+					  ma);
+
+	if (ret) {
+		/* Unspecified values mean 500 mA */
+		*ma = 500;
+	}
+	return 0;
+}
+
+static enum power_supply_property bd70528_charger_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_CHARGE_TYPE,
+	POWER_SUPPLY_PROP_HEALTH,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_MANUFACTURER,
+};
+
+static int bd70528_charger_get_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					union power_supply_propval *val)
+{
+	struct bd70528_psy *bdpsy = power_supply_get_drvdata(psy);
+	int ret = 0;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		return bd70528_get_charger_status(bdpsy, &val->intval);
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		return bd70528_get_charge_type(bdpsy, &val->intval);
+	case POWER_SUPPLY_PROP_HEALTH:
+		return bd70528_get_battery_health(bdpsy, &val->intval);
+	case POWER_SUPPLY_PROP_PRESENT:
+		return bd70528_get_present(bdpsy, &val->intval);
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		ret = get_current_limit(bdpsy, &val->intval);
+		val->intval *= 1000;
+		return ret;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		ret = get_charge_current(bdpsy, &val->intval);
+		val->intval *= 1000;
+		return ret;
+	case POWER_SUPPLY_PROP_ONLINE:
+		return bd70528_get_online(bdpsy, &val->intval);
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = bd70528_charger_model;
+		return 0;
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		val->strval = bd70528_charger_manufacturer;
+		return 0;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int bd70528_prop_is_writable(struct power_supply *psy,
+				    enum power_supply_property psp)
+{
+	switch (psp) {
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		return 1;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int set_charge_current(struct bd70528_psy *bdpsy, int ma)
+{
+	unsigned int reg;
+	int ret = 0, tmpret;
+	bool found;
+
+	if (ma > 500) {
+		dev_warn(bdpsy->dev,
+			 "Requested charge current %u exceed maximum (500mA)\n",
+			 ma);
+		reg = MAX_WARM_CHG_CURR_SEL;
+		goto set;
+	}
+	if (ma < 10) {
+		dev_err(bdpsy->dev,
+			"Requested charge current %u smaller than min (10mA)\n",
+			 ma);
+		reg = MIN_CHG_CURR_SEL;
+		ret = -EINVAL;
+		goto set;
+	}
+
+	ret = find_selector_for_value_low(&warm_charge_curr[0],
+					  ARRAY_SIZE(warm_charge_curr), ma,
+					  &reg, &found);
+	if (ret) {
+		reg = MIN_CHG_CURR_SEL;
+		goto set;
+	}
+	if (!found) {
+		/* There was a gap in supported values and we hit it */
+		dev_warn(bdpsy->dev,
+			 "Unsupported charge current %u mA\n", ma);
+	}
+set:
+
+	tmpret = regmap_update_bits(bdpsy->regmap,
+				    BD70528_REG_CHG_CHG_CURR_WARM,
+				    BD70528_MASK_CHG_CHG_CURR, reg);
+	if (tmpret)
+		dev_err(bdpsy->dev,
+			"Charge current write failure (%d)\n", tmpret);
+
+	if (reg > MAX_COLD_CHG_CURR_SEL)
+		reg = MAX_COLD_CHG_CURR_SEL;
+
+	if (!tmpret)
+		tmpret = regmap_update_bits(bdpsy->regmap,
+					    BD70528_REG_CHG_CHG_CURR_COLD,
+					    BD70528_MASK_CHG_CHG_CURR, reg);
+
+	if (!ret)
+		ret = tmpret;
+
+	return ret;
+}
+
+#define MAX_CURR_LIMIT_SEL 0x34
+#define MIN_CURR_LIMIT_SEL 0x0
+
+static int set_current_limit(struct bd70528_psy *bdpsy, int ma)
+{
+	unsigned int reg;
+	int ret = 0, tmpret;
+	bool found;
+
+	if (ma > 500) {
+		dev_warn(bdpsy->dev,
+			 "Requested current limit %u exceed maximum (500mA)\n",
+			 ma);
+		reg = MAX_CURR_LIMIT_SEL;
+		goto set;
+	}
+	if (ma < 5) {
+		dev_err(bdpsy->dev,
+			"Requested current limit %u smaller than min (5mA)\n",
+			ma);
+		reg = MIN_CURR_LIMIT_SEL;
+		ret = -EINVAL;
+		goto set;
+	}
+
+	ret = find_selector_for_value_low(&current_limit_ranges[0],
+					  ARRAY_SIZE(current_limit_ranges), ma,
+					  &reg, &found);
+	if (ret) {
+		reg = MIN_CURR_LIMIT_SEL;
+		goto set;
+	}
+	if (!found) {
+		/* There was a gap in supported values and we hit it ?*/
+		dev_warn(bdpsy->dev, "Unsupported current limit %umA\n",
+			 ma);
+	}
+
+set:
+	tmpret = regmap_update_bits(bdpsy->regmap,
+				    BD70528_REG_CHG_DCIN_ILIM,
+				    BD70528_MASK_CHG_DCIN_ILIM, reg);
+
+	if (!ret)
+		ret = tmpret;
+
+	return ret;
+}
+
+static int bd70528_charger_set_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					const union power_supply_propval *val)
+{
+	struct bd70528_psy *bdpsy = power_supply_get_drvdata(psy);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		return set_current_limit(bdpsy, val->intval / 1000);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		return set_charge_current(bdpsy, val->intval / 1000);
+	default:
+		break;
+	}
+	return -EINVAL;
+}
+
+static const struct power_supply_desc bd70528_charger_desc = {
+	.name		= "bd70528-charger",
+	.type		= POWER_SUPPLY_TYPE_MAINS,
+	.properties	= bd70528_charger_props,
+	.num_properties	= ARRAY_SIZE(bd70528_charger_props),
+	.get_property	= bd70528_charger_get_property,
+	.set_property	= bd70528_charger_set_property,
+	.property_is_writeable	= bd70528_prop_is_writable,
+};
+
+static int bd70528_power_probe(struct platform_device *pdev)
+{
+	struct bd70528_psy *bdpsy;
+	struct power_supply_config cfg = {};
+
+	bdpsy = devm_kzalloc(&pdev->dev, sizeof(*bdpsy), GFP_KERNEL);
+	if (!bdpsy)
+		return -ENOMEM;
+
+	bdpsy->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!bdpsy->regmap) {
+		dev_err(&pdev->dev, "No regmap found for chip\n");
+		return -EINVAL;
+	}
+	bdpsy->dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, bdpsy);
+	cfg.drv_data = bdpsy;
+	cfg.of_node = pdev->dev.parent->of_node;
+
+	bdpsy->psy = devm_power_supply_register(&pdev->dev,
+						&bd70528_charger_desc, &cfg);
+	if (IS_ERR(bdpsy->psy)) {
+		dev_err(&pdev->dev, "failed: power supply register\n");
+		return PTR_ERR(bdpsy->psy);
+	}
+
+	return bd70528_get_irqs(pdev, bdpsy);
+}
+
+static struct platform_driver bd70528_power = {
+	.driver = {
+		.name = "bd70528-power"
+	},
+	.probe = bd70528_power_probe,
+};
+
+module_platform_driver(bd70528_power);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("BD70528 power-supply driver");
+MODULE_LICENSE("GPL");
-- 
2.17.2


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
