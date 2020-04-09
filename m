Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16E01A3AEB
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgDIT7N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgDIT7N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:13 -0400
IronPort-SDR: VwHV2CGiGdFqzlohdJowjMFgF/8Rz2Y15trPMsC6uCbAmnLR6xKBOcDg4B917eI2+7mqTLqTUf
 OD3eiUTpoE2A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:13 -0700
IronPort-SDR: 3DbtjeHwk/w2uWYnuk1P6ASINIOsY+xPIcPb5V58T/vyN5oey6K7rCXXc54n0tnrTx6GhNgxXx
 Iyi33mokYWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745329"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:11 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DigitalDreamtime <clive.messer@digitaldreamtime.co.uk>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 07/16] clk: hifiberry-dacpro: initial import
Date:   Thu,  9 Apr 2020 14:58:32 -0500
Message-Id: <20200409195841.18901-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Daniel Matuschek <daniel@hifiberry.com>

This patch imports the clock code from the Raspberry v5.5-y tree. The
ASoC machine driver initially present in this patch was dropped. The
comments are also dropped but all sign-offs are kept below. The patch
authorship was modified with explicit permission from Daniel Matuschek
to make sure it matches the Signed-off tag.

This patch generates a lot of checkpatch.pl warnings that are
corrected in follow-up patches.

Signed-off-by: DigitalDreamtime <clive.messer@digitaldreamtime.co.uk>
Signed-off-by: Daniel Matuschek <daniel@hifiberry.com>
Signed-off-by: Matthias Reichl <hias@horus.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/Kconfig                |   3 +
 drivers/clk/Makefile               |   1 +
 drivers/clk/clk-hifiberry-dacpro.c | 160 +++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 drivers/clk/clk-hifiberry-dacpro.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index bcb257baed06..6bfffc99e3fd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -70,6 +70,9 @@ config COMMON_CLK_HI655X
 	  multi-function device has one fixed-rate oscillator, clocked
 	  at 32KHz.
 
+config COMMON_CLK_HIFIBERRY_DACPRO
+	tristate
+
 config COMMON_CLK_SCMI
 	tristate "Clock driver controlled via SCMI interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f4169cc2fd31..43ae7596de7b 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
 obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
+obj-$(CONFIG_COMMON_CLK_HIFIBERRY_DACPRO)	+= clk-hifiberry-dacpro.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_COMMON_CLK_MAX9485)	+= clk-max9485.o
 obj-$(CONFIG_ARCH_MILBEAUT_M10V)	+= clk-milbeaut.o
diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
new file mode 100644
index 000000000000..9e2634465823
--- /dev/null
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -0,0 +1,160 @@
+/*
+ * Clock Driver for HiFiBerry DAC Pro
+ *
+ * Author: Stuart MacLean
+ *         Copyright 2015
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+
+/* Clock rate of CLK44EN attached to GPIO6 pin */
+#define CLK_44EN_RATE 22579200UL
+/* Clock rate of CLK48EN attached to GPIO3 pin */
+#define CLK_48EN_RATE 24576000UL
+
+/**
+ * struct hifiberry_dacpro_clk - Common struct to the HiFiBerry DAC Pro
+ * @hw: clk_hw for the common clk framework
+ * @mode: 0 => CLK44EN, 1 => CLK48EN
+ */
+struct clk_hifiberry_hw {
+	struct clk_hw hw;
+	uint8_t mode;
+};
+
+#define to_hifiberry_clk(_hw) container_of(_hw, struct clk_hifiberry_hw, hw)
+
+static const struct of_device_id clk_hifiberry_dacpro_dt_ids[] = {
+	{ .compatible = "hifiberry,dacpro-clk",},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, clk_hifiberry_dacpro_dt_ids);
+
+static unsigned long clk_hifiberry_dacpro_recalc_rate(struct clk_hw *hw,
+	unsigned long parent_rate)
+{
+	return (to_hifiberry_clk(hw)->mode == 0) ? CLK_44EN_RATE :
+		CLK_48EN_RATE;
+}
+
+static long clk_hifiberry_dacpro_round_rate(struct clk_hw *hw,
+	unsigned long rate, unsigned long *parent_rate)
+{
+	long actual_rate;
+
+	if (rate <= CLK_44EN_RATE) {
+		actual_rate = (long)CLK_44EN_RATE;
+	} else if (rate >= CLK_48EN_RATE) {
+		actual_rate = (long)CLK_48EN_RATE;
+	} else {
+		long diff44Rate = (long)(rate - CLK_44EN_RATE);
+		long diff48Rate = (long)(CLK_48EN_RATE - rate);
+
+		if (diff44Rate < diff48Rate)
+			actual_rate = (long)CLK_44EN_RATE;
+		else
+			actual_rate = (long)CLK_48EN_RATE;
+	}
+	return actual_rate;
+}
+
+
+static int clk_hifiberry_dacpro_set_rate(struct clk_hw *hw,
+	unsigned long rate, unsigned long parent_rate)
+{
+	unsigned long actual_rate;
+	struct clk_hifiberry_hw *clk = to_hifiberry_clk(hw);
+
+	actual_rate = (unsigned long)clk_hifiberry_dacpro_round_rate(hw, rate,
+		&parent_rate);
+	clk->mode = (actual_rate == CLK_44EN_RATE) ? 0 : 1;
+	return 0;
+}
+
+
+const struct clk_ops clk_hifiberry_dacpro_rate_ops = {
+	.recalc_rate = clk_hifiberry_dacpro_recalc_rate,
+	.round_rate = clk_hifiberry_dacpro_round_rate,
+	.set_rate = clk_hifiberry_dacpro_set_rate,
+};
+
+static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct clk_hifiberry_hw *proclk;
+	struct clk *clk;
+	struct device *dev;
+	struct clk_init_data init;
+
+	dev = &pdev->dev;
+
+	proclk = kzalloc(sizeof(struct clk_hifiberry_hw), GFP_KERNEL);
+	if (!proclk)
+		return -ENOMEM;
+
+	init.name = "clk-hifiberry-dacpro";
+	init.ops = &clk_hifiberry_dacpro_rate_ops;
+	init.flags = 0;
+	init.parent_names = NULL;
+	init.num_parents = 0;
+
+	proclk->mode = 0;
+	proclk->hw.init = &init;
+
+	clk = devm_clk_register(dev, &proclk->hw);
+	if (!IS_ERR(clk)) {
+		ret = of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
+			clk);
+	} else {
+		dev_err(dev, "Fail to register clock driver\n");
+		kfree(proclk);
+		ret = PTR_ERR(clk);
+	}
+	return ret;
+}
+
+static int clk_hifiberry_dacpro_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+	return 0;
+}
+
+static struct platform_driver clk_hifiberry_dacpro_driver = {
+	.probe = clk_hifiberry_dacpro_probe,
+	.remove = clk_hifiberry_dacpro_remove,
+	.driver = {
+		.name = "clk-hifiberry-dacpro",
+		.of_match_table = clk_hifiberry_dacpro_dt_ids,
+	},
+};
+
+static int __init clk_hifiberry_dacpro_init(void)
+{
+	return platform_driver_register(&clk_hifiberry_dacpro_driver);
+}
+core_initcall(clk_hifiberry_dacpro_init);
+
+static void __exit clk_hifiberry_dacpro_exit(void)
+{
+	platform_driver_unregister(&clk_hifiberry_dacpro_driver);
+}
+module_exit(clk_hifiberry_dacpro_exit);
+
+MODULE_DESCRIPTION("HiFiBerry DAC Pro clock driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:clk-hifiberry-dacpro");
-- 
2.20.1

