Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D180C2D4FD1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 01:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgLJAoL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 19:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730400AbgLJAn4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 19:43:56 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E72C061285
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 16:42:50 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id f17so2554720pge.6
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 16:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I9wwcBZRCyeEr9XRTBpYjOogwWaUvKwEFHcbxUzUQoM=;
        b=S1kzsZMFFqi+HBJjQJdA05dwfCo57J+uMlKls7fx8UMPoRimRBhM/HGkbGLtmLxtI0
         zoEZB+ePtB8URpBWN84hdvkNyTlpsLERyVN/LVAAQXq97GqtEGSSjuKYo8Mv/oDe3Jtz
         OtssPVZ7jSrPIpxHFP9uazWQGKOeyJDn0s2Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I9wwcBZRCyeEr9XRTBpYjOogwWaUvKwEFHcbxUzUQoM=;
        b=FIOEQvM8CyXb/0ah6b1X/EHMEPjr1TXcgF4buBPZ1eadmVZAqKuiUqhMfVAtcVxTv/
         TQTFLYLu3C4uyNu2me519YXV1AkgIwyFJ5yKhmdUwssDZZBt6zgk1Tgz63E2JBS5QHhf
         SB6yQdStx1fkCjgt1Pw2RFvi1b3pfXZFqH934fgsi5AalnbwSewdT+1jpZn4aVBM6Dk5
         BC8YyMguIHhQ56NupdjGXc9t81MB1oP/P0mZxOLlU4l6xtkoavyxkM+qwlDkWt4uKT28
         nGdjz2s/2LX0W4DtUAbM4m4sbfJgbAIxQelmmLSO3dJue8WD+Xi+F3mUyMSYMdmgyWU3
         DKGg==
X-Gm-Message-State: AOAM5336ONAB0woq559z8lgiTUnXrY8Ij64G89sAHtZANkyH7RyqZjxq
        zMiAb7lyxR9O9NgWf0F8S1QqyQ==
X-Google-Smtp-Source: ABdhPJzIJI9uN+j6PWHpeLrBciq61GwFmBPTw4a45+lJmUphS3sRE/qfalayFyjEbk1SQrYGhJCUeA==
X-Received: by 2002:a63:1616:: with SMTP id w22mr4306316pgl.13.1607560969307;
        Wed, 09 Dec 2020 16:42:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id l23sm3690430pgm.22.2020.12.09.16.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 16:42:48 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] pinctrl: qcom: Clear possible pending irq when remuxing GPIOs
Date:   Wed,  9 Dec 2020 16:41:03 -0800
Message-Id: <20201209163818.v3.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Conceptually, we can envision the input on Qualcomm SoCs to pass
through a bunch of blocks between coming into the chip and becoming a
GPIO interrupt.  From guessing and running a handful of tests, I
believe that we can represent the state of the world with a drawing
that looks something like this:

 +-----------------+       +-----------------+       +-----------------+
 |      INPUT      |  -->  |      PINMUX     |       |    IS_INPUT     |
 +-----------------+       |                 |  -->  |                 |
                           | output bogus (?)|       | output bogus (?)|
                           | if not muxed    |       | if input disab. |
                           +-----------------+       +-----------------+
                                                              |
          +---------------------------------------------------+--> to PDC
          |
          V
 +-----------------+       +-----------------+       +-----------------+
 | INTR RAW ENABLE |       | DETECTION LOGIC |       | STATUS REGISTER |
 |                 |       |                 |       |                 |
 | output bogus (?)|  -->  | maybe handles   |       | latches inputs  |
 | if disabled     |       | polarity diffs  |  -->  | that are high   |
 +-----------------+       |                 |       |                 |
                           | maybe debounces |       | write 1 to clr  |
                           | level irqs      |       +-----------------+
                           +-----------------+                |
                                                              |
          +---------------------------------------------------+
          |
          V
 +-----------------+
 |      ENABLE     |
 |                 |       +-----------------+
 | nothing passes  |  -->  |   SUMMARY IRQ   |
 | through if      |       +-----------------+
 | disabled        |
 +-----------------+

The above might not be 100% exact, but for the purpose of this
discussion, the point is that there are a whole bunch of gates and
transformations on the input before it gets to the circuitry that
generates interrupts.

As you might guess, if you reconfigure one of the gates in the above
diagram while the system is configured to detect interrupts things get
a little wacky.  Specifically it appears that if you gate the input at
any step it can cause various glitches in the later steps because they
are still paying attention to their input but their input isn't really
sane anymore.

