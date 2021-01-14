Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883182F6F0D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 00:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731066AbhANXmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 18:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730570AbhANXmL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 18:42:11 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7565CC0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 15:40:52 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id j1so3743650pld.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 15:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hKVV4sAZA0xAOVP8vdAz7bGNatdjNTZfyIOhZxLnoz4=;
        b=QPVpuTXyzdk3nPOnqSsigVXBbJ9pn+Kthjhchf6mQRvK6Cj0dUtGkKIngpBA4CU1M+
         DfWGGLidUNCFOJj0L2OJ1sOlBR6YUj0f0aF9nH0njUWoaUe9y5evCUlu5CaYMg5ek37H
         vNuX164Z+vkl4HitLcM/US2cWxhL467jTNWpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hKVV4sAZA0xAOVP8vdAz7bGNatdjNTZfyIOhZxLnoz4=;
        b=JMz9ZNkRLLOSvK/vkuwoJExJXx2iS2E7A2fif7jiVVCeZ9HtjpnWKOKMYrTRWxV7Li
         ggd5VanilvR9yMVRFIiTkEWcqmAteE4D4CcUnPVNJaxC+eY/XFWi4I5KrMgDD3p2+yr/
         WzuC0CPT/i7gkaauoYYEJ7VUUmiHxdgprgOTIdcd3+72fZ1o6C+5v404zJrcZkGGuN0H
         Plx75k9E+bxz/Xe3M4uXe8m7wrUKzrRgJSeSRCQcfDmsS+SQaSGfN8pRjkakxFs8s8T6
         Q3+9nPdK1zz0bNoYceLt86QZndayGQRXVPehZvy5v/scsaU3A1EGrqCCb9Huo+t84DCQ
         /8KQ==
X-Gm-Message-State: AOAM530jcdlIafY0ZWOUel5HZ8TUBNr/3jczMLLi0vOzfeg7/p0B7+BH
        Rl1UD5BoyEmY5xOcUMu5PUmbzw==
X-Google-Smtp-Source: ABdhPJw7QsomuAKYBm265+SNF9CdZhknZtFOKPJCkXYHh+RU0shcdxrlhsbN6PR0Gx5V6LQfBUv+0Q==
X-Received: by 2002:a17:902:ac88:b029:de:1bdd:842c with SMTP id h8-20020a170902ac88b02900de1bdd842cmr10004832plr.40.1610667651924;
        Thu, 14 Jan 2021 15:40:51 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id x1sm6498804pfj.95.2021.01.14.15.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 15:40:51 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Neeraj Upadhyay <neeraju@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] pinctrl: qcom: No need to read-modify-write the interrupt status
Date:   Thu, 14 Jan 2021 15:40:25 -0800
Message-Id: <20210114154004.v6.2.I3635de080604e1feda770591c5563bd6e63dd39d@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210114154004.v6.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
References: <20210114154004.v6.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
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

