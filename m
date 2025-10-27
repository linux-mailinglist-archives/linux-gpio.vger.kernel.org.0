Return-Path: <linux-gpio+bounces-27640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E26C0CDBC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 11:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B62318906CA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 10:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46C830F95B;
	Mon, 27 Oct 2025 09:58:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6B630F929;
	Mon, 27 Oct 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559126; cv=none; b=IfE+XPacSlbk/X5Z06QE5dXQ/f5OgRmoGry0BY9psOAWx1MyKzHYyAl+SzXfE4n2roA6Ph3I6lUs/am9H67/7Kq+SZKjZfC1FNDU/N1iymxys/i67hTMmcqMNTuA5ZGQWUdTUhlyGQ9qrYWpendBE9DIZlBlbmCuUnuXpPy1ZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559126; c=relaxed/simple;
	bh=Lgh20nv4jONyfX47qNttEJoV1MhQawk5TgV3Gl2f/Us=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WuvMybVF+k8yyJ1rhiqrpSQQC7d4mFELr3SXlCvuR5/Oy7pKuRZinpjshDhD/VuHXsVmuU99EzNn4TqewBZBy3uSppb19PGLPPpjtThlrQSD1lbu378eN7d+HTwAGmPpLDs7tSGLLo9jGoqEjlvOmACcy54ajeXzh6NTjt2sf0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 27 Oct
 2025 17:58:26 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 27 Oct 2025 17:58:26 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v4 8/9] PCI: aspeed: Add ASPEED PCIe RC driver
Date: Mon, 27 Oct 2025 17:58:24 +0800
Message-ID: <20251027095825.181161-9-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
References: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
initialization, reset, clock, IRQ domain, and MSI domain setup.
Implement platform-specific setup and register configuration for
ASPEED. And provide PCI config space read/write and INTx/MSI
interrupt handling.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/pci/controller/Kconfig       |   16 +
 drivers/pci/controller/Makefile      |    1 +
 drivers/pci/controller/pcie-aspeed.c | 1122 ++++++++++++++++++++++++++
 3 files changed, 1139 insertions(+)
 create mode 100644 drivers/pci/controller/pcie-aspeed.c

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 41748d083b93..5926b85bb3b6 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -58,6 +58,22 @@ config PCI_VERSATILE
 	bool "ARM Versatile PB PCI controller"
 	depends on ARCH_VERSATILE || COMPILE_TEST
 
+config PCIE_ASPEED
+	bool "ASPEED PCIe controller"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on OF
+	depends on PCI_MSI
+	select IRQ_MSI_LIB
+	help
+	  Enable this option to support the PCIe controller found on ASPEED
+	  SoCs.
+
+	  This driver provides initialization and management for PCIe
+	  Root Complex functionality, including interrupt and MSI support.
+
+	  Select Y if your platform uses an ASPEED SoC and requires PCIe
+	  connectivity.
+
 config PCIE_BRCMSTB
 	tristate "Broadcom Brcmstb PCIe controller"
 	depends on ARCH_BRCMSTB || ARCH_BCM2835 || ARCH_BCMBCA || \
diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
index 038ccbd9e3ba..1339f88e153d 100644
--- a/drivers/pci/controller/Makefile
+++ b/drivers/pci/controller/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
 obj-$(CONFIG_PCIE_HISI_ERR) += pcie-hisi-error.o
 obj-$(CONFIG_PCIE_APPLE) += pcie-apple.o
 obj-$(CONFIG_PCIE_MT7621) += pcie-mt7621.o
+obj-$(CONFIG_PCIE_ASPEED) += pcie-aspeed.o
 
 # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
 obj-y				+= dwc/
diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controller/pcie-aspeed.c
new file mode 100644
index 000000000000..1cca89894bd2
--- /dev/null
+++ b/drivers/pci/controller/pcie-aspeed.c
@@ -0,0 +1,1122 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 Aspeed Technology Inc.
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-msi-lib.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_pci.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/phy/pcie.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include "../pci.h"
+
+#define MAX_MSI_HOST_IRQS	64
+#define ASPEED_RESET_RC_WAIT_MS	10
+
+/* AST2600 AHBC Registers */
+#define ASPEED_AHBC_KEY			0x00
+#define  ASPEED_AHBC_UNLOCK_KEY			0xaeed1a03
+#define  ASPEED_AHBC_UNLOCK			0x01
+#define ASPEED_AHBC_ADDR_MAPPING	0x8c
+#define  ASPEED_PCIE_RC_MEMORY_EN		BIT(5)
+
+/* AST2600 H2X Controller Registers */
+#define ASPEED_H2X_INT_STS		0x08
+#define  ASPEED_PCIE_TX_IDLE_CLEAR		BIT(0)
+#define  ASPEED_PCIE_INTX_STS			GENMASK(3, 0)
+#define ASPEED_H2X_HOST_RX_DESC_DATA	0x0c
+#define ASPEED_H2X_TX_DESC0		0x10
+#define ASPEED_H2X_TX_DESC1		0x14
+#define ASPEED_H2X_TX_DESC2		0x18
+#define ASPEED_H2X_TX_DESC3		0x1c
+#define ASPEED_H2X_TX_DESC_DATA		0x20
+#define ASPEED_H2X_STS			0x24
+#define  ASPEED_PCIE_TX_IDLE			BIT(31)
+#define  ASPEED_PCIE_STATUS_OF_TX		GENMASK(25, 24)
+#define	ASPEED_PCIE_RC_H_TX_COMPLETE		BIT(25)
+#define  ASPEED_PCIE_TRIGGER_TX			BIT(0)
+#define ASPEED_H2X_AHB_ADDR_CONFIG0	0x60
+#define  ASPEED_AHB_REMAP_LO_ADDR(x)		FIELD_PREP(GENMASK(15, 4), x)
+#define  ASPEED_AHB_MASK_LO_ADDR(x)		FIELD_PREP(GENMASK(31, 20), x)
+#define ASPEED_H2X_AHB_ADDR_CONFIG1	0x64
+#define  ASPEED_AHB_REMAP_HI_ADDR(x)		(x)
+#define ASPEED_H2X_AHB_ADDR_CONFIG2	0x68
+#define  ASPEED_AHB_MASK_HI_ADDR(x)		(x)
+#define ASPEED_H2X_DEV_CTRL		0xc0
+#define  ASPEED_PCIE_RX_DMA_EN			BIT(9)
+#define  ASPEED_PCIE_RX_LINEAR			BIT(8)
+#define  ASPEED_PCIE_RX_MSI_SEL			BIT(7)
+#define  ASPEED_PCIE_RX_MSI_EN			BIT(6)
+#define  ASPEED_PCIE_UNLOCK_RX_BUFF		BIT(4)
+#define  ASPEED_PCIE_WAIT_RX_TLP_CLR		BIT(2)
+#define  ASPEED_PCIE_RC_RX_ENABLE		BIT(1)
+#define  ASPEED_PCIE_RC_ENABLE			BIT(0)
+#define ASPEED_H2X_DEV_STS		0xc8
+#define  ASPEED_PCIE_RC_RX_DONE_ISR		BIT(4)
+#define ASPEED_H2X_DEV_RX_DESC_DATA	0xcc
+#define ASPEED_H2X_DEV_RX_DESC1		0xd4
+#define ASPEED_H2X_DEV_TX_TAG		0xfc
+#define  ASPEED_RC_TLP_TX_TAG_NUM		0x28
+
+/* AST2700 H2X */
+#define ASPEED_H2X_CTRL			0x00
+#define  ASPEED_H2X_BRIDGE_EN			BIT(0)
+#define  ASPEED_H2X_BRIDGE_DIRECT_EN		BIT(1)
+#define ASPEED_H2X_CFGE_INT_STS		0x08
+#define  ASPEED_CFGE_TX_IDLE			BIT(0)
+#define  ASPEED_CFGE_RX_BUSY			BIT(1)
+#define ASPEED_H2X_CFGI_TLP		0x20
+#define  ASPEED_CFGI_BYTE_EN_MASK		GENMASK(19, 16)
+#define  ASPEED_CFGI_BYTE_EN(x) \
+		FIELD_PREP(ASPEED_CFGI_BYTE_EN_MASK, (x))
+#define ASPEED_H2X_CFGI_WR_DATA		0x24
+#define  ASPEED_CFGI_WRITE			BIT(20)
+#define ASPEED_H2X_CFGI_CTRL		0x28
+#define  ASPEED_CFGI_TLP_FIRE			BIT(0)
+#define ASPEED_H2X_CFGI_RET_DATA	0x2c
+#define ASPEED_H2X_CFGE_TLP_1ST		0x30
+#define ASPEED_H2X_CFGE_TLP_NEXT	0x34
+#define ASPEED_H2X_CFGE_CTRL		0x38
+#define  ASPEED_CFGE_TLP_FIRE			BIT(0)
+#define ASPEED_H2X_CFGE_RET_DATA	0x3c
+#define ASPEED_H2X_REMAP_PREF_ADDR	0x70
+#define  ASPEED_REMAP_PREF_ADDR_63_32(x)	(x)
+#define ASPEED_H2X_REMAP_DIRECT_ADDR	0x78
+#define  ASPEED_REMAP_BAR_BASE(x)		(x)
+
+/* AST2700 SCU */
+#define ASPEED_SCU_60			0x60
+#define  ASPEED_RC_E2M_PATH_EN			BIT(0)
+#define  ASPEED_RC_H2XS_PATH_EN			BIT(16)
+#define  ASPEED_RC_H2XD_PATH_EN			BIT(17)
+#define  ASPEED_RC_H2XX_PATH_EN			BIT(18)
+#define  ASPEED_RC_UPSTREAM_MEM_EN		BIT(19)
+#define ASPEED_SCU_64			0x64
+#define  ASPEED_RC0_DECODE_DMA_BASE(x)		FIELD_PREP(GENMASK(7, 0), x)
+#define  ASPEED_RC0_DECODE_DMA_LIMIT(x)		FIELD_PREP(GENMASK(15, 8), x)
+#define  ASPEED_RC1_DECODE_DMA_BASE(x)		FIELD_PREP(GENMASK(23, 16), x)
+#define  ASPEED_RC1_DECODE_DMA_LIMIT(x)		FIELD_PREP(GENMASK(31, 24), x)
+#define ASPEED_SCU_70			0x70
+#define  ASPEED_DISABLE_EP_FUNC			0
+
+/* Macro to combine Fmt and Type into the 8-bit field */
+#define ASPEED_TLP_FMT_TYPE(fmt, type)	((((fmt) & 0x7) << 5) | ((type) & 0x1f))
+#define ASPEED_TLP_COMMON_FIELDS	GENMASK(31, 24)
+
+/* Complete status */
+#define CPL_STS(x)	FIELD_GET(GENMASK(15, 13), (x))
+/* TLP configuration type 0 and type 1 */
+#define CFG0_READ_FMTTYPE                                        \
+	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                     \
+		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_NO_DATA, \
+				       PCIE_TLP_TYPE_CFG0_RD))
+#define CFG0_WRITE_FMTTYPE                                    \
+	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                  \
+		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_DATA, \
+				       PCIE_TLP_TYPE_CFG0_WR))
+#define CFG1_READ_FMTTYPE                                        \
+	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                     \
+		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_NO_DATA, \
+				       PCIE_TLP_TYPE_CFG1_RD))
+#define CFG1_WRITE_FMTTYPE                                    \
+	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                  \
+		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_DATA, \
+				       PCIE_TLP_TYPE_CFG1_WR))
+#define CFG_PAYLOAD_SIZE		0x01 /* 1 DWORD */
+#define TLP_HEADER_BYTE_EN(x, y)	((GENMASK((x) - 1, 0) << ((y) % 4)))
+#define TLP_GET_VALUE(x, y, z)	\
+	(((x) >> ((((z) % 4)) * 8)) & GENMASK((8 * (y)) - 1, 0))
+#define TLP_SET_VALUE(x, y, z)	\
+	((((x) & GENMASK((8 * (y)) - 1, 0)) << ((((z) % 4)) * 8)))
+#define AST2600_TX_DESC1_VALUE		0x00002000
+#define AST2700_TX_DESC1_VALUE		0x00401000
+
+/**
+ * struct aspeed_pcie_port - PCIe port information
+ * @list: port list
+ * @pcie: pointer to PCIe host info
+ * @clk: pointer to the port clock gate
+ * @phy: pointer to PCIe PHY
+ * @perst: pointer to port reset control
+ * @slot: port slot
+ */
+struct aspeed_pcie_port {
+	struct list_head list;
+	struct aspeed_pcie *pcie;
+	struct clk *clk;
+	struct phy *phy;
+	struct reset_control *perst;
+	u32 slot;
+};
+
+/**
+ * struct aspeed_pcie - PCIe RC information
+ * @host: pointer to PCIe host bridge
+ * @dev: pointer to device structure
+ * @reg: PCIe host register base address
+ * @ahbc: pointer to AHHC register map
+ * @cfg: pointer to Aspeed PCIe configuration register map
+ * @platform: platform specific information
+ * @ports: list of PCIe ports
+ * @tx_tag: current TX tag for the port
+ * @host_bus_num: bus number of the host bridge
+ * @h2xrst: pointer to H2X reset control
+ * @intx_domain: IRQ domain for INTx interrupts
+ * @msi_domain: IRQ domain for MSI interrupts
+ * @lock: mutex to protect MSI bitmap variable
+ * @msi_irq_in_use: bitmap to track used MSI host IRQs
+ * @clear_msi_twice: AST2700 workaround to clear MSI status twice
+ */
+struct aspeed_pcie {
+	struct pci_host_bridge *host;
+	struct device *dev;
+	void __iomem *reg;
+	struct regmap *ahbc;
+	struct regmap *cfg;
+	const struct aspeed_pcie_rc_platform *platform;
+	struct list_head ports;
+
+	u8 tx_tag;
+	int host_bus_num;
+
+	struct reset_control *h2xrst;
+
+	struct irq_domain *intx_domain;
+	struct irq_domain *msi_domain;
+	struct mutex lock;
+	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_HOST_IRQS);
+
+	bool clear_msi_twice;		/* AST2700 workaround */
+};
+
+/**
+ * struct aspeed_pcie_rc_platform - Platform information
+ * @setup: initialization function
+ * @reg_intx_en: INTx enable register offset
+ * @reg_intx_sts: INTx status register offset
+ * @reg_msi_en: MSI enable register offset
+ * @reg_msi_sts: MSI enable register offset
+ * @msi_address: HW fixed MSI address
+ */
+struct aspeed_pcie_rc_platform {
+	int (*setup)(struct platform_device *pdev);
+	int reg_intx_en;
+	int reg_intx_sts;
+	int reg_msi_en;
+	int reg_msi_sts;
+	u32 msi_address;
+};
+
+static void aspeed_pcie_intx_irq_ack(struct irq_data *d)
+{
+	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
+	int intx_en = pcie->platform->reg_intx_en;
+	u32 en;
+
+	en = readl(pcie->reg + intx_en);
+	en |= BIT(d->hwirq);
+	writel(en, pcie->reg + intx_en);
+}
+
+static void aspeed_pcie_intx_irq_mask(struct irq_data *d)
+{
+	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
+	int intx_en = pcie->platform->reg_intx_en;
+	u32 en;
+
+	en = readl(pcie->reg + intx_en);
+	en &= ~BIT(d->hwirq);
+	writel(en, pcie->reg + intx_en);
+}
+
+static void aspeed_pcie_intx_irq_unmask(struct irq_data *d)
+{
+	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
+	int intx_en = pcie->platform->reg_intx_en;
+	u32 en;
+
+	en = readl(pcie->reg + intx_en);
+	en |= BIT(d->hwirq);
+	writel(en, pcie->reg + intx_en);
+}
+
+static struct irq_chip aspeed_intx_irq_chip = {
+	.name = "INTx",
+	.irq_ack = aspeed_pcie_intx_irq_ack,
+	.irq_mask = aspeed_pcie_intx_irq_mask,
+	.irq_unmask = aspeed_pcie_intx_irq_unmask,
+};
+
+static int aspeed_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
+				irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &aspeed_intx_irq_chip, handle_level_irq);
+	irq_set_chip_data(irq, domain->host_data);
+	irq_set_status_flags(irq, IRQ_LEVEL);
+
+	return 0;
+}
+
+static const struct irq_domain_ops aspeed_intx_domain_ops = {
+	.map = aspeed_pcie_intx_map,
+};
+
+static irqreturn_t aspeed_pcie_intr_handler(int irq, void *dev_id)
+{
+	struct aspeed_pcie *pcie = dev_id;
+	const struct aspeed_pcie_rc_platform *platform = pcie->platform;
+	unsigned long status;
+	unsigned long intx;
+	u32 bit;
+	int i;
+
+	intx = FIELD_GET(ASPEED_PCIE_INTX_STS,
+			 readl(pcie->reg + platform->reg_intx_sts));
+	for_each_set_bit(bit, &intx, PCI_NUM_INTX)
+		generic_handle_domain_irq(pcie->intx_domain, bit);
+
+	for (i = 0; i < 2; i++) {
+		int msi_sts_reg = platform->reg_msi_sts + (i * 4);
+
+		status = readl(pcie->reg + msi_sts_reg);
+		writel(status, pcie->reg + msi_sts_reg);
+
+		/*
+		 * AST2700 workaround:
+		 * The MSI status needs to clear one more time.
+		 */
+		if (pcie->clear_msi_twice)
+			writel(status, pcie->reg + msi_sts_reg);
+
+		for_each_set_bit(bit, &status, 32) {
+			bit += (i * 32);
+			generic_handle_domain_irq(pcie->msi_domain, bit);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static u32 aspeed_pcie_get_bdf_offset(struct pci_bus *bus, unsigned int devfn,
+				      int where)
+{
+	return ((bus->number) << 24) | (PCI_SLOT(devfn) << 19) |
+		(PCI_FUNC(devfn) << 16) | (where & ~3);
+}
+
+static int aspeed_ast2600_conf(struct pci_bus *bus, unsigned int devfn,
+			       int where, int size, u32 *val, u32 fmt_type,
+			       bool write)
+{
+	struct aspeed_pcie *pcie = bus->sysdata;
+	u32 bdf_offset, cfg_val, isr;
+	int ret;
+
+	bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
+
+	/* Driver may set unlock RX buffer before triggering next TX config */
+	cfg_val = readl(pcie->reg + ASPEED_H2X_DEV_CTRL);
+	writel(ASPEED_PCIE_UNLOCK_RX_BUFF | cfg_val,
+	       pcie->reg + ASPEED_H2X_DEV_CTRL);
+
+	cfg_val = fmt_type | CFG_PAYLOAD_SIZE;
+	writel(cfg_val, pcie->reg + ASPEED_H2X_TX_DESC0);
+
+	cfg_val = AST2600_TX_DESC1_VALUE |
+		  FIELD_PREP(GENMASK(11, 8), pcie->tx_tag) |
+		  TLP_HEADER_BYTE_EN(size, where);
+	writel(cfg_val, pcie->reg + ASPEED_H2X_TX_DESC1);
+
+	writel(bdf_offset, pcie->reg + ASPEED_H2X_TX_DESC2);
+	writel(0, pcie->reg + ASPEED_H2X_TX_DESC3);
+	if (write)
+		writel(TLP_SET_VALUE(*val, size, where),
+		       pcie->reg + ASPEED_H2X_TX_DESC_DATA);
+
+	cfg_val = readl(pcie->reg + ASPEED_H2X_STS);
+	cfg_val |= ASPEED_PCIE_TRIGGER_TX;
+	writel(cfg_val, pcie->reg + ASPEED_H2X_STS);
+
+	ret = readl_poll_timeout(pcie->reg + ASPEED_H2X_STS, cfg_val,
+				 (cfg_val & ASPEED_PCIE_TX_IDLE), 0, 50);
+	if (ret) {
+		dev_err(pcie->dev,
+			"%02x:%02x.%d CR tx timeout sts: 0x%08x\n",
+			bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn), cfg_val);
+		ret = PCIBIOS_SET_FAILED;
+		PCI_SET_ERROR_RESPONSE(val);
+		goto out;
+	}
+
+	cfg_val = readl(pcie->reg + ASPEED_H2X_INT_STS);
+	cfg_val |= ASPEED_PCIE_TX_IDLE_CLEAR;
+	writel(cfg_val, pcie->reg + ASPEED_H2X_INT_STS);
+
+	cfg_val = readl(pcie->reg + ASPEED_H2X_STS);
+	switch (cfg_val & ASPEED_PCIE_STATUS_OF_TX) {
+	case ASPEED_PCIE_RC_H_TX_COMPLETE:
+		ret = readl_poll_timeout(pcie->reg + ASPEED_H2X_DEV_STS, isr,
+					 (isr & ASPEED_PCIE_RC_RX_DONE_ISR), 0,
+					 50);
+		if (ret) {
+			dev_err(pcie->dev,
+				"%02x:%02x.%d CR rx timeout sts: 0x%08x\n",
+				bus->number, PCI_SLOT(devfn),
+				PCI_FUNC(devfn), isr);
+			ret = PCIBIOS_SET_FAILED;
+			PCI_SET_ERROR_RESPONSE(val);
+			goto out;
+		}
+		if (!write) {
+			cfg_val = readl(pcie->reg + ASPEED_H2X_DEV_RX_DESC1);
+			if (CPL_STS(cfg_val) != PCIE_CPL_STS_SUCCESS) {
+				ret = PCIBIOS_SET_FAILED;
+				PCI_SET_ERROR_RESPONSE(val);
+				goto out;
+			} else {
+				*val = readl(pcie->reg +
+					     ASPEED_H2X_DEV_RX_DESC_DATA);
+			}
+		}
+		break;
+	case ASPEED_PCIE_STATUS_OF_TX:
+		ret = PCIBIOS_SET_FAILED;
+		PCI_SET_ERROR_RESPONSE(val);
+		goto out;
+	default:
+		*val = readl(pcie->reg + ASPEED_H2X_HOST_RX_DESC_DATA);
+		break;
+	}
+
+	cfg_val = readl(pcie->reg + ASPEED_H2X_DEV_CTRL);
+	cfg_val |= ASPEED_PCIE_UNLOCK_RX_BUFF;
+	writel(cfg_val, pcie->reg + ASPEED_H2X_DEV_CTRL);
+
+	*val = TLP_GET_VALUE(*val, size, where);
+
+	ret = PCIBIOS_SUCCESSFUL;
+out:
+	cfg_val = readl(pcie->reg + ASPEED_H2X_DEV_STS);
+	writel(cfg_val, pcie->reg + ASPEED_H2X_DEV_STS);
+	pcie->tx_tag = (pcie->tx_tag + 1) % 0x8;
+	return ret;
+}
+
+static int aspeed_ast2600_rd_conf(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 *val)
+{
+	/*
+	 * AST2600 has only one Root Port on the root bus.
+	 */
+	if (PCI_SLOT(devfn) != 8)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return aspeed_ast2600_conf(bus, devfn, where, size, val,
+				   CFG0_READ_FMTTYPE, false);
+}
+
+static int aspeed_ast2600_child_rd_conf(struct pci_bus *bus, unsigned int devfn,
+					int where, int size, u32 *val)
+{
+	return aspeed_ast2600_conf(bus, devfn, where, size, val,
+				   CFG1_READ_FMTTYPE, false);
+}
+
+static int aspeed_ast2600_wr_conf(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 val)
+{
+	/*
+	 * AST2600 has only one Root Port on the root bus.
+	 */
+	if (PCI_SLOT(devfn) != 8)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return aspeed_ast2600_conf(bus, devfn, where, size, &val,
+				   CFG0_WRITE_FMTTYPE, true);
+}
+
+static int aspeed_ast2600_child_wr_conf(struct pci_bus *bus, unsigned int devfn,
+					int where, int size, u32 val)
+{
+	return aspeed_ast2600_conf(bus, devfn, where, size, &val,
+				   CFG1_WRITE_FMTTYPE, true);
+}
+
+static int aspeed_ast2700_config(struct pci_bus *bus, unsigned int devfn,
+				 int where, int size, u32 *val, bool write)
+{
+	struct aspeed_pcie *pcie = bus->sysdata;
+	u32 cfg_val;
+
+	cfg_val = ASPEED_CFGI_BYTE_EN(TLP_HEADER_BYTE_EN(size, where)) |
+		  (where & ~3);
+	if (write)
+		cfg_val |= ASPEED_CFGI_WRITE;
+	writel(cfg_val, pcie->reg + ASPEED_H2X_CFGI_TLP);
+
+	writel(TLP_SET_VALUE(*val, size, where),
+	       pcie->reg + ASPEED_H2X_CFGI_WR_DATA);
+	writel(ASPEED_CFGI_TLP_FIRE, pcie->reg + ASPEED_H2X_CFGI_CTRL);
+	*val = readl(pcie->reg + ASPEED_H2X_CFGI_RET_DATA);
+	*val = TLP_GET_VALUE(*val, size, where);
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static int aspeed_ast2700_child_config(struct pci_bus *bus, unsigned int devfn,
+				       int where, int size, u32 *val,
+				       bool write)
+{
+	struct aspeed_pcie *pcie = bus->sysdata;
+	u32 bdf_offset, status, cfg_val;
+	int ret;
+
+	bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
+
+	cfg_val = CFG_PAYLOAD_SIZE;
+	if (write)
+		cfg_val |= (bus->number == (pcie->host_bus_num + 1)) ?
+				   CFG0_WRITE_FMTTYPE :
+				   CFG1_WRITE_FMTTYPE;
+	else
+		cfg_val |= (bus->number == (pcie->host_bus_num + 1)) ?
+				   CFG0_READ_FMTTYPE :
+				   CFG1_READ_FMTTYPE;
+	writel(cfg_val, pcie->reg + ASPEED_H2X_CFGE_TLP_1ST);
+
+	cfg_val = AST2700_TX_DESC1_VALUE |
+		  FIELD_PREP(GENMASK(11, 8), pcie->tx_tag) |
+		  TLP_HEADER_BYTE_EN(size, where);
+	writel(cfg_val, pcie->reg + ASPEED_H2X_CFGE_TLP_NEXT);
+
+	writel(bdf_offset, pcie->reg + ASPEED_H2X_CFGE_TLP_NEXT);
+	if (write)
+		writel(TLP_SET_VALUE(*val, size, where),
+		       pcie->reg + ASPEED_H2X_CFGE_TLP_NEXT);
+	writel(ASPEED_CFGE_TX_IDLE | ASPEED_CFGE_RX_BUSY,
+	       pcie->reg + ASPEED_H2X_CFGE_INT_STS);
+	writel(ASPEED_CFGE_TLP_FIRE, pcie->reg + ASPEED_H2X_CFGE_CTRL);
+
+	ret = readl_poll_timeout(pcie->reg + ASPEED_H2X_CFGE_INT_STS, status,
+				 (status & ASPEED_CFGE_TX_IDLE), 0, 50);
+	if (ret) {
+		dev_err(pcie->dev,
+			"%02x:%02x.%d CR tx timeout sts: 0x%08x\n",
+			bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn), status);
+		ret = PCIBIOS_SET_FAILED;
+		PCI_SET_ERROR_RESPONSE(val);
+		goto out;
+	}
+
+	ret = readl_poll_timeout(pcie->reg + ASPEED_H2X_CFGE_INT_STS, status,
+				 (status & ASPEED_CFGE_RX_BUSY), 0, 50);
+	if (ret) {
+		dev_err(pcie->dev,
+			"%02x:%02x.%d CR rx timeout sts: 0x%08x\n",
+			bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn), status);
+		ret = PCIBIOS_SET_FAILED;
+		PCI_SET_ERROR_RESPONSE(val);
+		goto out;
+	}
+	*val = readl(pcie->reg + ASPEED_H2X_CFGE_RET_DATA);
+	*val = TLP_GET_VALUE(*val, size, where);
+
+	ret = PCIBIOS_SUCCESSFUL;
+out:
+	writel(status, pcie->reg + ASPEED_H2X_CFGE_INT_STS);
+	pcie->tx_tag = (pcie->tx_tag + 1) % 0xf;
+	return ret;
+}
+
+static int aspeed_ast2700_rd_conf(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 *val)
+{
+	/*
+	 * AST2700 has only one Root Port on the root bus.
+	 */
+	if (devfn != 0)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return aspeed_ast2700_config(bus, devfn, where, size, val, false);
+}
+
+static int aspeed_ast2700_child_rd_conf(struct pci_bus *bus, unsigned int devfn,
+					int where, int size, u32 *val)
+{
+	return aspeed_ast2700_child_config(bus, devfn, where, size, val, false);
+}
+
+static int aspeed_ast2700_wr_conf(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 val)
+{
+	/*
+	 * AST2700 has only one Root Port on the root bus.
+	 */
+	if (devfn != 0)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return aspeed_ast2700_config(bus, devfn, where, size, &val, true);
+}
+
+static int aspeed_ast2700_child_wr_conf(struct pci_bus *bus, unsigned int devfn,
+					int where, int size, u32 val)
+{
+	return aspeed_ast2700_child_config(bus, devfn, where, size, &val, true);
+}
+
+static struct pci_ops aspeed_ast2600_pcie_ops = {
+	.read = aspeed_ast2600_rd_conf,
+	.write = aspeed_ast2600_wr_conf,
+};
+
+static struct pci_ops aspeed_ast2600_pcie_child_ops = {
+	.read = aspeed_ast2600_child_rd_conf,
+	.write = aspeed_ast2600_child_wr_conf,
+};
+
+static struct pci_ops aspeed_ast2700_pcie_ops = {
+	.read = aspeed_ast2700_rd_conf,
+	.write = aspeed_ast2700_wr_conf,
+};
+
+static struct pci_ops aspeed_ast2700_pcie_child_ops = {
+	.read = aspeed_ast2700_child_rd_conf,
+	.write = aspeed_ast2700_child_wr_conf,
+};
+
+static void aspeed_irq_compose_msi_msg(struct irq_data *data,
+				       struct msi_msg *msg)
+{
+	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(data);
+
+	msg->address_hi = 0;
+	msg->address_lo = pcie->platform->msi_address;
+	msg->data = data->hwirq;
+}
+
+static struct irq_chip aspeed_msi_bottom_irq_chip = {
+	.name = "ASPEED MSI",
+	.irq_compose_msi_msg = aspeed_irq_compose_msi_msg,
+};
+
+static int aspeed_irq_msi_domain_alloc(struct irq_domain *domain,
+				       unsigned int virq, unsigned int nr_irqs,
+				       void *args)
+{
+	struct aspeed_pcie *pcie = domain->host_data;
+	int bit;
+	int i;
+
+	guard(mutex)(&pcie->lock);
+
+	bit = bitmap_find_free_region(pcie->msi_irq_in_use, MAX_MSI_HOST_IRQS,
+				      get_count_order(nr_irqs));
+
+	if (bit < 0)
+		return -ENOSPC;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_set_info(domain, virq + i, bit + i,
+				    &aspeed_msi_bottom_irq_chip,
+				    domain->host_data, handle_simple_irq, NULL,
+				    NULL);
+	}
+
+	return 0;
+}
+
+static void aspeed_irq_msi_domain_free(struct irq_domain *domain,
+				       unsigned int virq, unsigned int nr_irqs)
+{
+	struct irq_data *data = irq_domain_get_irq_data(domain, virq);
+	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(data);
+
+	guard(mutex)(&pcie->lock);
+
+	bitmap_release_region(pcie->msi_irq_in_use, data->hwirq,
+			      get_count_order(nr_irqs));
+}
+
+static const struct irq_domain_ops aspeed_msi_domain_ops = {
+	.alloc = aspeed_irq_msi_domain_alloc,
+	.free = aspeed_irq_msi_domain_free,
+};
+
+#define ASPEED_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
+				  MSI_FLAG_USE_DEF_CHIP_OPS	| \
+				  MSI_FLAG_NO_AFFINITY)
+
+#define ASPEED_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK	| \
+				   MSI_FLAG_MULTI_PCI_MSI	| \
+				   MSI_FLAG_PCI_MSIX)
+
+static const struct msi_parent_ops aspeed_msi_parent_ops = {
+	.required_flags		= ASPEED_MSI_FLAGS_REQUIRED,
+	.supported_flags	= ASPEED_MSI_FLAGS_SUPPORTED,
+	.bus_select_token	= DOMAIN_BUS_PCI_MSI,
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
+	.prefix			= "ASPEED-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
+static int aspeed_pcie_msi_init(struct aspeed_pcie *pcie)
+{
+	writel(~0, pcie->reg + pcie->platform->reg_msi_en);
+	writel(~0, pcie->reg + pcie->platform->reg_msi_en + 0x04);
+	writel(~0, pcie->reg + pcie->platform->reg_msi_sts);
+	writel(~0, pcie->reg + pcie->platform->reg_msi_sts + 0x04);
+
+	struct irq_domain_info info = {
+		.fwnode		= dev_fwnode(pcie->dev),
+		.ops		= &aspeed_msi_domain_ops,
+		.host_data	= pcie,
+		.size		= MAX_MSI_HOST_IRQS,
+	};
+
+	pcie->msi_domain = msi_create_parent_irq_domain(&info,
+							&aspeed_msi_parent_ops);
+	if (!pcie->msi_domain)
+		return dev_err_probe(pcie->dev, -ENOMEM,
+				     "failed to create MSI domain\n");
+
+	return 0;
+}
+
+static void aspeed_pcie_msi_free(struct aspeed_pcie *pcie)
+{
+	if (pcie->msi_domain) {
+		irq_domain_remove(pcie->msi_domain);
+		pcie->msi_domain = NULL;
+	}
+}
+
+static void aspeed_pcie_irq_domain_free(void *d)
+{
+	struct aspeed_pcie *pcie = d;
+
+	if (pcie->intx_domain) {
+		irq_domain_remove(pcie->intx_domain);
+		pcie->intx_domain = NULL;
+	}
+	aspeed_pcie_msi_free(pcie);
+}
+
+static int aspeed_pcie_init_irq_domain(struct aspeed_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	struct device_node *node = dev->of_node;
+	struct device_node *pcie_intc_node;
+	int ret;
+
+	pcie_intc_node = of_get_child_by_name(node,
+					      "legacy-interrupt-controller");
+	if (!pcie_intc_node)
+		return dev_err_probe(dev, -ENODEV, "No PCIe INTc node found\n");
+
+	pcie->intx_domain = irq_domain_add_linear(pcie_intc_node,
+						  PCI_NUM_INTX,
+						  &aspeed_intx_domain_ops,
+						  pcie);
+	of_node_put(pcie_intc_node);
+	if (!pcie->intx_domain) {
+		ret = dev_err_probe(dev, -ENOMEM,
+				    "failed to get INTx IRQ domain\n");
+		goto err;
+	}
+
+	writel(0, pcie->reg + pcie->platform->reg_intx_en);
+	writel(~0, pcie->reg + pcie->platform->reg_intx_sts);
+
+	ret = aspeed_pcie_msi_init(pcie);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	aspeed_pcie_irq_domain_free(pcie);
+	return ret;
+}
+
+static int aspeed_pcie_port_init(struct aspeed_pcie_port *port)
+{
+	struct aspeed_pcie *pcie = port->pcie;
+	struct device *dev = pcie->dev;
+	int ret;
+
+	ret = clk_prepare_enable(port->clk);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to set clock for slot (%d)\n",
+				     port->slot);
+
+	ret = phy_init(port->phy);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to init phy pcie for slot (%d)\n",
+				     port->slot);
+
+	ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to set phy mode for slot (%d)\n",
+				     port->slot);
+
+	reset_control_deassert(port->perst);
+	mdelay(PCIE_RESET_CONFIG_WAIT_MS);
+
+	return 0;
+}
+
+static int aspeed_pcie_init_ports(struct aspeed_pcie *pcie)
+{
+	struct aspeed_pcie_port *port, *tmp;
+	u8 num_enabled = 0;
+
+	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
+		int ret;
+
+		ret = aspeed_pcie_port_init(port);
+		if (ret)
+			list_del(&port->list);
+		else
+			num_enabled++;
+	}
+
+	return (num_enabled > 0) ? 0 : -ENODEV;
+}
+
+static void aspeed_host_reset(struct aspeed_pcie *pcie)
+{
+	reset_control_assert(pcie->h2xrst);
+	mdelay(ASPEED_RESET_RC_WAIT_MS);
+	reset_control_deassert(pcie->h2xrst);
+}
+
+static int aspeed_ast2600_setup(struct platform_device *pdev)
+{
+	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
+	struct device *dev = pcie->dev;
+
+	pcie->ahbc = syscon_regmap_lookup_by_phandle(dev->of_node,
+						     "aspeed,ahbc");
+	if (IS_ERR(pcie->ahbc))
+		return dev_err_probe(dev, PTR_ERR(pcie->ahbc),
+				     "failed to map ahbc base\n");
+
+	aspeed_host_reset(pcie);
+
+	regmap_write(pcie->ahbc, ASPEED_AHBC_KEY, ASPEED_AHBC_UNLOCK_KEY);
+	regmap_update_bits(pcie->ahbc, ASPEED_AHBC_ADDR_MAPPING,
+			   ASPEED_PCIE_RC_MEMORY_EN, ASPEED_PCIE_RC_MEMORY_EN);
+	regmap_write(pcie->ahbc, ASPEED_AHBC_KEY, ASPEED_AHBC_UNLOCK);
+
+	/* Due to the BAR assignment is fixed mapping on 0x6000_0000.*/
+	writel(ASPEED_AHB_REMAP_LO_ADDR(0x600) | ASPEED_AHB_MASK_LO_ADDR(0xe00),
+	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG0);
+	writel(ASPEED_AHB_REMAP_HI_ADDR(0),
+	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG1);
+	writel(ASPEED_AHB_MASK_HI_ADDR(~0),
+	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG2);
+	writel(ASPEED_H2X_BRIDGE_EN, pcie->reg + ASPEED_H2X_CTRL);
+
+	writel(ASPEED_PCIE_RX_DMA_EN | ASPEED_PCIE_RX_LINEAR |
+	       ASPEED_PCIE_RX_MSI_SEL | ASPEED_PCIE_RX_MSI_EN |
+	       ASPEED_PCIE_WAIT_RX_TLP_CLR | ASPEED_PCIE_RC_RX_ENABLE |
+	       ASPEED_PCIE_RC_ENABLE,
+	       pcie->reg + ASPEED_H2X_DEV_CTRL);
+
+	writel(ASPEED_RC_TLP_TX_TAG_NUM, pcie->reg + ASPEED_H2X_DEV_TX_TAG);
+
+	pcie->host->ops = &aspeed_ast2600_pcie_ops;
+	pcie->host->child_ops = &aspeed_ast2600_pcie_child_ops;
+
+	return 0;
+}
+
+static int aspeed_ast2700_ahb_remap_to_bar(struct aspeed_pcie *pcie)
+{
+	struct resource_entry *win, *tmp;
+	struct pci_host_bridge *bridge = pcie->host;
+
+	/* Configure AHB remapping to BAR on AST27x0.
+	 * The BAR region is HW-fixed in AST27x0, these BARs will be filled
+	 * in the ranges of pcie node in DT.
+	 */
+	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
+		struct resource *res = win->res;
+
+		if (resource_type(res) == IORESOURCE_MEM &&
+		    !(res->flags & IORESOURCE_MEM_64)) {
+			writel(ASPEED_REMAP_BAR_BASE(res->start),
+			       pcie->reg + ASPEED_H2X_REMAP_DIRECT_ADDR);
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
+static int aspeed_ast2700_setup(struct platform_device *pdev)
+{
+	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
+	struct device *dev = pcie->dev;
+	int ret;
+
+	pcie->cfg = syscon_regmap_lookup_by_phandle(dev->of_node,
+						    "aspeed,pciecfg");
+	if (IS_ERR(pcie->cfg))
+		return dev_err_probe(dev, PTR_ERR(pcie->cfg),
+				     "failed to map pciecfg base\n");
+
+	regmap_update_bits(pcie->cfg, ASPEED_SCU_60,
+			   ASPEED_RC_E2M_PATH_EN | ASPEED_RC_H2XS_PATH_EN |
+			   ASPEED_RC_H2XD_PATH_EN | ASPEED_RC_H2XX_PATH_EN |
+			   ASPEED_RC_UPSTREAM_MEM_EN,
+			   ASPEED_RC_E2M_PATH_EN | ASPEED_RC_H2XS_PATH_EN |
+			   ASPEED_RC_H2XD_PATH_EN | ASPEED_RC_H2XX_PATH_EN |
+			   ASPEED_RC_UPSTREAM_MEM_EN);
+	regmap_write(pcie->cfg, ASPEED_SCU_64,
+		     ASPEED_RC0_DECODE_DMA_BASE(0) |
+		     ASPEED_RC0_DECODE_DMA_LIMIT(0xff) |
+		     ASPEED_RC1_DECODE_DMA_BASE(0) |
+		     ASPEED_RC1_DECODE_DMA_LIMIT(0xff));
+	regmap_write(pcie->cfg, ASPEED_SCU_70, ASPEED_DISABLE_EP_FUNC);
+
+	aspeed_host_reset(pcie);
+
+	writel(0, pcie->reg + ASPEED_H2X_CTRL);
+	writel(ASPEED_H2X_BRIDGE_EN | ASPEED_H2X_BRIDGE_DIRECT_EN,
+	       pcie->reg + ASPEED_H2X_CTRL);
+
+	ret = aspeed_ast2700_ahb_remap_to_bar(pcie);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to assign BAR\n");
+
+	/* Prepare for 64-bit BAR pref */
+	writel(ASPEED_REMAP_PREF_ADDR_63_32(0x3),
+	       pcie->reg + ASPEED_H2X_REMAP_PREF_ADDR);
+
+	pcie->host->ops = &aspeed_ast2700_pcie_ops;
+	pcie->host->child_ops = &aspeed_ast2700_pcie_child_ops;
+	pcie->clear_msi_twice = true;
+
+	return 0;
+}
+
+static void aspeed_pcie_reset_release(void *d)
+{
+	struct reset_control *perst = d;
+
+	if (!perst)
+		return;
+
+	reset_control_put(perst);
+}
+
+static int aspeed_pcie_parse_port(struct aspeed_pcie *pcie,
+				  struct device_node *node,
+				  int slot)
+{
+	struct aspeed_pcie_port *port;
+	struct device *dev = pcie->dev;
+	int ret;
+
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	port->clk = devm_get_clk_from_child(dev, node, NULL);
+	if (IS_ERR(port->clk))
+		return dev_err_probe(dev, PTR_ERR(port->clk),
+				     "failed to get pcie%d clock\n", slot);
+
+	port->phy = devm_of_phy_get(dev, node, NULL);
+	if (IS_ERR(port->phy))
+		return dev_err_probe(dev, PTR_ERR(port->phy),
+				     "failed to get phy pcie%d\n", slot);
+
+	port->perst = of_reset_control_get_exclusive(node, "perst");
+	if (IS_ERR(port->perst))
+		return dev_err_probe(dev, PTR_ERR(port->perst),
+				     "failed to get pcie%d reset control\n",
+				     slot);
+	ret = devm_add_action_or_reset(dev, aspeed_pcie_reset_release,
+				       port->perst);
+	if (ret)
+		return ret;
+	reset_control_assert(port->perst);
+
+	port->slot = slot;
+	port->pcie = pcie;
+
+	INIT_LIST_HEAD(&port->list);
+	list_add_tail(&port->list, &pcie->ports);
+
+	return 0;
+}
+
+static int aspeed_pcie_parse_dt(struct aspeed_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	struct device_node *node = dev->of_node;
+	int ret;
+
+	for_each_available_child_of_node_scoped(node, child) {
+		int slot;
+		const char *type;
+
+		ret = of_property_read_string(child, "device_type", &type);
+		if (ret || strcmp(type, "pci"))
+			continue;
+
+		ret = of_pci_get_devfn(child);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "failed to parse devfn\n");
+
+		slot = PCI_SLOT(ret);
+
+		ret = aspeed_pcie_parse_port(pcie, child, slot);
+		if (ret)
+			return ret;
+	}
+
+	if (list_empty(&pcie->ports))
+		return dev_err_probe(dev, -ENODEV,
+				     "No PCIe port found in DT\n");
+
+	return 0;
+}
+
+static int aspeed_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pci_host_bridge *host;
+	struct aspeed_pcie *pcie;
+	struct resource_entry *entry;
+	const struct aspeed_pcie_rc_platform *md;
+	int irq, ret;
+
+	md = of_device_get_match_data(dev);
+	if (!md)
+		return -ENODEV;
+
+	host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
+	if (!host)
+		return -ENOMEM;
+
+	pcie = pci_host_bridge_priv(host);
+	pcie->dev = dev;
+	pcie->tx_tag = 0;
+	platform_set_drvdata(pdev, pcie);
+
+	pcie->platform = md;
+	pcie->host = host;
+	INIT_LIST_HEAD(&pcie->ports);
+
+	/* Get root bus num for cfg command to decide tlp type 0 or type 1 */
+	entry = resource_list_first_type(&host->windows, IORESOURCE_BUS);
+	if (entry)
+		pcie->host_bus_num = entry->res->start;
+
+	pcie->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcie->reg))
+		return PTR_ERR(pcie->reg);
+
+	pcie->h2xrst = devm_reset_control_get_exclusive(dev, "h2x");
+	if (IS_ERR(pcie->h2xrst))
+		return dev_err_probe(dev, PTR_ERR(pcie->h2xrst),
+				     "failed to get h2x reset\n");
+
+	ret = devm_mutex_init(dev, &pcie->lock);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init mutex\n");
+
+	ret = pcie->platform->setup(pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to setup PCIe RC\n");
+
+	ret = aspeed_pcie_parse_dt(pcie);
+	if (ret)
+		return ret;
+
+	ret = aspeed_pcie_init_ports(pcie);
+	if (ret)
+		return ret;
+
+	host->sysdata = pcie;
+
+	ret = aspeed_pcie_init_irq_domain(pcie);
+	if (ret)
+		return ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_add_action_or_reset(dev, aspeed_pcie_irq_domain_free, pcie);
+	if (ret)
+		return ret;
+
+	ret = devm_request_irq(dev, irq, aspeed_pcie_intr_handler, IRQF_SHARED,
+			       dev_name(dev), pcie);
+	if (ret)
+		return ret;
+
+	return pci_host_probe(host);
+}
+
+const struct aspeed_pcie_rc_platform pcie_rc_ast2600 = {
+	.setup = aspeed_ast2600_setup,
+	.reg_intx_en = 0xc4,
+	.reg_intx_sts = 0xc8,
+	.reg_msi_en = 0xe0,
+	.reg_msi_sts = 0xe8,
+	.msi_address = 0x1e77005c,
+};
+
+const struct aspeed_pcie_rc_platform pcie_rc_ast2700 = {
+	.setup = aspeed_ast2700_setup,
+	.reg_intx_en = 0x40,
+	.reg_intx_sts = 0x48,
+	.reg_msi_en = 0x50,
+	.reg_msi_sts = 0x58,
+	.msi_address = 0x000000f0,
+};
+
+static const struct of_device_id aspeed_pcie_of_match[] = {
+	{ .compatible = "aspeed,ast2600-pcie", .data = &pcie_rc_ast2600 },
+	{ .compatible = "aspeed,ast2700-pcie", .data = &pcie_rc_ast2700 },
+	{}
+};
+
+static struct platform_driver aspeed_pcie_driver = {
+	.driver = {
+		.name = "aspeed-pcie",
+		.of_match_table = aspeed_pcie_of_match,
+		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = aspeed_pcie_probe,
+};
+
+builtin_platform_driver(aspeed_pcie_driver);
+
+MODULE_AUTHOR("Jacky Chou <jacky_chou@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED PCIe Root Complex");
+MODULE_LICENSE("GPL");
-- 
2.34.1


