Return-Path: <linux-gpio+bounces-36344-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNgTGVNM/GmZNwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36344-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:24:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE044E4BC7
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E4BC30AE050
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3330D3859D4;
	Thu,  7 May 2026 08:18:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D4346FCA;
	Thu,  7 May 2026 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141897; cv=none; b=GtlALXLkY2NFMjvO+QsHs9FrI2lAPeE23EdCF+VJRJIzhE7uUvjegJlRreBOlyAhzNuiaCerImbvnmCB2/XP1eSjUtNlmbfylrEZlI9zW7hKs6FSehb4jK1Iv5on8nSs7prOo5uIWMv9i4YukwFAlZ6jgOpVFkf0MjZ59NS9pqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141897; c=relaxed/simple;
	bh=slz3b5E8oY2N7lAmYCiFN9uRLmSreujaw7K4jRu0oiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjErmu3roSiwKt+PE4q8wrbeVASbBcEwZcPQBr+0iDwsjY6v/7SuniUdIdaXP/V8hHXtrOeT/D9BzLjsK2xSd6pYhrR0T3TKeNg7qMMlHjlDQ/Jl6qlFX6bNYLB/e+RLzgMstnWrc3MxekPn3urn99SmCu/aiITdZ9OWCEGvgbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S7;
	Thu, 07 May 2026 16:17:26 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 05/12] phy: add a driver for T-Head TH1520 USB PHY
Date: Thu,  7 May 2026 16:17:03 +0800
Message-ID: <20260507081710.4090814-6-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3m+KLSvxpI_pNEA--.42168S7
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr15uw17tFW3KrWxJw4Dtwb_yoW3Zw1xpa
	nxAFWFyr4ktFsxWw4xJw1UCFWSqa17t34aqry7W3WfZFy3JryrXas8WFW5ZryvvFs7ZrW3
	tr95GFW7CF17JwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRQJ5wUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Queue-Id: AEE044E4BC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36344-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org,iscas.ac.cn];
	NEURAL_HAM(-0.00)[-0.965];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
some PHY parameters exported as another system controller along with it.

As a few PHY parameters' default value isn't ready to work, add a driver
configuring them before letting the PHY run, in addition to
clock/reset/regulator management.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/phy/Kconfig                |   1 +
 drivers/phy/Makefile               |   1 +
 drivers/phy/thead/Kconfig          |  12 ++
 drivers/phy/thead/Makefile         |   2 +
 drivers/phy/thead/phy-th1520-usb.c | 197 +++++++++++++++++++++++++++++
 5 files changed, 213 insertions(+)
 create mode 100644 drivers/phy/thead/Kconfig
 create mode 100644 drivers/phy/thead/Makefile
 create mode 100644 drivers/phy/thead/phy-th1520-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 227b9a4c612e8..ea1a52e14b839 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -164,6 +164,7 @@ source "drivers/phy/st/Kconfig"
 source "drivers/phy/starfive/Kconfig"
 source "drivers/phy/sunplus/Kconfig"
 source "drivers/phy/tegra/Kconfig"
+source "drivers/phy/thead/Kconfig"
 source "drivers/phy/ti/Kconfig"
 source "drivers/phy/xilinx/Kconfig"
 
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index f49d83f00a3d8..4604522548c91 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -48,5 +48,6 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   starfive/	\
 					   sunplus/	\
 					   tegra/	\
+					   thead/	\
 					   ti/		\
 					   xilinx/
