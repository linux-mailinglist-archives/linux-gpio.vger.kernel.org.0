Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFFB1F3E31
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 16:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbgFIOcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 10:32:17 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49092 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728423AbgFIOcQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 10:32:16 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 257561A13DF;
        Tue,  9 Jun 2020 16:32:14 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D68F1A13DB;
        Tue,  9 Jun 2020 16:32:09 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 802F54029F;
        Tue,  9 Jun 2020 22:32:03 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 1/9] pinctrl: imx: Support building SCU pinctrl driver as module
Date:   Tue,  9 Jun 2020 22:21:17 +0800
Message-Id: <1591712485-20609-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
References: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export necessary functions and use "IS_ENABLED" instead of "ifdef"
to support SCU pinctrl driver user and itself to be built as module.

And when PINCTRL_IMX_SCU can be built as module, if PINCTRL_IMX is
built in while PINCTRL_IMX_SCU is built as module, build will fail
due to SCU pinctrl driver's APIs are NOT implemented, to avoid such
common scenario, the config dependency needs to be changed to below:

    - All i.MX platforms pinctrl driver will select PINCTRL_IMX;
    - All i.MX ARM64 platforms will select PINCTRL_IMX_SCU;

However, it introduces a tiny side effect that, for i.MX8M platforms,
although PINCTRL_IMX_SCU is NOT needed, but it will be still selected.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V2:
	- change the config dependency of PINCTRL_IMX_SCU to support
	  scenario of building in PINCTRL_IMX while building PINCTRL_IMX_SCU
	  as module.
---
 drivers/pinctrl/freescale/Kconfig       | 10 +++++-----
 drivers/pinctrl/freescale/pinctrl-imx.h |  2 +-
 drivers/pinctrl/freescale/pinctrl-scu.c |  6 ++++++
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 4ca44dd..f6c00d5 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -5,11 +5,11 @@ config PINCTRL_IMX
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select REGMAP
+	select PINCTRL_IMX_SCU if (ARCH_MXC && ARM64)
 
 config PINCTRL_IMX_SCU
-	bool
+	tristate "IMX SCU pinctrl driver"
 	depends on IMX_SCU
-	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE
 	bool
@@ -154,21 +154,21 @@ config PINCTRL_IMX8MQ
 config PINCTRL_IMX8QM
 	bool "IMX8QM pinctrl driver"
 	depends on IMX_SCU && ARCH_MXC && ARM64
-	select PINCTRL_IMX_SCU
+	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8qm pinctrl driver
 
 config PINCTRL_IMX8QXP
 	bool "IMX8QXP pinctrl driver"
 	depends on IMX_SCU && ARCH_MXC && ARM64
-	select PINCTRL_IMX_SCU
+	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8qxp pinctrl driver
 
 config PINCTRL_IMX8DXL
 	bool "IMX8DXL pinctrl driver"
 	depends on IMX_SCU && ARCH_MXC && ARM64
-	select PINCTRL_IMX_SCU
+	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8dxl pinctrl driver
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 333d32b..4e93f12 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -137,7 +137,7 @@ struct imx_pinctrl {
 int imx_pinctrl_probe(struct platform_device *pdev,
 			const struct imx_pinctrl_soc_info *info);
 
-#ifdef CONFIG_PINCTRL_IMX_SCU
+#if IS_ENABLED(CONFIG_PINCTRL_IMX_SCU)
 #define BM_PAD_CTL_GP_ENABLE		BIT(30)
 #define BM_PAD_CTL_IFMUX_ENABLE		BIT(31)
 #define BP_PAD_CTL_IFMUX		27
diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pinctrl-scu.c
index 23cf04b..35efd5c 100644
--- a/drivers/pinctrl/freescale/pinctrl-scu.c
+++ b/drivers/pinctrl/freescale/pinctrl-scu.c
@@ -7,6 +7,7 @@
 
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
@@ -41,6 +42,7 @@ int imx_pinctrl_sc_ipc_init(struct platform_device *pdev)
 {
 	return imx_scu_get_handle(&pinctrl_ipc_handle);
 }
+EXPORT_SYMBOL_GPL(imx_pinctrl_sc_ipc_init);
 
 int imx_pinconf_get_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 			unsigned long *config)
@@ -66,6 +68,7 @@ int imx_pinconf_get_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(imx_pinconf_get_scu);
 
 int imx_pinconf_set_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 			unsigned long *configs, unsigned num_configs)
@@ -101,6 +104,7 @@ int imx_pinconf_set_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(imx_pinconf_set_scu);
 
 void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
 			       unsigned int *pin_id, struct imx_pin *pin,
@@ -119,3 +123,5 @@ void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
 	dev_dbg(ipctl->dev, "%s: 0x%x 0x%08lx", info->pins[pin->pin].name,
 		pin_scu->mux_mode, pin_scu->config);
 }
+EXPORT_SYMBOL_GPL(imx_pinctrl_parse_pin_scu);
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

