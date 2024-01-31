Return-Path: <linux-gpio+bounces-2813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA389844455
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 17:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF7491C2677C
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 16:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7AA130E2A;
	Wed, 31 Jan 2024 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J8MIa1Ae"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9280D12CD87;
	Wed, 31 Jan 2024 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706718442; cv=none; b=SZ92+hDc47r5VgpmpKhtOsCVPSXtPlcEE1ZlJTFgypamejKnAw7d+q7pdlj8LsoPybpH2Kbs2Z3D/EluLYTNY1HL9yPuG6+HYB7d+2dSKbkLD5BNJs+rn5jyhnW3HVknhu+Z9tERvqTpdUfrJkTE/D1si6sP2w5sMHtF6u78noI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706718442; c=relaxed/simple;
	bh=Zz0IimLVNcJHf7q6qgxG8tMencR1tlz76iMV6+xph6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9UDWufYuvNtSbi+xBWTejs7rsR9tmSrwAYrhXTE9z1fPyKkdIB8Oksyleq856VKo2L/PysW4FkjnxQgpslIqYwZzScZenbnQSWN1zRmzGmkZsMdCZRJwxHSLC+nsA6YwWBn9RvvzIhg2pK5+H2D7d9L+6Jw3F7DZ8RI5q6DsjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J8MIa1Ae; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2431F4000C;
	Wed, 31 Jan 2024 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706718437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upfj24gVT/veWe/jt2WpVMTfu8Jv9s5AFqkQcjOFxU8=;
	b=J8MIa1AeHcTtC2YPa5w6dDIgXe3SwD9rSLg4EAFg2IT7RImENZafNPVuwS/4DpEhMPRRU/
	c68DfX8pqRfB4iee2/7wydqw0wu6sq2r0XCqI5TbWRNC+CwbcE/kixV2H6l3Yx6gQ/Qv1+
	/RH1so1kvFh+43T5WsexWMY4+JJg6im5udAmOGqI7J/CexMtwhFsGDYHQHTfv8sEEBlnTb
	9nhE+z+v3+qEY+xfJR8Oz8EYpqZuB6lj/Kwzxx/qas+RVMNVxohaHOAh+punYVuwe4aDy7
	/SZK1rofYxQizZMyWtTaPy0+0NQ21vx7DGyzLQkHecaN8FuDgAgxTNiEIkci3g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 31 Jan 2024 17:26:22 +0100
Subject: [PATCH v4 09/18] reset: eyeq5: add platform driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240131-mbly-clk-v4-9-bcd00510d6a0@bootlin.com>
References: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
In-Reply-To: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Add the Mobileye EyeQ5 reset controller driver. It belongs to a syscon
region called OLB. It might grow to add later support of other
platforms from Mobileye.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 MAINTAINERS                 |   1 +
 drivers/reset/Kconfig       |  12 ++
 drivers/reset/Makefile      |   1 +
 drivers/reset/reset-eyeq5.c | 342 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 356 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d621e14dc95..72edb390a046 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14795,6 +14795,7 @@ F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq5.c
+F:	drivers/reset/reset-eyeq5.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
 F:	include/dt-bindings/soc/mobileye,eyeq5.h
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index ccd59ddd7610..80bfde54c076 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -66,6 +66,18 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216.
 
