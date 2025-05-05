Return-Path: <linux-gpio+bounces-19636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9937AAB6D6
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6313A6FE1
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 05:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E09544737D;
	Tue,  6 May 2025 00:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdWdDeV2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED073745A5;
	Mon,  5 May 2025 22:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485936; cv=none; b=o56+D2lHnTdiNyi8Y6lLVGVhGWAEzGDxDi9bT/zhvMKGwplPI/77BCqByq7cne0VvTS5rKMIIRI/m+eGaSQ4UG0dKCU4anzSB90FiP7gjW2cuBAjUpc92pstUFRNvDZTqvMQ404fGKqOJNEYiH710wJWoG8LfmaxXtHVyhufM30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485936; c=relaxed/simple;
	bh=rOo8j2xsQXpsL82NQglsa2dm1Nhqx7YdR2/zchL6+xw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ijIr8AqH5v7i0EZ3YvaTN20mKEAbnflfNV2973vIOSMwRfo2Js8tDpx6qMIZNPPkOSKadLuD23IkHK2i/Fmn1eqKFwdhBXdSgkYHjiyAHX1zJpF4+UzeXq1MeJEykTj3RwZk0TIQVigZxlanhDKAmTEka8dmWL+o4UHP7HqKKLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdWdDeV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32C4C4CEE4;
	Mon,  5 May 2025 22:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485936;
	bh=rOo8j2xsQXpsL82NQglsa2dm1Nhqx7YdR2/zchL6+xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hdWdDeV22HCRz9/iITCEYS9i19b0Mktg24weWKu2z2Yp1Ft/C4uWY50q8WtNX4SjN
	 IPJzweayWLXzzEzFi2WXkmyzqOxhMD8XMis/J+KxYxn9IvD6ueiv6pRSZFz91MQOCI
	 nwrAFMfntwdIkS1uthW+DOdbDbPuNicGwkjQ67b9E8J/mniLDjGs5gHaSR2MnAkBN8
	 Ovx/xt6jYO6UtoK2AXCNlSpwC8OkdssSy8I+1m3rbt2LUcGox0SqlixgCBKQO8c7Xk
	 iXqNy0HJj6xFn/7rPmw9FGB9A5h67bRsXsh0fjBRxdGEPWco0OwjPnHD6u9hK9wfut
	 7I2z36JD4nAQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Prathamesh Shete <pshete@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	brgl@bgdev.pl,
	peng.fan@nxp.com,
	kunwu.chan@linux.dev,
	dan.carpenter@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 074/294] pinctrl-tegra: Restore SFSEL bit when freeing pins
Date: Mon,  5 May 2025 18:52:54 -0400
Message-Id: <20250505225634.2688578-74-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Prathamesh Shete <pshete@nvidia.com>

[ Upstream commit c12bfa0fee65940b10ff5187349f76c6f6b1df9c ]

Each pin can be configured as a Special Function IO (SFIO) or GPIO,
where the SFIO enables the pin to operate in alternative modes such as
I2C, SPI, etc.

The current implementation sets all the pins back to SFIO mode
even if they were initially in GPIO mode. This can cause glitches
on the pins when pinctrl_gpio_free() is called.

Avoid these undesired glitches by storing the pin's SFIO/GPIO
state on GPIO request and restoring it on GPIO free.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Link: https://lore.kernel.org/20250305104939.15168-2-pshete@nvidia.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 59 +++++++++++++++++++++++----
 drivers/pinctrl/tegra/pinctrl-tegra.h |  6 +++
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 7c12a3470642c..1350ab56fbc03 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -280,8 +280,8 @@ static int tegra_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *pctldev,
-					unsigned int offset)
+static int tegra_pinctrl_get_group_index(struct pinctrl_dev *pctldev,
+					 unsigned int offset)
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	unsigned int group, num_pins, j;
@@ -294,12 +294,35 @@ static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *
 			continue;
 		for (j = 0; j < num_pins; j++) {
 			if (offset == pins[j])
-				return &pmx->soc->groups[group];
+				return group;
 		}
 	}
 
