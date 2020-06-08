Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28081F1B5A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 16:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgFHOso (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 10:48:44 -0400
Received: from inva020.nxp.com ([92.121.34.13]:46608 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729958AbgFHOs3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 10:48:29 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D6951A105F;
        Mon,  8 Jun 2020 16:48:27 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CD34C1A107E;
        Mon,  8 Jun 2020 16:48:22 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EE22E4031F;
        Mon,  8 Jun 2020 22:48:16 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 7/9] pinctrl: imx8qxp: Support building as module
Date:   Mon,  8 Jun 2020 22:37:34 +0800
Message-Id: <1591627056-19022-8-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591627056-19022-1-git-send-email-Anson.Huang@nxp.com>
References: <1591627056-19022-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support building i.MX8QXP pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 drivers/pinctrl/freescale/Kconfig           | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 8f89964..5c9714a 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -159,7 +159,7 @@ config PINCTRL_IMX8QM
 	  Say Y here to enable the imx8qm pinctrl driver
 
 config PINCTRL_IMX8QXP
-	bool "IMX8QXP pinctrl driver"
+	tristate "IMX8QXP pinctrl driver"
 	depends on IMX_SCU && ARCH_MXC && ARM64
 	select PINCTRL_IMX_SCU
 	help
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
index 1131dc3..0eaa36b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
@@ -204,6 +204,7 @@ static const struct of_device_id imx8qxp_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8qxp-iomuxc", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8qxp_pinctrl_of_match);
 
 static int imx8qxp_pinctrl_probe(struct platform_device *pdev)
 {
@@ -224,9 +225,5 @@ static struct platform_driver imx8qxp_pinctrl_driver = {
 	},
 	.probe = imx8qxp_pinctrl_probe,
 };
-
-static int __init imx8qxp_pinctrl_init(void)
-{
-	return platform_driver_register(&imx8qxp_pinctrl_driver);
-}
-arch_initcall(imx8qxp_pinctrl_init);
+module_platform_driver(imx8qxp_pinctrl_driver);
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

