Return-Path: <linux-gpio+bounces-6153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 759738BD140
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041A31F225C8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF39C155A55;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3+9ZDQx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843C15538A;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=GL0tEjnMVwdsF6utk+55YH0j+NKzyzpkKQ3yf5oXvkcJsv6A+yeCCnRFqv1MaW+jLorTJC9jrN1U6qUTC3xdRZbmpPCr1HVXvm35JXJFefVZqELmVxNaOv07hd9wtlR/2VmCfGvm2Jv1++KVrHykFfzB/2EtXxammerdztCHqPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=0aydgANvs4yyrVr15oY0u9/Cz+F+w2leBSDOWuTvRIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQVz7sN0NHoZS9qdLXOwzLzq1Sws8/FjE0xzYCv/iC8LI8z3XDexYQW21F7elsmlfXSm/kZqDMn3BYMsByayLtsn0s3RCi0vo5pq1s5001bZjhmslRCxH/Rz0COjlHmdzcBvxA4fCVEfF7YzQvHmePyWmkaSs+Fepm5JGgSW6Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3+9ZDQx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED81EC4DDF3;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008215;
	bh=0aydgANvs4yyrVr15oY0u9/Cz+F+w2leBSDOWuTvRIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I3+9ZDQxTUQU4/QDlDWt5c84d3lzqov+UO2P2mp2UaCyRFsUxyTa/qyxOomcVoBQW
	 Hnv26uVKZXc8n5l8yIqSAF+d5iwPDI3RcnxTTMivQX3YMTqeP6wxyUjdQ9XgpUJm5z
	 d2ev0bKTFKANLKLEwp7suZlomu0q00pIqAYvQNFU2gUgJ2DtXnQiG/KuwEKQSsrcpA
	 BCmha3TvO8WTgwJqaBX+eHaQNwLGCmmXuq1On2FfWkA4Ova5No60ec/LLlDJoBiXJ5
	 AOMAc2gVka+DxYfYPeEFGIfHN6orM4ujF+pB+LTivy9aPFW4Y0aR+HepDlWKZeiXyn
	 2vMwmy98/F+CQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CZ-38WB;
	Mon, 06 May 2024 17:10:16 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 11/13] mfd: pm8008: rework driver
Date: Mon,  6 May 2024 17:08:28 +0200
Message-ID: <20240506150830.23709-12-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the pm8008 driver to match the new binding which no longer
describes internal details like interrupts and register offsets
(including which of the two consecutive I2C addresses the registers
belong two).

Instead make the interrupt controller implementation internal and pass
interrupts to the subdrivers using MFD cell resources.

Note that subdrivers may either get their resources, like register block
offsets, from the parent MFD or this can be included in the subdrivers
directly.

In the current implementation, the temperature alarm driver is generic
enough to just get its base address and alarm interrupt from the parent
driver, which already uses this information to implement the interrupt
controller.

The regulator driver, however, needs additional information like parent
supplies and regulator characteristics so in that case it is easier to
just augment its table with the regulator register base addresses.

Similarly, the current GPIO driver already holds the number of pins and
that lookup table can therefore also be extended with register offsets.

Note that subdrivers can now access the two regmaps by name, even if the
primary regmap is registered last so that it's returned by default when
no name is provided in lookups.

Finally, note that the current QPNP GPIO and temperature alarm
subdrivers need some minor rework before they can be used with non-SPMI
devices like the PM8008. The MFD cell names therefore use a "qpnp"
rather than "spmi" prefix to prevent binding until the drivers have been
updated.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/Kconfig                   |  1 +
 drivers/mfd/qcom-pm8008.c             | 95 +++++++++++++++++++++++----
 include/dt-bindings/mfd/qcom-pm8008.h | 19 ------
 3 files changed, 85 insertions(+), 30 deletions(-)
 delete mode 100644 include/dt-bindings/mfd/qcom-pm8008.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 4b023ee229cf..bfcb68c62b07 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2208,6 +2208,7 @@ config MFD_ACER_A500_EC
 config MFD_QCOM_PM8008
 	tristate "QCOM PM8008 Power Management IC"
 	depends on I2C && OF
+	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
 	help
diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index c7a4f8a60cd4..706a725428dd 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -7,8 +7,10 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/ioport.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -16,8 +18,6 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/mfd/qcom-pm8008.h>
-
 #define I2C_INTR_STATUS_BASE		0x0550
 #define INT_RT_STS_OFFSET		0x10
 #define INT_SET_TYPE_OFFSET		0x11
