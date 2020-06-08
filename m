Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC2D1F1B51
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 16:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730102AbgFHOsZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 10:48:25 -0400
Received: from inva020.nxp.com ([92.121.34.13]:46498 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729958AbgFHOsZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 10:48:25 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 056A11A1097;
        Mon,  8 Jun 2020 16:48:23 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A2361A105F;
        Mon,  8 Jun 2020 16:48:18 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9B41D402FB;
        Mon,  8 Jun 2020 22:48:12 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 3/9] pinctrl: imx8mm: Support building as module
Date:   Mon,  8 Jun 2020 22:37:30 +0800
Message-Id: <1591627056-19022-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591627056-19022-1-git-send-email-Anson.Huang@nxp.com>
References: <1591627056-19022-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support building i.MX8MM pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 drivers/pinctrl/freescale/Kconfig          |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mm.c | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 58d48df..baa7e70 100644
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
index 6d1038a..eca1424 100644
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
@@ -340,9 +342,5 @@ static struct platform_driver imx8mm_pinctrl_driver = {
 	},
 	.probe = imx8mm_pinctrl_probe,
 };
-
-static int __init imx8mm_pinctrl_init(void)
-{
-	return platform_driver_register(&imx8mm_pinctrl_driver);
-}
-arch_initcall(imx8mm_pinctrl_init);
+module_platform_driver(imx8mm_pinctrl_driver);
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

