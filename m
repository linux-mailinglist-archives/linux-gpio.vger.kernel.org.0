Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910B32C19BF
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 01:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgKXAC0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 19:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728614AbgKXACW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 19:02:22 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE4FC061A51
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 16:02:22 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id l1so1457390pld.5
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 16:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L89oXQzcinW0XVkoPkY/8VBs+sljP+/OT5KD3oBT6VA=;
        b=GEjSWduNUiOKDZ327Z36o6TRnl57q/Pg1X0VBsUprtQZqfRdsapmA6Lk8twZOVkLfc
         SEkPZNNKosLv40o4esKxnKIchpxzAi0eiOdOMccM15oFCyZTgbnGmUyvzGJMZd0KbC/N
         EvIInLSEhOQ6e0aor7r09MI5VVzzi9rzjjIZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L89oXQzcinW0XVkoPkY/8VBs+sljP+/OT5KD3oBT6VA=;
        b=EMVVTLro4x/hj9NkHSkevlXFMMBOAgJC8HaU0ARt2hI/6vb9X648JpCuyrAQALFEBW
         /ibIvW91prcYYZXBB55Frc98BYMyopgbTsPjmekmhuHRWTVadSC3Ba/0sGMJwqDM66rr
         Luv5zd6rONvFdsnkfpmJJdYpLXs7N1/pkb+RNXbyVBWH7rPcnPr9CwYZ8VUdXB4tGAXv
         70eAead6iNf3Bi0j/BiRTNBVITkaLis9Iu331kvYI+3lqrICtPnhzxQbAq0l5+zvc6rk
         jE98TZloX/XdEA7XQxe+o41YUGAkvpgF+3tQ5w8yFa4Jb82zMPu9DCC4nx2t8iFU12yI
         dClw==
X-Gm-Message-State: AOAM533F2CTpEfBEwPUbVc5tz/mODHmSr7dXssLlwnlJwoIFVDjucUE4
        W/y8QdCKTc/zHwveUfaYa2bc3PVrEMJFkQ==
X-Google-Smtp-Source: ABdhPJzIt+OXu8ATXhk6OvopLSMTU2ebqBFoV4Yj2uiZ6Tqox41miFCS+XKNLgw9fFBY2CNgMRiecQ==
X-Received: by 2002:a17:902:c393:b029:d9:6e7:6787 with SMTP id g19-20020a170902c393b02900d906e76787mr1531403plg.78.1606176142049;
        Mon, 23 Nov 2020 16:02:22 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id l133sm13091945pfd.112.2020.11.23.16.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 16:02:21 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] pinctrl: qcom: Clear possible pending irq when remuxing GPIOs
Date:   Mon, 23 Nov 2020 16:01:53 -0800
Message-Id: <20201123160139.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
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

Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This is a pretty hairy little patch and presumably needs a good amount
of testing / discussion before landing.  If this patch is totally
broken / wrong feel free to consider it as an RFC and suggest how it
should be better.

Also note: I wanted to put this in the same series as patch #1, but
IMO that patch can stand on its own.  If it looks Ok but we want to
have lots of debate about this one, please land patch #1 on its own
and we can split the series.

I have done most of this patch testing on the Chrome OS 5.4 kernel
tree (with many backports) but have sanity checked it on mainline.

 drivers/pinctrl/qcom/pinctrl-msm.c | 104 ++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 588df91274e2..e7c3927c7d54 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -166,14 +166,42 @@ static int msm_get_function_groups(struct pinctrl_dev *pctldev,
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
+	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
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
@@ -187,15 +215,26 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
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
 
@@ -456,32 +495,45 @@ static const struct pinconf_ops msm_pinconf_ops = {
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
@@ -491,12 +543,17 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
 		val &= ~BIT(g->out_bit);
 	msm_writel_io(val, pctrl, g);
 
-	val = msm_readl_ctl(pctrl, g);
+	oldval = msm_readl_ctl(pctrl, g);
 	val |= BIT(g->oe_bit);
 	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
+	if (oldval != val)
+		msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
+
+	enable_irq(irq);
+
 	return 0;
 }
 
@@ -774,7 +831,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
-static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
+static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
@@ -792,17 +849,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
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
@@ -815,14 +861,10 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
 static void msm_gpio_irq_enable(struct irq_data *d)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
-
 	if (d->parent_data)
 		irq_chip_enable_parent(d);
 
-	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
-		msm_gpio_irq_clear_unmask(d, true);
+	msm_gpio_irq_unmask(d);
 }
 
 static void msm_gpio_irq_disable(struct irq_data *d)
@@ -837,11 +879,6 @@ static void msm_gpio_irq_disable(struct irq_data *d)
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
@@ -1097,19 +1134,6 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
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
2.29.2.454.gaff20da3a2-goog

