Return-Path: <linux-gpio+bounces-26492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82FB91ECF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9552A2D87
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE652E7BA0;
	Mon, 22 Sep 2025 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h14dkl0K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F95E2E7193;
	Mon, 22 Sep 2025 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758554836; cv=none; b=GNwEMWtMkhBQZXhL+5zV2c4ioBDr/TbDAdsjgpsik0iriYqZLkIlYNtkYNSzwZKqj6BdRlS55QppzMxcNAYkz/FEy5uRy5JjElH87Sa1+cidQTpCOz0XaXRrVUr+Bi3K4rGoEYFeJ4kHPLwDiC+jUME97xGgpTVCg/chjtCSPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758554836; c=relaxed/simple;
	bh=q0gwHRhjcL7Y6HxtnpqPxd7p3ZHrLmlZGmas+U2TA/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxyYRLtYUh70Isty8JNw5UhjUnz7nhoYOr7SaQte3/xEZw12cJHphAKJKPur8asuBzv2gTnExdUP6NbQvaWhqbWorsQqXkWc9o42esiKCt1dGC2xJkjHNbkaq8Yp/HuN5HU6ELWinRHqbK2sTTts9fPoKrHwQYzc/JJuoYiIrSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h14dkl0K; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 11AB4C8EC47;
	Mon, 22 Sep 2025 15:26:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12CD860635;
	Mon, 22 Sep 2025 15:27:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BC02102F1961;
	Mon, 22 Sep 2025 17:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758554832; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1ki+cIr8t9w4BHVw8FJzv59jS/ij06Z2lPM7mhzdtQo=;
	b=h14dkl0KYw3/k0tT9t8nVCmMWhmrI9tDIxf3qQjNOu+hDy8Ln7wkFAu3EXGyvcYxO9GQVC
	lsMuP+LHH25PBDaHQ4clvnOFKrZFWOHvb5DRWuYQgHxmEduLxZYloy8Z8tf5Rgc6e9tFMk
	UitimTijGdgvsoI5hZjMKd9AyWHdOECxhMobn/skk4TsHzuu4l1C7/j9qEIumrKd2bnCrk
	Ze6mov5JJNf64PzOZN1sgRackld1jgIja8kt4CNacdc805LwTVUVSB3r5/ZdHt8YS/q+Dy
	xOIvoGIXRA02/s2J1Hwku6CkRRhLLVFpblVhwQqFXQwiRuFTpUqPak4/olSihQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
Date: Mon, 22 Sep 2025 17:26:38 +0200
Message-ID: <20250922152640.154092-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922152640.154092-1-herve.codina@bootlin.com>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
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
---
 drivers/soc/renesas/Kconfig       |   4 +
 drivers/soc/renesas/Makefile      |   1 +
 drivers/soc/renesas/rzn1_irqmux.c | 136 ++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 719b7f4f376f..0878b6884515 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -58,6 +58,7 @@ config ARCH_RZN1
 	select PM
 	select PM_GENERIC_DOMAINS
 	select ARM_AMBA
+	select RZN1_IRQMUX
 
 if ARM && ARCH_RENESAS
 
@@ -447,6 +448,9 @@ config PWC_RZV2M
 config RST_RCAR
 	bool "Reset Controller support for R-Car" if COMPILE_TEST
 
+config RZN1_IRQMUX
+	bool "Renesas RZ/N1 GPIO IRQ multiplexer support" if COMPILE_TEST
+
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
 
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 3bdcc6a395d5..daa932c7698d 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -14,4 +14,5 @@ obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
+obj-$(CONFIG_RZN1_IRQMUX)		+= rzn1_irqmux.o
 obj-$(CONFIG_SYSC_RZ)		+= rz-sysc.o
diff --git a/drivers/soc/renesas/rzn1_irqmux.c b/drivers/soc/renesas/rzn1_irqmux.c
new file mode 100644
index 000000000000..1f33e357689f
--- /dev/null
+++ b/drivers/soc/renesas/rzn1_irqmux.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RZ/N1 GPIO Interrupt Multiplexer
+ *
+ * Copyright 2025 Schneider Electric
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/build_bug.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/*
+ * The array index is the output line index, the value at the index is the
+ * GIC SPI interrupt number the output line is connected to.
+ */
+static u32 rzn1_irqmux_output_lines[] = {
+	103, 104, 105, 106, 107, 108, 109, 110
+};
+
+static int rzn1_irqmux_parent_args_to_line_index(struct device *dev,
+						 const struct of_phandle_args *parent_args)
+{
+	int i;
+
+	/*
+	 * The parent interrupt should be one of the GIC controller.
+	 * Three arguments must be provided.
+	 *  - args[0]: GIC_SPI
+	 *  - args[1]: The GIC interrupt number
+	 *  - args[2]: The interrupt flags
+	 *
+	 * We retrieve the line index based on the GIC interrupt number
+	 * provided and rzn1_irqmux_output_line[] mapping array.
+	 */
+
+	if (parent_args->args_count != 3 ||
+	    parent_args->args[0] != GIC_SPI) {
+		dev_err(dev, "Invalid interrupt-map item\n");
+		return -EINVAL;
+	}
+
+	/* 8 output lines are available */
+	BUILD_BUG_ON(ARRAY_SIZE(rzn1_irqmux_output_lines) != 8);
+
+	for (i = 0; i < ARRAY_SIZE(rzn1_irqmux_output_lines); i++) {
+		if (parent_args->args[1] == rzn1_irqmux_output_lines[i])
+			return i;
+	}
+
+	dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->args[1]);
+	return -EINVAL;
+}
+
+static int rzn1_irqmux_setup(struct device *dev, struct device_node *np, u32 __iomem *regs)
+{
+	struct of_imap_parser imap_parser;
+	struct of_imap_item imap_item;
+	int index;
+	int ret;
+	u32 tmp;
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
+static int rzn1_irqmux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	u32 __iomem *regs;
+	int ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	ret = rzn1_irqmux_setup(dev, np, regs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to setup mux\n");
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
2.51.0


