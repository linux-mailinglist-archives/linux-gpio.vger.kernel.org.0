Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2B9497FFD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 13:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242425AbiAXMzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 07:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiAXMzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 07:55:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7718BC06173B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 04:55:40 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id n8so8635305lfq.4
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 04:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K3jX6KNYLxVVfU+757neaubNFT0zhWBBXzq1lJf6lfc=;
        b=3P3PYKC4/iJ0Aqmma1TeD+h4BQSq4L0ZwGq5Br6kyElf1fnBYPUrBewxP+i9ConvAK
         hpm+yUMWKuY7McGxGzqdojqSyq4WrywSkc0nqqs9MbBTlTyvCm8wcu52w7KkYUALMUj2
         xu5aH0NwZ+rFhtkY6aYSP9pJLJMLDBmWG31u1hV2vi+W6YTFjRpENIZ9/oOdttuU7dh9
         doSE+fwDx0Pw6BcVSEixEm8IxyLm0fsbefXiQS0v4BwtALqznPChL8TXey3Ki5Om0+ZN
         rxAKklRmrgPwOu9W25E/O216Mv+1J2/3hlI6zNzDjxxzDEkhI1oYF0JUOji42aptVXB2
         /BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K3jX6KNYLxVVfU+757neaubNFT0zhWBBXzq1lJf6lfc=;
        b=yZJoqNwI/2rB74DkQCUignXlVsDgLFI+bddkPgmBx6nPm6FftDdQ9gB++Zet9JDEGL
         jOAcJhAI5w5l2xskY1lITTHPdR/BdMblLfH8/gSmwcD0uVjCkbqNRyXzSC0GBDdssIS4
         Lke25PQewjDipdKhPAiJ5uYUhtendWwCxBaK9NuhF3MUgIrzmhWlr723ufwfguhr5o8+
         5GOiIKyCJXkN4z+IYbwSBTodhxo0vj454TseYhBpFa6uq+/X8z+cR5/yyWZJsjI1MW+9
         i2vFNVOBVFtiA0FUjwwyMXOsx7vKjpdqyPeyBKmK3KdPdp3Af3GorAt41mt2Ly2qYqq3
         ZG3A==
X-Gm-Message-State: AOAM530rpjVVOjzk3mU8SUVZOEKxK/OZwatqGa6xjrYUm65fydOvcrS8
        je8m8LW1fvp9riYBHEI06g7LccaUd1TpyEE=
X-Google-Smtp-Source: ABdhPJz9Q5MFc+ERz2BKftgcakUFO2e5sI83doJVbtN2em7AptC1GktUX2ASU1yCxDLqtF53X2k7lA==
X-Received: by 2002:a05:6512:925:: with SMTP id f5mr13067662lft.282.1643028938756;
        Mon, 24 Jan 2022 04:55:38 -0800 (PST)
Received: from localhost.localdomain (public-gprs377729.centertel.pl. [37.47.106.194])
        by smtp.gmail.com with ESMTPSA id q7sm313569lfp.63.2022.01.24.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 04:55:37 -0800 (PST)
From:   Lukasz Bartosik <lb@semihalf.com>
X-Google-Original-From: Lukasz Bartosik <lukasz.bartosik@semihalf.com>
To:     Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v2] pinctrl: intel: fix unexpected interrupt
Date:   Mon, 24 Jan 2022 13:55:29 +0100
Message-Id: <20220124125529.20432-1-lukasz.bartosik@semihalf.com>
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
 drivers/pinctrl/intel/pinctrl-intel.c | 54 +++++++++++++++++----------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index b6ef1911c1dd..12bad1a9aa9c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1268,6 +1268,39 @@ static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 	return ngpio;
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
+static int init_hw(struct gpio_chip *gc)
+{
+	struct intel_pinctrl *pctrl = container_of(gc, struct intel_pinctrl,
+						   chip);
+	/*
+	 * Make sure the interrupt lines are in a proper state before
+	 * further configuration
+	 */
+	intel_gpio_irq_init(pctrl);
+
+	return 0;
+}
+
 static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 {
 	int ret;
@@ -1311,6 +1344,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	girq->num_parents = 0;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
+	girq->init_hw = init_hw;
 
 	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
@@ -1640,26 +1674,6 @@ int intel_pinctrl_suspend_noirq(struct device *dev)
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
2.35.0.rc0.227.g00780c9af4-goog

