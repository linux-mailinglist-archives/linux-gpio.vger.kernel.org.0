Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3776E222693
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 17:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgGPPKk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 11:10:40 -0400
Received: from inva020.nxp.com ([92.121.34.13]:51660 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728402AbgGPPKj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 11:10:39 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BF2F61A06C3;
        Thu, 16 Jul 2020 17:10:36 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A639E1A162A;
        Thu, 16 Jul 2020 17:10:30 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D7831402BF;
        Thu, 16 Jul 2020 23:10:23 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as module
Date:   Thu, 16 Jul 2020 23:06:52 +0800
Message-Id: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To support building i.MX SCU pinctrl driver as module, below things need to be changed:

    - Export SCU related functions and use "IS_ENABLED" instead of
      "ifdef" to support SCU pinctrl driver user and itself to be
      built as module;
    - Use function callbacks for SCU related functions in pinctrl-imx.c
      in order to support the scenario of PINCTRL_IMX is built in
      while PINCTRL_IMX_SCU is built as module;
    - All drivers using SCU pinctrl driver need to initialize the
      SCU related function callback;
    - Change PINCTR_IMX_SCU to tristate;
    - Add module author, description and license.

With above changes, i.MX SCU pinctrl driver can be built as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/pinctrl/freescale/Kconfig           |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c     |  8 ++--
 drivers/pinctrl/freescale/pinctrl-imx.h     | 57 ++++++++++++-----------------
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c |  3 ++
 drivers/pinctrl/freescale/pinctrl-imx8qm.c  |  3 ++
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c |  3 ++
 drivers/pinctrl/freescale/pinctrl-scu.c     |  5 +++
 7 files changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 08fcf5c..570355c 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -7,7 +7,7 @@ config PINCTRL_IMX
 	select REGMAP
 
 config PINCTRL_IMX_SCU
-	bool
+	tristate "IMX SCU pinctrl driver"
 	depends on IMX_SCU
 	select PINCTRL_IMX
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 507e4af..b80c450 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -373,7 +373,7 @@ static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 
 	if (info->flags & IMX_USE_SCU)
-		return imx_pinconf_get_scu(pctldev, pin_id, config);
+		return info->imx_pinconf_get(pctldev, pin_id, config);
 	else
 		return imx_pinconf_get_mmio(pctldev, pin_id, config);
 }
@@ -423,7 +423,7 @@ static int imx_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 
 	if (info->flags & IMX_USE_SCU)
