Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CB939DA27
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 12:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhFGKxt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 06:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhFGKxs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 06:53:48 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55FFC061789
        for <linux-gpio@vger.kernel.org>; Mon,  7 Jun 2021 03:51:41 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t3so19768747edc.7
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uxuJDaLJFNMdWrD4zSHSMfbzdhKctWUxMQCY49G8FVw=;
        b=rxjL76AkrRw0JxUyfDDXs5bGMmvnTz6gU3LutNmmL5V+bh8KUcho88eVUr9G+7NaMS
         MogE4EAVXvrfqadSOsckN2l+M9vcQQpJNSBgfqvdAQFridfFxfeY8Q8xefavQRouYEXS
         bRxc9IQhaIUxcqt2FCl6vQVS9ZZIb1VddDM1R9i5Kjgcobmy+oMLTGTgILmeTrdVLXYH
         5SwUk7LW/XupyAh8u1rT/u+p/SMGgmj+zZ2A5m4XIkfAWp1x/jPYK8sVlNUCbGLZaNfB
         nkKDZ7un9P1WqtScpaqez/297WZAjFGHqB7L7Hia24dJ4NJDLoxxRFU5UBVQukwoAF7g
         4zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxuJDaLJFNMdWrD4zSHSMfbzdhKctWUxMQCY49G8FVw=;
        b=iRLdDH2wssVluFdeiX0YkO6/NSeaQBxs9WJ2AbW8BPrR5CB1hTzUgBxdNs+LXKs8RS
         A9pmhlZXP7Bzv+BJ5DErKhe4b/j+gnyZpf6icue7wVUQgVSihZYZ0EBNHBqwRUEmNE1B
         t/von5MfoNiEUYk8OW/mWw+sLPEGSKDVK4wu2WroJjIrYEdOR+5dZvkW6ur/h5WMJAl4
         UGj2YYhHzs9QqcP96bB4qCNMh3xdClkke5KFc83eYN2X0d+u928UOz0ALQvGySs14jZQ
         JGlIvXzO3zS/2KATTXXg0ab3QEH8+hxVudcEeH1wtGmSJs/Da6wt3hy7oyyDj7wIqvUk
         bfng==
X-Gm-Message-State: AOAM530IVnzUhBpoIDZtwUVdZc5uFuwBvGQil3KCgISJ+a80F6HoUo54
        ZKJq/mz1cBsZnosItiPmqAvijQ==
X-Google-Smtp-Source: ABdhPJye2k3qcg1+WLKeni35oa2jwPys8xL1XoA14y+owIVRgXHhgfU3uyPcWZUg2mX4gqC4JjmmFQ==
X-Received: by 2002:a50:d589:: with SMTP id v9mr19936231edi.126.1623063100484;
        Mon, 07 Jun 2021 03:51:40 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id f6sm6340003eja.108.2021.06.07.03.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:51:40 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, lee.jones@linaro.org,
        p.zabel@pengutronix.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bgolaszewski@baylibre.com
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 4/6] reset: Add Delta TN48M CPLD reset controller
Date:   Mon,  7 Jun 2021 12:51:20 +0200
Message-Id: <20210607105122.2047212-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607105122.2047212-1-robert.marko@sartura.hr>
References: <20210607105122.2047212-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delta TN48M CPLD exposes resets for the following:
* 88F7040 SoC
* 88F6820 SoC
* 98DX3265 switch MAC-s
* 88E1680 PHY-s
* 88E1512 PHY
* PoE PSE controller

Controller supports only self clearing resets.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v5:
* Allow COMPILE_TEST as well
* Default to MFD_TN48M_CPLD

Changes in v4:
* Drop assert and deassert as only self-clearing
resets are support by the HW
* Make sure that reset is cleared before returning
from reset.

 drivers/reset/Kconfig       |  10 +++
 drivers/reset/Makefile      |   1 +
 drivers/reset/reset-tn48m.c | 128 ++++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/reset/reset-tn48m.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 4171c6f76385..b647bb945597 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -237,6 +237,16 @@ config RESET_TI_SYSCON
 	  you wish to use the reset framework for such memory-mapped devices,
 	  say Y here. Otherwise, say N.
 
