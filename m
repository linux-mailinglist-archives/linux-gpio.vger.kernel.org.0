Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A892D81D3
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 23:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406768AbgLKWRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 17:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406796AbgLKWRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 17:17:09 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C18C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:15:49 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id hk16so3075470pjb.4
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y7sUikV/F7gNe5Jy42I6mRR8y7okTjvOyaqlUQve9s8=;
        b=EYiob21Rk2nzqjeDbvTDWyfCsA5lwPGIN4WkDcg9WvyrIj+NdQqgSUBvcFUeMIaojD
         Qreh8bkGQrrrOE40m5XF9N4P8r0PR6Cvk+j5LTDKEfe7GA9uwRzUwZFKxnBIpsgEP7l9
         6SPjZnja/FHUJJmDxX+CKRlXiqeTiJFh4QCq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y7sUikV/F7gNe5Jy42I6mRR8y7okTjvOyaqlUQve9s8=;
        b=FmJMp9gj6rNO+2I6ukLcBGDcf6fuJo0yAhbQqcuHq441vAu/D7+FNEmCdHPXVHSS1d
         8aLYSiUpuKpTyS87T86pf2cV4/anbGWb3qmQAQcb29kYMGRsb6TbNsn8iIfz7EVjlZEs
         5ING1HfVHP26mEb5ynIJGdQADf0YQseGeB/HFep9zff5g+si/jgxphGKtDtfAH/xxH/i
         +b57qHnt5IshzzEZkCv30M4d5rRotsR0zRB97uxTex2kcDjai5q3sjAQ4T4p9V1DgK7r
         gTqZrIUHN5G65JwAyEfI4wLgVDZb0suqSEZwEuqQfI6Hv2H+eQDoWF9ZZ3ZBZpYcKNy+
         6AgQ==
X-Gm-Message-State: AOAM531tCqr3SUY6vfBF+UUNYxKF2Hcpdf3yq2UrU80GL4xEgn4oCbZa
        392/cnxRNfkAbeWOTKYD0Ci6uw==
X-Google-Smtp-Source: ABdhPJwQaEII/ZFOuv5w3ZNFYFqtSx7WMh6WT8IlI/wAmhJhldG2bz6rBTVow8GDJR+cKB3eYQkmrw==
X-Received: by 2002:a17:902:5581:b029:da:a817:1753 with SMTP id g1-20020a1709025581b02900daa8171753mr12637716pli.76.1607724948477;
        Fri, 11 Dec 2020 14:15:48 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id s21sm11832981pgk.52.2020.12.11.14.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 14:15:48 -0800 (PST)
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
Subject: [PATCH v4 4/4] pinctrl: qcom: Clear possible pending parent irq when remuxing GPIOs
Date:   Fri, 11 Dec 2020 14:15:38 -0800
Message-Id: <20201211141514.v4.4.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In commit 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to
.irq_request_resources callback") we tried to make it so that the
"enable" didn't clear pending interrupts for interrupts that were
handled by our parent (the PDC).  Unfortunately that regressed things.
After that patch we found that sc7180-trogdor based devices could no
longer enter suspend.

Specifically in sc7180-trogdor.dtsi we configure the uart3 to have two
pinctrl states, sleep and default, and mux between the two during
runtime PM and system suspend (see geni_se_resources_{on,off}() for
more details). The difference between the sleep and default state is
that the RX pin is muxed to a GPIO during sleep and muxed to the UART
otherwise.

As per Qualcomm, when we mux the pin over to the UART function the PDC
is still watching it / latching edges.  These edges don't cause
interrupts because the current code masks the interrupt unless we're
entering suspend.  However, as soon as we enter suspend we unmask the
interrupt and it's counted as a wakeup.

Let's deal with the problem like this:
* When we mux away, we'll mask our parent.  This isn't necessary in
  the above case since the parent already masked us, but it's a good
  idea in general.
* When we mux back will clear any interrupts and unmask our parent if
  needed.

Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch depends on #2/#3 in the series, but not #1.  #1 can land on
its own and then #2/#3/#4 can land together even without #1.  The only
reason patch #1 and #2/#3/#4 are together in one series is because
they address similar issues.

I have done most of this patch testing on the Chrome OS 5.4 kernel
tree (with many backports) but have sanity checked it on mainline.

This patch definitely needs more testing / discussion, so please don't
land without Qualcomm confirming that it looks OK in all the cases
they are aware of.

Changes in v4:
- Totally rewrote again with my new understanding of the world.
- Split non-PDC fix and PDC fix in two.

Changes in v3:
- Fixed bug in msm_gpio_direction_output() (s/oldval =/oldval = val =/)
- Add back "if !skip_wake_irqs" test in msm_gpio_irq_enable()
- For non-PDC, clear 1st interrupt in msm_gpio_irq_set_type()

Changes in v2:
- 0 => false
- If skip_wake_irqs, don't need to clear normal intr.
- Add comment about glitches in both output and input.

 drivers/pinctrl/qcom/pinctrl-msm.c | 42 +++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f785646d1df7..37fa95c5805c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -171,7 +171,12 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned group)
 {
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct gpio_chip *gc = &pctrl->chip;
+	unsigned int irq = irq_find_mapping(gc->irq.domain, group);
+	struct irq_data *d = irq_get_irq_data(irq);
+	unsigned int gpio_func = pctrl->soc->gpio_func;
 	const struct msm_pingroup *g;
+	bool should_manage_parent;
 	unsigned long flags;
 	u32 val, mask;
 	int i;
@@ -187,6 +192,23 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	if (WARN_ON(i == g->nfuncs))
 		return -EINVAL;
 
+	/*
+	 * If an GPIO interrupt is setup on this pin and those interrupts are
+	 * handled by our parent we need special handling.  Specifically the
+	 * parent will still see the pin twiddle even when we're muxed away.
+	 *
+	 * If our GPIO was unmasked before muxing away from GPIO we need to
+	 * mask our parent before switching so it doesn't see the twiddling.
+	 *
+	 * When we switch back we might need to clear any interrupts that were
+	 * latched while were muxed away.
+	 */
+	should_manage_parent = d && d->parent_data &&
+			       test_bit(d->hwirq, pctrl->skip_wake_irqs);
+
+	if (i != gpio_func && should_manage_parent && !irqd_irq_masked(d))
+		irq_chip_mask_parent(d);
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	val = msm_readl_ctl(pctrl, g);
@@ -196,6 +218,13 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
+	if (i == gpio_func && should_manage_parent) {
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
+
+		if (!irqd_irq_masked(d))
+			irq_chip_unmask_parent(d);
+	}
+
 	return 0;
 }
 
@@ -1093,19 +1122,6 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
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

