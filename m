Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E53A219241
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 23:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgGHVQy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 17:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGHVQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 17:16:53 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84021C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 14:16:53 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id k27so6188531pgm.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 14:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I7Vp4IuLZ1fVFx/6cLby6T01RfWxA+FZRBxb5ymhKT4=;
        b=DG7Tq5xEaJXFcxP4mcYE+im28DTZQdmZDWvSKnqffveDKPj3fO/xuVFGGKoMptZTQ8
         LY97zeiSNQNbHLYq6snNwSh90+f3Fnp9Bj5lUrM5x+HMl+04tmbtcdP+LKDw1p3WpkmA
         PQkWAFIZc+06vjWVjULcB7qsQMylExydLQhwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I7Vp4IuLZ1fVFx/6cLby6T01RfWxA+FZRBxb5ymhKT4=;
        b=pVrYTX8ZYbHogUd3z6kLDWS7iY0afW/yZuWvdkKnxBkONRePzRRIo8tYmcbsa8WG7g
         kF+CIsmyCJCTS/FQujrq0LRsHU2a2ctMpWauTaBpNDbQG7XhizbmEvtWSRsc96BEA4gR
         79ezRPht9D4zgZ4QvlRKEbb3XjHfnnxk5qTE7WeUbe4fYPyQm5sIUmSNUPAsRmDnYoVx
         SVsj6LDa2K2D+8mhHSs4x0qMIbkYkZMtxEDxiRV+AUOytW8tAhf/eezFy97h56k2aZf8
         tlaa2xjgqLH7lU3kyL1Ne/FpojY+PQeYTW8wzzCb3Jv8RBUNORp3nTKeY/m5ctA5PiEe
         H7uA==
X-Gm-Message-State: AOAM531eXuXZ+2EGeH9ojD9yruXbDzLuZEYiL8DOcI+cCOrQNj5Kxzvx
        fmj5a9U3y7Wog+bRaDabYEecXuLM0+U=
X-Google-Smtp-Source: ABdhPJxuMVCDqicP0QTyskpceVvBBaKgMk43D7cr7sg5uyWx5sV1LZCBwu7yN9Mi4xs8tEXPi85ctw==
X-Received: by 2002:aa7:930b:: with SMTP id 11mr51514573pfj.320.1594243012759;
        Wed, 08 Jul 2020 14:16:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id f3sm381600pju.54.2020.07.08.14.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 14:16:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        cychiang@chromium.org, ilina@codeaurora.org, agross@kernel.org,
        rnayak@codeaurora.org, mkshah@codeaurora.org,
        bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: Handle broken PDC dual edge case on sc7180
Date:   Wed,  8 Jul 2020 14:16:25 -0700
Message-Id: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As per Qualcomm, there is a PDC hardware issue (with the specific IP
rev that exists on sc7180) that causes the PDC not to work properly
when configured to handle dual edges.

Let's work around this by emulating only ever letting our parent see
requests for single edge interrupts on affected hardware.

Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As far as I can tell everything here should work and the limited
testing I'm able to give it shows that, in fact, I can detect both
edges.

Please give this an extra thorough review since it's trying to find
the exact right place to insert this code and I'm not massively
familiar with all the frameworks.

If someone has hardware where it's easy to stress test this that'd be
wonderful too.  The board I happen to have in front of me doesn't have
any easy-to-toggle GPIOs where I can just poke a button or a switch to
generate edges.  My testing was done by hacking the "write protect"
GPIO on my board into gpio-keys as a dual-edge interrupt and then
sending commands to our security chip to toggle it--not exactly great
for testing to make sure there are no race conditions if the interrupt
bounces a lot.

 drivers/pinctrl/qcom/pinctrl-msm.c    | 80 +++++++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h    |  4 ++
 drivers/pinctrl/qcom/pinctrl-sc7180.c |  1 +
 3 files changed, 85 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83b7d64bc4c1..45ca09ebb7b3 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -860,6 +860,79 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
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
+	unsigned long flags;
+	int loop_limit = 100;
+	unsigned int val;
+	unsigned int type;
+
+	/* Read the value and make a guess about what edge we need to catch */
+	val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
+	type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
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
+				break;
+			type = IRQ_TYPE_EDGE_FALLING;
+		} else if (type == IRQ_TYPE_EDGE_FALLING) {
+			if (val)
+				break;
+			type = IRQ_TYPE_EDGE_RISING;
+		}
+	} while (loop_limit-- > 0);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	if (!loop_limit)
+		dev_err(pctrl->dev, "dual-edge irq failed to stabilize\n");
+}
+
+void msm_gpio_handle_dual_edge_parent_irq(struct irq_desc *desc)
+{
+	struct irq_data	*d = &desc->irq_data;
+
+	/* Make sure we're primed for the next edge */
+	msm_gpio_update_dual_edge_parent(d);
+
+	/* Pass on to the normal interrupt handler */
+	handle_fasteoi_irq(desc);
+}
+
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
@@ -868,6 +941,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	unsigned long flags;
 	u32 val;
 
+	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
+		irq_set_handler_locked(d, msm_gpio_handle_dual_edge_parent_irq);
+		msm_gpio_update_dual_edge_parent(d);
+
+		return 0;
+	}
+
 	if (d->parent_data)
 		irq_chip_set_type_parent(d, type);
 
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

