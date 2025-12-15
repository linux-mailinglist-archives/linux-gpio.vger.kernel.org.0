Return-Path: <linux-gpio+bounces-29563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC11CBE5B6
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 15:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0CC3301CD86
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 14:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20954342C9D;
	Mon, 15 Dec 2025 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tUw2076R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0162534252B
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 14:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808958; cv=none; b=CIJQxZ9iZLzU6/qk+9k+WfJTdGsUvfEEmwZoIjF+wHbtku6NUV4sMTPZBKmwedmaXQVv6qt4zX0fPz/GFQTfNqx9zKSaJqxCuTREDA345asl0rmX0rXA4BfCJqmyW+shWF8J8YK2LKH/3NkMF2FVJ4kseDvfOEkYczO6HJSzejc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808958; c=relaxed/simple;
	bh=1+hhTLRRJG+Cyziw8HidX1b6AZuTf8DRlXdZT5dxvmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlsGHnBjNL9erVtpmaHdit9B1vg6jZBQEzmTRI+9J3k60Sy8eZN8D6KmHMskM+qVGMjsHBn+oosmCI34hgzZMcfUGzi8Tyq4R+HG+i4fHxkNHbQylgfuvYC78HtcWWJWJZBbDKR0UttBkujX+GleIWdbghYevz+qXSsoAYmwNd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tUw2076R; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4DE8FC19D1E;
	Mon, 15 Dec 2025 14:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A938260664;
	Mon, 15 Dec 2025 14:29:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 677661194242C;
	Mon, 15 Dec 2025 15:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765808954; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AfgtNuhQLvHHpWBwaaOqWAYPpKWvaoKh0A4ISWCHImo=;
	b=tUw2076R3Wfivqy4Z6f6Yl0IAnWgGzObfHWvwqVSU4D3zuKEH+UkxkMnQnYEx1Pn1f0vBr
	YdDD2SdMSqvLUwvOcV3Au8F0GABjZ971OuSmfc8d3rWhnLbx04AKTC2bh1VDirezTRM3ur
	eNJTrjIZTya5TKYIG7EPTjWLYHVFWjiwc5B8qyPtYE4gQ8Vp4gtDDU4TWin6YRVEd+BR8F
	xDrlS+d4yGm4qWboeU6VvC8x+DFOHUiQ8zKdjwf1N46MKF1iEP2J4wsrSMOy0UyXbAfph/
	dJwHl1kOT08MO1+weg6GurEf5AEOhJY5Ibvhss/nEl0W3W0UhRnY+f/bW9GsjQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v7 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
Date: Mon, 15 Dec 2025 15:28:29 +0100
Message-ID: <20251215142836.167101-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215142836.167101-1-herve.codina@bootlin.com>
References: <20251215142836.167101-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.

The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
IRQ lines out of the 96 available to wire them to the GIC input lines.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig       |   4 +
 drivers/soc/renesas/Makefile      |   1 +
 drivers/soc/renesas/rzn1_irqmux.c | 127 ++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 340a1ff7e92b..2dc51873480a 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -62,6 +62,7 @@ config ARCH_RZN1
 	select PM
 	select PM_GENERIC_DOMAINS
 	select ARM_AMBA
+	select RZN1_IRQMUX if GPIO_DWAPB
 
 if ARM && ARCH_RENESAS
 
@@ -459,6 +460,9 @@ config PWC_RZV2M
 config RST_RCAR
 	bool "Reset Controller support for R-Car" if COMPILE_TEST
 
+config RZN1_IRQMUX
+	bool "Renesas RZ/N1 GPIO IRQ multiplexer support" if COMPILE_TEST
+
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
 	select MFD_SYSCON
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 3bdcc6a395d5..33d44d964d61 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -14,4 +14,5 @@ obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
+obj-$(CONFIG_RZN1_IRQMUX)	+= rzn1_irqmux.o
 obj-$(CONFIG_SYSC_RZ)		+= rz-sysc.o
