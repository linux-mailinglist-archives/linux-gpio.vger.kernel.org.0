Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D354B4FFF5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 05:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfFXDDO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 23:03:14 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13181 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfFXDDN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jun 2019 23:03:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d103d6f0000>; Sun, 23 Jun 2019 20:03:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 23 Jun 2019 20:03:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 23 Jun 2019 20:03:12 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Jun
 2019 03:03:11 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Jun 2019 03:03:12 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.174.126]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d103d6d0000>; Sun, 23 Jun 2019 20:03:12 -0700
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
Subject: [PATCH V4 03/18] gpio: tegra: use resume_noirq for tegra gpio resume
Date:   Sun, 23 Jun 2019 20:02:44 -0700
Message-ID: <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561345391; bh=sRe8u/ipKpVvaQoBwoDn3g0xn32P0M0SuS3aAzlESxI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=MCDvEj2hfTBiQwprqPOCEEpybnoW7OecF4panZAyYbSramhqrAS2e8kHgAIBCj1tl
         njduCX2jTV1tc5vmJMbjiL9af/ZHS1V6cIz2XIC49nt6c8RtDnL2XP+RE4W9mS18yq
         bU23/GPUf2/nSKdYHjKQBQTiw1AcQWRaNHugFy7qBtroGtLrNxeh1FzMkqbXaZTgnP
         G45oTnaobBikSHIHe3LhdfvoFibQLxjpoMN1XPrXxkBJjswMBjWkzkZKiN9wOumekI
         LjEIyVOLDZwZEE0NsdQOMbySCnlW51+DkjFgXNqt/K/lUNJzsN+UlNHkYacXX6zm6S
         vvBC6wn/y6kiw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During SC7 resume, PARKED bit clear from the pinmux registers may
cause a glitch on the GPIO lines.

So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
to keep the GPIO lines in a known good state prior to clearing PARKED
bit.

This patch has fix for this by moving Tegra GPIOs restore to happen
very early than pinctrl resume.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index f57bfc07ae22..f427540568f9 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -410,7 +410,7 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int tegra_gpio_resume(struct device *dev)
+static int tegra_gpio_resume_noirq(struct device *dev)
 {
 	struct tegra_gpio_info *tgi = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -554,7 +554,8 @@ static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 #endif
 
 static const struct dev_pm_ops tegra_gpio_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
+	.suspend = tegra_gpio_suspend,
+	.resume_noirq = tegra_gpio_resume_noirq
 };
 
 static int tegra_gpio_probe(struct platform_device *pdev)
-- 
2.7.4

