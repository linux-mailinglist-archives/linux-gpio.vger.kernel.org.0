Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A2A1F1B54
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 16:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbgFHOs1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 10:48:27 -0400
Received: from inva020.nxp.com ([92.121.34.13]:46462 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730052AbgFHOsW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 10:48:22 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8235F1A107D;
        Mon,  8 Jun 2020 16:48:20 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 025D71A10DE;
        Mon,  8 Jun 2020 16:48:16 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 71EB640299;
        Mon,  8 Jun 2020 22:48:10 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 1/9] pinctrl: imx: Support building SCU pinctrl driver as module
Date:   Mon,  8 Jun 2020 22:37:28 +0800
Message-Id: <1591627056-19022-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591627056-19022-1-git-send-email-Anson.Huang@nxp.com>
References: <1591627056-19022-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export necessary functions and use "IS_ENABLED" instead of "ifdef"
to support SCU pinctrl driver user and itself to be built as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- Separate i.MX and i.MX SCU pinctrl driver to 2 patches;
	- Support building i.MX SCU pinctrl driver itself as module.
---
 drivers/pinctrl/freescale/Kconfig       | 2 +-
 drivers/pinctrl/freescale/pinctrl-imx.h | 2 +-
 drivers/pinctrl/freescale/pinctrl-scu.c | 6 ++++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 4ca44dd..a3a30f1d 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,7 +7,7 @@ config PINCTRL_IMX
 	select REGMAP
 
 config PINCTRL_IMX_SCU
-	bool
+	tristate "IMX SCU pinctrl driver"
 	depends on IMX_SCU
 	select PINCTRL_IMX
 
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