-	dev_err(pctldev->dev, "Pingroup not found for pin %u\n", offset);
-	return NULL;
+	return -EINVAL;
+}
+
+static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *pctldev,
+							    unsigned int offset,
+							    int group_index)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+
+	if (group_index < 0 || group_index > pmx->soc->ngroups)
+		return NULL;
+
+	return &pmx->soc->groups[group_index];
+}
+
+static struct tegra_pingroup_config *tegra_pinctrl_get_group_config(struct pinctrl_dev *pctldev,
+								    unsigned int offset,
+								    int group_index)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+
+	if (group_index < 0)
+		return NULL;
+
+	return &pmx->pingroup_configs[group_index];
 }
 
 static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
@@ -308,12 +331,15 @@ static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	const struct tegra_pingroup *group;
+	struct tegra_pingroup_config *config;
+	int group_index;
 	u32 value;
 
 	if (!pmx->soc->sfsel_in_mux)
 		return 0;
 
-	group = tegra_pinctrl_get_group(pctldev, offset);
+	group_index = tegra_pinctrl_get_group_index(pctldev, offset);
+	group = tegra_pinctrl_get_group(pctldev, offset, group_index);
 
 	if (!group)
 		return -EINVAL;
@@ -321,7 +347,11 @@ static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
 	if (group->mux_reg < 0 || group->sfsel_bit < 0)
 		return -EINVAL;
 
+	config = tegra_pinctrl_get_group_config(pctldev, offset, group_index);
+	if (!config)
+		return -EINVAL;
 	value = pmx_readl(pmx, group->mux_bank, group->mux_reg);
+	config->is_sfsel = (value & BIT(group->sfsel_bit)) != 0;
 	value &= ~BIT(group->sfsel_bit);
 	pmx_writel(pmx, value, group->mux_bank, group->mux_reg);
 
@@ -334,12 +364,15 @@ static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	const struct tegra_pingroup *group;
+	struct tegra_pingroup_config *config;
+	int group_index;
 	u32 value;
 
 	if (!pmx->soc->sfsel_in_mux)
 		return;
 
-	group = tegra_pinctrl_get_group(pctldev, offset);
+	group_index = tegra_pinctrl_get_group_index(pctldev, offset);
+	group = tegra_pinctrl_get_group(pctldev, offset, group_index);
 
 	if (!group)
 		return;
@@ -347,8 +380,12 @@ static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
 	if (group->mux_reg < 0 || group->sfsel_bit < 0)
 		return;
 
+	config = tegra_pinctrl_get_group_config(pctldev, offset, group_index);
+	if (!config)
+		return;
 	value = pmx_readl(pmx, group->mux_bank, group->mux_reg);
-	value |= BIT(group->sfsel_bit);
+	if (config->is_sfsel)
+		value |= BIT(group->sfsel_bit);
 	pmx_writel(pmx, value, group->mux_bank, group->mux_reg);
 }
 
@@ -785,6 +822,12 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	pmx->dev = &pdev->dev;
 	pmx->soc = soc_data;
 
+	pmx->pingroup_configs = devm_kcalloc(&pdev->dev,
+					     pmx->soc->ngroups, sizeof(*pmx->pingroup_configs),
+					     GFP_KERNEL);
+	if (!pmx->pingroup_configs)
+		return -ENOMEM;
+
 	/*
 	 * Each mux group will appear in 4 functions' list of groups.
 	 * This over-allocates slightly, since not all groups are mux groups.
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index b3289bdf727d8..b97136685f7a8 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -8,6 +8,10 @@
 #ifndef __PINMUX_TEGRA_H__
 #define __PINMUX_TEGRA_H__
 
+struct tegra_pingroup_config {
+	bool is_sfsel;
+};
+
 struct tegra_pmx {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
@@ -21,6 +25,8 @@ struct tegra_pmx {
 	int nbanks;
 	void __iomem **regs;
 	u32 *backup_regs;
+	/* Array of size soc->ngroups */
+	struct tegra_pingroup_config *pingroup_configs;
 };
 
 enum tegra_pinconf_param {
-- 
2.39.5