I did some poking and I found that I could generate bogus interrupts
in the system both when muxing away from GPIO mode and also when
muxing back to GPIO mode.  When configured to use the PDC path for
generating interrupts I found that if the external input on the GPIO
was low that I'd get what looked like a rising edge when unmuxing and
a falling edge when muxing.  When configured away from the PDC path I
got slightly different glitch interrupts when changing muxing.

These glitches when remuxing matter in reality, not just in theory.
To be concrete, let's take the special "wakeup_irq" in
qcom_geni_serial.c as an example.  In sc7180-trogdor.dtsi we configure
the uart3 to have two pinctrl states, sleep and default, and mux
between the two during runtime PM and system suspend (see
geni_se_resources_{on,off}() for more details).  The difference
between the sleep and default state is that the RX pin is muxed to a
GPIO during sleep and muxed to the UART otherwise.  When we switch
between these two states we can generate the glitches talked about
above because we're configured to look for edges but the transition
from the gated input (which is bogus) to the real input can look like
an edge.

Historically the UART case above was handled by the fact that the
"enable" function in the MSM GPIO driver did an "unmask and clear".
This relied on the fact that the system happens to have the interrupt
disabled until suspend time and that it would enable it after the
pinmux change happened, thus clearing the interrupt.

The historical solution, however, had a few problems.  The first
problem (that nobody seemed to have tripped) is that we can still get
bogus interrupts if we remux when the interrupt isn't disabled during
the muxing and re-enabled after.  The second problem is that it
violates how I believe that the interrupt enable path is supposed to
work.

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
didn't work for two reasons:
* It only tried to address the problem for interrupts that had parents
  (like the PDC).
* It regressed the problem that the original clearing was trying to
  solve.

I think we can safely assume that if someone muxes a pin to be
something other than a GPIO and then muxes it back that we can clear
any interrupts that were pending on it without violating any
assumptions that client drivers are making.  Presumably the client
drivers are intentionally remuxing the pin away from a dedicated
purpose to be a plain GPIO so they don't care what the pin state was
before the mux switch and they don't expect to see the pin change
level during this switch.  Let's move the clearing of the IRQ to the
pin muxing routine so that we'll clear a pending IRQ if we're muxing
from some non-GPIO mode to a GPIO mode.

NOTE: now that we're not clearing the interrupt in "enable" we also
need one extra fix here to clear the phantom interrupt that could have
been generated the first time we set RAW_STATUS_EN.

Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch depends on #2 in the series, but not #1.  #1 can land on
its own and then #2/#3 can land together even without #1.  The only
reason patch #1 and #2/#3 are together in one series is because they
address similar issues.

I have done most of this patch testing on the Chrome OS 5.4 kernel
tree (with many backports) but have sanity checked it on mainline.

NOTE: there was quite a bit of discussion on v2 and I'm not sure I
ever arrived on the same page as Maulik on how things here work.  If
there are truly problems with v3 I'd love to see some test code
proving it out.

Changes in v3:
- Fixed bug in msm_gpio_direction_output() (s/oldval =/oldval = val =/)
- Add back "if !skip_wake_irqs" test in msm_gpio_irq_enable()
- For non-PDC, clear 1st interrupt in msm_gpio_irq_set_type()

