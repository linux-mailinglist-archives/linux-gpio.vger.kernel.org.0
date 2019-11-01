Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20118EC203
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbfKALi6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:38:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33717 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKALi5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:38:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id t5so9961369ljk.0;
        Fri, 01 Nov 2019 04:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E3NBaCIzLoDA3FRBZFE+VHhKHximovNpQrRs5+2XczE=;
        b=Vh/ka3r5EXW59s9aNJM3qJCGpaybV9e5jMQuEVZGv1BghgiPmTvXA2nXc3h+wAOiBb
         6tBbKP4XNJgSBBDnCsMOxst+tAlDYeK6IP06m0FvXq/A/arI+zBXw7pwV9J8veBYCu6u
         zJPRmpcpNMx4D3krWPhRtsha/bTSve7kJ+zEnAj35rkUP9OO7jW5jOz2ki0Qc0yPBD6J
         UUyD8LLZ3u6bBdW4HkjiQ6v7j8GEcn1Z4y5IqAx1NJH2gjulX0DlH8GQ/WNbbntM2ZMO
         faWZv2hKRO4m5SFSykiaL+Pjjos1isMtH6KBnhSd/6d+n8w6kQ46Oe0G7Sepe9pWv2bq
         d21w==
X-Gm-Message-State: APjAAAVrKKj6oK0eRmlUcuNWJLJTFHipc3uha7RGqiBDGYJbysUlwd8M
        9NwNMGWlOlTkKkAaYoxcxVE=
X-Google-Smtp-Source: APXvYqzwtGLykpwgymDiFuTxrjrbT5XIEkSrhFvw2Ay2tBKvglBn5wTXLHeQFrbmvi5LsAXX2Koy8g==
X-Received: by 2002:a05:651c:28a:: with SMTP id b10mr7737048ljo.193.1572608334570;
        Fri, 01 Nov 2019 04:38:54 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id d9sm4549767lfj.81.2019.11.01.04.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:38:54 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:38:38 +0200
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
Subject: [RFC PATCH v3 06/15] clk: bd718x7: Support ROHM BD71828 clk block
Message-ID: <e2e85a1bae1b27a1fc1faa39dcab9b922791f7df.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
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
devices. Add support for controlling BD71828 clk using bd718x7 driver.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes from v2 - use unsigned int for clk_set

 drivers/clk/Kconfig       |  6 +++---
 drivers/clk/clk-bd718x7.c | 15 ++++++++++-----
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c44247d0b83e..71c5dfdc78f4 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -293,10 +293,10 @@ config COMMON_CLK_STM32H7
 	  Support for stm32h7 SoC family clocks
 
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
index ae6e5baee330..ca627e1d0ef9 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/mfd/rohm-bd718x7.h>
+#include <linux/mfd/rohm-bd71828.h>
 #include <linux/mfd/rohm-bd70528.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
@@ -21,10 +22,8 @@ struct bd718xx_clk {
 	struct rohm_regmap_dev *mfd;
 };
 
-static int bd71837_clk_set(struct clk_hw *hw, int status)
+static int bd71837_clk_set(struct bd718xx_clk *c, unsigned int status)
 {
-	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
-
 	return regmap_update_bits(c->mfd->regmap, c->reg, c->mask, status);
 }
 
@@ -33,14 +32,16 @@ static void bd71837_clk_disable(struct clk_hw *hw)
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
@@ -93,6 +94,10 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 		c->reg = BD718XX_REG_OUT32K;
 		c->mask = BD718XX_OUT32K_EN;
 		break;
+	case ROHM_CHIP_TYPE_BD71828:
+		c->reg = BD71828_REG_OUT32K;
+		c->mask = BD71828_OUT32K_EN;
+		break;
 	case ROHM_CHIP_TYPE_BD70528:
 		c->reg = BD70528_REG_CLK_OUT;
 		c->mask = BD70528_CLK_OUT_EN_MASK;
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
