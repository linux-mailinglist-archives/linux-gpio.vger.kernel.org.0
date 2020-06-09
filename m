Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702AE1F3E2D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 16:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730571AbgFIOc0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 10:32:26 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49326 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730544AbgFIOcY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 10:32:24 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 233021A13E5;
        Tue,  9 Jun 2020 16:32:22 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 97E891A13CA;
        Tue,  9 Jun 2020 16:32:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1EA90402FF;
        Tue,  9 Jun 2020 22:32:12 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 9/9] pinctrl: imx8dxl: Support building as module
Date:   Tue,  9 Jun 2020 22:21:25 +0800
Message-Id: <1591712485-20609-10-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
References: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support building i.MX8DXL pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change.
---
 drivers/pinctrl/freescale/Kconfig           | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 4a9c19b..286bbbd 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -167,7 +167,7 @@ config PINCTRL_IMX8QXP
 	  Say Y here to enable the imx8qxp pinctrl driver
 
 config PINCTRL_IMX8DXL
-	bool "IMX8DXL pinctrl driver"
+	tristate "IMX8DXL pinctrl driver"
 	depends on IMX_SCU && ARCH_MXC && ARM64
 	select PINCTRL_IMX
 	help
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
index 7f32e57..c11fcfb 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
@@ -165,6 +165,7 @@ static const struct of_device_id imx8dxl_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8dxl-iomuxc", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8dxl_pinctrl_of_match);
 
 static int imx8dxl_pinctrl_probe(struct platform_device *pdev)
 {
@@ -185,9 +186,5 @@ static struct platform_driver imx8dxl_pinctrl_driver = {
 	},
 	.probe = imx8dxl_pinctrl_probe,
 };
-
-static int __init imx8dxl_pinctrl_init(void)
-{
-	return platform_driver_register(&imx8dxl_pinctrl_driver);
-}
-arch_initcall(imx8dxl_pinctrl_init);
+module_platform_driver(imx8dxl_pinctrl_driver);
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

