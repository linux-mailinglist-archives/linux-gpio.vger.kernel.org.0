Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC76B1F5000
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 10:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgFJIJK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 04:09:10 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37936 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726207AbgFJIIp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 04:08:45 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0B0451A14F7;
        Wed, 10 Jun 2020 10:08:44 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 660461A150D;
        Wed, 10 Jun 2020 10:08:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C67994031B;
        Wed, 10 Jun 2020 16:08:33 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V4 2/9] pinctrl: imx: Support building i.MX pinctrl driver as module
Date:   Wed, 10 Jun 2020 15:57:38 +0800
Message-Id: <1591775865-26872-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591775865-26872-1-git-send-email-Anson.Huang@nxp.com>
References: <1591775865-26872-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export necessary functions to support building i.MX common pinctrl
driver and its user to be built as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change.
---
 drivers/pinctrl/freescale/Kconfig       | 3 ++-
 drivers/pinctrl/freescale/pinctrl-imx.c | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index a3a30f1d..e281c3f 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_IMX
-	bool
+	tristate "IMX pinctrl driver"
+	depends on OF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index c1faae1..a68d430 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
@@ -878,6 +879,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 
 	return pinctrl_enable(ipctl->pctl);
 }
+EXPORT_SYMBOL_GPL(imx_pinctrl_probe);
 
 static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
 {
@@ -897,3 +899,5 @@ const struct dev_pm_ops imx_pinctrl_pm_ops = {
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
 					imx_pinctrl_resume)
 };
+EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

