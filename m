Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AD01F6711
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 13:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgFKLp7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 07:45:59 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33012 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727097AbgFKLp5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 07:45:57 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 14C0C2006D1;
        Thu, 11 Jun 2020 13:45:55 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5BAC92006BD;
        Thu, 11 Jun 2020 13:45:50 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CE07F402F3;
        Thu, 11 Jun 2020 19:45:44 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V5 1/9] pinctrl: imx: Support building SCU pinctrl driver as module
Date:   Thu, 11 Jun 2020 19:34:47 +0800
Message-Id: <1591875295-19427-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591875295-19427-1-git-send-email-Anson.Huang@nxp.com>
References: <1591875295-19427-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To support building i.MX SCU pinctrl driver as module, below things
need to be changed:

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
Changes since V4:
	- add module author and description.
---
 drivers/pinctrl/freescale/Kconfig           |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c     | 18 ++++-----
 drivers/pinctrl/freescale/pinctrl-imx.h     | 57 ++++++++++++-----------------
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c |  3 ++
 drivers/pinctrl/freescale/pinctrl-imx8qm.c  |  3 ++
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c |  3 ++
 drivers/pinctrl/freescale/pinctrl-scu.c     |  9 +++++
 7 files changed, 51 insertions(+), 44 deletions(-)

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
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index cb7e0f0..c1faae1 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -372,8 +372,8 @@ static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 
-	if (info->flags & IMX_USE_SCU)
-		return imx_pinconf_get_scu(pctldev, pin_id, config);
+	if ((info->flags & IMX_USE_SCU) && info->imx_pinconf_get)
+		return info->imx_pinconf_get(pctldev, pin_id, config);
 	else
 		return imx_pinconf_get_mmio(pctldev, pin_id, config);
 }
@@ -422,8 +422,8 @@ static int imx_pinconf_set(struct pinctrl_dev *pctldev,
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 
-	if (info->flags & IMX_USE_SCU)
-		return imx_pinconf_set_scu(pctldev, pin_id,
+	if ((info->flags & IMX_USE_SCU) && info->imx_pinconf_set)
+		return info->imx_pinconf_set(pctldev, pin_id,
 					   configs, num_configs);
 	else
 		return imx_pinconf_set_mmio(pctldev, pin_id,
@@ -439,8 +439,8 @@ static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 	unsigned long config;
 	int ret;
 
-	if (info->flags & IMX_USE_SCU) {
-		ret = imx_pinconf_get_scu(pctldev, pin_id, &config);
+	if ((info->flags & IMX_USE_SCU) && info->imx_pinconf_get) {
+		ret = info->imx_pinconf_get(pctldev, pin_id, &config);
 		if (ret) {
 			dev_err(ipctl->dev, "failed to get %s pinconf\n",
 				pin_get_name(pctldev, pin_id));
@@ -628,9 +628,9 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 
 	for (i = 0; i < grp->num_pins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
-		if (info->flags & IMX_USE_SCU)
-			imx_pinctrl_parse_pin_scu(ipctl, &grp->pins[i],
-						  pin, &list);
+		if ((info->flags & IMX_USE_SCU) && info->imx_pinctrl_parse_pin)
+			info->imx_pinctrl_parse_pin(ipctl, &grp->pins[i],
+						    pin, &list);
 		else
 			imx_pinctrl_parse_pin_mmio(ipctl, &grp->pins[i],
 						   pin, &list, np);
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
index 7f32e57..be3b09e 100644
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
index 0b6029b..9ba3249 100644
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
index 1131dc3..05906b9 100644
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
index 23cf04b..59b5f8a 100644
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
@@ -119,3 +123,8 @@ void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
 	dev_dbg(ipctl->dev, "%s: 0x%x 0x%08lx", info->pins[pin->pin].name,
 		pin_scu->mux_mode, pin_scu->config);
 }
+EXPORT_SYMBOL_GPL(imx_pinctrl_parse_pin_scu);
+
+MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX SCU common pinctrl driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

