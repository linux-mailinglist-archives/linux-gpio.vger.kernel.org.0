Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAADD206C8C
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 08:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389312AbgFXGfk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 02:35:40 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34150 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389190AbgFXGfi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jun 2020 02:35:38 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5CADA1A111E;
        Wed, 24 Jun 2020 08:35:36 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D00B01A10F4;
        Wed, 24 Jun 2020 08:35:31 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EB7AB402DB;
        Wed, 24 Jun 2020 14:35:25 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V6 3/9] pinctrl: imx8mm: Support building as module
Date:   Wed, 24 Jun 2020 14:23:58 +0800
Message-Id: <1592979844-18833-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
References: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change configuration to "tristate", add module device table,
author, description and license to support building i.MX8MM
pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change.
---
 drivers/pinctrl/freescale/Kconfig          | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mm.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 4ca44dd..3681c4d 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -124,7 +124,7 @@ config PINCTRL_IMX7ULP
 	  Say Y here to enable the imx7ulp pinctrl driver
 
 config PINCTRL_IMX8MM
-	bool "IMX8MM pinctrl driver"
+	tristate "IMX8MM pinctrl driver"
 	depends on ARCH_MXC
 	select PINCTRL_IMX
 	help
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mm.c b/drivers/pinctrl/freescale/pinctrl-imx8mm.c
index 6d1038a..31c5d88 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mm.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mm.c
@@ -5,6 +5,7 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
@@ -326,6 +327,7 @@ static const struct of_device_id imx8mm_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8mm-iomuxc", .data = &imx8mm_pinctrl_info, },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8mm_pinctrl_of_match);
 
 static int imx8mm_pinctrl_probe(struct platform_device *pdev)
 {
@@ -346,3 +348,7 @@ static int __init imx8mm_pinctrl_init(void)
 	return platform_driver_register(&imx8mm_pinctrl_driver);
 }
 arch_initcall(imx8mm_pinctrl_init);
+
+MODULE_AUTHOR("Bai Ping <ping.bai@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX8MM pinctrl driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