-		return imx_pinconf_set_scu(pctldev, pin_id,
+		return info->imx_pinconf_set(pctldev, pin_id,
 					   configs, num_configs);
 	else
 		return imx_pinconf_set_mmio(pctldev, pin_id,
@@ -440,7 +440,7 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 	int ret;
 
 	if (info->flags & IMX_USE_SCU) {
-		ret = imx_pinconf_get_scu(pctldev, pin_id, &config);
+		ret = info->imx_pinconf_get(pctldev, pin_id, &config);
 		if (ret) {
 			dev_err(ipctl->dev, "failed to get %s pinconf\n",
 				pin_get_name(pctldev, pin_id));
@@ -629,7 +629,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 	for (i = 0; i < grp->num_pins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
 		if (info->flags & IMX_USE_SCU)
-			imx_pinctrl_parse_pin_scu(ipctl, &grp->pins[i],
+			info->imx_pinctrl_parse_pin(ipctl, &grp->pins[i],
 						  pin, &list);
 		else
 			imx_pinctrl_parse_pin_mmio(ipctl, &grp->pins[i],
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index 333d32b..bdb86c2 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -75,6 +75,21 @@ struct imx_cfg_params_decode {
 	bool invert;
 };
 
+/**
+ * @dev: a pointer back to containing device
+ * @base: the offset to the controller in virtual memory
+ */
+struct imx_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+	void __iomem *base;
+	void __iomem *input_sel_base;
+	const struct imx_pinctrl_soc_info *info;
+	struct imx_pin_reg *pin_regs;
+	unsigned int group_index;
+	struct mutex mutex;
+};
+
 struct imx_pinctrl_soc_info {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
@@ -98,21 +113,13 @@ struct imx_pinctrl_soc_info {
 				  struct pinctrl_gpio_range *range,
 				  unsigned offset,
 				  bool input);
-};
-
-/**
- * @dev: a pointer back to containing device
- * @base: the offset to the controller in virtual memory
- */
-struct imx_pinctrl {
-	struct device *dev;
-	struct pinctrl_dev *pctl;
-	void __iomem *base;
-	void __iomem *input_sel_base;
-	const struct imx_pinctrl_soc_info *info;
-	struct imx_pin_reg *pin_regs;
-	unsigned int group_index;
-	struct mutex mutex;
+	int (*imx_pinconf_get)(struct pinctrl_dev *pctldev, unsigned int pin_id,
+			       unsigned long *config);
+	int (*imx_pinconf_set)(struct pinctrl_dev *pctldev, unsigned int pin_id,
+			       unsigned long *configs, unsigned int num_configs);
+	void (*imx_pinctrl_parse_pin)(struct imx_pinctrl *ipctl,
+				      unsigned int *pin_id, struct imx_pin *pin,
+				      const __be32 **list_p);
 };
 
 #define IMX_CFG_PARAMS_DECODE(p, m, o) \
@@ -137,7 +144,7 @@ struct imx_pinctrl {
 int imx_pinctrl_probe(struct platform_device *pdev,
 			const struct imx_pinctrl_soc_info *info);
 
-#ifdef CONFIG_PINCTRL_IMX_SCU
+#if IS_ENABLED(CONFIG_PINCTRL_IMX_SCU)
 #define BM_PAD_CTL_GP_ENABLE		BIT(30)
 #define BM_PAD_CTL_IFMUX_ENABLE		BIT(31)
 #define BP_PAD_CTL_IFMUX		27
@@ -150,23 +157,5 @@ int imx_pinconf_set_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
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
 #endif
 #endif /* __DRIVERS_PINCTRL_IMX_H */
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
index 12b97da..d3020c0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
@@ -159,6 +159,9 @@ static struct imx_pinctrl_soc_info imx8dxl_pinctrl_info = {
 	.pins = imx8dxl_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx8dxl_pinctrl_pads),
 	.flags = IMX_USE_SCU,
+	.imx_pinconf_get = imx_pinconf_get_scu,
+	.imx_pinconf_set = imx_pinconf_set_scu,
+	.imx_pinctrl_parse_pin = imx_pinctrl_parse_pin_scu,
 };
 
 static const struct of_device_id imx8dxl_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qm.c b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
index 095acf4..8f46b940 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qm.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qm.c
@@ -292,6 +292,9 @@ static const struct imx_pinctrl_soc_info imx8qm_pinctrl_info = {
 	.pins = imx8qm_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx8qm_pinctrl_pads),
 	.flags = IMX_USE_SCU,
+	.imx_pinconf_get = imx_pinconf_get_scu,
+	.imx_pinconf_set = imx_pinconf_set_scu,
+	.imx_pinctrl_parse_pin = imx_pinctrl_parse_pin_scu,
 };
 
 static const struct of_device_id imx8qm_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
index 81ebd4c..6776ad6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
@@ -198,6 +198,9 @@ static struct imx_pinctrl_soc_info imx8qxp_pinctrl_info = {
 	.pins = imx8qxp_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx8qxp_pinctrl_pads),
 	.flags = IMX_USE_SCU,
+	.imx_pinconf_get = imx_pinconf_get_scu,
+	.imx_pinconf_set = imx_pinconf_set_scu,
+	.imx_pinctrl_parse_pin = imx_pinctrl_parse_pin_scu,
 };
 
 static const struct of_device_id imx8qxp_pinctrl_of_match[] = {
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

