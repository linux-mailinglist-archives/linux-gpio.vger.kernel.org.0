Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB9486E4F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 01:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404941AbfHHXrG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 19:47:06 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:12834 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404842AbfHHXrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 19:47:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4cb47a0000>; Thu, 08 Aug 2019 16:47:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 08 Aug 2019 16:47:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 08 Aug 2019 16:47:04 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 23:47:04 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 23:47:04 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 8 Aug 2019 23:47:04 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.110]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d4cb4770007>; Thu, 08 Aug 2019 16:47:04 -0700
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
        <digetx@gmail.com>, <devicetree@vger.kernel.org>,
        <rjw@rjwysocki.net>, <viresh.kumar@linaro.org>,
        <linux-pm@vger.kernel.org>
Subject: [PATCH v8 11/21] clk: tegra: clk-dfll: Add suspend and resume support
Date:   Thu, 8 Aug 2019 16:46:50 -0700
Message-ID: <1565308020-31952-12-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565308026; bh=ZmXQG3uKkfyAQI4tPlaiZSRJU0Jj7WxxNukinw2sjd0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=pN4TEGpT5neEasaIDCorZX7dErxt9ghpNf8CWAusUGoPpSfYMv7ONNcZvaQAcF2TE
         yjErBWa8fSDKCvZWgA5/6Fh87hb5VaoDNDcSCXpCqJd1XrjaYfBAuxSJQAFjc3eB1o
         SsbTf6z7iBT4PQK+Q8S02T6ptVxHHnmOD7Cc/dzKvP/nHxb1S7SIUqhWXB8oqg36fi
         1ppWVw+R5/ZmH5GmVjpUKoYlSxoxDpTdL3aQt88PKa1xgj7HpyljGXT2ZJqDk/ktYq
         NUR5dyzamnQtGiLHTe06/8OcuFsL/Oc8UOBQjd2Czm/zx9lpM6Rf/OmWy82nczTG4f
         TIs5VHT6N1Qjg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements DFLL suspend and resume operation.

During system suspend entry, CPU clock will switch CPU to safe
clock source of PLLP and disables DFLL clock output.

DFLL driver suspend confirms DFLL disable state and errors out on
being active.

DFLL is re-initialized during the DFLL driver resume as it goes
through complete reset during suspend entry.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-dfll.c               | 56 ++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-dfll.h               |  2 ++
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |  1 +
 3 files changed, 59 insertions(+)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index f8688c2ddf1a..eb298a5d7be9 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1487,6 +1487,7 @@ static int dfll_init(struct tegra_dfll *td)
 	td->last_unrounded_rate = 0;
 
 	pm_runtime_enable(td->dev);
+	pm_runtime_irq_safe(td->dev);
 	pm_runtime_get_sync(td->dev);
 
 	dfll_set_mode(td, DFLL_DISABLED);
@@ -1513,6 +1514,61 @@ static int dfll_init(struct tegra_dfll *td)
 	return ret;
 }
 
+/**
+ * tegra_dfll_suspend - check DFLL is disabled
+ * @dev: DFLL device *
+ *
+ * DFLL clock should be disabled by the CPUFreq driver. So, make
+ * sure it is disabled and disable all clocks needed by the DFLL.
+ */
+int tegra_dfll_suspend(struct device *dev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(dev);
+
+	if (dfll_is_running(td)) {
+		dev_err(td->dev, "dfll is enabled while shouldn't be\n");
+		return -EBUSY;
+	}
+
+	reset_control_assert(td->dvco_rst);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_dfll_suspend);
+
+/**
+ * tegra_dfll_resume - reinitialize DFLL on resume
+ * @dev: DFLL instance
+ *
+ * DFLL is disabled and reset during suspend and resume.
+ * So, reinitialize the DFLL IP block back for use.
+ * DFLL clock is enabled later in closed loop mode by CPUFreq
+ * driver before switching its clock source to DFLL output.
+ */
+int tegra_dfll_resume(struct device *dev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(dev);
+
+	reset_control_deassert(td->dvco_rst);
+
+	pm_runtime_get_sync(td->dev);
+
+	dfll_set_mode(td, DFLL_DISABLED);
+	dfll_set_default_params(td);
+
+	if (td->soc->init_clock_trimmers)
+		td->soc->init_clock_trimmers();
+
+	dfll_set_open_loop_config(td);
+
+	dfll_init_out_if(td);
+
+	pm_runtime_put_sync(td->dev);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_dfll_resume);
+
 /*
  * DT data fetch
  */
diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index 1b14ebe7268b..fb209eb5f365 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -42,5 +42,7 @@ int tegra_dfll_register(struct platform_device *pdev,
 struct tegra_dfll_soc_data *tegra_dfll_unregister(struct platform_device *pdev);
 int tegra_dfll_runtime_suspend(struct device *dev);
 int tegra_dfll_runtime_resume(struct device *dev);
+int tegra_dfll_suspend(struct device *dev);
+int tegra_dfll_resume(struct device *dev);
 
 #endif /* __DRIVERS_CLK_TEGRA_CLK_DFLL_H */
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index e84b6d52cbbd..2ac2679d696d 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -631,6 +631,7 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
 static const struct dev_pm_ops tegra124_dfll_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_dfll_runtime_suspend,
 			   tegra_dfll_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_dfll_suspend, tegra_dfll_resume)
 };
 
 static struct platform_driver tegra124_dfll_fcpu_driver = {
-- 
2.7.4

