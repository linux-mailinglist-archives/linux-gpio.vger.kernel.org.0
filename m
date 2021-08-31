Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F613FC224
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 07:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbhHaFaK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 01:30:10 -0400
Received: from mail-bn8nam11on2069.outbound.protection.outlook.com ([40.107.236.69]:50049
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235359AbhHaFaJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Aug 2021 01:30:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6b/cO5Y2TbsYqGltOZ+n3XEYlc+YgP8PomdD/VgFZcL2fr34sGRyZXRMUVLIyw6xF6Z+P+d4UhVrtU24XEX0/6Rulq2y1ULwCFR3kyR32v/vsrDy+XnfVKQQJf2fzyhmdhpFieHjC492kzYvl1ElHVLYTRL9Ij8NIcXA/+C4yI6psqx+gel0Ho5R3nCF14xLbkq/8IHcxSwKIvUDn/5R6WtGHrlbZIhLOuqxkSc6d55FlNxAl98A1WQTz4ZsyFxEa6HmpJ8aGrdH4ApPWDpHMfl4+3lsskzBcgBrNNOcWaaVRonOSO/W1/MB3XyUaVyBZnfvHF3tFrFlhU0+d5AiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Y/Zs2rwwjhZFmtip6qc+ty1wzxI8lt02B2eoj2dePs=;
 b=Q+TfbaAvq9rzWaEup7x+iUVAlXKgeh0IFQ+RrPtpreoKp3m5aBmSMLBvt5MP8NlgLVBkcR9wSXEattHgIbGR5xQlMeCKUdXFg5KUzrttpv/jZBZHDc+//27KH2V+g59wo2iwlSInjuN5uabWGcOpmApXLuguBzkyREHJZqmn7JdUAs1/YOL9QwfYeOkOoFNDJyO+BRXmpy1dx0Vryjfalo8zBz2UGn4yiGH4/u0KiNYJ+4yfmtdJ/SeP4sRAbgIhGj0JQjCJ06zGMhff63+yDKNokqCYKi4a/kS6oyAr4XTW5TU1hzIVQI3lW+dHJnJzSSWFGbCtDv3ab+Ph6Ax4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Y/Zs2rwwjhZFmtip6qc+ty1wzxI8lt02B2eoj2dePs=;
 b=WuhxnNTEKyYB09jxMxPRQ2hQEpqRbuKplDfecnXBw3N11KB/8NgRQhQ4115SU/YQLta5sxF4gcnk6E615cgjUdYrYvGm6ihOz6cxafUap2s8MDTynxFpBamu3fwjf5Sz/wmw7jPkL/X2ylpKeTKksWxw1OHQ/csBzKzVQZRh5BcL7Oe5m8sedWWY1NePJ/p45xwdq5rspLTojQ3xgfSJ+r2i+NjO5foLPHYctkckb5vHHNf3vRic1FGKV4r/KaEL4cTt613A62nczOfgG17+mwTCDKHxAEk6gx866zSGvxjEOZ5j2z4q6uFB5FrAcdtcwBImwD4vv6xX98UlxFs+mQ==
Received: from BN9PR03CA0958.namprd03.prod.outlook.com (2603:10b6:408:108::33)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 05:29:12 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::64) by BN9PR03CA0958.outlook.office365.com
 (2603:10b6:408:108::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23 via Frontend
 Transport; Tue, 31 Aug 2021 05:29:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 05:29:11 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 05:29:08 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 05:29:06 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH 2/2] pinctrl: tegra: Implement pinmux register save and restore
