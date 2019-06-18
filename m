Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A726449B67
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbfFRHsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:48:11 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9689 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfFRHqp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:46:45 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896e30000>; Tue, 18 Jun 2019 00:46:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:46:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Jun 2019 00:46:43 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:46:42 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:46:43 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896e00007>; Tue, 18 Jun 2019 00:46:43 -0700
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
Subject: [PATCH V3 03/17] gpio: tegra: use resume_noirq for tegra gpio resume
Date:   Tue, 18 Jun 2019 00:46:17 -0700
Message-ID: <1560843991-24123-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844003; bh=Pr7vcEZPGjVmliq8J2fR0U6t7tGM+0Ul14bqoyMQjC8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=jGud0Hqrlsdyja3FOUV8qfAb9/4AjvqCEy+IDTOk/kPu0lNqbprnH2jFYsLQ4EC5M
         U2XSv8t087I75tzlOkfwctsi3NmUotvna3lIkYSONSLYoWWajX7GNafV4+ij8tpezF
         Mw21p5uJU43qufboDfyCleg0SIxnndHAaIuEfzG3uxMZ4GngvKLsFr1gqyOoL5mfz/
         ZIIlbj//xqDWBmrgy0f0kG3dkuJK60yGyVn/1wLQh0evQ4krDB4UBltD2YKosfW8x2
         oIH+nwZG7THKehLdRSGrpseyWT9MvJKabRplQJimonT1jpJvL/nmvPIWAd6V0jI6iT
         tSRzL8xFaF20Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During SC7 resume, PARKED bit clear from the pinmux registers may
cause a glitch on the GPIO lines.

So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
to keep the GPIO lines in a known good state prior to clearing PARKED
bit.

This patch has fix for this by moving Tegra GPIO restore to happen
during resume_noirq.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index f57bfc07ae22..f3c58c597ab9 100644
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
@@ -506,6 +506,15 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 
 	return irq_set_irq_wake(bank->irq, enable);
 }
+
+static const struct dev_pm_ops tegra_gpio_pm_ops = {
+	.suspend = &tegra_gpio_suspend,
+	.resume_noirq = &tegra_gpio_resume_noirq
+};
+
+#define TEGRA_GPIO_PM	(&tegra_gpio_pm_ops)
+#else
+#define TEGRA_GPIO_PM	NULL
 #endif
 
 #ifdef	CONFIG_DEBUG_FS
@@ -553,10 +562,6 @@ static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 
 #endif
 
-static const struct dev_pm_ops tegra_gpio_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
-};
-
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	struct tegra_gpio_info *tgi;
@@ -706,7 +711,7 @@ static const struct of_device_id tegra_gpio_of_match[] = {
 static struct platform_driver tegra_gpio_driver = {
 	.driver		= {
 		.name	= "tegra-gpio",
-		.pm	= &tegra_gpio_pm_ops,
+		.pm	= TEGRA_GPIO_PM,
 		.of_match_table = tegra_gpio_of_match,
 	},
 	.probe		= tegra_gpio_probe,
-- 
2.7.4

