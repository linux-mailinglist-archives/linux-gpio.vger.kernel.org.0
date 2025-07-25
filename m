Return-Path: <linux-gpio+bounces-23826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB2B120E7
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 17:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BA563B910A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 15:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459902EF64A;
	Fri, 25 Jul 2025 15:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cVmWSZuV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521302EE97E;
	Fri, 25 Jul 2025 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457196; cv=none; b=WOEKnjzWBKqHQD5E7qLrETLx9QPGruTsYjIz9ibxAgFW67CEJCEcD4CyxXrBFoK2bT4KWWzI9QZWRGmUoYvuDmqWLBQ4d0Lht/KzUIJU5MVp3LeMtFCvRbnMtyglYXQH642FqMiAG69cbY3XT10VR47F4owVqLi/8v76cM9TS/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457196; c=relaxed/simple;
	bh=/ZcV+0GPdJthrvYhyoNts6nK/br1ORNPwUM6PWdxMvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqTRGAacrNSLoTfrWOQWoonm5en4XIsVqA0QZxrOhweKsLbswnWVjXTlQT8il9bm2+Zjt8UGOsklMbB+y55jgbZekCTPVYAkiFVgN5JM2nqZ5feRCCLmazora3qgk1D/tPOLdiU1mA3HeRrsecQB0vabj16aHEHaupgfBWHMGtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cVmWSZuV; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id AC24B442B7;
	Fri, 25 Jul 2025 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753457191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2bVnURAI35njT7CHzoVAKYMvlvIjGI7coGMmmFm+tk=;
	b=cVmWSZuVUD4d/BzyZ2P3M3yN57ldaaR296hxd9KdXEzno4up4DcxsTf3A/AtiMNowyL3M2
	Hd0TMhxKNfi5WShO8d12RijLrFow8LbayKFJ902n/dPF/KjmsdvGSs1h7DlcYquf6rOOCr
	wvJZdrToVGj7WW+BXcxj1wW0sgeKr8th+6vVNNuQbxQp2LBpmj+G0fjrPLLKmRjVNQzGD/
	bArBSEw83AWbhAH6XqNtTFSHwCqQ5+r4PttVt3iyl6YnqnxToBhmsb5s7Ori0bEpxQKjxu
	GPrwNZfOE9Dfnx48lX6W34wWT4UifAM7A6GzRJIC4CuvfdMmXgkLGIWkzMAbWw==
From: Herve Codina <herve.codina@bootlin.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 5/6] soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
Date: Fri, 25 Jul 2025 17:26:14 +0200
Message-ID: <20250725152618.32886-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725152618.32886-1-herve.codina@bootlin.com>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohephhhorghnsehoshdrrghmphgvrhgvtghomhhpuhhtihhnghdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.

The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
IRQ lines out of the 96 available to wire them to the GIC input lines.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/renesas/Kconfig       |   4 +
 drivers/soc/renesas/Makefile      |   1 +
 drivers/soc/renesas/rzn1_irqmux.c | 169 ++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fbc3b69d21a7..9e8ac33052fb 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -58,6 +58,7 @@ config ARCH_RZN1
 	select PM
 	select PM_GENERIC_DOMAINS
 	select ARM_AMBA
+	select RZN1_IRQMUX
 
 if ARM && ARCH_RENESAS
 
@@ -435,6 +436,9 @@ config PWC_RZV2M
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
index 000000000000..37e41c2b9104
--- /dev/null
+++ b/drivers/soc/renesas/rzn1_irqmux.c
@@ -0,0 +1,169 @@
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
+static int irqmux_is_phandle_args_equal(const struct of_phandle_args *a,
+					const struct of_phandle_args *b)
+{
+	int i;
+
+	if (a->np != b->np)
+		return false;
+
+	if (a->args_count != b->args_count)
+		return false;
+
+	for (i = 0; i < a->args_count; i++) {
+		if (a->args[i] != b->args[i])
+			return false;
+	}
+
+	return true;
+}
+
+static int irqmux_find_interrupt_index(struct device *dev, struct device_node *np,
+				       const struct of_phandle_args *expected_irq)
+{
+	struct of_phandle_args out_irq;
+	bool is_equal;
+	int ret;
+	int i;
+
+	for (i = 0; i < IRQMUX_MAX_IRQS; i++) {
+		ret = of_irq_parse_one(np, i, &out_irq);
+		if (ret)
+			return ret;
+
+		is_equal = irqmux_is_phandle_args_equal(expected_irq, &out_irq);
+		of_node_put(out_irq.np);
+		if (is_equal)
+			return i;
+	}
+
+	return -ENOENT;
+}
+
+struct irqmux_cb_data {
+	struct device_node *np;
+	struct device *dev;
+	u32 __iomem *regs;
+};
+
+static int irqmux_imap_cb(void *data, const __be32 *imap,
+			  const struct of_phandle_args *parent_args)
+{
+	struct irqmux_cb_data *priv = data;
+	u32 src_hwirq;
+	int index;
+
+	/*
+	 * The child #address-cells is 0. Already checked in irqmux_setup().
+	 * The first value in imap is the src_hwirq
+	 */
+	src_hwirq = be32_to_cpu(*imap);
+
+	/*
+	 * Get the index in our interrupt array that matches the parent in the
+	 * interrupt-map
+	 */
+	index = irqmux_find_interrupt_index(priv->dev, priv->np, parent_args);
+	if (index < 0)
+		return dev_err_probe(priv->dev, index, "output interrupt not found\n");
+
+	dev_info(priv->dev, "interrupt %u mapped to output interrupt[%u]\n",
+		 src_hwirq, index);
+
+	/*
+	 * Our interrupt array items matches 1:1 the interrupt lines that could
+	 * be configured by registers (same order, same number).
+	 * Configure the related register with the src hwirq retrieved from the
+	 * interrupt-map.
+	 */
+	writel(src_hwirq, priv->regs + index);
+
+	return 0;
+}
+
+static int irqmux_setup(struct device *dev, struct device_node *np, u32 __iomem *regs)
+{
+	struct irqmux_cb_data cb_data;
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
+	cb_data.dev = dev;
+	cb_data.regs = regs;
+	cb_data.np = np;
+	return of_irq_foreach_imap(np, irqmux_imap_cb, &cb_data);
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
2.50.1


