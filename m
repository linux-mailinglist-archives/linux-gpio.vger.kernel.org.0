Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30078E3118
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 13:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfJXLo4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 07:44:56 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35002 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfJXLo4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 07:44:56 -0400
Received: by mail-lf1-f68.google.com with SMTP id y6so12596337lfj.2;
        Thu, 24 Oct 2019 04:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aPuYD0Y1OwLq/YJrQ4uz9MAHyVZVeSJvf6a0mditrIY=;
        b=nRqLxXBkkEInW/18PbD0s5mr7GZHErRcMrY44YWl/Ecm60WZEyCfpTODNgTw6UTxi0
         Fd5m8V3MQZpVEe63zqeEhuaQE+zcRZ2DuZYB8C9yDi1RB9K4YKRgMkDMhll9ESKh5RMB
         pAywvMw6Bj8W98UEup4zo90ev/ne5Xr0ys6DQvxtlUN7aXzCVLjhy9M12VgjhMOA4NRA
         r29dz3UT/P63DcLjsjLUr60uC2BfjNg7F8RsJCOnMm8r5rckaCMf9bFprGRqPg3QmIwS
         Leb6jqBEDYc/zaeYOYWiW8qjduWCIGpPNjGoCe+DoA/YnMbK8R26Lw2rRRqXiUX+AcIu
         DfEg==
X-Gm-Message-State: APjAAAWcPC38thkvSAc0EhPzCrxhROk4N1mi9+upjaEw5ysvIAZQzYhu
        UJWFXC06tPsRpFZo1qHSMq8=
X-Google-Smtp-Source: APXvYqwU7zOQZVwIIYztaUUqrwwsRQUOAq6NcR8ErtA6eJZ+8AQRs4zCLSIDdVasHCAf77BIQjJzjg==
X-Received: by 2002:a19:855:: with SMTP id 82mr25699183lfi.44.1571917493250;
        Thu, 24 Oct 2019 04:44:53 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 4sm11643240ljv.87.2019.10.24.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:44:52 -0700 (PDT)
Date:   Thu, 24 Oct 2019 14:44:40 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v2 05/13] clk: bd718x7: Support ROHM BD71828 clk block
Message-ID: <5c66ac7d43ae1f57c335b6e565553fe1df703a83.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

BD71828GW is a single-chip power management IC for battery-powered portable
devices. Add support for controlling BD71828 clk using bd718x7 driver.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

No changes since v1

 drivers/clk/Kconfig       |  6 +++---
 drivers/clk/clk-bd718x7.c | 15 ++++++++++-----
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 801fa1cd0321..1d61d94cdb29 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -302,10 +302,10 @@ config COMMON_CLK_STM32H7
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
index ae6e5baee330..d17a19e04592 100644
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
+static int bd71837_clk_set(struct bd718xx_clk *c, int status)
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
