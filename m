Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D388268321
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 05:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgINDgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 23:36:07 -0400
Received: from inva021.nxp.com ([92.121.34.21]:55890 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgINDgE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Sep 2020 23:36:04 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 56CEB200653;
        Mon, 14 Sep 2020 05:36:02 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A0C51200442;
        Mon, 14 Sep 2020 05:35:51 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DFE0F40299;
        Mon, 14 Sep 2020 05:35:37 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, oleksandr.suvorov@toradex.com,
        peng.fan@nxp.com, andreas@kemnade.info, hverkuil-cisco@xs4all.nl,
        olof@lixom.net, krzk@kernel.org, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aisheng.dong@nxp.com,
        lkundrak@v3.sk, joel@jms.id.au, bjorn.andersson@linaro.org,
        leoyang.li@nxp.com, vkoul@kernel.org, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 RESEND 1/4] gpio: mxc: Support module build
Date:   Mon, 14 Sep 2020 11:29:04 +0800
Message-Id: <1600054147-29997-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change config to tristate, add module device table, module author,
description and license to support module build for i.MX GPIO driver.

As this is a SoC GPIO module, it provides common functions for most
of the peripheral devices, such as GPIO pins control, secondary
interrupt controller for GPIO pins IRQ etc., without GPIO driver, most
of the peripheral devices will NOT work properly, so GPIO module is
similar with clock, pinctrl driver that should be loaded ONCE and
never unloaded.

Since MXC GPIO driver needs to have init function to register syscore
ops once, here still use subsys_initcall(), NOT module_platform_driver().

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- no code change, just add detail explanation about why this patch
	  does NOT support module unloaded.
---
 drivers/gpio/Kconfig    | 2 +-
 drivers/gpio/gpio-mxc.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5cfdaf3..c7292a5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -397,7 +397,7 @@ config GPIO_MVEBU
 	select REGMAP_MMIO
 
 config GPIO_MXC
-	def_bool y
+	tristate "i.MX GPIO support"
 	depends on ARCH_MXC || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 64278a4..643f4c55 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -15,6 +15,7 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/syscore_ops.h>
@@ -158,6 +159,7 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx7d-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
 
 /*
  * MX2 has one interrupt *for all* gpio ports. The list is used
@@ -604,3 +606,7 @@ static int __init gpio_mxc_init(void)
 	return platform_driver_register(&mxc_gpio_driver);
 }
 subsys_initcall(gpio_mxc_init);
+
+MODULE_AUTHOR("Shawn Guo <shawn.guo@linaro.org>");
+MODULE_DESCRIPTION("i.MX GPIO Driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4

