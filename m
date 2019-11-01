Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66751EC241
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbfKALtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:49:22 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46556 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKALtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:49:22 -0400
Received: by mail-lf1-f66.google.com with SMTP id 19so1866515lft.13;
        Fri, 01 Nov 2019 04:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+Qh5EdYFjyHge3uXpxMW9nc7+2GAW1YmdpiZg2xLgbQ=;
        b=M8OkP+KMzFafpyeVnFHkw7a6+R0ol1j+hE0ijnXtF+VgZgyab6f7swY3j6teesK07x
         LbAbzc0RiVTGoQz/s5+maQsyrqVD0TYCdYJZQPKftd/qekOCFLeTmyMIhKtqkllE3c18
         NsE5zMfrY3/OySivvvnVlLc9GCgywcOGGzNECkU+L5wZtG/IHT7bMjn1/4ACZQSzw5yt
         AFg31Zwo7yAkHe37xIfP7r8GulArAfqsTuDQ8i7VqonIaLOZPHsMYeF+yFl6CcYDf+/L
         m69k927KUqkPIWXDKV0AwWm700moEgIBxys2ANSPVCJiMPcChLcfSv29ZHay6kflUIgV
         VtjA==
X-Gm-Message-State: APjAAAV5ibr5ljgaIA/3RVV8QTqwYR8gUvXc9d8P4b561QfTIPpcPU53
        PeWHLICXFQZE56tSQCQ2sGk=
X-Google-Smtp-Source: APXvYqyr4m3w8WIPV8epGylkVjuTWKyhZHbIb5oRQbAn3XrLg1m5LSy1S1cxyXUcb7+yINcdsWNYhQ==
X-Received: by 2002:a05:6512:40e:: with SMTP id u14mr7093940lfk.73.1572608958875;
        Fri, 01 Nov 2019 04:49:18 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id i8sm2826343ljj.11.2019.11.01.04.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:49:18 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:49:11 +0200
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
Subject: [RFC PATCH v3 13/15] rtc: bd70528 add BD71828 support
Message-ID: <d86b3d62170bd680a9f750946cf69a2d509f7b52.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
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

ROHM BD71828 PMIC RTC block is from many parts similar to one
on BD70528. Support BD71828 RTC using BD70528 RTC driver and
avoid re-inventing the wheel.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Changes since v2 - Rebased to v5.4-rc5

---
 drivers/rtc/Kconfig              |   3 +-
 drivers/rtc/rtc-bd70528.c        | 150 ++++++++++++++++++++++++++++---
 include/linux/mfd/rohm-bd70528.h |  13 +--
 include/linux/mfd/rohm-bd71828.h |   4 +-
 include/linux/mfd/rohm-shared.h  |  27 ++++++
 5 files changed, 170 insertions(+), 27 deletions(-)
 create mode 100644 include/linux/mfd/rohm-shared.h

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 1adf9f815652..d03636ec7311 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -509,12 +509,13 @@ config RTC_DRV_M41T80_WDT
 	help
 	  If you say Y here you will get support for the
 	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
+
 config RTC_DRV_BD70528
 	tristate "ROHM BD70528 PMIC RTC"
 	depends on MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
 	help
 	  If you say Y here you will get support for the RTC
-	  on ROHM BD70528 Power Management IC.
+	  block on ROHM BD70528 and BD71828 Power Management IC.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-bd70528.
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 7744333b0f40..fbf407fe0c6d 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -6,6 +6,7 @@
 
 #include <linux/bcd.h>
 #include <linux/mfd/rohm-bd70528.h>
