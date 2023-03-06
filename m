Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4596AB90F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjCFJAq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:00:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjCFJAl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:00:41 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 810721C5BE;
        Mon,  6 Mar 2023 01:00:37 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.98,236,1673881200"; 
   d="scan'208";a="154992549"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2023 18:00:36 +0900
Received: from localhost.localdomain (unknown [10.226.93.39])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5DDBC41C704C;
        Mon,  6 Mar 2023 18:00:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 04/13] pinctrl: renesas: rzg2l: Add pin output disable support
Date:   Mon,  6 Mar 2023 09:00:05 +0000
Message-Id: <20230306090014.128732-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pin output disable support for RZ/G2L alike SoCs by registering with
pincontrol core and provide callback mechanism for configuring pin output
disable device by matching with device registered with callback against
the device found by the core framework for a given function name and device
name.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch
Ref:
 https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922F5494D3C0862E15F3F8486B39@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#t
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 44 +++++++++++++++++++++++++
 include/linux/pinctrl/pinctrl-rzg2l.h   | 26 +++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 include/linux/pinctrl/pinctrl-rzg2l.h

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 04b31f0c6b34..137d085077d8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -17,9 +17,11 @@
 #include <linux/spinlock.h>
 
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/output-disable.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinctrl-rzg2l.h>
 #include <linux/pinctrl/pinmux.h>
 
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
@@ -136,6 +138,10 @@ struct rzg2l_pinctrl_data {
 	unsigned int n_dedicated_pins;
 };
 
+static struct device *rzg2l_poeg_dev;
+static output_disable_cb rzg2l_poeg_cb;
+static void *rzg2l_poeg_context;
+
 struct rzg2l_pinctrl {
 	struct pinctrl_dev		*pctl;
 	struct pinctrl_desc		desc;
@@ -747,6 +753,28 @@ static int rzg2l_pinctrl_pinconf_group_get(struct pinctrl_dev *pctldev,
 	return 0;
 };
 
+static int rzg2l_pinctrl_output_disable_set(struct pinctrl_dev *pctldev,
+					    struct device *dev,
+					    const char *fname,
+					    const char *gname,
+					    enum pin_output_disable_conf conf,
+					    unsigned int conf_val)
+{
+	struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!rzg2l_poeg_cb || !rzg2l_poeg_context) {
+		dev_err(pctrl->dev, "No callback function registered\n");
+		return -EINVAL;
+	}
+
+	if (!rzg2l_poeg_dev || rzg2l_poeg_dev != dev) {
+		dev_err(pctrl->dev, "Device match failed\n");
+		return -EINVAL;
+	}
+
+	return rzg2l_poeg_cb(rzg2l_poeg_context, fname, gname, conf, conf_val);
+}
+
 static const struct pinctrl_ops rzg2l_pinctrl_pctlops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
@@ -772,6 +800,10 @@ static const struct pinconf_ops rzg2l_pinctrl_confops = {
 	.pin_config_config_dbg_show = pinconf_generic_dump_config,
 };
 
+static const struct pin_output_disable_ops rzg2l_pinctrl_output_disable_fops = {
+	.pin_output_disable_config_set = rzg2l_pinctrl_output_disable_set,
+};
+
 static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
@@ -1320,6 +1352,17 @@ static void rzg2l_init_irq_valid_mask(struct gpio_chip *gc,
 	}
 }
 
+int rzg2l_output_disable_cb_register(struct device *dev, output_disable_cb cb,
+				     void *cb_context)
+{
+	rzg2l_poeg_dev = dev;
+	rzg2l_poeg_cb = cb;
+	rzg2l_poeg_context = cb_context;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rzg2l_output_disable_cb_register);
+
 static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 {
 	struct device_node *np = pctrl->dev->of_node;
@@ -1404,6 +1447,7 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 	pctrl->desc.pctlops = &rzg2l_pinctrl_pctlops;
 	pctrl->desc.pmxops = &rzg2l_pinctrl_pmxops;
 	pctrl->desc.confops = &rzg2l_pinctrl_confops;
+	pctrl->desc.poutdisops = &rzg2l_pinctrl_output_disable_fops;
 	pctrl->desc.owner = THIS_MODULE;
 
 	pins = devm_kcalloc(pctrl->dev, pctrl->desc.npins, sizeof(*pins), GFP_KERNEL);
diff --git a/include/linux/pinctrl/pinctrl-rzg2l.h b/include/linux/pinctrl/pinctrl-rzg2l.h
new file mode 100644
index 000000000000..a49b4c5f8908
--- /dev/null
+++ b/include/linux/pinctrl/pinctrl-rzg2l.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_PINCTRL_RZG2L_H__
+#define __LINUX_PINCTRL_RZG2L_H__
+
+#include <linux/pinctrl/output-disable.h>
+
+typedef int (*output_disable_cb) (void *context,
+				  const char *fname,
+				  const char *gname,
+				  enum pin_output_disable_conf conf,
+				  unsigned int conf_val);
+
+#if IS_ENABLED(CONFIG_PINCTRL_RZG2L)
+int rzg2l_output_disable_cb_register(struct device *dev,
+				     output_disable_cb cb,
+				     void *cb_context);
+#else
+static inline int rzg2l_output_disable_cb_register(struct device *dev,
+						   output_disable_cb cb,
+						   void *cb_context)
+{
+	return -EINVAL;
+}
+#endif
+
+#endif /* __LINUX_PINCTRL_RZG2L_H__ */
-- 
2.25.1

