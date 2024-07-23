Return-Path: <linux-gpio+bounces-8359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442C939FD9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37BAB1C220A8
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 11:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA3C152526;
	Tue, 23 Jul 2024 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="w+FX9vVl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B01514D0;
	Tue, 23 Jul 2024 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734111; cv=none; b=YlbByaesTomaRrrMSf8/yDn5ZP2gbubBb/mvFMLWah46tTXWh1pt/kvdMu1qp4FL87LVfZmCIbdm9uJ1xeRjdW/ABrT0kOfB9l34EtIhDPm82bzrUE1xLcWbAkTkUC4bF9SWpnqF5DKnRJwpkTuhPP1apdHVXRwLtq2QN72FvPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734111; c=relaxed/simple;
	bh=CsrygMY0NxxMA3gHMzButnMVxrGDWdwJPdZ6u63oMS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuV4xqF8Mpf9ixFlWP/fCMnz5o0v31Ewy5+6NEzhtXxIEonZRa6OEvSkhJrQSFUBj6YtvDOklq3ogHo4KfI/wTSXlOHltOiBcxj5glLt9IQYFdazIlHaO9GKIVPGKSPzFtHbuGqtvEGC8+t9l5opiC99HBDfu0/TuwcF/1dOE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=w+FX9vVl; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734110; x=1753270110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CsrygMY0NxxMA3gHMzButnMVxrGDWdwJPdZ6u63oMS8=;
  b=w+FX9vVluU9p8OaQydUUxuYho9naRY2ogPwR4UcWsDxw2KyY2958J/Rt
   RiWpdROFyWl1+u1u6QhgCPm9WEpDWvcXuOS3Gpc1VoJSiuzNA6SZCpRDh
   SpYz7IFLi6AlmVwTVb2ElzViOKZ83h986WsaqhfoA2a/pKiyXxkFEwyt1
   IvuerPyAibvyin2wq7Y01CzbQfPlkb7cfRVNkJRx0yMrNmtddSbP6WjR9
   eun0Y9SgaD3Hvh/DiVKCwSPFMJM+UkRgx7DGrcHC0DB4tugGzkTRA+UUY
   Ol0K55Ld+5unrQGhTlbKm9Px0nNfy8DfCf3NHS9tLo72lIf93RX5/E23j
   w==;
X-CSE-ConnectionGUID: S6DrTYNTSQStcH62wvxgTw==
X-CSE-MsgGUID: 5nh63x7SS/qg7QgYEfGAKA==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29574955"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:13 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
Date: Tue, 23 Jul 2024 12:27:12 +0100
Message-ID: <20240723-flatworm-cornflake-8023212f6584@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13683; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CsrygMY0NxxMA3gHMzButnMVxrGDWdwJPdZ6u63oMS8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ0/YdyXK+qTsivLef7LOVlJsNb2rrFV43p+9eHz+jFOu AbJVHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIrCfD/0p7+UzGbL7y+Au1m9YdK+ 94PEstYPl6n3nd8YXHdEVtpzMybBbw2f6JZcrnRx/n/HKdfnQHr3SZ1gmTmVMbi2/I2jHmswAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On PolarFire SoC there are more GPIO interrupts than there are interrupt
lines available on the PLIC, and a runtime configurable mux is used to
decide which interrupts are assigned direct connections to the PLIC &
which are relegated to sharing a line.
This mux is, in our reference configuration, written by platform
firmware during boot based on the FPGA's configuration.

Add a driver so that Linux can figure out this mapping and correctly map
the GPIO interrupts to their parents on the PLIC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Please read my cover letter for the things I'm unsure of on the
interrupt side.
---
 drivers/irqchip/Kconfig        |  11 ++
 drivers/irqchip/Makefile       |   1 +
 drivers/irqchip/irq-mpfs-mux.c | 333 +++++++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+)
 create mode 100644 drivers/irqchip/irq-mpfs-mux.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 14464716bacbb..2b951dbd559c7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -706,6 +706,17 @@ config MCHP_EIC
 	help
 	  Support for Microchip External Interrupt Controller.
 
