Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12175EC20A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbfKALjm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:39:42 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43458 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbfKALjm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:39:42 -0400
Received: by mail-lf1-f66.google.com with SMTP id j5so7009670lfh.10;
        Fri, 01 Nov 2019 04:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vsa+atuEH7w2weN2HXmPj18JF//HbbnMvgpG2i54wEo=;
        b=sXSfU93ha7nN7NOnlU8fowLhQNCQbj9U4gtfuI4uywSG5UmXdqzbJyWpmMk/nwpqr/
         AeiBKBjtq6baSnR4AyUsT8/Qu1tI7/Z4D2mDBjJmzckWuaWo8MWWOPPQuMIKEVOSRdMm
         AgZyJuDftMMrulXJUwc2r4eJ2zS8bCGY1IxrBwfHdYnb5ptMHKl9NgsHR1wpo7MMf/AR
         fGjxFGai9U5oWp/hjPfLRF3Bm99DZam6kdqj6DxM6YIQPON1hhIFcrVlAE4sXF1bBiCz
         CbB+fo5o1O5p7iHtlPgev//SToxOLGagwZbGpI8F6sggILHfEHGJ2IWjztU5QnGs46zr
         w65A==
X-Gm-Message-State: APjAAAX2ockig5F1mWQ4Dj/K936e7dGbQOqjnx0V0YVdspfK8VZeHEhW
        m/HMqsKqnKDaR2sryGtUvhE=
X-Google-Smtp-Source: APXvYqzgRIHKGytvfPPq7i4/qeG98NiAlPVaeqYdB6Ido0BjmjJlbppWsZ0r4sL4+KBHO9vKdB1x7w==
X-Received: by 2002:ac2:4564:: with SMTP id k4mr7146530lfm.20.1572608378215;
        Fri, 01 Nov 2019 04:39:38 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id y189sm5135218lfc.9.2019.11.01.04.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:39:37 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:39:24 +0200
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
Subject: [RFC PATCH v3 07/15] clk: bd718x7: simplify header dependencies
Message-ID: <8c46d32e6f2723ffa23cf2606be05aa0000f3d85.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
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

The clk control on ROHM BD71837, BD71847, BD70528 and BD71828 is
really simple. Only one register is accessed. Furthermore no other
drivers but the clk driver needs access to those registers. It's a
bit of an overkill to include all of the PMIC register information
in clk driver.

Define clk control register addresses and mask in the clk driver
and drop the unnecessary PMIC header includes.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes from v2 - new patch.

 drivers/clk/clk-bd718x7.c        | 26 +++++++++++++++++++-------
 include/linux/mfd/rohm-bd70528.h |  6 ------
 include/linux/mfd/rohm-bd71828.h |  4 ----
 include/linux/mfd/rohm-bd718x7.h |  6 ------
 4 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index ca627e1d0ef9..75190d6d3672 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -7,13 +7,25 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/mfd/rohm-bd718x7.h>
-#include <linux/mfd/rohm-bd71828.h>
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
@@ -92,15 +104,15 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 	case ROHM_CHIP_TYPE_BD71837:
 	case ROHM_CHIP_TYPE_BD71847:
 		c->reg = BD718XX_REG_OUT32K;
-		c->mask = BD718XX_OUT32K_EN;
+		c->mask = CLK_OUT_EN_MASK;
 		break;
 	case ROHM_CHIP_TYPE_BD71828:
 		c->reg = BD71828_REG_OUT32K;
-		c->mask = BD71828_OUT32K_EN;
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
