Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96A72590AA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfF1COs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:14:48 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17594 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfF1CNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577cd0000>; Thu, 27 Jun 2019 19:13:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 27 Jun 2019 19:13:34 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:33 +0000
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:33 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577cd0002>; Thu, 27 Jun 2019 19:13:33 -0700
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
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
Subject: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
Date:   Thu, 27 Jun 2019 19:12:36 -0700
Message-ID: <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688013; bh=6XVtmPiEo6fFZCuCiwnb+UkS0vaYrf4FcEseKnc+izw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Um3OwDcVHDIRK3fw70C6JDSsK7KNL+Be94prmyNCuyuDnCI43A5Rh6oDEcTMG63Kz
         TsOce2FU6YyUW0HAQ72qXwWXofnsNc98mbliOdeXwxxK2cfJ/cSMRV8bC+dvKt9nyu
         Y89O0CS7G1QhcNjeQKLmh3NXruppoumz80bfrTZd6hBEvPtot2I1dwL9sHsmXEN3/v
         0Wj1dw8+9Tleh12YGFBqelgsBrz6N8DBVtiaEOP29eshytynzSOIC91gvLv5+0Iju+
         73jNbTW8/lVUHkuXG1JiywOxQFAG/cGqBTMnWCPqMtbm97ec9bvWBe1DI7HU/gAgZJ
         wNhJLBAQhYNTg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for Tegra pinctrl driver suspend and resume.

During suspend, context of all pinctrl registers are stored and
on resume they are all restored to have all the pinmux and pad
configuration for normal operation.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
 drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
 3 files changed, 56 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 34596b246578..e7c0a1011cba 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -621,6 +621,43 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 	}
 }
 
+static int tegra_pinctrl_suspend(struct device *dev)
+{
+	struct tegra_pmx *pmx = dev_get_drvdata(dev);
+	u32 *backup_regs = pmx->backup_regs;
+	u32 *regs;
+	unsigned int i, j;
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
+static int tegra_pinctrl_resume(struct device *dev)
+{
+	struct tegra_pmx *pmx = dev_get_drvdata(dev);
+	u32 *backup_regs = pmx->backup_regs;
+	u32 *regs;
+	unsigned int i, j;
+
+	for (i = 0; i < pmx->nbanks; i++) {
+		regs = pmx->regs[i];
+		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
+			writel(*backup_regs++, regs++);
+	}
+
+	return 0;
+}
+
+const struct dev_pm_ops tegra_pinctrl_pm = {
+	.suspend = &tegra_pinctrl_suspend,
+	.resume = &tegra_pinctrl_resume
+};
+
 static bool gpio_node_has_range(const char *compatible)
 {
 	struct device_node *np;
@@ -645,6 +682,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	int i;
 	const char **group_pins;
 	int fn, gn, gfn;
+	unsigned long backup_regs_size = 0;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx)
@@ -697,6 +735,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (!res)
 			break;
+		backup_regs_size += resource_size(res);
 	}
 	pmx->nbanks = i;
 
@@ -705,11 +744,24 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
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
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 287702660783..55456f8d44cf 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -17,6 +17,8 @@ struct tegra_pmx {
 
 	int nbanks;
 	void __iomem **regs;
+	size_t *reg_bank_size;
+	u32 *backup_regs;
 };
 
 enum tegra_pinconf_param {
@@ -193,6 +195,7 @@ struct tegra_pinctrl_soc_data {
 	bool drvtype_in_mux;
 };
 
+extern const struct dev_pm_ops tegra_pinctrl_pm;
 int tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data);
 #endif
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 0b56ad5c9c1c..edd3f4606cdb 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
 	.driver = {
 		.name = "tegra210-pinctrl",
 		.of_match_table = tegra210_pinctrl_of_match,
+		.pm = &tegra_pinctrl_pm,
 	},
 	.probe = tegra210_pinctrl_probe,
 };
-- 
2.7.4

