Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E756AB90C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjCFJAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjCFJAe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:00:34 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 179B6E05E;
        Mon,  6 Mar 2023 01:00:30 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.98,236,1673881200"; 
   d="scan'208";a="154992524"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2023 18:00:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.39])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3B59641C819E;
        Mon,  6 Mar 2023 18:00:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 02/13] pinctrl: Add poutdisops variable to struct pinctrl_desc
Date:   Mon,  6 Mar 2023 09:00:03 +0000
Message-Id: <20230306090014.128732-3-biju.das.jz@bp.renesas.com>
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

Add pin output disable operations vtable to struct pinctrl_desc.
This is needed for configuring IPs that support pin output disable
function.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch
Ref:
 https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922F5494D3C0862E15F3F8486B39@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#t
---
 include/linux/pinctrl/output-disable.h | 42 ++++++++++++++++++++++++++
 include/linux/pinctrl/pinctrl.h        |  4 +++
 2 files changed, 46 insertions(+)
 create mode 100644 include/linux/pinctrl/output-disable.h

diff --git a/include/linux/pinctrl/output-disable.h b/include/linux/pinctrl/output-disable.h
new file mode 100644
index 000000000000..7f63dcc93e44
--- /dev/null
+++ b/include/linux/pinctrl/output-disable.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Interface the output disable portions of the pinctrl subsystem
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ * This interface is used in the core to keep track of output_disable pins.
+ *
+ * Author: Biju Das <biju.das.jz@bp.renesas.com>
+ */
+#ifndef __LINUX_PINCTRL_OUTPUT_DISABLE_H
+#define __LINUX_PINCTRL_OUTPUT_DISABLE_H
+
+#include <linux/types.h>
+#include <linux/pinctrl/consumer.h>
+
+struct pinctrl_dev;
+struct seq_file;
+
+enum pin_output_disable_conf {
+	PINCTRL_OUTPUT_DISABLE_BY_USER,
+	PINCTRL_OUTPUT_DISABLE_BY_SOC_ON_PIN_OUTPUT_HIGH,
+	PINCTRL_OUTPUT_DISABLE_BY_SOC_ON_PIN_OUTPUT_LOW,
+	PINCTRL_OUTPUT_DISABLE_BY_SOC_ON_DEAD_TIME_ERROR,
+	PINCTRL_OUTPUT_DISABLE_BY_LEVEL_DETECTION,
+};
+
+/**
+ * struct pin_config_set - pin output disable config operations, to be
+ * implemented by pin configuration capable drivers.
+ * @pin_output_disable_config_set: for pin controllers that want to use the
+ *	generic interface, this flag tells the framework that it's generic.
+ */
+struct pin_output_disable_ops {
+	int (*pin_output_disable_config_set)(struct pinctrl_dev *pctldev,
+					     struct device *dev,
+					     const char *fname,
+					     const char *gname,
+					     enum pin_output_disable_conf conf,
+					     unsigned int conf_val);
+};
+
+#endif /* __LINUX_PINCTRL_OUTPUT_DISABLE_H */
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 4d252ea00ed1..3b5beee49039 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -25,6 +25,7 @@ struct pinconf_ops;
 struct pinctrl_dev;
 struct pinctrl_map;
 struct pinmux_ops;
+struct pin_output_disable_ops;
 
 /**
  * struct pingroup - provides information on pingroup
@@ -135,6 +136,8 @@ struct pinctrl_ops {
  * @pmxops: pinmux operations vtable, if you support pinmuxing in your driver
  * @confops: pin config operations vtable, if you support pin configuration in
  *	your driver
+ * @poutdisops: pin output disable operations vtable, if you support pin output
+ *	disable in your driver
  * @owner: module providing the pin controller, used for refcounting
  * @num_custom_params: Number of driver-specific custom parameters to be parsed
  *	from the hardware description
@@ -154,6 +157,7 @@ struct pinctrl_desc {
 	const struct pinctrl_ops *pctlops;
 	const struct pinmux_ops *pmxops;
 	const struct pinconf_ops *confops;
+	const struct pin_output_disable_ops *poutdisops;
 	struct module *owner;
 #ifdef CONFIG_GENERIC_PINCONF
 	unsigned int num_custom_params;
-- 
2.25.1