+config RESET_EYEQ5
+	bool "Mobileye EyeQ5 reset controller"
+	depends on MFD_SYSCON
+	depends on MACH_EYEQ5 || COMPILE_TEST
+	default MACH_EYEQ5
+	help
+	  This enables the Mobileye EyeQ5 reset controller.
+
+	  It has three domains, with a varying number of resets in each of them.
+	  Registers are located in a shared register region called OLB accessed
+	  through a syscon & regmap.
+
 config RESET_HSDK
 	bool "Synopsys HSDK Reset Driver"
 	depends on HAS_IOMEM
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 8270da8a4baa..4fabe0070390 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_EYEQ5) += reset-eyeq5.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
diff --git a/drivers/reset/reset-eyeq5.c b/drivers/reset/reset-eyeq5.c
new file mode 100644
index 000000000000..f9d3935dd420
--- /dev/null
+++ b/drivers/reset/reset-eyeq5.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Reset driver for the Mobileye EyeQ5 platform.
+ *
+ * The registers are located in a syscon region called OLB. We handle three
+ * reset domains. Domains 0 and 2 look similar in that they both use one bit
+ * per reset line. Domain 1 has a register per reset.
+ *
+ * We busy-wait after updating a reset in domains 0 or 1. The reason is hardware
+ * logic built-in self-test (LBIST) that might be enabled.
+ *
+ * We use eq5r_ as prefix, as-in "EyeQ5 Reset", but way shorter.
+ *
+ * Known resets in domain 0:
+ *  3. CAN0
+ *  4. CAN1
+ *  5. CAN2
+ *  6. SPI0
+ *  7. SPI1
+ *  8. SPI2
+ *  9. SPI3
+ * 10. UART0
+ * 11. UART1
+ * 12. UART2
+ * 13. I2C0
+ * 14. I2C1
+ * 15. I2C2
+ * 16. I2C3
+ * 17. I2C4
+ * 18. TIMER0
+ * 19. TIMER1
+ * 20. TIMER2
+ * 21. TIMER3
+ * 22. TIMER4
+ * 23. WD0
+ * 24. EXT0
+ * 25. EXT1
+ * 26. GPIO
+ * 27. WD1
+ *
+ * Known resets in domain 1:
+ * 0. VMP0	(Vector Microcode Processors)
+ * 1. VMP1
+ * 2. VMP2
+ * 3. VMP3
+ * 4. PMA0	(Programmable Macro Array)
+ * 5. PMA1
+ * 6. PMAC0
+ * 7. PMAC1
+ * 8. MPC0	(Multi-threaded Processing Clusters)
+ * 9. MPC1
+ *
+ * Known resets in domain 2:
+ *  0. PCIE0_CORE
+ *  1. PCIE0_APB
+ *  2. PCIE0_LINK_AXI
+ *  3. PCIE0_LINK_MGMT
+ *  4. PCIE0_LINK_HOT
+ *  5. PCIE0_LINK_PIPE
+ *  6. PCIE1_CORE
+ *  7. PCIE1_APB
+ *  8. PCIE1_LINK_AXI
+ *  9. PCIE1_LINK_MGMT
+ * 10. PCIE1_LINK_HOT
+ * 11. PCIE1_LINK_PIPE
+ * 12. MULTIPHY
+ * 13. MULTIPHY_APB
+ * 15. PCIE0_LINK_MGMT
+ * 16. PCIE1_LINK_MGMT
+ * 17. PCIE0_LINK_PM
+ * 18. PCIE1_LINK_PM
+ *
+ * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+/* Domain 0 register offsets */
+#define D0_SARCR0	(0x004)
+#define D0_SARCR1	(0x008)
+
+/* Domain 1 masks */
+#define D1_ACRP_PD_REQ		BIT(0)
+#define D1_ACRP_ST_POWER_DOWN	BIT(27)
+#define D1_ACRP_ST_ACTIVE	BIT(29)
+
+/* Vendor-provided timeout values. D1 has a long timeout because of LBIST. */
+#define D0_TIMEOUT_POLL			10
+#define D1_TIMEOUT_POLL			40000
+
+/*
+ * Masks for valid reset lines in each domain. This array is also used to get
+ * the domain and reset counts.
+ */
+static const u32 eq5r_valid_masks[] = { 0x0FFFFFF8, 0x00001FFF, 0x0007BFFF };
+
+#define EQ5R_DOMAIN_COUNT ARRAY_SIZE(eq5r_valid_masks)
+
+struct eq5r_private {
+	struct mutex mutexes[EQ5R_DOMAIN_COUNT];
+	void __iomem *base_d0;
+	void __iomem *base_d1;
+	void __iomem *base_d2;
+	struct reset_controller_dev rcdev;
+};
+
+#define rcdev_to_priv(rcdev) container_of(rcdev, struct eq5r_private, rcdev)
+
+static int eq5r_busy_wait_withlock(struct eq5r_private *priv,
+				   struct device *dev, u32 domain, u32 offset,
+				   bool assert)
+{
+	unsigned int val, mask;
+	int i;
+
+	lockdep_assert_held(&priv->mutexes[domain]);
+
+	switch (domain) {
+	case 0:
+		for (i = 0; i < D0_TIMEOUT_POLL; i++) {
+			val = readl(priv->base_d0 + D0_SARCR1);
+			val = !(val & BIT(offset));
+			if (val == assert)
+				return 0;
+			udelay(1);
+		}
+		break;
+	case 1:
+		mask = assert ? D1_ACRP_ST_POWER_DOWN : D1_ACRP_ST_ACTIVE;
+		for (i = 0; i < D1_TIMEOUT_POLL; i++) {
+			val = readl(priv->base_d1 + 4 * offset);
+			if (val & mask)
+				return 0;
+			udelay(1);
+		}
+		break;
+	case 2:
+		return 0; /* No busy waiting for domain 2. */
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "%u-%u: timeout\n", domain, offset);
+	return -ETIMEDOUT;
+}
+
+static void eq5r_assert_withlock(struct eq5r_private *priv, u32 domain,
+				 u32 offset)
+{
+	void __iomem *reg;
+
+	lockdep_assert_held(&priv->mutexes[domain]);
+
+	switch (domain) {
+	case 0:
+		reg = priv->base_d0 + D0_SARCR0;
+		writel(readl(reg) & ~BIT(offset), reg);
+		break;
+	case 1:
+		reg = priv->base_d1 + 4 * offset;
+		writel(readl(reg) | D1_ACRP_PD_REQ, reg);
+		break;
+	case 2:
+		reg = priv->base_d2;
+		writel(readl(reg) & ~BIT(offset), reg);
+		break;
+	default:
+		WARN_ON(1);
+	}
+}
+
+static int eq5r_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct eq5r_private *priv = rcdev_to_priv(rcdev);
+	u32 offset = id & GENMASK(7, 0);
+	u32 domain = id >> 8;
+
+	dev_dbg(rcdev->dev, "%u-%u: assert request\n", domain, offset);
+
+	guard(mutex)(&priv->mutexes[domain]);
+	eq5r_assert_withlock(priv, domain, offset);
+	return eq5r_busy_wait_withlock(priv, rcdev->dev, domain, offset, true);
+}
+
+static void eq5r_deassert_withlock(struct eq5r_private *priv, u32 domain,
+				   u32 offset)
+{
+	void __iomem *reg;
+
+	lockdep_assert_held(&priv->mutexes[domain]);
+
+	switch (domain) {
+	case 0:
+		reg = priv->base_d0 + D0_SARCR0;
+		writel(readl(reg) | BIT(offset), reg);
+		break;
+	case 1:
+		reg = priv->base_d1 + 4 * offset;
+		writel(readl(reg) & ~D1_ACRP_PD_REQ, reg);
+		break;
+	case 2:
+		reg = priv->base_d2;
+		writel(readl(reg) | BIT(offset), reg);
+		break;
+	default:
+		WARN_ON(1);
+	}
+}
+
+static int eq5r_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct eq5r_private *priv = rcdev_to_priv(rcdev);
+	u32 offset = id & GENMASK(7, 0);
+	u32 domain = id >> 8;
+
+	dev_dbg(rcdev->dev, "%u-%u: deassert request\n", domain, offset);
+
+	guard(mutex)(&priv->mutexes[domain]);
+	eq5r_deassert_withlock(priv, domain, offset);
+	return eq5r_busy_wait_withlock(priv, rcdev->dev, domain, offset, false);
+}
+
+static int eq5r_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct eq5r_private *priv = rcdev_to_priv(rcdev);
+	u32 offset = id & GENMASK(7, 0);
+	u32 domain = id >> 8;
+	u32 val;
+
+	dev_dbg(rcdev->dev, "%u-%u: status request\n", domain, offset);
+
+	guard(mutex)(&priv->mutexes[domain]);
+
+	switch (domain) {
+	case 0:
+		val = readl(priv->base_d0 + D0_SARCR1);
+		return !(val & BIT(offset));
+	case 1:
+		val = readl(priv->base_d1 + 4 * offset);
+		return !(val & D1_ACRP_ST_ACTIVE);
+	case 2:
+		val = readl(priv->base_d2);
+		return !(val & BIT(offset));
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct reset_control_ops eq5r_ops = {
+	.assert	  = eq5r_assert,
+	.deassert = eq5r_deassert,
+	.status	  = eq5r_status,
+};
+
+static int eq5r_of_xlate(struct reset_controller_dev *rcdev,
+			 const struct of_phandle_args *reset_spec)
+{
+	u32 domain, offset;
+
+	if (WARN_ON(reset_spec->args_count != 2))
+		return -EINVAL;
+
+	domain = reset_spec->args[0];
+	offset = reset_spec->args[1];
+
+	if (domain >= EQ5R_DOMAIN_COUNT || offset > 31 ||
+	    !(eq5r_valid_masks[domain] & BIT(offset))) {
+		dev_err(rcdev->dev, "%u-%u: invalid reset\n", domain, offset);
+		return -EINVAL;
+	}
+
+	return (domain << 8) | offset;
+}
+
+static int eq5r_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct eq5r_private *priv;
+	int ret, i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base_d0 = devm_platform_ioremap_resource_byname(pdev, "d0");
+	if (IS_ERR(priv->base_d0))
+		return PTR_ERR(priv->base_d0);
+
+	priv->base_d1 = devm_platform_ioremap_resource_byname(pdev, "d1");
+	if (IS_ERR(priv->base_d1))
+		return PTR_ERR(priv->base_d1);
+
+	priv->base_d2 = devm_platform_ioremap_resource_byname(pdev, "d2");
+	if (IS_ERR(priv->base_d2))
+		return PTR_ERR(priv->base_d2);
+
+	for (i = 0; i < EQ5R_DOMAIN_COUNT; i++)
+		mutex_init(&priv->mutexes[i]);
+
+	priv->rcdev.ops = &eq5r_ops;
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.dev = dev;
+	priv->rcdev.of_node = np;
+	priv->rcdev.of_reset_n_cells = 2;
+	priv->rcdev.of_xlate = eq5r_of_xlate;
+
+	priv->rcdev.nr_resets = 0;
+	for (i = 0; i < EQ5R_DOMAIN_COUNT; i++)
+		priv->rcdev.nr_resets += __builtin_popcount(eq5r_valid_masks[i]);
+
+	ret = devm_reset_controller_register(dev, &priv->rcdev);
+	if (ret) {
+		dev_err(dev, "Failed registering reset controller: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id eq5r_match_table[] = {
+	{ .compatible = "mobileye,eyeq5-reset" },
+	{}
+};
+
+static struct platform_driver eq5r_driver = {
+	.probe = eq5r_probe,
+	.driver = {
+		.name = "eyeq5-reset",
+		.of_match_table = eq5r_match_table,
+	},
+};
+
+builtin_platform_driver(eq5r_driver);

-- 
2.43.0