Changes in v2:
- 0 => false
- If skip_wake_irqs, don't need to clear normal intr.
- Add comment about glitches in both output and input.

 drivers/pinctrl/qcom/pinctrl-msm.c | 122 ++++++++++++++++++++---------
 1 file changed, 86 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 588df91274e2..915b1e2ad40d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -166,14 +166,44 @@ static int msm_get_function_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static void msm_pinctrl_clear_pending_irq(struct msm_pinctrl *pctrl,
+					  unsigned int group,
+					  unsigned int irq)
+{
+	struct irq_data *d = irq_get_irq_data(irq);
+	const struct msm_pingroup *g;
+	unsigned long flags;
+	u32 val;
+
+	if (!d)
+		return;
+
+	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
+		return;
+	}
+
+	g = &pctrl->soc->groups[group];
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	val = msm_readl_intr_status(pctrl, g);
+	val &= ~BIT(g->intr_status_bit);
+	msm_writel_intr_status(val, pctrl, g);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
 {
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct gpio_chip *gc = &pctrl->chip;
+	unsigned int irq = irq_find_mapping(gc->irq.domain, group);
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val, mask;
+	u32 oldval;
+	u32 old_i;
 	int i;
 
 	g = &pctrl->soc->groups[group];
@@ -187,15 +217,26 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	if (WARN_ON(i == g->nfuncs))
 		return -EINVAL;
 
-	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	disable_irq(irq);
 
-	val = msm_readl_ctl(pctrl, g);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	oldval = val = msm_readl_ctl(pctrl, g);
 	val &= ~mask;
 	val |= i << g->mux_bit;
 	msm_writel_ctl(val, pctrl, g);
-
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
+	/*
+	 * Clear IRQs if switching to/from GPIO mode since muxing to/from
+	 * the GPIO path can cause phantom edges.
+	 */
+	old_i = (oldval & mask) >> g->mux_bit;
+	if (old_i != i &&
+	    (i == pctrl->soc->gpio_func || old_i == pctrl->soc->gpio_func))
+		msm_pinctrl_clear_pending_irq(pctrl, group, irq);
+
+	enable_irq(irq);
+
 	return 0;
 }
 
@@ -456,32 +497,49 @@ static const struct pinconf_ops msm_pinconf_ops = {
 static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	const struct msm_pingroup *g;
+	unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned long flags;
+	u32 oldval;
 	u32 val;
 
 	g = &pctrl->soc->groups[offset];
 
+	disable_irq(irq);
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = msm_readl_ctl(pctrl, g);
+	oldval = val = msm_readl_ctl(pctrl, g);
 	val &= ~BIT(g->oe_bit);
 	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
+	/*
+	 * Clear IRQs if switching to/from input mode since that can use
+	 * a phantom edge.
+	 */
+	if (oldval != val)
+		msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
+
+	enable_irq(irq);
+
 	return 0;
 }
 
 static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 {
 	const struct msm_pingroup *g;
+	unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned long flags;
+	u32 oldval;
 	u32 val;
 
 	g = &pctrl->soc->groups[offset];
 
+	disable_irq(irq);
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	val = msm_readl_io(pctrl, g);
@@ -491,12 +549,21 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
 		val &= ~BIT(g->out_bit);
 	msm_writel_io(val, pctrl, g);
 
-	val = msm_readl_ctl(pctrl, g);
+	oldval = val = msm_readl_ctl(pctrl, g);
 	val |= BIT(g->oe_bit);
 	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
+	/*
+	 * Clear IRQs if switching to/from input mode since that can use
+	 * a phantom edge.
+	 */
+	if (oldval != val)
+		msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
+
+	enable_irq(irq);
+
 	return 0;
 }
 
@@ -774,7 +841,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
-static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
+static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
@@ -792,17 +859,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
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
@@ -822,7 +878,7 @@ static void msm_gpio_irq_enable(struct irq_data *d)
 		irq_chip_enable_parent(d);
 
 	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
-		msm_gpio_irq_clear_unmask(d, true);
+		msm_gpio_irq_unmask(d);
 }
 
 static void msm_gpio_irq_disable(struct irq_data *d)
@@ -837,11 +893,6 @@ static void msm_gpio_irq_disable(struct irq_data *d)
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
@@ -936,6 +987,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
+	bool was_enabled;
 	u32 val;
 
 	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
@@ -997,6 +1049,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	 * could cause the INTR_STATUS to be set for EDGE interrupts.
 	 */
 	val = msm_readl_intr_cfg(pctrl, g);
+	was_enabled = val & BIT(g->intr_raw_status_bit);
 	val |= BIT(g->intr_raw_status_bit);
 	if (g->intr_detection_width == 2) {
 		val &= ~(3 << g->intr_detection_bit);
@@ -1046,6 +1099,16 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
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
 
@@ -1097,19 +1160,6 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
 		ret = -EINVAL;
 		goto out;
 	}
-
-	/*
-	 * Clear the interrupt that may be pending before we enable
-	 * the line.
-	 * This is especially a problem with the GPIOs routed to the
-	 * PDC. These GPIOs are direct-connect interrupts to the GIC.
-	 * Disabling the interrupt line at the PDC does not prevent
-	 * the interrupt from being latched at the GIC. The state at
-	 * GIC needs to be cleared before enabling.
-	 */
-	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
-		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
-
 	return 0;
 out:
 	module_put(gc->owner);
-- 
2.29.2.576.ga3fc446d84-goog