diff --git a/drivers/soc/renesas/rzn1_irqmux.c b/drivers/soc/renesas/rzn1_irqmux.c
new file mode 100644
index 000000000000..b50b295f83d7
--- /dev/null
+++ b/drivers/soc/renesas/rzn1_irqmux.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RZ/N1 GPIO Interrupt Multiplexer
+ *
+ * Copyright 2025 Schneider Electric
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/*
+ * Up to 8 output lines are connected to GIC SPI interrupt controller
+ * starting at IRQ 103.
+ */
+#define RZN1_IRQMUX_GIC_SPI_BASE	103
+#define RZN1_IRQMUX_NUM_OUTPUTS		8
+
+static int rzn1_irqmux_parent_args_to_line_index(struct device *dev,
+						 const struct of_phandle_args *parent_args)
+{
+	/*
+	 * The parent interrupt should be one of the GIC controller.
+	 * Three arguments must be provided.
+	 *  - args[0]: GIC_SPI
+	 *  - args[1]: The GIC interrupt number
+	 *  - args[2]: The interrupt flags
+	 *
+	 * We retrieve the line index based on the GIC interrupt number
+	 * provided.
+	 */
+
+	if (parent_args->args_count != 3 || parent_args->args[0] != GIC_SPI) {
+		dev_err(dev, "Invalid interrupt-map item\n");
+		return -EINVAL;
+	}
+
+	if (parent_args->args[1] < RZN1_IRQMUX_GIC_SPI_BASE ||
+	    parent_args->args[1] >= RZN1_IRQMUX_GIC_SPI_BASE + RZN1_IRQMUX_NUM_OUTPUTS) {
+		dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->args[1]);
+		return -EINVAL;
+	}
+
+	return parent_args->args[1] - RZN1_IRQMUX_GIC_SPI_BASE;
+}
+
+static int rzn1_irqmux_probe(struct platform_device *pdev)
+{
+	DECLARE_BITMAP(index_done, RZN1_IRQMUX_NUM_OUTPUTS) = {};
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct of_imap_parser imap_parser;
+	struct of_imap_item imap_item;
+	u32 __iomem *regs;
+	int index;
+	int ret;
+	u32 tmp;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	/* We support only #interrupt-cells = <1> and #address-cells = <0> */
+	ret = of_property_read_u32(np, "#interrupt-cells", &tmp);
+	if (ret)
+		return ret;
+	if (tmp != 1)
+		return -EINVAL;
+
+	ret = of_property_read_u32(np, "#address-cells", &tmp);
+	if (ret)
+		return ret;
+	if (tmp != 0)
+		return -EINVAL;
+
+	ret = of_imap_parser_init(&imap_parser, np, &imap_item);
+	if (ret)
+		return ret;
+
+	for_each_of_imap_item(&imap_parser, &imap_item) {
+		index = rzn1_irqmux_parent_args_to_line_index(dev, &imap_item.parent_args);
+		if (index < 0) {
+			of_node_put(imap_item.parent_args.np);
+			return index;
+		}
+
+		if (test_and_set_bit(index, index_done)) {
+			of_node_put(imap_item.parent_args.np);
+			dev_err(dev, "Mux output line %d already defined in interrupt-map\n",
+				index);
+			return -EINVAL;
+		}
+
+		/*
+		 * The child #address-cells is 0 (already checked). The first
+		 * value in imap item is the src hwirq.
+		 */
+		writel(imap_item.child_imap[0], regs + index);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id rzn1_irqmux_of_match[] = {
+	{ .compatible = "renesas,rzn1-gpioirqmux", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzn1_irqmux_of_match);
+
+static struct platform_driver rzn1_irqmux_driver = {
+	.probe = rzn1_irqmux_probe,
+	.driver = {
+		.name = "rzn1_irqmux",
+		.of_match_table = rzn1_irqmux_of_match,
+	},
+};
+module_platform_driver(rzn1_irqmux_driver);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("Renesas RZ/N1 GPIO IRQ Multiplexer Driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0