@@ -45,6 +45,16 @@ enum {
 #define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
 #define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
+/* PM8008 IRQ numbers */
+#define PM8008_IRQ_MISC_UVLO	0
+#define PM8008_IRQ_MISC_OVLO	1
+#define PM8008_IRQ_MISC_OTST2	2
+#define PM8008_IRQ_MISC_OTST3	3
+#define PM8008_IRQ_MISC_LDO_OCP	4
+#define PM8008_IRQ_TEMP_ALARM	5
+#define PM8008_IRQ_GPIO1	6
+#define PM8008_IRQ_GPIO2	7
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -150,21 +160,65 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
-static struct regmap_config qcom_mfd_regmap_cfg = {
+static const struct regmap_config qcom_mfd_regmap_cfg = {
+	.name		= "primary",
+	.reg_bits	= 16,
+	.val_bits	= 8,
+	.max_register	= 0xffff,
+};
+
+static const struct regmap_config pm8008_regmap_cfg_2 = {
+	.name		= "secondary",
 	.reg_bits	= 16,
 	.val_bits	= 8,
 	.max_register	= 0xffff,
 };
 
+static const struct resource pm8008_temp_res[] = {
+	DEFINE_RES_MEM(PM8008_TEMP_ALARM_ADDR, 0x100),
+	DEFINE_RES_IRQ(PM8008_IRQ_TEMP_ALARM),
+};
+
+static const struct mfd_cell pm8008_cells[] = {
+	MFD_CELL_NAME("qcom-pm8008-regulator"),
+	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+	MFD_CELL_NAME("qpnp-gpio"),
+};
+
+static void devm_irq_domain_fwnode_release(void *res)
+{
+	struct fwnode_handle *fwnode = res;
+
+	irq_domain_free_fwnode(fwnode);
+}
+
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	struct device *dev = &client->dev;
+	struct regmap *regmap, *regmap2;
+	struct fwnode_handle *fwnode;
+	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	char *name;
 	int rc;
-	struct device *dev;
-	struct regmap *regmap;
 
-	dev = &client->dev;
+	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
+	if (IS_ERR(dummy)) {
+		rc = PTR_ERR(dummy);
+		dev_err(&client->dev, "failed to claim second address: %d\n", rc);
+		return rc;
+	}
+
+	regmap2 = devm_regmap_init_i2c(dummy, &qcom_mfd_regmap_cfg);
+	if (IS_ERR(regmap2))
+		return PTR_ERR(regmap2);
+
+	rc = regmap_attach_dev(dev, regmap2, &pm8008_regmap_cfg_2);
+	if (rc)
+		return rc;
+
+	/* Default regmap must be attached last. */
 	regmap = devm_regmap_init_i2c(client, &qcom_mfd_regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
@@ -173,14 +227,33 @@ static int pm8008_probe(struct i2c_client *client)
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
 
-	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
-		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
+	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+	if (!name)
+		return -ENOMEM;
+
+	name = strreplace(name, '/', ':');
+
+	fwnode = irq_domain_alloc_named_fwnode(name);
+	if (!fwnode)
+		return -ENOMEM;
+
+	rc = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+	if (rc)
+		return rc;
+
+	rc = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
 				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-		if (rc)
-			dev_err(dev, "failed to add IRQ chip: %d\n", rc);
+	if (rc) {
+		dev_err(dev, "failed to add IRQ chip: %d\n", rc);
+		return rc;
 	}
 
-	return devm_of_platform_populate(dev);
+	/* Needed by GPIO driver. */
+	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
+				ARRAY_SIZE(pm8008_cells), NULL, 0,
+				regmap_irq_get_domain(irq_data));
 }
 
 static const struct of_device_id pm8008_match[] = {
diff --git a/include/dt-bindings/mfd/qcom-pm8008.h b/include/dt-bindings/mfd/qcom-pm8008.h
deleted file mode 100644
index eca9448df228..000000000000
--- a/include/dt-bindings/mfd/qcom-pm8008.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2021 The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DT_BINDINGS_MFD_QCOM_PM8008_H
-#define __DT_BINDINGS_MFD_QCOM_PM8008_H
-
-/* PM8008 IRQ numbers */
-#define PM8008_IRQ_MISC_UVLO	0
-#define PM8008_IRQ_MISC_OVLO	1
-#define PM8008_IRQ_MISC_OTST2	2
-#define PM8008_IRQ_MISC_OTST3	3
-#define PM8008_IRQ_MISC_LDO_OCP	4
-#define PM8008_IRQ_TEMP_ALARM	5
-#define PM8008_IRQ_GPIO1	6
-#define PM8008_IRQ_GPIO2	7
-
-#endif
-- 
2.43.2


