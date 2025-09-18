Return-Path: <linux-gpio+bounces-26320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07BB842CB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 12:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDE81739F7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 10:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744873002B4;
	Thu, 18 Sep 2025 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UgEAW4f/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764022FFDFD
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758192046; cv=none; b=LS0tH6jeB8fVgRVXSeIDqzepJ9IRsnveIyc8aUlqq7Tbq74xwk9WJpYxQSXwfewsYgIRky551XjIpKMlPRO1aEWuScL7yJah5oPCLQSqitqOwIK1IM4Bl9SqZuRbbSzgReCeLomYBQzmaEMTLhDona+SigdQTs+kDvcbvVk47aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758192046; c=relaxed/simple;
	bh=dndIw7FY0vB6XNMwaNprdOxuasKUV84FFdOaGqsO3Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dr/BNWaKoF12OdWhyOmXtcD5mUMEP/wvYn9esQLXpB23frJXRkf5P53SYBtcnKFk4q3CTF4G4ITFAk0Ansyyb8Lx7MLoLtDv0yK1z1iFuPqISe0oHQOhZSRnOWLdrdneco9gdXP42uZ7nZCeyi9fgc7Dup0cqa9xpLcO0hsFk68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UgEAW4f/; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A794CC0008A;
	Thu, 18 Sep 2025 10:40:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 439F26062C;
	Thu, 18 Sep 2025 10:40:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C55E102F1D07;
	Thu, 18 Sep 2025 12:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758192042; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Oih+z7DRki3/W3NXwG40HAfWX9fZXZjpXuzwRdxWrcw=;
	b=UgEAW4f/DyoVkm7T2FCcpmZQfQCZzkmGZ/3kOfRLKXS62dP/WdogW9bvMX2iJW5Vcuwilb
	pEQ+1xWlUg0VvgEjHwiew8iIqLfUm2+K/stJZyqk2+fcJBN2BDWuoVfWRItqnBJQyORVyD
	Z/9Hv0X5cz92kr8aU9kJ0ruS4aonyjnQX50E6/i/rxeEl7+itRK/kbXmJz8t60tLEP2G5h
	pjPXGGQEYIngFNH35bS5lFPJSrbqrhiquvNHLOLJYvislrpOGQTqzGPkrrIrml/YhFvgQA
	bGubzjMFMuRgS4PAbtm4owvfqzM294gjHddUH65hiXSW2rZ/hV5K4bFTKs6Hyw==
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
Subject: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
Date: Thu, 18 Sep 2025 12:40:05 +0200
Message-ID: <20250918104009.94754-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918104009.94754-1-herve.codina@bootlin.com>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
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
 drivers/soc/renesas/Kconfig       |   4 ++
 drivers/soc/renesas/Makefile      |   1 +
 drivers/soc/renesas/rzn1_irqmux.c | 110 ++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)
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
index 000000000000..3855e132c15f
--- /dev/null
+++ b/drivers/soc/renesas/rzn1_irqmux.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RZ/N1 GPIO Interrupt Multiplexer
+ *
+ * Copyright 2025 Schneider Electric
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+
+#define IRQMUX_MAX_IRQS 8
+
+static int irqmux_setup(struct device *dev, struct device_node *np, u32 __iomem *regs)
+{
+	struct of_imap_parser imap_parser;
+	struct of_imap_item imap_item;
+	unsigned int index = 0;
+	u32 tmp;
+	int ret;
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
+		/*
+		 * The child #address-cells is 0 (already checked). The first
+		 * value in imap item is the src hwirq.
+		 *
+		 * imap items matches 1:1 the interrupt lines that could
+		 * be configured by registers (same order, same number).
+		 * Configure the related register with the src hwirq retrieved
+		 * from the interrupt-map.
+		 */
+		if (index > IRQMUX_MAX_IRQS) {
+			of_node_put(imap_item.parent_args.np);
+			dev_err(dev, "too much items in interrupt-map\n");
+			return -EINVAL;
+		}
+
+		writel(imap_item.child_imap[0], regs + index);
+		index++;
+	}
+
+	return 0;
+}
+
+static int irqmux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	u32 __iomem *regs;
+	int nr_irqs;
+	int ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	nr_irqs = of_irq_count(np);
+	if (nr_irqs < 0)
+		return nr_irqs;
+
+	if (nr_irqs > IRQMUX_MAX_IRQS) {
+		dev_err(dev, "too many output interrupts\n");
+		return -ENOENT;
+	}
+
+	ret = irqmux_setup(dev, np, regs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to setup mux\n");
+
+	return 0;
+}
+
+static const struct of_device_id irqmux_of_match[] = {
+	{ .compatible = "renesas,rzn1-gpioirqmux", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, irq_mux_of_match);
+
+static struct platform_driver irqmux_driver = {
+	.probe = irqmux_probe,
+	.driver = {
+		.name = "rzn1_irqmux",
+		.of_match_table = irqmux_of_match,
+	},
+};
+module_platform_driver(irqmux_driver);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("Renesas RZ/N1 GPIO IRQ Multiplexer Driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


