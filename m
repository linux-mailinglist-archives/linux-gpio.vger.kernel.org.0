Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B5E2D22A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 01:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfE1XJu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 19:09:50 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11159 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfE1XJC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 19:09:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cedbf830000>; Tue, 28 May 2019 16:08:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 16:09:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 May 2019 16:09:00 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:08:59 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:08:59 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 May 2019 23:08:59 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.86]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cedbf8b0000>; Tue, 28 May 2019 16:08:59 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>, <skomatineni@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH V2 02/12] pinctrl: tegra: add suspend and resume support
Date:   Tue, 28 May 2019 16:08:46 -0700
Message-ID: <1559084936-4610-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559084931; bh=1xQTTbYTuPrto0ISx2uIjIGBvlAvxtvkm/nwrFZurio=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=LHvM/bKICmb2hxEW1u9Kc+QyqJJU6E0ERAosA74SzGlhdRns6rQ3sFqjIZXFC8jAZ
         +PPepx9H+ckB7accx6fv1W35O9fh5KiRliDTah+OOagzTkHU4tkfuEdsckYjA+ZwCD
         u/5oghWBziGJUjJnLfHPHy7Mb+MisNehiRF38+zQ97sBlnqDw+bqteJ9uqTtWrGlql
         1TNjdiCN5W/Gdw3Ra4qNg+SeA9ggtS4b7cSFdol1egRKbjMlg7BL+Gfz50k6XxMflU
         /iuMUzYqZ8WW3JY4Pno5MenEAS1MrJIo/A29ZZdZGRcRCiR5cRzG5oGHbCjM+KAUuV
         +gGDx7VNhFFew==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds suspend and resume support for Tegra pinctrl driver
and registers them to syscore so the pinmux settings are restored
before the devices resume.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 68 +++++++++++++++++++++++++++++++-
 drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
 drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
 drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
 drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
 drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
 7 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index a5008c066bac..bdc47e62c457 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -28,11 +28,18 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/slab.h>
+#include <linux/syscore_ops.h>
 
 #include "../core.h"
 #include "../pinctrl-utils.h"
 #include "pinctrl-tegra.h"
 
+#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
+#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
+#define EMMC_DPD_PARKING			(0x1fff << 14)
+
+static struct tegra_pmx *pmx;
+
 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
 {
 	return readl(pmx->regs[bank] + reg);
@@ -629,6 +636,50 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 	}
 }
 
+static int __maybe_unused tegra_pinctrl_suspend(void)
+{
+	u32 *backup_regs = pmx->backup_regs;
+	u32 *regs;
+	int i, j;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
+			*backup_regs++ = readl(regs++);
+	}
+
+	return pinctrl_force_sleep(pmx->pctl);
+}
+
+static void __maybe_unused tegra_pinctrl_resume(void)
+{
+	u32 *backup_regs = pmx->backup_regs;
+	u32 *regs;
+	u32 val;
+	int i, j;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
+			writel(*backup_regs++, regs++);
+	}
+
+	if (pmx->soc->has_park_padcfg) {
+		val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
+		val &= ~EMMC_DPD_PARKING;
+		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
+
+		val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
+		val &= ~EMMC_DPD_PARKING;
+		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
+	}
+}
+
+static struct syscore_ops pinctrl_syscore_ops = {
+	.suspend = tegra_pinctrl_suspend,
+	.resume = tegra_pinctrl_resume,
+};
+
 static bool gpio_node_has_range(const char *compatible)
 {
 	struct device_node *np;
@@ -648,11 +699,11 @@ static bool gpio_node_has_range(const char *compatible)
 int tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data)
 {
-	struct tegra_pmx *pmx;
 	struct resource *res;
 	int i;
 	const char **group_pins;
 	int fn, gn, gfn;
+	unsigned long backup_regs_size = 0;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx)
@@ -705,6 +756,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (!res)
 			break;
+		backup_regs_size += resource_size(res);
 	}
 	pmx->nbanks = i;
 
@@ -713,11 +765,24 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	if (!pmx->regs)
 		return -ENOMEM;
 
+	pmx->reg_bank_size = devm_kcalloc(&pdev->dev, pmx->nbanks,
+					  sizeof(*pmx->reg_bank_size),
+					  GFP_KERNEL);
+	if (!pmx->reg_bank_size)
+		return -ENOMEM;
+
+	pmx->backup_regs = devm_kzalloc(&pdev->dev, backup_regs_size,
+					GFP_KERNEL);
+	if (!pmx->backup_regs)
+		return -ENOMEM;
+
 	for (i = 0; i < pmx->nbanks; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(pmx->regs[i]))
 			return PTR_ERR(pmx->regs[i]);
+
+		pmx->reg_bank_size[i] = resource_size(res);
 	}
 
 	pmx->pctl = devm_pinctrl_register(&pdev->dev, &tegra_pinctrl_desc, pmx);
@@ -732,6 +797,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
 
 	platform_set_drvdata(pdev, pmx);
+	register_syscore_ops(&pinctrl_syscore_ops);
 
 	dev_dbg(&pdev->dev, "Probed Tegra pinctrl driver\n");
 
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 44c71941b5f8..b405df6fd390 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -25,6 +25,8 @@ struct tegra_pmx {
 
 	int nbanks;
 	void __iomem **regs;
+	size_t *reg_bank_size;
+	u32 *backup_regs;
 };
 
 enum tegra_pinconf_param {
@@ -199,6 +201,7 @@ struct tegra_pinctrl_soc_data {
 	bool hsm_in_mux;
 	bool schmitt_in_mux;
 	bool drvtype_in_mux;
+	bool has_park_padcfg;
 };
 
 int tegra_pinctrl_probe(struct platform_device *pdev,
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index d43c209e9c30..4ac44f34dccf 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1849,6 +1849,7 @@ static const struct tegra_pinctrl_soc_data tegra114_pinctrl = {
 	.hsm_in_mux = false,
 	.schmitt_in_mux = false,
 	.drvtype_in_mux = false,
+	.has_park_padcfg = false,
 };
 
 static int tegra114_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index 5b07a5834d15..1dac7648b41f 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -2061,6 +2061,7 @@ static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
 	.hsm_in_mux = false,
 	.schmitt_in_mux = false,
 	.drvtype_in_mux = false,
+	.has_park_padcfg = false,
 };
 
 static int tegra124_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 1fc82a9576e0..9d2b25200f32 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2231,6 +2231,7 @@ static const struct tegra_pinctrl_soc_data tegra20_pinctrl = {
 	.hsm_in_mux = false,
 	.schmitt_in_mux = false,
 	.drvtype_in_mux = false,
+	.has_park_padcfg = false,
 };
 
 static const char *cdev1_parents[] = {
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 3e77f5474dd8..dc06c36e698a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1563,6 +1563,7 @@ static const struct tegra_pinctrl_soc_data tegra210_pinctrl = {
 	.hsm_in_mux = true,
 	.schmitt_in_mux = true,
 	.drvtype_in_mux = true,
+	.has_park_padcfg = true,
 };
 
 static int tegra210_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index 10e617003e9c..42182d714950 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -2484,6 +2484,7 @@ static const struct tegra_pinctrl_soc_data tegra30_pinctrl = {
 	.hsm_in_mux = false,
 	.schmitt_in_mux = false,
 	.drvtype_in_mux = false,
+	.has_park_padcfg = false,
 };
 
 static int tegra30_pinctrl_probe(struct platform_device *pdev)
-- 
2.7.4

