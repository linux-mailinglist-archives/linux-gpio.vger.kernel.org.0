Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538A41F3E36
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 16:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbgFIOcX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 10:32:23 -0400
Received: from inva021.nxp.com ([92.121.34.21]:37946 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730374AbgFIOcV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 10:32:21 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 452AA201234;
        Tue,  9 Jun 2020 16:32:19 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B9DEC2001E8;
        Tue,  9 Jun 2020 16:32:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DC3D64031B;
        Tue,  9 Jun 2020 22:32:08 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 6/9] pinctrl: imx8mp: Support building as module
Date:   Tue,  9 Jun 2020 22:21:22 +0800
Message-Id: <1591712485-20609-7-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
References: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support building i.MX8MP pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change.
---
 drivers/pinctrl/freescale/Kconfig          |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mp.c | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index a6c109e..bd68af1 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -139,7 +139,7 @@ config PINCTRL_IMX8MN
 	  Say Y here to enable the imx8mn pinctrl driver
 
 config PINCTRL_IMX8MP
-	bool "IMX8MP pinctrl driver"
+	tristate "IMX8MP pinctrl driver"
 	depends on ARCH_MXC
 	select PINCTRL_IMX
 	help
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mp.c b/drivers/pinctrl/freescale/pinctrl-imx8mp.c
index e3f644c..f3f3bdd 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mp.c
@@ -5,6 +5,7 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
@@ -324,6 +325,7 @@ static const struct of_device_id imx8mp_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8mp-iomuxc", .data = &imx8mp_pinctrl_info, },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8mp_pinctrl_of_match);
 
 static int imx8mp_pinctrl_probe(struct platform_device *pdev)
 {
@@ -337,9 +339,5 @@ static struct platform_driver imx8mp_pinctrl_driver = {
 	},
 	.probe = imx8mp_pinctrl_probe,
 };
-
-static int __init imx8mp_pinctrl_init(void)
-{
-	return platform_driver_register(&imx8mp_pinctrl_driver);
-}
-arch_initcall(imx8mp_pinctrl_init);
+module_platform_driver(imx8mp_pinctrl_driver);
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

