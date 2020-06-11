Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6131F670C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 13:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgFKLqN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 07:46:13 -0400
Received: from inva020.nxp.com ([92.121.34.13]:38476 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727916AbgFKLqE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 07:46:04 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D1AE21A17C6;
        Thu, 11 Jun 2020 13:46:02 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E55C1A070F;
        Thu, 11 Jun 2020 13:45:58 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6F33340307;
        Thu, 11 Jun 2020 19:45:52 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V5 8/9] pinctrl: imx8qm: Support building as module
Date:   Thu, 11 Jun 2020 19:34:54 +0800
Message-Id: <1591875295-19427-9-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591875295-19427-1-git-send-email-Anson.Huang@nxp.com>
References: <1591875295-19427-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change configuration to "tristate", add module device table,
author, description and license to support building i.MX8QM
pinctrl driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V4:
	- remove unnecessary change of replacing arch_initcall() with module_platform_driver();
	- add module author and description;
	- add more details to commit message.
---
 drivers/pinctrl/freescale/Kconfig          | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx8qm.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 412d581..de8d571 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -153,7 +153,7 @@ config PINCTRL_IMX8MQ
 	  Say Y here to enable the imx8mq pinctrl driver
 
 config PINCTRL_IMX8QM
-	bool "IMX8QM pinctrl driver"
+	tristate "IMX8QM pinctrl driver"
 	depends on IMX_SCU && ARCH_MXC && ARM64
 	select PINCTRL_IMX_SCU
 	help
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qm.c b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
index 9ba3249..8f46b940 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qm.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
@@ -301,6 +301,7 @@ static const struct of_device_id imx8qm_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx8qm-iomuxc", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx8qm_pinctrl_of_match);
 
 static int imx8qm_pinctrl_probe(struct platform_device *pdev)
 {
@@ -327,3 +328,7 @@ static int __init imx8qm_pinctrl_init(void)
 	return platform_driver_register(&imx8qm_pinctrl_driver);
 }
 arch_initcall(imx8qm_pinctrl_init);
+
+MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX8QM pinctrl driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

