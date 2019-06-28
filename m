Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3E7590A4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfF1COh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:14:37 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17614 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbfF1CNh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577ce0000>; Thu, 27 Jun 2019 19:13:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 27 Jun 2019 19:13:35 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:34 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:34 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:34 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577ce0002>; Thu, 27 Jun 2019 19:13:34 -0700
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
Subject: [PATCH V5 08/18] clk: tegra: Add suspend resume support for DFLL
Date:   Thu, 27 Jun 2019 19:12:42 -0700
Message-ID: <1561687972-19319-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688014; bh=dps+xdpNYqPp4cSiwoi1+rWcYiqKiL43QEvLjCGhFJY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=njilldqndHtEh9BLnwi0r+GhoSuQpcuNohDMCN8MwQDfHyooYR10Hs/teKY3E8LAQ
         hRPzmidxR71jdttUwIdZnFWEyuqWbQHirDZraeVMJcQj8/TiPBpintC+dvQUBAJ+tc
         qW2EM+Zdne/10N+uSqBilqG+TUwknAy5Qgd5kBgo8hlz07vfMAsGVHSI3Hp3pqWXbT
         RsKz8W0U+O3DUiLQESy4w19oLYuOqBXkmeFEPtVFnlnR4ik8d8ZyLHYyuJJQBjy7F0
         0icroQtj8p3MTGOnmqC0dsl6bxaRuEfLAGwS9y/Pr6yrFWDkxmMPtnVvCrEcQqL40x
         RkRvayrYU2kgQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch creates APIs for supporting Tegra210 clock driver to
perform DFLL suspend and resume operation.

During suspend, DFLL mode is saved and on resume Tegra210 clock driver
invokes DFLL resume API to re-initialize DFLL to enable target device
clock in open loop mode or closed loop mode.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-dfll.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-dfll.h |  2 ++
 2 files changed, 80 insertions(+)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index f8688c2ddf1a..a1f37cf99b00 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -277,6 +277,7 @@ struct tegra_dfll {
 	unsigned long			dvco_rate_min;
 
 	enum dfll_ctrl_mode		mode;
+	enum dfll_ctrl_mode		resume_mode;
 	enum dfll_tune_range		tune_range;
 	struct dentry			*debugfs_dir;
 	struct clk_hw			dfll_clk_hw;
@@ -1864,6 +1865,83 @@ static int dfll_fetch_common_params(struct tegra_dfll *td)
 }
 
 /*
+ * tegra_dfll_suspend
+ * @pdev: DFLL instance
+ *
+ * dfll controls clock/voltage to other devices, including CPU. Therefore,
+ * dfll driver pm suspend callback does not stop cl-dvfs operations.
+ */
+void tegra_dfll_suspend(struct platform_device *pdev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
+
+	if (!td)
+		return;
+
+	if (td->mode <= DFLL_DISABLED)
+		return;
+
+	td->resume_mode = td->mode;
+	switch (td->mode) {
+	case DFLL_CLOSED_LOOP:
+		dfll_set_mode(td, DFLL_CLOSED_LOOP);
+		dfll_set_frequency_request(td, &td->last_req);
+
+		dfll_unlock(td);
+		break;
+	default:
+		break;
+	}
+}
+
+/**
+ * tegra_dfll_resume - reprogram the DFLL after context-loss
+ * @pdev: DFLL instance
+ *
+ * Re-initialize and enable target device clock in open loop mode. Called
+ * directly from SoC clock resume syscore operation. Closed loop will be
+ * re-entered in platform syscore ops as well after CPU clock source is
+ * switched to DFLL in open loop.
+ */
+void tegra_dfll_resume(struct platform_device *pdev, bool on_dfll)
+{
+	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
+
+	if (!td)
+		return;
+
+	if (on_dfll) {
+		if (td->resume_mode == DFLL_CLOSED_LOOP)
+			dfll_lock(td);
+		td->resume_mode = DFLL_DISABLED;
+		return;
+	}
+
+	reset_control_deassert(td->dvco_rst);
+
+	pm_runtime_get(td->dev);
+
+	/* Re-init DFLL */
+	dfll_init_out_if(td);
+	dfll_set_default_params(td);
+	dfll_set_open_loop_config(td);
+
+	pm_runtime_put(td->dev);
+
+	/* Restore last request and mode up to open loop */
+	switch (td->resume_mode) {
+	case DFLL_CLOSED_LOOP:
+	case DFLL_OPEN_LOOP:
+		dfll_set_mode(td, DFLL_OPEN_LOOP);
+		if (td->pmu_if == TEGRA_DFLL_PMU_I2C)
+			dfll_i2c_set_output_enabled(td, false);
+		break;
+	default:
+		break;
+	}
+}
+
+/*
  * API exported to per-SoC platform drivers
  */
 
diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index 1b14ebe7268b..c21fc2061a20 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -40,6 +40,8 @@ struct tegra_dfll_soc_data {
 int tegra_dfll_register(struct platform_device *pdev,
 			struct tegra_dfll_soc_data *soc);
 struct tegra_dfll_soc_data *tegra_dfll_unregister(struct platform_device *pdev);
+void tegra_dfll_suspend(struct platform_device *pdev);
+void tegra_dfll_resume(struct platform_device *pdev, bool on_dfll);
 int tegra_dfll_runtime_suspend(struct device *dev);
 int tegra_dfll_runtime_resume(struct device *dev);
 
-- 
2.7.4

