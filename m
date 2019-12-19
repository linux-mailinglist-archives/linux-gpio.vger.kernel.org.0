Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B04D125E33
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 10:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfLSJwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 04:52:24 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35576 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfLSJwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 04:52:24 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so5517511lja.2;
        Thu, 19 Dec 2019 01:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iU4XGAsaq3/G2hvdMm5W0Ee+bjsQg5k9atppLiusKgg=;
        b=PITCqpEQL6Frkn24dw+6X2OWwLH+7KqC36CxohW8xqi5IbRFnSIdi89SRSojru5Mno
         9S2bgg5Y2Fs9wP8UuOW4lBlliY4pYWAd5eh2Lg9WqXY9YiVPA/YjKt/H86eKj3UXJoYZ
         tNuS04HklAnLR9bZR26I5+vvuHA54uRJcyiNTKCRA/elvh0uoMzNHVCLZ11GBlM9Qfrm
         LnRgDv0zOnthq0/HBItqgFH8jxvCAfKqcWtCqqCk3aFgpf7351VAqKz7Ml9B+MA8sOJ5
         R2ouFCru8tfoH8APNlpoZQs/eaTnwpHBdan+oZY/Ws1ihhfksDLl57QN5Yd12xNulxAm
         awUg==
X-Gm-Message-State: APjAAAWeG9Ma51c70ZV036Bb+8UzfOGIVuHWJdmnPoYwXmXrP5hzIEDX
        j/pYrvLv66WfWmkdqT9rqVY=
X-Google-Smtp-Source: APXvYqwbVnDRrFO7CunxzD3JERbXxyc20f1f8DJtM4sA0CB8GOgA7LRWol6W+/8I1EOnFnqdUtfgFA==
X-Received: by 2002:a2e:9196:: with SMTP id f22mr5384218ljg.18.1576749140715;
        Thu, 19 Dec 2019 01:52:20 -0800 (PST)
Received: from localhost.localdomain (dyt4gctb359myxd0pkwmt-4.rev.dnainternet.fi. [2001:14bb:430:5140:37cf:5409:8fcc:4495])
        by smtp.gmail.com with ESMTPSA id y7sm2478161ljj.58.2019.12.19.01.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:52:19 -0800 (PST)
Date:   Thu, 19 Dec 2019 11:52:13 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v7 07/12] clk: bd718x7: Support ROHM BD71828 clk block
Message-ID: <4907f35240ae77bba4a27fd32f1e586e00cd434d.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

BD71828GW is a single-chip power management IC for battery-powered portable
devices. Add support for controlling BD71828 clk using bd718x7 driver.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---

No changes since v6

 drivers/clk/Kconfig              |  6 ++---
 drivers/clk/clk-bd718x7.c        | 38 +++++++++++++++++++++++---------
 include/linux/mfd/rohm-bd70528.h |  6 -----
 include/linux/mfd/rohm-bd71828.h |  4 ----
 include/linux/mfd/rohm-bd718x7.h |  6 -----
 5 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 45653a0e6ecd..ac5981ce2477 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -305,10 +305,10 @@ config COMMON_CLK_MMP2
 	  Support for Marvell MMP2 and MMP3 SoC clocks
 
 config COMMON_CLK_BD718XX
-	tristate "Clock driver for ROHM BD718x7 PMIC"
-	depends on MFD_ROHM_BD718XX || MFD_ROHM_BD70528
+	tristate "Clock driver for 32K clk gates on ROHM PMICs"
+	depends on MFD_ROHM_BD718XX || MFD_ROHM_BD70528 || MFD_ROHM_BD71828
 	help
-	  This driver supports ROHM BD71837, ROHM BD71847 and
+	  This driver supports ROHM BD71837, ROHM BD71847, ROHM BD71828 and
 	  ROHM BD70528 PMICs clock gates.
 
 config COMMON_CLK_FIXED_MMIO
diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index 33699ee1bdf3..b52e8d6f660c 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -7,12 +7,25 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/mfd/rohm-bd718x7.h>
-#include <linux/mfd/rohm-bd70528.h>
+#include <linux/mfd/rohm-generic.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/regmap.h>
 
