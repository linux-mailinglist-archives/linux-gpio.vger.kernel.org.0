Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA4121DA07
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 17:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbgGMP1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 11:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729593AbgGMP1m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 11:27:42 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE88C08C5DB
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 08:27:42 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 72so5662747ple.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YTEDj86jVOBOKy55+k8XdsSThYyvDWhrbgJpr5syovM=;
        b=L9v5FK6aRvDNqE4B0WqbtZjiMd9iGJ+ycXEHwQ/uzoPFLCVuN+TmJohRtPArrWOdrz
         THQITg4gaR13UL5D0JKs+8dwwL+zPMFmfAouKeTJRA8yevMip2antDue4BeK2VPh8MoF
         gei8ezfQyYgQKOtLmHvmRIWE2TUU1ePV0B9QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YTEDj86jVOBOKy55+k8XdsSThYyvDWhrbgJpr5syovM=;
        b=hezHbk8XD+AaCoIOJYN+/osXAsW370l2KVypWWHcvAqQuVOAgHznms+e7BmwovYpPe
         jBE1gFD+vj1oGZf+sI+ZNH+HY7v+94DP07la5iBSlQybVO8qKJzI5HNMEPh3J6Bm2UES
         2/vRK/6mLoofk6cDO0YYAORSaqtRiE2eCyZPvG9NDhecZcaQJjRY3KwVot31AUI86iuY
         dmyMGlfcfFPe99XxjS74Al0IV970MS7FuwVcJaXjJJnONyrpKpf6d1EXbKYX2hUDTCWI
         RCOGdui/9jCUue3JuDRB9P8fQuM22mvH+mmyvL6a/GOM4TFh1uBDKKCJdNOnZturivas
         EalQ==
X-Gm-Message-State: AOAM532W0Weg9OnVe/PmTCYcM8JX826yEuorolGghIItpFftJoTyg4KO
        K8bOUgCXlwCa5VlNJOUrGXCmkQ==
X-Google-Smtp-Source: ABdhPJzO4L0IXVmhW5EiVzQxJX1VczzInaieVj9uxJDtJxJm5Lf2o8tHdKS4BBnfwrEFbaR4WiYYZw==
X-Received: by 2002:a17:902:6bca:: with SMTP id m10mr177239plt.210.1594654061334;
        Mon, 13 Jul 2020 08:27:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id z2sm14730645pff.36.2020.07.13.08.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:27:40 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, cychiang@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, swboyd@chromium.org,
        Marc Zyngier <maz@kernel.org>, agross@kernel.org,
        mkshah@codeaurora.org, bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: Handle broken/missing PDC dual edge IRQs on sc7180
Date:   Mon, 13 Jul 2020 08:26:33 -0700
Message-Id: <20200713082628.v2.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
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
index 83b7d64bc4c1..eae8f421ff63 100644
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
+	dev_err(pctrl->dev, "dual-edge irq failed to stabilize\n");
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
2.27.0.383.g050319c2ae-goog