diff --git a/drivers/phy/thead/Kconfig b/drivers/phy/thead/Kconfig
new file mode 100644
index 0000000000000..14012db5973c4
--- /dev/null
+++ b/drivers/phy/thead/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config PHY_TH1520_USB
+	tristate "USB PHY driver for T-Head TH1520 SoC"
+	depends on ARCH_THEAD || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on HAS_IOMEM
+	depends on OF
+	depends on RESET_CONTROLLER
+	select GENERIC_PHY
+	default ARCH_THEAD
+	help
+	  Enable support for the USB PHY on the T-Head TH1520 SoC.
diff --git a/drivers/phy/thead/Makefile b/drivers/phy/thead/Makefile
new file mode 100644
index 0000000000000..5b459bc7004bd
--- /dev/null
+++ b/drivers/phy/thead/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_TH1520_USB) += phy-th1520-usb.o
diff --git a/drivers/phy/thead/phy-th1520-usb.c b/drivers/phy/thead/phy-th1520-usb.c
new file mode 100644
index 0000000000000..c87bd779bbb74
--- /dev/null
+++ b/drivers/phy/thead/phy-th1520-usb.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
+ *
+ * Authors:
+ * Icenowy Zheng <zhengxingda@iscas.ac.cn>
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+
+#define USB_SYSCON_OFFSET		0xf000
+
+/* All the below registers are in the USB syscon region */
+#define USB_CLK_GATE_STS		0x0
+#define USB_LOGIC_ANALYZER_TRACE_STS0	0x4
+#define USB_LOGIC_ANALYZER_TRACE_STS1	0x8
+#define USB_GPIO			0xc
+#define USB_DEBUG_STS0			0x10
+#define USB_DEBUG_STS1			0x14
+#define USB_DEBUG_STS2			0x18
+#define USBCTL_CLK_CTRL0		0x1c
+#define USBPHY_CLK_CTRL1		0x20
+#define USBPHY_TEST_CTRL0		0x24
+#define USBPHY_TEST_CTRL1		0x28
+#define USBPHY_TEST_CTRL2		0x2c
+#define USBPHY_TEST_CTRL3		0x30
+#define USB_SSP_EN			0x34
+#define USB_HADDR_SEL			0x38
+#define USB_SYS				0x3c
+#define USB_HOST_STATUS			0x40
+#define USB_HOST_CTRL			0x44
+#define USBPHY_HOST_CTRL		0x48
+#define USBPHY_HOST_STATUS		0x4c
+#define USB_TEST_REG0			0x50
+#define USB_TEST_REG1			0x54
+#define USB_TEST_REG2			0x58
+#define USB_TEST_REG3			0x5c
+
+#define USB_SYS_COMMONONN		BIT(0)
+
+#define USB_SSP_EN_REF_SSP_EN		BIT(0)
+
+struct th1520_usb_phy {
+	struct platform_device *pdev;
+	struct phy *phy;
+	struct regmap *regmap;
+	struct clk *ref_clk;
+	struct reset_control *phy_reset;
+};
+
+static int th1520_usb_phy_init(struct phy *phy)
+{
+	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(th1520_phy->ref_clk);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(th1520_phy->phy_reset);
+	if (ret)
+		goto err_disable_clk;
+
+	/*
+	 * Do some initial PHY setup:
+	 * - Set COMMONONN to allow the PHY to automatically power down.
+	 * - Set REF_SSP_EN to enable feeding reference clock to SuperSpeed
+	 *   PHY clock PLL.
+	 */
+	regmap_set_bits(th1520_phy->regmap, USB_SYS, USB_SYS_COMMONONN);
+	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN, USB_SSP_EN_REF_SSP_EN);
+
+	ret = reset_control_deassert(th1520_phy->phy_reset);
+	if (ret)
+		goto err_disable_clk;
+
+	udelay(10);
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(th1520_phy->ref_clk);
+	return ret;
+}
+
+static int th1520_usb_phy_exit(struct phy *phy)
+{
+	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = reset_control_assert(th1520_phy->phy_reset);
+	if (ret)
+		return ret;
+
+	clk_disable_unprepare(th1520_phy->ref_clk);
+
+	return 0;
+}
+
+static const struct phy_ops th1520_usb_phy_ops = {
+	.init		= th1520_usb_phy_init,
+	.exit		= th1520_usb_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct regmap_config phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = USB_TEST_REG3,
+};
+
+static int th1520_usb_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct th1520_usb_phy *th1520_phy;
+	struct reset_control *bus_reset;
+	void __iomem *base;
+	int ret;
+
+	th1520_phy = devm_kzalloc(dev, sizeof(*th1520_phy), GFP_KERNEL);
+	if (!th1520_phy)
+		return -ENOMEM;
+
+	th1520_phy->pdev = pdev;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	th1520_phy->ref_clk = devm_clk_get(dev, "ref");
+	if (IS_ERR(th1520_phy->ref_clk))
+		return PTR_ERR(th1520_phy->ref_clk);
+
+	/* De-assert the bus reset and leave it that way */
+	bus_reset = devm_reset_control_get_exclusive_deasserted(dev, "bus");
+	if (IS_ERR(bus_reset))
+		return PTR_ERR(bus_reset);
+
+	th1520_phy->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
+	if (IS_ERR(th1520_phy->phy_reset))
+		return PTR_ERR(th1520_phy->phy_reset);
+
+	/*
+	 * Schematics of several boards (Lichee Module 4A/Milk-V Meles)
+	 * describe this power rail as always-on.
+	 */
+	ret = devm_regulator_get_enable(dev, "avdd33-usb3");
+	if (ret)
+		return ret;
+
+	th1520_phy->regmap = devm_regmap_init_mmio_clk(dev, "bus",
+						       base + USB_SYSCON_OFFSET,
+						       &phy_regmap_config);
+	if (IS_ERR(th1520_phy->regmap))
+		return dev_err_probe(dev, PTR_ERR(th1520_phy->regmap),
+				     "Failed to init regmap\n");
+
+	th1520_phy->phy = devm_phy_create(dev, dev->of_node, &th1520_usb_phy_ops);
+	if (IS_ERR(th1520_phy->phy)) {
+		dev_err(dev, "failed to create PHY\n");
+		return PTR_ERR(th1520_phy->phy);
+	}
+
+	phy_set_drvdata(th1520_phy->phy, th1520_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id th1520_usb_phy_of_table[] = {
+	{ .compatible = "thead,th1520-usb-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, th1520_usb_phy_of_table);
+
+static struct platform_driver th1520_usb_phy_driver = {
+	.driver = {
+		.name = "th1520-usb-phy",
+		.of_match_table = th1520_usb_phy_of_table,
+	},
+	.probe = th1520_usb_phy_probe,
+};
+
+module_platform_driver(th1520_usb_phy_driver);
+
+MODULE_DESCRIPTION("T-Head TH1520 USB PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0


