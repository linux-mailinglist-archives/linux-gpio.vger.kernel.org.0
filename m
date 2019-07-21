Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62BE96F53B
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 21:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfGUTlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 15:41:11 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9007 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727625AbfGUTlJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 15:41:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34bfd20001>; Sun, 21 Jul 2019 12:41:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 12:41:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 21 Jul 2019 12:41:08 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:41:08 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:41:08 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 21 Jul 2019 19:41:07 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.85]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d34bfd20001>; Sun, 21 Jul 2019 12:41:08 -0700
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
Subject: [PATCH V6 11/21] clk: tegra: clk-dfll: Add suspend and resume support
Date:   Sun, 21 Jul 2019 12:40:50 -0700
Message-ID: <1563738060-30213-12-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563738066; bh=9ijUqrJ/k0zBr3NzGVytMDfceIsaTvOJsIgwEsZOjyU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=o7K0FD3hUXnH6w7/M9TkXLZDDz9Ew8X7EVG+DkLNNEr3rd0RdW2kCQ5kB0yKqkRW4
         XQFgIzKrMeRO+LF4be7clX3hhGMRa3CdvaAEi65MvljhDP72lGqlr277ACf4/JYohY
         XxTcwl0VXlyYlP2QKUPWK68/0WWkx0O6IkMI8eFWfxwpl7NDxnR4GsHLI7ADdxB7Zk
         t5FtA/5/VcyqZ3BymBmZmR5yPZfHUXTjRQTCBDKrCgmvV96D5TbRW7c9hdx+OGgbSv
         Ad9xL/RVcgtP7wxYBxH21z7TdZUSexd/Mx1OHNR1pe12rUPEP8Rz8WB4TtmBMHHhyi
         xwwh8bglRjFjw==
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

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-dfll.c               | 44 ++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-dfll.h               |  2 ++
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |  1 +
 3 files changed, 47 insertions(+)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index f8688c2ddf1a..7dcad4ccd0ae 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1513,6 +1513,50 @@ static int dfll_init(struct tegra_dfll *td)
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
+		dev_warn(td->dev, "failed disabling the dfll\n");
+		return -EBUSY;
+	}
+
+	pm_runtime_disable(dev);
+
+	clk_unprepare(td->ref_clk);
+	clk_unprepare(td->soc_clk);
+	clk_unprepare(td->i2c_clk);
+
+	reset_control_assert(td->dvco_rst);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_dfll_suspend);
+
+/**
+ * tegra_dfll_resume - reinitialize DFLL on resume
+ * @pdev: DFLL instance
+ *
+ * Re-initialize DFLL on resume as it gets disabled and reset during
+ * suspend entry. DFLL clock is enabled in closed loop mode later
+ * and CPU frequency will be switched to DFLL output.
+ */
+int tegra_dfll_resume(struct device *dev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(dev);
+
+	return dfll_init(td);
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

