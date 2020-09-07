Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0F525FA9B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 14:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbgIGMmE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 08:42:04 -0400
Received: from inva021.nxp.com ([92.121.34.21]:51858 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729155AbgIGMke (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 08:40:34 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 301AB2000D4;
        Mon,  7 Sep 2020 14:40:28 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AA23E200E9A;
        Mon,  7 Sep 2020 14:40:23 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 35DD1402DD;
        Mon,  7 Sep 2020 14:40:18 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 2/3] pinctrl: imx: Support building SCU pinctrl core driver as module
Date:   Mon,  7 Sep 2020 20:32:32 +0800
Message-Id: <1599481953-32704-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599481953-32704-1-git-send-email-Anson.Huang@nxp.com>
References: <1599481953-32704-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change PINCTR_IMX_SCU to tristate, remove unnecessary #ifdef and add
module author, description and license to support building SCU pinctrl
core driver as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- split V1 [1/2] patch to 2 patches, this patch supports building SCU pinctrl core
	  driver as module;
	- remove unnecessary #ifdef check and #else block.
---
 drivers/pinctrl/freescale/Kconfig       |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx.h | 20 --------------------
 drivers/pinctrl/freescale/pinctrl-scu.c |  5 +++++
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 08fcf5c..452c499 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,7 +7,7 @@ config PINCTRL_IMX
 	select REGMAP
 
 config PINCTRL_IMX_SCU
-	bool
+	tristate "IMX SCU pinctrl core driver"
 	depends on IMX_SCU
 	select PINCTRL_IMX
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 40927ca..fd8c4b6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -144,7 +144,6 @@ struct imx_pinctrl_soc_info {
 int imx_pinctrl_probe(struct platform_device *pdev,
 			const struct imx_pinctrl_soc_info *info);
 
-#ifdef CONFIG_PINCTRL_IMX_SCU
 #define BM_PAD_CTL_GP_ENABLE		BIT(30)
 #define BM_PAD_CTL_IFMUX_ENABLE		BIT(31)
 #define BP_PAD_CTL_IFMUX		27
@@ -157,23 +156,4 @@ int imx_pinconf_set_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
 			       unsigned int *pin_id, struct imx_pin *pin,
 			       const __be32 **list_p);
-#else
-static inline int imx_pinconf_get_scu(struct pinctrl_dev *pctldev,
-				      unsigned pin_id, unsigned long *config)
-{
-	return -EINVAL;
-}
-static inline int imx_pinconf_set_scu(struct pinctrl_dev *pctldev,
-				      unsigned pin_id, unsigned long *configs,
-				      unsigned num_configs)
-{
-	return -EINVAL;
-}
-static inline void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
-					    unsigned int *pin_id,
-					    struct imx_pin *pin,
-					    const __be32 **list_p)
-{
-}
-#endif
 #endif /* __DRIVERS_PINCTRL_IMX_H */
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

