Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2ADA2F70D4
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 04:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732392AbhAODSH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 22:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbhAODSG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 22:18:06 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5624CC0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 19:16:47 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id p15so4179680pjv.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 19:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p7zpEv9oX6ykv/tex0korxEUMq0epw7wPN0O1ExTQX8=;
        b=Is14NoFFfR8v8M7Cz3eZV3HjrWwyyOwBOCc3Ir9fEePREURL/bjtO/Nus6fbQEL7L5
         L+bg/5B5rbsSt+nyY5uq2AEL7jvR8/u6ruXJf7y7oa5zHBakB/6EPltdqJqsxmonwON3
         /fPiPjG4ZZmw4QT1+/f5q/C0xn2LcVAWOrhZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7zpEv9oX6ykv/tex0korxEUMq0epw7wPN0O1ExTQX8=;
        b=ildtoX00HIoFWMrBj3qCssQp8a/Cb6UL3hqfSDoeS2J25CWlWEuiu9WFvQVC7IG5Ud
         j5QUToXA4LWllT3fnVs9qfzdJDTtXEiZpSbQE0TrrcWsrWW8Ac8ma/iN/G98sgCCl2OY
         PfI3UcvKdP0g7zPn+WFYBjhLmhUxbJreMukxpIoVjx+MWA2qgMnN2UGhZMZIUOQiRzPO
         ctAGqyVQEQI/cwnf0zU/2WKlIQ4G8StfpWO2DYli9meNTnKf+k/o+/8vIWEO9sadjbkF
         jIm1agGw4CwuEAByTx/+0ho0eAOkfRF/ttr1CHMRpGNEVAgy0Ou1ldiGFrKl8/XAvelY
         5axg==
X-Gm-Message-State: AOAM5331AQdhOWWBXfcPmliwr6Eb7/Deq5yhP8IsaqgAl3TeKEWgy1Ll
        BZMRJClhfcw/eil+MeyaVXX9yg==
X-Google-Smtp-Source: ABdhPJzmK8tIJ03CfYW9jOjPJdxLW5HO/zNJ47qYUxnMt5BU2EHJ8vyiNWHjXoSWhTck8tGKdduitg==
X-Received: by 2002:a17:90a:5793:: with SMTP id g19mr8392975pji.32.1610680606890;
        Thu, 14 Jan 2021 19:16:46 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q26sm6346318pfl.219.2021.01.14.19.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:16:46 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/4] pinctrl: qcom: No need to read-modify-write the interrupt status
Date:   Thu, 14 Jan 2021 19:16:22 -0800
Message-Id: <20210114191601.v7.2.I3635de080604e1feda770591c5563bd6e63dd39d@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
References: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When the Qualcomm pinctrl driver wants to Ack an interrupt, it does a
read-modify-write on the interrupt status register.  On some SoCs it
makes sure that the status bit is 1 to "Ack" and on others it makes
sure that the bit is 0 to "Ack".  Presumably the first type of
interrupt controller is a "write 1 to clear" type register and the
second just let you directly set the interrupt status register.

As far as I can tell from scanning structure definitions, the
interrupt status bit is always in a register by itself.  Thus with
both types of interrupt controllers it is safe to "Ack" interrupts
without doing a read-modify-write.  We can do a simple write.

It should be noted that if the interrupt status bit _was_ ever in a
register with other things (like maybe status bits for other GPIOs):
a) For "write 1 clear" type controllers then read-modify-write would
   be totally wrong because we'd accidentally end up clearing
   interrupts we weren't looking at.
b) For "direct set" type controllers then read-modify-write would also
   be wrong because someone setting one of the other bits in the
   register might accidentally clear (or set) our interrupt.
I say this simply to show that the current read-modify-write doesn't
provide any sort of "future proofing" of the code.  In fact (for
"write 1 clear" controllers) the new code is slightly more "future
proof" since it would allow more than one interrupt status bits to
share a register.

NOTE: this code fixes no bugs--it simply avoids an extra register
read.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v6)

Changes in v6:
- Remove unneeded parenthesis.

Changes in v5:
- ("pinctrl: qcom: No need to read-modify-write the ...") new for v5.

 drivers/pinctrl/qcom/pinctrl-msm.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index d1261188fb6e..2f363c28d9d9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -791,16 +791,13 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	if (status_clear) {
-		/*
-		 * clear the interrupt status bit before unmask to avoid
-		 * any erroneous interrupts that would have got latched
-		 * when the interrupt is not in use.
-		 */
-		val = msm_readl_intr_status(pctrl, g);
-		val &= ~BIT(g->intr_status_bit);
-		msm_writel_intr_status(val, pctrl, g);
-	}
+	/*
+	 * clear the interrupt status bit before unmask to avoid
+	 * any erroneous interrupts that would have got latched
+	 * when the interrupt is not in use.
+	 */
+	if (status_clear)
+		msm_writel_intr_status(0, pctrl, g);
 
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
@@ -905,11 +902,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = msm_readl_intr_status(pctrl, g);
-	if (g->intr_ack_high)
-		val |= BIT(g->intr_status_bit);
-	else
-		val &= ~BIT(g->intr_status_bit);
+	val = g->intr_ack_high ? BIT(g->intr_status_bit) : 0;
 	msm_writel_intr_status(val, pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
-- 
2.30.0.284.gd98b1dd5eaa7-goog

