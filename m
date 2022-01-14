Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D2E48F0BC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jan 2022 21:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239761AbiANUBp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jan 2022 15:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiANUBp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jan 2022 15:01:45 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FC6C061574
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jan 2022 12:01:44 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d3so33579756lfv.13
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jan 2022 12:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22iDP+EDN50ukyEGH/TTpJIxd7/X2niB/p91tYDKLDA=;
        b=AMuATPm5PasQvE6isui+RnAVqITgGSW4Kn72845nsUvsYkJ3JfJeEOanSdOn37szhs
         OkWFOLgL2QHCj1BGS8wmgWZZNBxDEAn1DxaLC99QHe5b57JoY1Drooh10Ni95GVTc2LN
         /ezletpZB9yUytof8L61rRUd+XS8A5dvM8HyfVNWFOLv61CqYa0tFraeRk2e6F+s6wUy
         hi2UWWUyR9TQufwoBkdX4AQZDW8L7Jpu3A1XFGQ1vDRFYJ+UiL9nnEdrHPwgP/jYt8ow
         YPzlDYxNNQjpwdiLkFRarp4qXwVXnhEdSV4iIxIDkMrfgGg1CKVRFeDvUo0HY1hSvzgH
         ltzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22iDP+EDN50ukyEGH/TTpJIxd7/X2niB/p91tYDKLDA=;
        b=rgTxf3BbV60Vz2l3+WoKg9DJ+KdfLCN74pV5lTbrBA1oLnmwFuAW7O37mvO1melJDP
         2HWDpBmx//GqCrT2kcGHFi49n3C6iiqrMJM6cq6v927tFj3SiakxBvzppDAcAJtOS2+k
         UOPqney5q4kFiLI5PNqgj+x0B4RRbNa+WMWEycqXoxJTJryVVs5iD2e3LsY2Gdb+aOFl
         tvS0SgXevT/f3PccIlQO+SqhLj7VYlE98mMJJb3NKozwy9s0DM8CZxEAv0aCJWbgGDFW
         XYOdy6D7cHLKrhGIfI2VbGIXOjmAZrYTYPYkMdpbWK5V9aba/7Lor3TcUL7XRomb7h4/
         XTGg==
X-Gm-Message-State: AOAM53381AbJZ9itoFJ8/OqCBdfDhwpbapUuCwYwK/HRpEERbdPKIxX5
        2BuDVVf62WK7FQSW7MHp0UKu
X-Google-Smtp-Source: ABdhPJw564LeP2pqVJH41ORvW/RP3d3ffJVtHjeWuq5NQF+p2Rmd956t6SuicFpvCkQIjZemfLfNVg==
X-Received: by 2002:a05:6512:12d5:: with SMTP id p21mr7609176lfg.569.1642190502785;
        Fri, 14 Jan 2022 12:01:42 -0800 (PST)
Received: from localhost.localdomain (public-gprs377099.centertel.pl. [37.47.104.76])
        by smtp.gmail.com with ESMTPSA id v13sm647444ljv.124.2022.01.14.12.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 12:01:42 -0800 (PST)
From:   Lukasz Bartosik <lb@semihalf.com>
X-Google-Original-From: Lukasz Bartosik <lukasz.bartosik@semihalf.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v1] pinctrl: intel: fix unexpected interrupt
Date:   Fri, 14 Jan 2022 21:01:38 +0100
Message-Id: <20220114200138.28254-1-lukasz.bartosik@semihalf.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Łukasz Bartosik <lb@semihalf.com>

ASUS Chromebook C223 with Celeron N3350 crashes sometimes during
cold booot. Inspection of the kernel log showed that it gets into
an inifite loop logging the following message:

->handle_irq():  000000009cdb51e8, handle_bad_irq+0x0/0x251
->irq_data.chip(): 000000005ec212a7, 0xffffa043009d8e7
->action(): 00000
   IRQ_NOPROBE set
unexpected IRQ trap at vector 7c

The issue happens during cold boot but only if cold boot happens
at most several dozen seconds after Chromebook is powered off. For
longer intervals between power off and power on (cold boot) the issue
does not reproduce. The unexpected interrupt is sourced from INT3452
GPIO pin which is used for SD card detect. Investigation relevealed
that when the interval between power off and power on (cold boot)
is less than several dozen seconds then values of INT3452 GPIO interrupt
enable and interrupt pending registers survive power off and power
on sequence and interrupt for SD card detect pin is enabled and pending
during probe of SD controller which causes the unexpected IRQ message.
"Intel Pentium and Celeron Processor N- and J- Series" volume 3 doc
mentions that GPIO interrupt enable and status registers default
value is 0x0.
The fix clears INT3452 GPIO interrupt enabled and interrupt pending
registers in its probe function.

Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
Signed-off-by: Łukasz Bartosik <lb@semihalf.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 46 +++++++++++++++------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index b6ef1911c1dd..b8282d5f485e 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1428,6 +1428,26 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 	return 0;
 }
 
+static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
+{
+	size_t i;
+
+	for (i = 0; i < pctrl->ncommunities; i++) {
+		const struct intel_community *community;
+		void __iomem *base;
+		unsigned int gpp;
+
+		community = &pctrl->communities[i];
+		base = community->regs;
+
+		for (gpp = 0; gpp < community->ngpps; gpp++) {
+			/* Mask and clear all interrupts */
+			writel(0, base + community->ie_offset + gpp * 4);
+			writel(0xffff, base + community->is_offset + gpp * 4);
+		}
+	}
+}
+
 static int intel_pinctrl_probe(struct platform_device *pdev,
 			       const struct intel_pinctrl_soc_data *soc_data)
 {
@@ -1488,6 +1508,12 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 			return ret;
 	}
 
+	/*
+	 * Make sure the interrupt lines are in a proper state before
+	 * further configuration
+	 */
+	intel_gpio_irq_init(pctrl);
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -1640,26 +1666,6 @@ int intel_pinctrl_suspend_noirq(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(intel_pinctrl_suspend_noirq);
 
-static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
-{
-	size_t i;
-
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		const struct intel_community *community;
-		void __iomem *base;
-		unsigned int gpp;
-
-		community = &pctrl->communities[i];
-		base = community->regs;
-
-		for (gpp = 0; gpp < community->ngpps; gpp++) {
-			/* Mask and clear all interrupts */
-			writel(0, base + community->ie_offset + gpp * 4);
-			writel(0xffff, base + community->is_offset + gpp * 4);
-		}
-	}
-}
-
 static bool intel_gpio_update_reg(void __iomem *reg, u32 mask, u32 value)
 {
 	u32 curr, updated;
-- 
2.34.1.703.g22d0c6ccf7-goog

