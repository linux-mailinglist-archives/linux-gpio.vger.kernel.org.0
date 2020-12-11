Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F872D81DA
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 23:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406800AbgLKWR2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 17:17:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406786AbgLKWRF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 17:17:05 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE26C06138C
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:15:47 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id t18so5308412plo.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCtCEdisGnwJ/m/Si2p+dicRUYBBDnixrXm0wKTUER8=;
        b=ZEW5iU4Fxh9N+lYYP0JBBAkU7IeYPA0hVyMVR63zKm8fhxD2mbwwvd1rQtQOXthW4L
         olxC/jeh/INp5y1veB8q6jCktNIYK54dpVYvno7fBxw7/g2jM3d/V1Z95t0aBqbkLnz6
         IgUegy8umBQamsjVkhgOpEN055Z9uFuAUvjbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCtCEdisGnwJ/m/Si2p+dicRUYBBDnixrXm0wKTUER8=;
        b=M78XedGrcBpwHeAFnegMlxXCjLKbS59u2rO1tgwspmcXwe0knOdPHcQSX28jbVmjqc
         CoLK7l2VupgrYHOM0zwmsbeRhIMXUlkoljn3IwqwhGZ3GY6Xe4Nsj+zeNbfbaoNan4R4
         gt4nEJjgiPYdf0K2bK5R0dPxakedCNIidOIgL4axwKKg3Z34vOsmORskM0kg5sitffTL
         tPyxueUOpi1yZEeePjdkyPaOUnwnxvrES8LuwSwRNCq837crGCPD3Ztehg42kbz7P6iJ
         TgT1yVIZjZGJaz1oPbilMj+63tCHJ2c0xuJ9Apnlocg3DdY/OFsZLxS5oQCS+IcA3XTw
         rTIQ==
X-Gm-Message-State: AOAM533M3W7CXnCnnsWb8GN8QUr6CXRS+gN842R+SvOWSHQDYmZY2Je9
        RV5hr/8fHd/JltAUdGe23Se6cA==
X-Google-Smtp-Source: ABdhPJx0nEWDmBvQpziG9Q3KncbTdZ0FTJoDcPmTQQweqDdXF16kPufiackPupAAHqo28Bb3OH9Edw==
X-Received: by 2002:a17:902:654f:b029:da:347d:7af3 with SMTP id d15-20020a170902654fb02900da347d7af3mr12764004pln.18.1607724946834;
        Fri, 11 Dec 2020 14:15:46 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id s21sm11832981pgk.52.2020.12.11.14.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 14:15:46 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] pinctrl: qcom: Don't clear pending interrupts when enabling
Date:   Fri, 11 Dec 2020 14:15:37 -0800
Message-Id: <20201211141514.v4.3.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In Linux, if a driver does disable_irq() and later does enable_irq()
on its interrupt, I believe it's expecting these properties:
* If an interrupt was pending when the driver disabled then it will
  still be pending after the driver re-enables.
* If an edge-triggered interrupt comes in while an interrupt is
  disabled it should assert when the interrupt is re-enabled.

If you think that the above sounds a lot like the disable_irq() and
enable_irq() are supposed to be masking/unmasking the interrupt
instead of disabling/enabling it then you've made an astute
observation.  Specifically when talking about interrupts, "mask"
usually means to stop posting interrupts but keep tracking them and
"disable" means to fully shut off interrupt detection.  It's
unfortunate that this is so confusing, but presumably this is all the
way it is for historical reasons.

Perhaps more confusing than the above is that, even though clients of
IRQs themselves don't have a way to request mask/unmask
vs. disable/enable calls, IRQ chips themselves can implement both.
...and yet more confusing is that if an IRQ chip implements
disable/enable then they will be called when a client driver calls
disable_irq() / enable_irq().

It does feel like some of the above could be cleared up.  However,
without any other core interrupt changes it should be clear that when
an IRQ chip gets a request to "disable" an IRQ that it has to treat it
like a mask of that IRQ.

In any case, after that long interlude you can see that the "unmask
and clear" can break things.  Maulik tried to fix it so that we no
longer did "unmask and clear" in commit 71266d9d3936 ("pinctrl: qcom:
Move clearing pending IRQ to .irq_request_resources callback"), but it
only handled the PDC case (it also had problems, but that's the
subject of another patch).  Let's fix this for the non-PDC case.

From my understanding the source of the phantom interrupt in the
non-PDC case was the one that could have been introduced in
msm_gpio_irq_set_type().  Let's handle that one and then get rid of
the clear.

Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't have lots of good test cases here, so hopefully someone from
Qualcomm can confirm that this works well for them and there isn't
some other phantom interrupt source that I'm not aware of.

Changes in v4:
- ("pinctrl: qcom: Don't clear pending interrupts when enabling") split for v4.

 drivers/pinctrl/qcom/pinctrl-msm.c | 32 +++++++++++++-----------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 588df91274e2..f785646d1df7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -774,7 +774,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
-static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
+static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
@@ -792,17 +792,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
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
-
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
 	val |= BIT(g->intr_enable_bit);
@@ -822,7 +811,7 @@ static void msm_gpio_irq_enable(struct irq_data *d)
 		irq_chip_enable_parent(d);
 
 	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
-		msm_gpio_irq_clear_unmask(d, true);
+		msm_gpio_irq_unmask(d);
 }
 
 static void msm_gpio_irq_disable(struct irq_data *d)
@@ -837,11 +826,6 @@ static void msm_gpio_irq_disable(struct irq_data *d)
 		msm_gpio_irq_mask(d);
 }
 
-static void msm_gpio_irq_unmask(struct irq_data *d)
-{
-	msm_gpio_irq_clear_unmask(d, false);
-}
-
 /**
  * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs handled by parent.
  * @d: The irq dta.
@@ -936,6 +920,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
+	bool was_enabled;
 	u32 val;
 
 	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
@@ -997,6 +982,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	 * could cause the INTR_STATUS to be set for EDGE interrupts.
 	 */
 	val = msm_readl_intr_cfg(pctrl, g);
+	was_enabled = val & BIT(g->intr_raw_status_bit);
 	val |= BIT(g->intr_raw_status_bit);
 	if (g->intr_detection_width == 2) {
 		val &= ~(3 << g->intr_detection_bit);
@@ -1046,6 +1032,16 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	}
 	msm_writel_intr_cfg(val, pctrl, g);
 
+	/*
+	 * The first time we set RAW_STATUS_EN it could trigger an interrupt.
+	 * Clear it.  This is safe because we have IRQCHIP_SET_TYPE_MASKED.
+	 */
+	if (!was_enabled) {
+		val = msm_readl_intr_status(pctrl, g);
+		val &= ~BIT(g->intr_status_bit);
+		msm_writel_intr_status(val, pctrl, g);
+	}
+
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 		msm_gpio_update_dual_edge_pos(pctrl, g, d);
 
-- 
2.29.2.576.ga3fc446d84-goog

