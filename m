Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C721206C97
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 08:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389188AbgFXGf6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 02:35:58 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34256 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389327AbgFXGfp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jun 2020 02:35:45 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B8E5F1A01B7;
        Wed, 24 Jun 2020 08:35:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 37D7A1A01C8;
        Wed, 24 Jun 2020 08:35:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4C35B40314;
        Wed, 24 Jun 2020 14:35:30 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V6 7/9] pinctrl: imx8qxp: Support building as module
Date:   Wed, 24 Jun 2020 14:24:02 +0800
Message-Id: <1592979844-18833-8-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
References: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change configuration to "tristate", add module device table,
author, description and license to support building i.MX8QXP
pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change.
---
 drivers/pinctrl/freescale/Kconfig           | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 2bf90b3..0a728bb 100644
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
index 1131dc3..81ebd4c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
@@ -204,6 +204,7 @@ static const struct of_device_id imx8qxp_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8qxp-iomuxc", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8qxp_pinctrl_of_match);
 
 static int imx8qxp_pinctrl_probe(struct platform_device *pdev)
 {
@@ -230,3 +231,7 @@ static int __init imx8qxp_pinctrl_init(void)
 	return platform_driver_register(&imx8qxp_pinctrl_driver);
 }
 arch_initcall(imx8qxp_pinctrl_init);
+
+MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX8QXP pinctrl driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