+/* clk control registers */
+/* BD70528 */
+#define BD70528_REG_OUT32K	0x2c
+/* BD71828 */
+#define BD71828_REG_OUT32K	0x4B
+/* BD71837 and BD71847 */
+#define BD718XX_REG_OUT32K	0x2E
+
+/*
+ * BD71837, BD71847, BD70528 and BD71828 all use bit [0] to clk output control
+ */
+#define CLK_OUT_EN_MASK		BIT(0)
+
+
 struct bd718xx_clk {
 	struct clk_hw hw;
 	u8 reg;
@@ -21,10 +34,8 @@ struct bd718xx_clk {
 	struct rohm_regmap_dev *mfd;
 };
 
-static int bd71837_clk_set(struct clk_hw *hw, int status)
+static int bd71837_clk_set(struct bd718xx_clk *c, unsigned int status)
 {
-	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
-
 	return regmap_update_bits(c->mfd->regmap, c->reg, c->mask, status);
 }
 
@@ -33,14 +44,16 @@ static void bd71837_clk_disable(struct clk_hw *hw)
 	int rv;
 	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
 
-	rv = bd71837_clk_set(hw, 0);
+	rv = bd71837_clk_set(c, 0);
 	if (rv)
 		dev_dbg(&c->pdev->dev, "Failed to disable 32K clk (%d)\n", rv);
 }
 
 static int bd71837_clk_enable(struct clk_hw *hw)
 {
-	return bd71837_clk_set(hw, 1);
+	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
+
+	return bd71837_clk_set(c, 0xffffffff);
 }
 
 static int bd71837_clk_is_enabled(struct clk_hw *hw)
@@ -92,11 +105,15 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 	case ROHM_CHIP_TYPE_BD71837:
 	case ROHM_CHIP_TYPE_BD71847:
 		c->reg = BD718XX_REG_OUT32K;
-		c->mask = BD718XX_OUT32K_EN;
+		c->mask = CLK_OUT_EN_MASK;
+		break;
+	case ROHM_CHIP_TYPE_BD71828:
+		c->reg = BD71828_REG_OUT32K;
+		c->mask = CLK_OUT_EN_MASK;
 		break;
 	case ROHM_CHIP_TYPE_BD70528:
-		c->reg = BD70528_REG_CLK_OUT;
-		c->mask = BD70528_CLK_OUT_EN_MASK;
+		c->reg = BD70528_REG_OUT32K;
+		c->mask = CLK_OUT_EN_MASK;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unknown clk chip\n");
@@ -126,6 +143,7 @@ static const struct platform_device_id bd718x7_clk_id[] = {
 	{ "bd71837-clk", ROHM_CHIP_TYPE_BD71837 },
 	{ "bd71847-clk", ROHM_CHIP_TYPE_BD71847 },
 	{ "bd70528-clk", ROHM_CHIP_TYPE_BD70528 },
+	{ "bd71828-clk", ROHM_CHIP_TYPE_BD71828 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_clk_id);
diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
index 1013e60c5b25..2ad2320d0a96 100644
--- a/include/linux/mfd/rohm-bd70528.h
+++ b/include/linux/mfd/rohm-bd70528.h
@@ -89,10 +89,6 @@ struct bd70528_data {
 #define BD70528_REG_GPIO3_OUT	0x52
 #define BD70528_REG_GPIO4_OUT	0x54
 
-/* clk control */
-
-#define BD70528_REG_CLK_OUT	0x2c
-
 /* RTC */
 
 #define BD70528_REG_RTC_COUNT_H		0x2d
@@ -309,8 +305,6 @@ enum {
 
 #define BD70528_GPIO_IN_STATE_BASE 1
 
-#define BD70528_CLK_OUT_EN_MASK 0x1
-
 /* RTC masks to mask out reserved bits */
 
 #define BD70528_MASK_RTC_SEC		0x7f
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index eb0557eb5314..d013e03f742d 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -183,9 +183,6 @@ enum {
 #define BD71828_REG_CHG_STATE		0x65
 #define BD71828_REG_CHG_FULL		0xd2
 
-/* CLK */
-#define BD71828_REG_OUT32K		0x4B
-
 /* LEDs */
 #define BD71828_REG_LED_CTRL		0x4A
 #define BD71828_MASK_LED_AMBER		0x80
@@ -417,7 +414,6 @@ enum {
 #define BD71828_INT_RTC1_MASK				0x2
 #define BD71828_INT_RTC2_MASK				0x4
 
-#define BD71828_OUT32K_EN				0x1
 #define BD71828_OUT_TYPE_MASK				0x2
 #define BD71828_OUT_TYPE_OPEN_DRAIN			0x0
 #define BD71828_OUT_TYPE_CMOS				0x2
diff --git a/include/linux/mfd/rohm-bd718x7.h b/include/linux/mfd/rohm-bd718x7.h
index 7f2dbde402a1..bee2474a8f9f 100644
--- a/include/linux/mfd/rohm-bd718x7.h
+++ b/include/linux/mfd/rohm-bd718x7.h
@@ -191,12 +191,6 @@ enum {
 #define IRQ_ON_REQ		0x02
 #define IRQ_STBY_REQ		0x01
 
-/* BD718XX_REG_OUT32K bits */
-#define BD718XX_OUT32K_EN	0x01
-
-/* BD7183XX gated clock rate */
-#define BD718XX_CLK_RATE 32768
-
 /* ROHM BD718XX irqs */
 enum {
 	BD718XX_INT_STBY_REQ,
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