Date:   Tue, 31 Aug 2021 10:58:34 +0530
Message-ID: <20210831052834.4136-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210831052834.4136-1-pshete@nvidia.com>
References: <20210831052834.4136-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ae77144-d30a-4c28-6bef-08d96c4043d3
X-MS-TrafficTypeDiagnostic: CO6PR12MB5476:
X-Microsoft-Antispam-PRVS: <CO6PR12MB547657708C848D5B3A099AE5B7CC9@CO6PR12MB5476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JYHPEQVX1wyBpyLukoh8lHDiWYsmm1rwGGSYo9TH0ALHpU1EdGRVXvlSAHB8xzZj0oqQGRQiXRtNKjIyyHcJYfp2VYGebhvLDHULGKipAKAy/uKt2UgrgMa5fzjAHdcmN2D5ULy3czdJSgl0fgt7awWYmqi4yLM5HFMEgayhCJVnk5xDnA4I2dVcnObToCZVYcje38VNB3xthG1yr68mtac4GU+6b2bwr5aXbUJci7/AdBzCODXE9/qAxSXBpmbcdntlaPgB76mBhD5JIx/l86TAcfTyab39ujLIuD2RJBEHA4vrK9NtLWqbJ92GqEhz1Z+Qwa0Bp9xCHeEtQbjh+3REnhUyeBoZmYuU2AwFdaRfa+k+i6tLpCDy4lewEB2CB8kp6Fu1bfnDTDmFHqOKSaSTl96FuXiftZnc04x4ArD8+UB1PPGDXIeejOSBbyRDIZ+EEkeiYbzpR1ZHDDAVYZxOy6kKZrctfwTT8EQMoEhb9nb2JOuvdDOuza4jUroVMsnAkuYT02mrZ55EPAxD1RbJiczGGCfbMDhKeNNHQkq1QcgqTVFRxC32WYggeVcxwlW004X+3bYEKasgghjvGXhK5voznjC89SxYvEr3sjtOURulWManBB1lQdw5ZDCSp0lgljnnq5UwqR1MACm/CpsM1jq6MAMTlkhPJq+QJjg5W/RRq6TJkGfiGAGRI8NeWBZpnUYLj1eXgvAdHR+o4S0u9s60VmTwlllVMZf9VE=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(4326008)(1076003)(7636003)(6666004)(36756003)(356005)(70206006)(26005)(86362001)(36860700001)(47076005)(5660300002)(70586007)(110136005)(478600001)(336012)(426003)(36906005)(2906002)(83380400001)(316002)(8936002)(82310400003)(2616005)(82740400003)(8676002)(7696005)(54906003)(186003)(107886003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 05:29:11.9382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae77144-d30a-4c28-6bef-08d96c4043d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Laxman Dewangan <ldewangan@nvidia.com>

Implement the pinmux register save and restore for the GPIO
configuration of pins. This helps in changing the pins
configuration for suspend state only.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: pshete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 66 +++++++++++++++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h |  1 +
 2 files changed, 67 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 195cfe557511..7f947c952e09 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -275,6 +275,66 @@ static int tegra_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int tegra_pinctrl_gpio_save_config(struct pinctrl_dev *pctldev,
+					  struct pinctrl_gpio_range *range,
+					  unsigned offset)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	const struct tegra_pingroup *g;
+	unsigned group, num_pins;
+	const unsigned *pins;
+	int ret;
+
+	for (group = 0; group < pmx->soc->ngroups; ++group) {
+		ret = tegra_pinctrl_get_group_pins(pctldev, group, &pins, &num_pins);
+		if (ret < 0 || num_pins != 1)
+			continue;
+		if (offset ==  pins[0])
+			break;
+	}
+
+	if (group == pmx->soc->ngroups) {
+		dev_err(pctldev->dev, "Pingroup not found for pin %u\n", offset);
+		return -EINVAL;
+	}
+
+	g = &pmx->soc->groups[group];
+	if (g->mux_reg >= 0)
+		pmx->gpio_conf[offset] = pmx_readl(pmx, g->mux_bank, g->mux_reg);
+
+	return 0;
+}
+
+static int tegra_pinctrl_gpio_restore_config(struct pinctrl_dev *pctldev,
+					     struct pinctrl_gpio_range *range,
+					     unsigned offset)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+	const struct tegra_pingroup *g;
+	unsigned group, num_pins;
+	const unsigned *pins;
+	int ret;
+
+	for (group = 0; group < pmx->soc->ngroups; ++group) {
+		ret = tegra_pinctrl_get_group_pins(pctldev, group, &pins, &num_pins);
+		if (ret < 0 || num_pins != 1)
+			continue;
+		if (offset == pins[0])
+			break;
+	}
+
+	if (group == pmx->soc->ngroups) {
+		dev_err(pctldev->dev, "Pingroup not found for pin %u\n", offset);
+		return -EINVAL;
+	}
+
+	g = &pmx->soc->groups[group];
+	if (g->mux_reg >= 0)
+		pmx_writel(pmx, pmx->gpio_conf[offset], g->mux_bank, g->mux_reg);
+
+	return 0;
+}
+
 static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
 					     struct pinctrl_gpio_range *range,
 					     unsigned int offset)
@@ -326,6 +386,8 @@ static const struct pinmux_ops tegra_pinmux_ops = {
 	.set_mux = tegra_pinctrl_set_mux,
 	.gpio_request_enable = tegra_pinctrl_gpio_request_enable,
 	.gpio_disable_free = tegra_pinctrl_gpio_disable_free,
+	.gpio_save_config = tegra_pinctrl_gpio_save_config,
+	.gpio_restore_config = tegra_pinctrl_gpio_restore_config,
 };
 
 static int tegra_pinconf_reg(struct tegra_pmx *pmx,
@@ -826,6 +888,10 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	if (!pmx->backup_regs)
 		return -ENOMEM;
 
+	pmx->gpio_conf = devm_kzalloc(&pdev->dev, backup_regs_size, GFP_KERNEL);
+	if (!pmx->gpio_conf)
+		return -ENOMEM;
+
 	for (i = 0; i < pmx->nbanks; i++) {
 		pmx->regs[i] = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR(pmx->regs[i]))
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index fcad7f74c5a2..c08c676bfa03 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -18,6 +18,7 @@ struct tegra_pmx {
 	int nbanks;
 	void __iomem **regs;
 	u32 *backup_regs;
+	u32 *gpio_conf;
 };
 
 enum tegra_pinconf_param {
-- 
2.17.1

