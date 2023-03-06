Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341F06AB909
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjCFJAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjCFJAc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:00:32 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B2E97222E4;
        Mon,  6 Mar 2023 01:00:28 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.98,236,1673881200"; 
   d="scan'208";a="151662690"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2023 18:00:27 +0900
Received: from localhost.localdomain (unknown [10.226.93.39])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2DD0441C704C;
        Mon,  6 Mar 2023 18:00:24 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Date:   Mon,  6 Mar 2023 09:00:02 +0000
Message-Id: <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
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

Add pinctrl_get_device() to find a device handle associated with
a pincontrol group(i.e. by matching function name and group name for a
device). This device handle can then be used for finding match for the
pin output disable device that protects device against short circuits
on the pins.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch
Ref:
 https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922F5494D3C0862E15F3F8486B39@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#t
---
 drivers/pinctrl/core.c           | 49 ++++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 ++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d6e6c751255f..2ba222026db4 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -27,6 +27,7 @@
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
 
 #ifdef CONFIG_GPIOLIB
 #include "../gpio/gpiolib.h"
@@ -1584,6 +1585,54 @@ int pinctrl_select_default_state(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pinctrl_select_default_state);
 
+static bool pinctrl_get_device_match(struct pinctrl_setting *setting,
+				     const char *fname, const char *gname)
+{
+	struct pinctrl_dev *pctldev = setting->pctldev;
+	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
+	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
+	const char *function = pmxops->get_function_name(pctldev,
+							 setting->data.mux.func);
+	const char *group = pctlops->get_group_name(pctldev,
+						    setting->data.mux.group);
+
+	if ((!strcmp(function, fname)) && (!strcmp(group, gname)))
+		return true;
+
+	return false;
+}
+
+/**
+ * pinctrl_get_device() - returns device associated with a pincontrol group
+ * @fname: function name
+ * @gname: group name
+ */
+struct device *pinctrl_get_device(const char *fname, const char *gname)
+{
+	struct pinctrl *p;
+	struct pinctrl_state *state;
+	struct pinctrl_setting *setting;
+
+	mutex_lock(&pinctrl_list_mutex);
+
+	list_for_each_entry(p, &pinctrl_list, node) {
+		list_for_each_entry(state, &p->states, node) {
+			list_for_each_entry(setting, &state->settings, node) {
+				if (setting->type == PIN_MAP_TYPE_MUX_GROUP &&
+				    pinctrl_get_device_match(setting, fname, gname)) {
+					mutex_unlock(&pinctrl_list_mutex);
+					return p->dev;
+				}
+			}
+		}
+	}
+
+	mutex_unlock(&pinctrl_list_mutex);
+
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(pinctrl_get_device);
+
 #ifdef CONFIG_PM
 
 /**
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 4729d54e8995..6ff8857c0a9c 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -42,6 +42,9 @@ extern struct pinctrl * __must_check devm_pinctrl_get(struct device *dev);
 extern void devm_pinctrl_put(struct pinctrl *p);
 extern int pinctrl_select_default_state(struct device *dev);
 
+extern struct device * __must_check pinctrl_get_device(const char *fname,
+						       const char *gname);
+
 #ifdef CONFIG_PM
 extern int pinctrl_pm_select_default_state(struct device *dev);
 extern int pinctrl_pm_select_sleep_state(struct device *dev);
@@ -142,6 +145,12 @@ static inline int pinctrl_pm_select_idle_state(struct device *dev)
 	return 0;
 }
 
+static inline struct device * __must_check pinctrl_get_device(const char *fname,
+							      const char *gname)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_PINCTRL */
 
 static inline struct pinctrl * __must_check pinctrl_get_select(struct device *dev,
-- 
2.25.1

