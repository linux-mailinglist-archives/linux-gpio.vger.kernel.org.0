Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10199260D5B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 10:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729775AbgIHISa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 04:18:30 -0400
Received: from inva020.nxp.com ([92.121.34.13]:32846 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729453AbgIHIS2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 04:18:28 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 59A461A0134;
        Tue,  8 Sep 2020 10:18:26 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 709031A016A;
        Tue,  8 Sep 2020 10:18:21 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 349C2402D9;
        Tue,  8 Sep 2020 10:18:15 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arnd@arndb.de
Cc:     Linux-imx@nxp.com
Subject: [PATCH V4 2/3] pinctrl: imx: Support building SCU pinctrl core driver as module
Date:   Tue,  8 Sep 2020 16:12:00 +0800
Message-Id: <1599552721-24872-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599552721-24872-1-git-send-email-Anson.Huang@nxp.com>
References: <1599552721-24872-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change PINCTR_IMX_SCU to tristate, add module author, description
and license to support building SCU pinctrl core driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V3:
	- remove the prompt for PINCTRL_IMX_SCU.
---
 drivers/pinctrl/freescale/Kconfig       | 2 +-
 drivers/pinctrl/freescale/pinctrl-scu.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 08fcf5c..7198916 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,7 +7,7 @@ config PINCTRL_IMX
 	select REGMAP
 
 config PINCTRL_IMX_SCU
-	bool
+	tristate
 	depends on IMX_SCU
 	select PINCTRL_IMX
 
diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pinctrl-scu.c
index 9df45d3..59b5f8a 100644
--- a/drivers/pinctrl/freescale/pinctrl-scu.c
+++ b/drivers/pinctrl/freescale/pinctrl-scu.c
@@ -7,6 +7,7 @@
 
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
@@ -123,3 +124,7 @@ void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
 		pin_scu->mux_mode, pin_scu->config);
 }
 EXPORT_SYMBOL_GPL(imx_pinctrl_parse_pin_scu);
+
+MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX SCU common pinctrl driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

