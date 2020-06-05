Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1A61EF195
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 08:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgFEGpV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 02:45:21 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57278 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgFEGpU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 02:45:20 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0E5002002B3;
        Fri,  5 Jun 2020 08:45:18 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 80B742014A1;
        Fri,  5 Jun 2020 08:45:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E7F8B4031F;
        Fri,  5 Jun 2020 14:45:07 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 7/8] pinctrl: imx8qm: Support building as module
Date:   Fri,  5 Jun 2020 14:34:33 +0800
Message-Id: <1591338874-4733-8-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591338874-4733-1-git-send-email-Anson.Huang@nxp.com>
References: <1591338874-4733-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support building i.MX8QM pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/pinctrl/freescale/Kconfig          | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qm.c | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 0a728bb..d9fb5f2 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -152,7 +152,7 @@ config PINCTRL_IMX8MQ
 	  Say Y here to enable the imx8mq pinctrl driver
 
 config PINCTRL_IMX8QM
-	bool "IMX8QM pinctrl driver"
+	tristate "IMX8QM pinctrl driver"
 	depends on IMX_SCU && ARCH_MXC && ARM64
 	select PINCTRL_IMX_SCU
 	help
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qm.c b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
index 0b6029b..905702a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qm.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
@@ -298,6 +298,7 @@ static const struct of_device_id imx8qm_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8qm-iomuxc", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8qm_pinctrl_of_match);
 
 static int imx8qm_pinctrl_probe(struct platform_device *pdev)
 {
@@ -318,9 +319,5 @@ static struct platform_driver imx8qm_pinctrl_driver = {
 	},
 	.probe = imx8qm_pinctrl_probe,
 };
-
-static int __init imx8qm_pinctrl_init(void)
-{
-	return platform_driver_register(&imx8qm_pinctrl_driver);
-}
-arch_initcall(imx8qm_pinctrl_init);
+module_platform_driver(imx8qm_pinctrl_driver);
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

