Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F1521F5AA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 17:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgGNPEt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 11:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgGNPEs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 11:04:48 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC3EC08C5C1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 08:04:48 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id k4so7122932pld.12
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2020 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69EodTdWYHlEAq5QPFBw8533OrGBXqn7j8SYE13YOZs=;
        b=cQSVL88ANjkwN4gGvrPeJaPo6cD8kadt+RcL4kRtj568HiFgABjsmINlN7cj7LpxME
         7cl3m4SHsKCc3FSaiHNy+jsW+xKTCF//O4QSQujOITFjxZNfj7URCPQ20mjS97UyRgCD
         2yayid8YdwA9tPHqqkEh3DRab59yP6eJjxYLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69EodTdWYHlEAq5QPFBw8533OrGBXqn7j8SYE13YOZs=;
        b=k9PQy9wzTXAGbiYzE3jeVEZH8V7fqbGLcTxT+G72VSu+p2DQfnvnbrLlJ8RXNBc2BK
         9v+lzo2p1A05028Cfe54B08QwtNwUG6yFD/NLNTmFuekOoqOzi3DuLvk4IxrCPnAY65Y
         xo+OoofcUh/RX4l0KNPvUpTEAQ3hIrP2FX4afPsrYtj09gmgG4miqksY4Io8Clpdg2F9
         DLDiITHaODkKSNoqv747Id+ms/vKWE3x+dtdm6CiCYLlrtwSZNLzVeH6I3QlSb+2eXG4
         dp1N2rtfFzxw9t1JLqdBReVi56daBRG5X54vMrFQ6eZu1WF3E1OJmPG6RUgo5ylIa2u6
         L1ew==
X-Gm-Message-State: AOAM533nXXkOQ5aSsJP9V0ZjmJCK8G5q+2akNX8OQHKv50jZU6rHq5EP
        CoKELyL1TIx2Oeygv82RWmLRRA==
X-Google-Smtp-Source: ABdhPJwiBC+kV8XEGEiCll0NbA71iPHEzbM0ilNZUq825EkI66xmzeU4QYutwOVwCVoe6Yi5pK69YA==
X-Received: by 2002:a17:902:6b0c:: with SMTP id o12mr4353185plk.321.1594739087887;
        Tue, 14 Jul 2020 08:04:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id n18sm18849700pfd.99.2020.07.14.08.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 08:04:47 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org
Cc:     rnayak@codeaurora.org, mkshah@codeaurora.org,
        Marc Zyngier <maz@kernel.org>, ilina@codeaurora.org,
        cychiang@chromium.org, swboyd@chromium.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: qcom: Handle broken/missing PDC dual edge IRQs on sc7180
Date:   Tue, 14 Jul 2020 08:04:17 -0700
Message-Id: <20200714080254.v3.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Depending on how you look at it, you can either say that:
a) There is a PDC hardware issue (with the specific IP rev that exists
   on sc7180) that causes the PDC not to work properly when configured
   to handle dual edges.
b) The dual edge feature of the PDC hardware was only added in later
   HW revisions and thus isn't in all hardware.

Regardless of how you look at it, let's work around the lack of dual
edge support by only ever letting our parent see requests for single
edge interrupts on affected hardware.

NOTE: it's possible that a driver requesting a dual edge interrupt
might get several edges coalesced into a single IRQ.  For instance if
a line starts low and then goes high and low again, the driver that
requested the IRQ is not guaranteed to be called twice.  However, it
is guaranteed that once the driver's interrupt handler starts running
its first instruction that any new edges coming in will cause the
interrupt to fire again.  This is relatively commonplace for dual-edge
gpio interrupts (many gpio controllers require software to emulate
dual edge with single edge) so client drivers should be setup to
handle it.

Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As far as I can tell everything here should work and the limited
testing I'm able to give it shows that, in fact, I can detect both
edges.

I specifically left off Reviewed-by and Tested-by tags from v2 becuase
I felt that the implementation had changed just enough to invalidate
previous reviews / testing.  Hopefully it's not too much of a hassle
for folks to re-review and re-test.

Changes in v3:
- Rate limit the warning.