+config RESET_TN48M_CPLD
+	tristate "Delta Networks TN48M switch CPLD reset controller"
+	depends on MFD_TN48M_CPLD || COMPILE_TEST
+	default MFD_TN48M_CPLD
+	help
+	  This enables the reset controller driver for the Delta TN48M CPLD.
+	  It provides reset signals for Armada 7040 and 385 SoC-s, Alleycat 3X
+	  switch MAC-s, Alaska OOB ethernet PHY, Quad Alaska ethernet PHY-s and
+	  Microchip PD69200 PoE PSE controller.
+
 config RESET_UNIPHIER
 	tristate "Reset controller driver for UniPhier SoCs"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 65a118a91b27..d048498e6566 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
 obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
+obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
diff --git a/drivers/reset/reset-tn48m.c b/drivers/reset/reset-tn48m.c
new file mode 100644
index 000000000000..fa6fd7ddbdfb
--- /dev/null
+++ b/drivers/reset/reset-tn48m.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Delta TN48M CPLD reset driver
+ *
+ * Copyright 2021 Sartura Ltd
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/delta,tn48m-reset.h>
+
+#define TN48M_RESET_REG		0x10
+
+#define TN48M_RESET_TIMEOUT	125000
+#define TN48M_RESET_SLEEP	10
+
+struct tn48_reset_map {
+	u8 bit;
+};
+
+struct tn48_reset_data {
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+};
+
+static const struct tn48_reset_map tn48m_resets[] = {
+	[CPU_88F7040_RESET] = {0},
+	[CPU_88F6820_RESET] = {1},
+	[MAC_98DX3265_RESET] = {2},
+	[PHY_88E1680_RESET] = {4},
+	[PHY_88E1512_RESET] = {6},
+	[POE_RESET] = {7},
+};
+
+static inline struct tn48_reset_data *to_tn48_reset_data(
+			struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct tn48_reset_data, rcdev);
+}
+
+static int tn48m_control_reset(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
+	unsigned int val;
+
+	regmap_update_bits(data->regmap, TN48M_RESET_REG,
+			   BIT(tn48m_resets[id].bit), 0);
+
+	return regmap_read_poll_timeout(data->regmap,
+					TN48M_RESET_REG,
+					val,
+					val & BIT(tn48m_resets[id].bit),
+					TN48M_RESET_SLEEP,
+					TN48M_RESET_TIMEOUT);
+}
+
+static int tn48m_control_status(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
+	if (ret < 0)
+		return ret;
+
+	if (BIT(tn48m_resets[id].bit) & regval)
+		return 0;
+	else
+		return 1;
+}
+
+static const struct reset_control_ops tn48_reset_ops = {
+	.reset		= tn48m_control_reset,
+	.status		= tn48m_control_status,
+};
+
+static int tn48m_reset_probe(struct platform_device *pdev)
+{
+	struct tn48_reset_data *data;
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = regmap;
+
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &tn48_reset_ops;
+	data->rcdev.nr_resets = ARRAY_SIZE(tn48m_resets);
+	data->rcdev.of_node = pdev->dev.of_node;
+
+	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+}
+
+static const struct of_device_id tn48m_reset_of_match[] = {
+	{ .compatible = "delta,tn48m-reset", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tn48m_reset_of_match);
+
+static struct platform_driver tn48m_reset_driver = {
+	.driver = {
+		.name = "delta-tn48m-reset",
+		.of_match_table = tn48m_reset_of_match,
+	},
+	.probe = tn48m_reset_probe,
+};
+module_platform_driver(tn48m_reset_driver);
+
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_DESCRIPTION("Delta TN48M CPLD reset driver");
+MODULE_LICENSE("GPL");
-- 
2.31.1