+#include <linux/mfd/rohm-bd71828.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -15,7 +16,7 @@
 /*
  * We read regs RTC_SEC => RTC_YEAR
  * this struct is ordered according to chip registers.
- * Keep it u8 only to avoid padding issues.
+ * Keep it u8 only (or packed) to avoid padding issues.
  */
 struct bd70528_rtc_day {
 	u8 sec;
@@ -36,6 +37,13 @@ struct bd70528_rtc_wake {
 	u8 ctrl;
 } __packed;
 
+struct bd71828_rtc_alm {
+	struct bd70528_rtc_data alm0;
+	struct bd70528_rtc_data alm1;
+	u8 alm_mask;
+	u8 alm1_mask;
+} __packed;
+
 struct bd70528_rtc_alm {
 	struct bd70528_rtc_data data;
 	u8 alm_mask;
@@ -45,6 +53,8 @@ struct bd70528_rtc_alm {
 struct bd70528_rtc {
 	struct rohm_regmap_dev *mfd;
 	struct device *dev;
+	u8 reg_time_start;
+	bool has_rtc_timers;
 };
 
 static int bd70528_set_wake(struct rohm_regmap_dev *bd70528,
@@ -152,12 +162,18 @@ static int bd70528_set_rtc_based_timers(struct bd70528_rtc *r, int new_state,
 static int bd70528_re_enable_rtc_based_timers(struct bd70528_rtc *r,
 					      int old_state)
 {
+	if (!r->has_rtc_timers)
+		return 0;
+
 	return bd70528_set_rtc_based_timers(r, old_state, NULL);
 }
 
 static int bd70528_disable_rtc_based_timers(struct bd70528_rtc *r,
 					    int *old_state)
 {
+	if (!r->has_rtc_timers)
+		return 0;
+
 	return bd70528_set_rtc_based_timers(r, 0, old_state);
 }
 
@@ -213,6 +229,36 @@ static inline void rtc2tm(struct bd70528_rtc_data *r, struct rtc_time *t)
 	t->tm_wday = bcd2bin(r->week & BD70528_MASK_RTC_WEEK);
 }
 
+static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
+{
+	int ret;
+	struct bd71828_rtc_alm alm;
+	struct bd70528_rtc *r = dev_get_drvdata(dev);
+	struct rohm_regmap_dev *bd71828 = r->mfd;
+
+	ret = regmap_bulk_read(bd71828->regmap, BD71828_REG_RTC_ALM_START,
+			       &alm, sizeof(alm));
+	if (ret) {
+		dev_err(dev, "Failed to read alarm regs\n");
+		return ret;
+	}
+
+	tm2rtc(&a->time, &alm.alm0);
+
+	if (!a->enabled)
+		alm.alm_mask &= ~BD70528_MASK_ALM_EN;
+	else
+		alm.alm_mask |= BD70528_MASK_ALM_EN;
+
+	ret = regmap_bulk_write(bd71828->regmap, BD71828_REG_RTC_ALM_START,
+				&alm, sizeof(alm));
+	if (ret)
+		dev_err(dev, "Failed to set alarm time\n");
+
+	return ret;
+
+}
+
 static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 {
 	struct bd70528_rtc_wake wake;
@@ -261,6 +307,30 @@ static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	return ret;
 }
 
+static int bd71828_read_alarm(struct device *dev, struct rtc_wkalrm *a)
+{
+	int ret;
+	struct bd71828_rtc_alm alm;
+	struct bd70528_rtc *r = dev_get_drvdata(dev);
+	struct rohm_regmap_dev *bd71828 = r->mfd;
+
+	ret = regmap_bulk_read(bd71828->regmap, BD71828_REG_RTC_ALM_START,
+			       &alm, sizeof(alm));
+	if (ret) {
+		dev_err(dev, "Failed to read alarm regs\n");
+		return ret;
+	}
+
+	rtc2tm(&alm.alm0, &a->time);
+	a->time.tm_mday = -1;
+	a->time.tm_mon = -1;
+	a->time.tm_year = -1;
+	a->enabled = !!(alm.alm_mask & BD70528_MASK_ALM_EN);
+	a->pending = 0;
+
+	return 0;
+}
+
 static int bd70528_read_alarm(struct device *dev, struct rtc_wkalrm *a)
 {
 	struct bd70528_rtc_alm alm;
@@ -297,7 +367,7 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 		return ret;
 
 	tmpret = regmap_bulk_read(bd70528->regmap,
-				  BD70528_REG_RTC_START, &rtc_data,
+				  r->reg_time_start, &rtc_data,
 				  sizeof(rtc_data));
 	if (tmpret) {
 		dev_err(dev, "Failed to read RTC time registers\n");
@@ -306,7 +376,7 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 	tm2rtc(t, &rtc_data);
 
 	tmpret = regmap_bulk_write(bd70528->regmap,
-				   BD70528_REG_RTC_START, &rtc_data,
+				   r->reg_time_start, &rtc_data,
 				   sizeof(rtc_data));
 	if (tmpret) {
 		dev_err(dev, "Failed to set RTC time\n");
@@ -341,7 +411,7 @@ static int bd70528_get_time(struct device *dev, struct rtc_time *t)
 
 	/* read the RTC date and time registers all at once */
 	ret = regmap_bulk_read(bd70528->regmap,
-			       BD70528_REG_RTC_START, &rtc_data,
+			       r->reg_time_start, &rtc_data,
 			       sizeof(rtc_data));
 	if (ret) {
 		dev_err(dev, "Failed to read RTC time (err %d)\n", ret);
@@ -378,6 +448,23 @@ static int bd70528_alm_enable(struct device *dev, unsigned int enabled)
 	return ret;
 }
 
+static int bd71828_alm_enable(struct device *dev, unsigned int enabled)
+{
+	int ret;
+	struct bd70528_rtc *r = dev_get_drvdata(dev);
+	unsigned int enableval = BD70528_MASK_ALM_EN;
+
+	if (!enabled)
+		enableval = 0;
+
+	ret = regmap_update_bits(r->mfd->regmap, BD71828_REG_RTC_ALM0_MASK,
+				 BD70528_MASK_ALM_EN, enableval);
+	if (ret)
+		dev_err(dev, "Failed to change alarm state\n");
+
+	return ret;
+}
+
 static const struct rtc_class_ops bd70528_rtc_ops = {
 	.read_time		= bd70528_get_time,
 	.set_time		= bd70528_set_time,
@@ -386,6 +473,14 @@ static const struct rtc_class_ops bd70528_rtc_ops = {
 	.alarm_irq_enable	= bd70528_alm_enable,
 };
 
+static const struct rtc_class_ops bd71828_rtc_ops = {
+	.read_time		= bd70528_get_time,
+	.set_time		= bd70528_set_time,
+	.read_alarm		= bd71828_read_alarm,
+	.set_alarm		= bd71828_set_alarm,
+	.alarm_irq_enable	= bd71828_alm_enable,
+};
+
 static irqreturn_t alm_hndlr(int irq, void *data)
 {
 	struct rtc_device *rtc = data;
@@ -397,11 +492,15 @@ static irqreturn_t alm_hndlr(int irq, void *data)
 static int bd70528_probe(struct platform_device *pdev)
 {
 	struct bd70528_rtc *bd_rtc;
+	const struct rtc_class_ops *rtc_ops;
 	struct rohm_regmap_dev *mfd;
+	const char *irq_name;
 	int ret;
 	struct rtc_device *rtc;
 	int irq;
 	unsigned int hr;
+	bool enable_main_irq = false;
+	u8 hour_reg;
 
 	mfd = dev_get_drvdata(pdev->dev.parent);
 	if (!mfd) {
@@ -415,13 +514,36 @@ static int bd70528_probe(struct platform_device *pdev)
 	bd_rtc->mfd = mfd;
 	bd_rtc->dev = &pdev->dev;
 
-	irq = platform_get_irq_byname(pdev, "bd70528-rtc-alm");
-	if (irq < 0)
+	switch (mfd->chip_type) {
+	case ROHM_CHIP_TYPE_BD70528:
+		irq_name = "bd70528-rtc-alm";
+		bd_rtc->has_rtc_timers = true;
+		bd_rtc->reg_time_start = BD70528_REG_RTC_START;
+		hour_reg = BD70528_REG_RTC_HOUR;
+		enable_main_irq = true;
+		rtc_ops = &bd70528_rtc_ops;
+		break;
+	case ROHM_CHIP_TYPE_BD71828:
+		irq_name = "bd71828-rtc-alm-0";
+		bd_rtc->reg_time_start = BD71828_REG_RTC_START;
+		hour_reg = BD71828_REG_RTC_HOUR;
+		rtc_ops = &bd71828_rtc_ops;
+		break;
+	default:
+		dev_err(&pdev->dev, "Unknown chip\n");
+		return -ENOENT;
+	}
+
+	irq = platform_get_irq_byname(pdev, irq_name);
+
+	if (irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq\n");
 		return irq;
+	}
 
 	platform_set_drvdata(pdev, bd_rtc);
 
-	ret = regmap_read(mfd->regmap, BD70528_REG_RTC_HOUR, &hr);
+	ret = regmap_read(mfd->regmap, hour_reg, &hr);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to reag RTC clock\n");
@@ -454,7 +576,7 @@ static int bd70528_probe(struct platform_device *pdev)
 
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
-	rtc->ops = &bd70528_rtc_ops;
+	rtc->ops = rtc_ops;
 
 	/* Request alarm IRQ prior to registerig the RTC */
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, &alm_hndlr,
@@ -468,12 +590,14 @@ static int bd70528_probe(struct platform_device *pdev)
 	 *  leave them enabled as irq-controller should disable irqs
 	 *  from sub-registers when IRQ is disabled or freed.
 	 */
-	ret = regmap_update_bits(mfd->regmap,
+	if (enable_main_irq) {
+		ret = regmap_update_bits(mfd->regmap,
 				 BD70528_REG_INT_MAIN_MASK,
 				 BD70528_INT_RTC_MASK, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to enable RTC interrupts\n");
-		return ret;
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to enable RTC interrupts\n");
+			return ret;
+		}
 	}
 
 	return rtc_register_device(rtc);
@@ -489,5 +613,5 @@ static struct platform_driver bd70528_rtc = {
 module_platform_driver(bd70528_rtc);
 
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
-MODULE_DESCRIPTION("BD70528 RTC driver");
+MODULE_DESCRIPTION("ROHM BD70528 and BD71828 PMIC RTC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
index 2ad2320d0a96..a57af878fd0c 100644
--- a/include/linux/mfd/rohm-bd70528.h
+++ b/include/linux/mfd/rohm-bd70528.h
@@ -7,6 +7,7 @@
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/mfd/rohm-generic.h>
+#include <linux/mfd/rohm-shared.h>
 #include <linux/regmap.h>
 
 enum {
@@ -307,17 +308,6 @@ enum {
 
 /* RTC masks to mask out reserved bits */
 
-#define BD70528_MASK_RTC_SEC		0x7f
-#define BD70528_MASK_RTC_MINUTE		0x7f
-#define BD70528_MASK_RTC_HOUR_24H	0x80
-#define BD70528_MASK_RTC_HOUR_PM	0x20
-#define BD70528_MASK_RTC_HOUR		0x1f
-#define BD70528_MASK_RTC_DAY		0x3f
-#define BD70528_MASK_RTC_WEEK		0x07
-#define BD70528_MASK_RTC_MONTH		0x1f
-#define BD70528_MASK_RTC_YEAR		0xff
-#define BD70528_MASK_RTC_COUNT_L	0x7f
-
 #define BD70528_MASK_ELAPSED_TIMER_EN	0x1
 /* Mask second, min and hour fields
  * HW would support ALM irq for over 24h
@@ -326,7 +316,6 @@ enum {
  * wake-up we limit ALM to 24H and only
  * unmask sec, min and hour
  */
-#define BD70528_MASK_ALM_EN		0x7
 #define BD70528_MASK_WAKE_EN		0x1
 
 /* WDT masks */
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index fc0955f0662c..093662f3e867 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -5,6 +5,7 @@
 #define __LINUX_MFD_BD71828_H__
 
 #include <linux/mfd/rohm-generic.h>
+#include <linux/mfd/rohm-shared.h>
 
 /* Regulator IDs */
 enum {
@@ -160,6 +161,7 @@ enum {
 #define BD71828_REG_RTC_YEAR		0x52
 
 #define BD71828_REG_RTC_ALM0_SEC	0x53
+#define BD71828_REG_RTC_ALM_START	BD71828_REG_RTC_ALM0_SEC
 #define BD71828_REG_RTC_ALM0_MINUTE	0x54
 #define BD71828_REG_RTC_ALM0_HOUR	0x55
 #define BD71828_REG_RTC_ALM0_WEEK	0x56
@@ -178,6 +180,7 @@ enum {
 #define BD71828_REG_RTC_ALM1_MASK	0x62
 
 #define BD71828_REG_RTC_ALM2		0x63
+#define BD71828_REG_RTC_START		BD71828_REG_RTC_SEC
 
 /* Charger/Battey */
 #define BD71828_REG_CHG_STATE		0x65
@@ -204,7 +207,6 @@ enum {
 #define BD71828_REG_INT_MASK_TEMP	0xdd
 #define BD71828_REG_INT_MASK_RTC	0xde
 
-
 #define BD71828_REG_INT_MAIN		0xdf
 #define BD71828_REG_INT_BUCK		0xe0
 #define BD71828_REG_INT_DCIN1		0xe1
diff --git a/include/linux/mfd/rohm-shared.h b/include/linux/mfd/rohm-shared.h
new file mode 100644
index 000000000000..f16fc3b5000e
--- /dev/null
+++ b/include/linux/mfd/rohm-shared.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (C) 2018 ROHM Semiconductors */
+
+
+#ifndef __LINUX_MFD_ROHM_SHARED_H__
+#define __LINUX_MFD_ROHM_SHARED_H__
+
+/*
+ * RTC definitions shared between
+ *
+ * BD70528
+ * and BD71828
+ */
+
+
+#define BD70528_MASK_RTC_SEC		0x7f
+#define BD70528_MASK_RTC_MINUTE	0x7f
+#define BD70528_MASK_RTC_HOUR_24H	0x80
+#define BD70528_MASK_RTC_HOUR_PM	0x20
+#define BD70528_MASK_RTC_HOUR		0x3f
+#define BD70528_MASK_RTC_DAY		0x3f
+#define BD70528_MASK_RTC_WEEK		0x07
+#define BD70528_MASK_RTC_MONTH		0x1f
+#define BD70528_MASK_RTC_YEAR		0xff
+#define BD70528_MASK_ALM_EN		0x7
+
+#endif /* __LINUX_MFD_ROHM_SHARED_H__ */
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