Changes in v2:
- Use handle_fasteoi_ack_irq() and switch edges in the Ack now.
- If we change types, switch back to the normal handle_fasteoi_irq().
- No extra locking.
- Properly print an error if we hit 100 loops w/ no stability.
- Beefed up the commit message.

 drivers/pinctrl/qcom/Kconfig          |  2 +
 drivers/pinctrl/qcom/pinctrl-msm.c    | 74 ++++++++++++++++++++++++++-
 drivers/pinctrl/qcom/pinctrl-msm.h    |  4 ++
 drivers/pinctrl/qcom/pinctrl-sc7180.c |  1 +
 4 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index ff1ee159dca2..f8ff30cdafa6 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -7,6 +7,8 @@ config PINCTRL_MSM
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
+	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83b7d64bc4c1..c322f30a2064 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -832,6 +832,52 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 	msm_gpio_irq_clear_unmask(d, false);
 }
 
+/**
+ * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs handled by parent.
+ * @d: The irq dta.
+ *
+ * This is much like msm_gpio_update_dual_edge_pos() but for IRQs that are
+ * normally handled by the parent irqchip.  The logic here is slightly
+ * different due to what's easy to do with our parent, but in principle it's
+ * the same.
+ */
+static void msm_gpio_update_dual_edge_parent(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
+	int loop_limit = 100;
+	unsigned int val;
+	unsigned int type;
+
+	/* Read the value and make a guess about what edge we need to catch */
+	val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
+	type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
+
+	do {
+		/* Set the parent to catch the next edge */
+		irq_chip_set_type_parent(d, type);
+
+		/*
+		 * Possibly the line changed between when we last read "val"
+		 * (and decided what edge we needed) and when set the edge.
+		 * If the value didn't change (or changed and then changed
+		 * back) then we're done.
+		 */
+		val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
+		if (type == IRQ_TYPE_EDGE_RISING) {
+			if (!val)
+				return;
+			type = IRQ_TYPE_EDGE_FALLING;
+		} else if (type == IRQ_TYPE_EDGE_FALLING) {
+			if (val)
+				return;
+			type = IRQ_TYPE_EDGE_RISING;
+		}
+	} while (loop_limit-- > 0);
+	dev_warn_once(pctrl->dev, "dual-edge irq failed to stabilize\n");
+}
+
 static void msm_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -840,8 +886,11 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	unsigned long flags;
 	u32 val;
 
-	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
+		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
+			msm_gpio_update_dual_edge_parent(d);
 		return;
+	}
 
 	g = &pctrl->soc->groups[d->hwirq];
 
@@ -860,6 +909,17 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
+static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
+						       unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+
+	return type == IRQ_TYPE_EDGE_BOTH &&
+	       pctrl->soc->wakeirq_dual_edge_errata && d->parent_data &&
+	       test_bit(d->hwirq, pctrl->skip_wake_irqs);
+}
+
 static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -868,11 +928,21 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	unsigned long flags;
 	u32 val;
 
+	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
+		set_bit(d->hwirq, pctrl->dual_edge_irqs);
+		irq_set_handler_locked(d, handle_fasteoi_ack_irq);
+		msm_gpio_update_dual_edge_parent(d);
+		return 0;
+	}
+
 	if (d->parent_data)
 		irq_chip_set_type_parent(d, type);
 
-	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
+		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
+		irq_set_handler_locked(d, handle_fasteoi_irq);
 		return 0;
+	}
 
 	g = &pctrl->soc->groups[d->hwirq];
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 9452da18a78b..7486fe08eb9b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -113,6 +113,9 @@ struct msm_gpio_wakeirq_map {
  * @pull_no_keeper: The SoC does not support keeper bias.
  * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/MPM
  * @nwakeirq_map:   The number of entries in @wakeirq_map
+ * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
+ *                            to be aware that their parent can't handle dual
+ *                            edge interrupts.
  */
 struct msm_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
@@ -128,6 +131,7 @@ struct msm_pinctrl_soc_data {
 	const int *reserved_gpios;
 	const struct msm_gpio_wakeirq_map *wakeirq_map;
 	unsigned int nwakeirq_map;
+	bool wakeirq_dual_edge_errata;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 1b6465a882f2..1d9acad3c1ce 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -1147,6 +1147,7 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
 	.ntiles = ARRAY_SIZE(sc7180_tiles),
 	.wakeirq_map = sc7180_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(sc7180_pdc_map),
+	.wakeirq_dual_edge_errata = true,
 };
 
 static int sc7180_pinctrl_probe(struct platform_device *pdev)
-- 
2.27.0.389.gc38d7665816-goog