+config POLARFIRE_SOC_IRQ_MUX
+	bool "Microchip PolarFire SoC's GPIO IRQ Mux"
+	depends on ARCH_MICROCHIP_POLARFIRE
+	default y
+	help
+	  Support for the interrupt mux on Polarfire SoC. It sits between
+	  the GPIO controllers and the PLIC, as only 35 interrupts are shared
+	  between 3 GPIO controllers with 32 interrupts each. Configuration of
+	  the mux is done by the platform firmware, this driver is responsible
+	  for reading that configuration and setting up correct routing.
+
 config SUNPLUS_SP7021_INTC
 	bool "Sunplus SP7021 interrupt controller" if COMPILE_TEST
 	default SOC_SP7021
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index d9dc3d99aaa86..cf2f417c8d7fc 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -123,4 +123,5 @@ obj-$(CONFIG_WPCM450_AIC)		+= irq-wpcm450-aic.o
 obj-$(CONFIG_IRQ_IDT3243X)		+= irq-idt3243x.o
 obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
+obj-$(CONFIG_POLARFIRE_SOC_IRQ_MUX)	+= irq-mpfs-mux.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
diff --git a/drivers/irqchip/irq-mpfs-mux.c b/drivers/irqchip/irq-mpfs-mux.c
new file mode 100644
index 0000000000000..b093cae399700
--- /dev/null
+++ b/drivers/irqchip/irq-mpfs-mux.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip PolarFire SoC (MPFS) GPIO IRQ MUX
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ */
+
+#define pr_fmt(fmt) "mpfs-irq-mux: " fmt
+
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define MPFS_MUX_NUM_IRQS		41
+#define MPFS_MUX_NUM_DIRECT_IRQS	38
+#define MPFS_MUX_NUM_NON_DIRECT_IRQS	3
+#define MPFS_MAX_IRQS_PER_GPIO		32
+#define MPFS_NUM_IRQS_GPIO0		14
+#define MPFS_NUM_IRQS_GPIO1		24
+#define MPFS_NUM_IRQS_GPIO2		32
+#define MPFS_NUM_IRQS_GPIO02_SHIFT	0
+#define MPFS_NUM_IRQS_GPIO1_SHIFT	14
+
+/*
+ * There are 3 GPIO controllers on this SoC, of which:
+ * - GPIO controller 0 has 14 GPIOs
+ * - GPIO controller 1 has 24 GPIOs
+ * - GPIO controller 2 has 32 GPIOs
+ *
+ * All GPIOs are capable of generating interrupts, for a total of 70.
+ * There are only 41 IRQs available however, so a configurable mux is used to
+ * ensure all GPIOs can be used for interrupt generation.
+ * 38 of the 41 interrupts are in what the documentation calls "direct mode",
+ * as they provide an exclusive connection from a GPIO to the PLIC.
+ * The 3 remaining interrupts are used to mux the interrupts which do not have
+ * a exclusive connection, one for each GPIO controller.
+ * A register is used to set this configuration of this mux, depending on how
+ * the "MSS Configurator" (FPGA configuration tool) has set things up.
+ * This is done by the platform's firmware, so access from Linux is read-only.
+ *
+ * Documentation also refers to GPIO controller 0 & 1 as "pad" GPIO controllers
+ * and GPIO controller 2 as the "fabric" GPIO controller. Despite that wording,
+ * all 3 are "hard" peripherals.
+ *
+ * The mux has a single register, where bits 0 to 13 mux between GPIO controller
+ * 1's 14 GPIOs and GPIO controller 2's first 14 GPIOs. The remaining bits mux
+ * between the first 18 GPIOs of controller 1 and the last 18 GPIOS of
+ * controller 2. If a bit in the mux's control register is set, the
+ * corresponding interrupt line for GPIO controller 0 or 1 will be put in
+ * "non-direct" mode. If cleared, the "fabric" controller's will.
+ *
+ * Register layout:
+ *    GPIO 1 interrupt line 17 | mux bit 31 | GPIO 2 interrupt line 31
+ *    ...                      | ...        | ...
+ *    ...                      | ...        | ...
+ *    GPIO 1 interrupt line  0 | mux bit 14 | GPIO 2 interrupt line 14
+ *    GPIO 0 interrupt line 13 | mux bit 13 | GPIO 2 interrupt line 13
+ *    ...                      | ...        | ...
+ *    ...                      | ...        | ...
+ *    GPIO 0 interrupt line  0 | mux bit  0 | GPIO 2 interrupt line  0
+ *
+ * That leaves 6 exclusive, or "direct", interrupts remaining. These are
+ * used by GPIO controller 1's lines 18 to 23.
+ */
+
+struct mpfs_irq_mux_bank_config {
+	u32 mask;
+	u8 shift;
+};
+
+static const struct mpfs_irq_mux_bank_config mpfs_irq_mux_bank_configs[3] = {
+	{GENMASK(MPFS_NUM_IRQS_GPIO0 - 1, 0), MPFS_NUM_IRQS_GPIO02_SHIFT},
+	{GENMASK(MPFS_NUM_IRQS_GPIO1 - 1, 0), MPFS_NUM_IRQS_GPIO1_SHIFT},
+	{GENMASK(MPFS_NUM_IRQS_GPIO2 - 1, 0), MPFS_NUM_IRQS_GPIO02_SHIFT},
+};
+
+struct mpfs_irq_mux_irqchip {
+	struct irq_domain *domain;
+	int bank;
+	int irq;
+	u8 offset;
+};
+
+struct mpfs_irq_mux {
+	void __iomem *reg;
+	u32 mux_config;
+	struct mpfs_irq_mux_irqchip nondirect_irqchips[MPFS_MUX_NUM_NON_DIRECT_IRQS];
+	int parent_irqs[MPFS_MUX_NUM_DIRECT_IRQS];
+};
+
+/*
+ * There is no "control" hardware in this mux, and as such there is no ability
+ * to mask at this level. As the irq has been disconnected from the hierarchy,
+ * there's no parent irqchip from which to use mask functions either.
+ */
+static void mpfs_irq_mux_irq_mask(struct irq_data *d) {}
+static void mpfs_irq_mux_irq_unmask(struct irq_data *d) {}
+
+static struct irq_chip mpfs_irq_mux_nondirect_irq_chip = {
+	.name = "MPFS GPIO Interrupt Mux",
+	.irq_mask = mpfs_irq_mux_irq_mask,
+	.irq_unmask = mpfs_irq_mux_irq_unmask,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static struct irq_chip mpfs_irq_mux_irq_chip = {
+	.name = "MPFS GPIO Interrupt Mux",
+	.irq_mask = irq_chip_mask_parent,
+	.irq_unmask = irq_chip_unmask_parent,
+	.irq_eoi = irq_chip_eoi_parent,
+	.irq_set_type = irq_chip_set_type_parent,
+	.irq_set_affinity = irq_chip_set_affinity_parent,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+/*
+ * Returns an unsigned long, where a set bit indicates the corresponding
+ * interrupt is in non-direct/muxed mode for that bank/GPIO controller.
+ */
+static inline unsigned long mpfs_irq_mux_get_muxed_irqs(struct mpfs_irq_mux *priv,
+							unsigned int bank)
+{
+	unsigned long mux_config = priv->mux_config, muxed_irqs = -1;
+	struct mpfs_irq_mux_bank_config bank_config = mpfs_irq_mux_bank_configs[bank];
+
+	/*
+	 * If a bit is set in the mux, GPIO the corresponding interrupt from
+	 * controller 2 is direct and that controllers 0 or 1 is muxed.
+	 * Invert the bits in the configuration register, so that set bits
+	 * equate to non-direct mode, for GPIO controller 2.
+	 */
+	if (bank == 2u)
+		mux_config = ~mux_config;
+
+	muxed_irqs &= bank_config.mask;
+	muxed_irqs &= mux_config >> bank_config.shift;
+
+	return muxed_irqs;
+}
+
+static void mpfs_irq_mux_nondirect_handler(struct irq_desc *desc)
+{
+	struct mpfs_irq_mux_irqchip *irqchip_data = irq_desc_get_handler_data(desc);
+	struct mpfs_irq_mux *priv = container_of(irqchip_data, struct mpfs_irq_mux,
+						 nondirect_irqchips[irqchip_data->bank]);
+	unsigned long muxed_irqs;
+	int pos;
+
+	chained_irq_enter(irq_desc_get_chip(desc), desc);
+
+	muxed_irqs = mpfs_irq_mux_get_muxed_irqs(priv, irqchip_data->bank);
+
+	for_each_set_bit(pos, &muxed_irqs, MPFS_MAX_IRQS_PER_GPIO)
+		generic_handle_domain_irq(irqchip_data->domain, irqchip_data->offset + pos);
+
+	chained_irq_exit(irq_desc_get_chip(desc), desc);
+}
+
+static bool mpfs_irq_mux_is_direct(struct mpfs_irq_mux *priv, struct irq_fwspec *fwspec)
+{
+	unsigned int bank, line;
+	u32 muxed_irqs;
+
+	bank = fwspec->param[0] / MPFS_MAX_IRQS_PER_GPIO;
+	line = fwspec->param[0] % MPFS_MAX_IRQS_PER_GPIO;
+
+	muxed_irqs = mpfs_irq_mux_get_muxed_irqs(priv, bank);
+
+	if (BIT(line) & muxed_irqs)
+		return false;
+
+	return true;
+}
+
+static int mpfs_irq_mux_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
+				  unsigned long *out_hwirq, unsigned int *out_type)
+{
+	if (!is_of_node(fwspec->fwnode))
+		return -EINVAL;
+
+	return irq_domain_translate_onecell(d, fwspec, out_hwirq, out_type);
+}
+
+static int mpfs_irq_mux_nondirect_alloc(struct irq_domain *d, unsigned int virq,
+					struct irq_fwspec *fwspec, struct mpfs_irq_mux *priv)
+{
+	unsigned int bank = fwspec->param[0] / MPFS_MAX_IRQS_PER_GPIO;
+
+	if (bank > 2)
+		return -EINVAL;
+
+	priv->nondirect_irqchips[bank].domain = d;
+
+	irq_domain_set_hwirq_and_chip(d, virq, fwspec->param[0],
+				      &mpfs_irq_mux_nondirect_irq_chip, priv);
+	irq_set_chained_handler_and_data(virq, handle_untracked_irq,
+					 &priv->nondirect_irqchips[bank]);
+
+	return irq_domain_disconnect_hierarchy(d->parent, virq);
+}
+
+static int mpfs_irq_mux_alloc(struct irq_domain *d, unsigned int virq,
+			      unsigned int nr_irqs, void *arg)
+{
+	struct mpfs_irq_mux *priv = d->host_data;
+	struct irq_fwspec *fwspec = arg;
+	struct irq_fwspec parent_fwspec;
+	unsigned int bank, line, irq;
+
+	if (!mpfs_irq_mux_is_direct(priv, fwspec))
+		return mpfs_irq_mux_nondirect_alloc(d, virq, fwspec, priv);
+
+	bank = fwspec->param[0] / MPFS_MAX_IRQS_PER_GPIO;
+	line = fwspec->param[0] % MPFS_MAX_IRQS_PER_GPIO;
+	irq = line + mpfs_irq_mux_bank_configs[bank].shift;
+
+	parent_fwspec.fwnode = d->parent->fwnode;
+	parent_fwspec.param[0] = priv->parent_irqs[irq];
+	parent_fwspec.param_count = 1;
+
+	irq_domain_set_hwirq_and_chip(d, virq, fwspec->param[0], &mpfs_irq_mux_irq_chip, priv);
+
+	return irq_domain_alloc_irqs_parent(d, virq, 1, &parent_fwspec);
+}
+
+static const struct irq_domain_ops mpfs_irq_mux_domain_ops = {
+	.translate = mpfs_irq_mux_translate,
+	.alloc = mpfs_irq_mux_alloc,
+	.free = irq_domain_free_irqs_common,
+};
+
+static int mpfs_irq_mux_probe(struct platform_device *pdev)
+{
+	struct device_node *node, *parent;
+	struct device *dev = &pdev->dev;
+	struct mpfs_irq_mux *priv;
+	struct irq_domain *hier_domain, *parent_domain;
+	int i, ret = 0;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/*
+	 * This is clearly unacceptable - there's a significant re-write of
+	 * the devicetree handling for this device required however to get
+	 * rid of this. It'll be fixed for !RFC.
+	 */
+	node = to_of_node(dev->fwnode);
+	priv->reg = of_iomap(node, 0);
+	if (!priv->reg) {
+		ret = -ENODEV;
+		goto out_free_priv;
+	}
+
+	priv->mux_config = readl(priv->reg);
+
+	for (i = 0; i < MPFS_MUX_NUM_DIRECT_IRQS; i++) {
+		struct of_phandle_args parent_irq;
+		int ret;
+
+		ret = of_irq_parse_one(node, i, &parent_irq);
+		if (ret) {
+			ret = -ENODEV;
+			goto out_unmap;
+		}
+
+		/*
+		 * The parent irqs are saved off for the first 38 interrupts
+		 * from the devicetree entry so that they can be used in the
+		 * domains alloc callback to allocate irqs from the parent irq
+		 * chip directly.
+		 */
+		priv->parent_irqs[i] = parent_irq.args[0];
+	}
+
+	parent = of_irq_find_parent(node);
+	parent_domain = irq_find_host(parent);
+	hier_domain = irq_domain_add_hierarchy(parent_domain, 0, MPFS_MAX_IRQS_PER_GPIO * 3,
+					       node, &mpfs_irq_mux_domain_ops, priv);
+	if (!hier_domain) {
+		dev_err(dev, "failed to add hierarchical domain\n");
+		ret = -ENODEV;
+		goto out_unmap;
+	}
+
+	/*
+	 * The last 3 interrupts must be the non-direct/muxed ones, per
+	 * the dt-binding.
+	 */
+	for (i = 0; i < MPFS_MUX_NUM_NON_DIRECT_IRQS; i++) {
+		int irq_index = i + MPFS_MUX_NUM_DIRECT_IRQS;
+
+		priv->nondirect_irqchips[i].bank = i;
+		priv->nondirect_irqchips[i].irq = irq_of_parse_and_map(node, irq_index);
+		priv->nondirect_irqchips[i].offset = i * MPFS_MAX_IRQS_PER_GPIO;
+		irq_set_chained_handler_and_data(priv->nondirect_irqchips[i].irq,
+						 mpfs_irq_mux_nondirect_handler,
+						 &priv->nondirect_irqchips[i]);
+	}
+
+	dev_dbg(dev, "mux configuration %x\n", priv->mux_config);
+
+	return 0;
+
+out_unmap:
+	iounmap(priv->reg);
+
+out_free_priv:
+	kfree(priv);
+
+	return ret;
+}
+
+static const struct of_device_id mpfs_irq_mux_match[] = {
+	{ .compatible = "microchip,mpfs-gpio-irq-mux" },
+
+};
+
+static struct platform_driver mpfs_irq_mux_driver = {
+	.driver = {
+		.name = "mpfs_irq_mux",
+		.of_match_table	= mpfs_irq_mux_match,
+	},
+	.probe = mpfs_irq_mux_probe,
+};
+builtin_platform_driver(mpfs_irq_mux_driver);
-- 
2.43.2


