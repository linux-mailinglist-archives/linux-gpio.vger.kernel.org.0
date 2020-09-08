Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF43D260BBF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 09:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgIHHSh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 03:18:37 -0400
Received: from inva021.nxp.com ([92.121.34.21]:51482 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729386AbgIHHSe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 03:18:34 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 21B0F200217;
        Tue,  8 Sep 2020 09:18:32 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9DC7420022A;
        Tue,  8 Sep 2020 09:18:27 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C30B4402DF;
        Tue,  8 Sep 2020 09:18:21 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 3/3] pinctrl: imx: Support building i.MX pinctrl core driver as module
Date:   Tue,  8 Sep 2020 15:12:06 +0800
Message-Id: <1599549126-17413-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599549126-17413-1-git-send-email-Anson.Huang@nxp.com>
References: <1599549126-17413-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change PINCTRL_IMX to tristate to support loadable module build.

And i.MX common pinctrl driver should depend on CONFIG_OF to make sure
no build error when i.MX common pinctrl driver is enabled for different
architectures without CONFIG_OF.

Also add module author, description and license.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
no change.
---
 drivers/pinctrl/freescale/Kconfig       | 3 ++-
 drivers/pinctrl/freescale/pinctrl-imx.c | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 452c499..0058d3a 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_IMX
-	bool
+	tristate "IMX pinctrl core driver"
+	depends on OF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index b80c450..daf28bc 100644
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
@@ -898,3 +899,7 @@ const struct dev_pm_ops imx_pinctrl_pm_ops = {
 					imx_pinctrl_resume)
 };
 EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);
+
+MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX common pinctrl driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

