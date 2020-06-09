Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FBB1F3E34
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 16:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbgFIOcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 10:32:21 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49206 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730498AbgFIOcU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 10:32:20 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3375B1A13DD;
        Tue,  9 Jun 2020 16:32:18 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A79B01A13CB;
        Tue,  9 Jun 2020 16:32:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C9DC74030C;
        Tue,  9 Jun 2020 22:32:07 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 5/9] pinctrl: imx8mq: Support building as module
Date:   Tue,  9 Jun 2020 22:21:21 +0800
Message-Id: <1591712485-20609-6-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
References: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support building i.MX8MQ pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change.
---
 drivers/pinctrl/freescale/Kconfig          | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8mq.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 18ef57e..a6c109e 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -146,7 +146,7 @@ config PINCTRL_IMX8MP
 	  Say Y here to enable the imx8mp pinctrl driver
 
 config PINCTRL_IMX8MQ
-	bool "IMX8MQ pinctrl driver"
+	tristate "IMX8MQ pinctrl driver"
 	depends on ARCH_MXC
 	select PINCTRL_IMX
 	help
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
index 50aa1c0..db5b41a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -329,6 +330,7 @@ static const struct of_device_id imx8mq_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8mq-iomuxc", .data = &imx8mq_pinctrl_info, },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8mq_pinctrl_of_match);
 
 static int imx8mq_pinctrl_probe(struct platform_device *pdev)
 {
@@ -345,8 +347,5 @@ static struct platform_driver imx8mq_pinctrl_driver = {
 	.probe = imx8mq_pinctrl_probe,
 };
 
-static int __init imx8mq_pinctrl_init(void)
-{
-	return platform_driver_register(&imx8mq_pinctrl_driver);
-}
-arch_initcall(imx8mq_pinctrl_init);
+module_platform_driver(imx8mq_pinctrl_driver);
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

