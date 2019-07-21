Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFE16F545
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 21:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbfGUTmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 15:42:05 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15853 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727631AbfGUTlL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 15:41:11 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34bfdd0000>; Sun, 21 Jul 2019 12:41:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 12:41:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 21 Jul 2019 12:41:10 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:41:09 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:41:09 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 21 Jul 2019 19:41:09 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.85]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d34bfd40000>; Sun, 21 Jul 2019 12:41:09 -0700
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
Subject: [PATCH V6 12/21] cpufreq: tegra124: Add suspend and resume support
Date:   Sun, 21 Jul 2019 12:40:51 -0700
Message-ID: <1563738060-30213-13-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563738077; bh=ERM45gzILmBTa9m60jszJM5aBp4VqzLlD5QiVJxaQLQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=NME1X1iTJsBLu1Mi6wjnP50EmLtURbBbGNdHSSYOvhm7CBrXin0jYMspYYKTotsbY
         medU6u9QbGFnlXNmisA3dDS//8X+mk0fWMc4DqS0teHcmTSBOtoLMURehnXI4TOOGK
         SGKn5ddgTyxDXhBYigSHWVruen95P63hm53XQIcB9KZf5B/7qAIRC+sc2yKqNJWaXO
         ylHtfRTr9hT7r9FyFf+h7flv0Bul0YuUQ0r9W5ez5/SSSW6rA87/SeeqBVhUF3gfq+
         oAY15IrjQcqoCe2ydht2MykT9eRNvxikI8MaP+9w+ouq9vnS2Bezt9gVyTQBizWmKX
         dygWqDFahnlbQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds suspend and resume pm ops for cpufreq driver.

PLLP is the safe clock source for CPU during system suspend and
resume as PLLP rate is below the CPU Fmax at Vmin.

CPUFreq driver suspend switches the CPU clock source to PLLP and
disables the DFLL clock.

During system resume, warmboot code powers up the CPU with PLLP
clock source. So CPUFreq driver resume enabled DFLL clock and
switches CPU back to DFLL clock source.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/cpufreq/tegra124-cpufreq.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
index 4f0c637b3b49..4eff63379b0f 100644
--- a/drivers/cpufreq/tegra124-cpufreq.c
+++ b/drivers/cpufreq/tegra124-cpufreq.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/clk.h>
+#include <linux/cpufreq.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -128,8 +129,53 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int tegra124_cpufreq_suspend(struct device *dev)
+{
+	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
+
+	/*
+	 * PLLP rate 408Mhz is below the CPU Fmax at Vmin and is safe to
+	 * use during suspend and resume. So, switch the CPU clock source
+	 * to PLLP and disable DFLL.
+	 */
+	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
+
+	/* disable DFLL clock */
+	clk_disable_unprepare(priv->dfll_clk);
+
+	return 0;
+}
+
+static int tegra124_cpufreq_resume(struct device *dev)
+{
+	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
+	int ret = 0;
+
+	/*
+	 * Warmboot code powers up the CPU with PLLP clock source.
+	 * Enable DFLL clock and switch CPU clock source back to DFLL.
+	 */
+	ret = clk_prepare_enable(priv->dfll_clk);
+	if (ret) {
+		dev_warn(dev, "failed to enable DFLL clock for CPU\n");
+		clk_set_parent(priv->cpu_clk, priv->pllp_clk);
+		disable_cpufreq();
+		return ret;
+	}
+
+	clk_set_parent(priv->cpu_clk, priv->dfll_clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops tegra124_cpufreq_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(tegra124_cpufreq_suspend,
+				tegra124_cpufreq_resume)
+};
+
 static struct platform_driver tegra124_cpufreq_platdrv = {
 	.driver.name	= "cpufreq-tegra124",
+	.driver.pm	= &tegra124_cpufreq_pm_ops,
 	.probe		= tegra124_cpufreq_probe,
 };
 
-- 
2.7.4

