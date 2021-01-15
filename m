Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5892F70D9
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 04:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbhAODSH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 22:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732387AbhAODSG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 22:18:06 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B809C061786
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 19:16:49 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id r4so3967649pls.11
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 19:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N9ZaqZ46wlGnN7FBtq7FolY4OMba+JOZe66Oqhjpajw=;
        b=dMkB7BJyvcLuCZx0F/66ek/Tz5GqGjfQcXs9Rzh7Zq+KUCQgvscmK/otbbIT+ZYA/J
         pCCTkdaX+GEy0jLQ7BH3vamYhINMDPsKpuco7SNZGxFR/Nlks50/1yuj3bP9nEZafqfT
         ppSKO2C1CbgwM+lEsXvwRUPCmsI/wgjV+S/rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N9ZaqZ46wlGnN7FBtq7FolY4OMba+JOZe66Oqhjpajw=;
        b=LTtIdtx324LCALkmNF4bZnJfVRo66xpLxk+4Fi0D5JZIz2MXw1CF1ptr9B9ZabA2PM
         l3tr/3vVv17ix9UNVDiUwR2NXRvDixKVY5c9Jq9Za1AL4cDZs1dJrCSZ8133i1axZNml
         B+y1oIHX4wb51boU9k6d18dPQ8DDrRxREegxb+SRnNYRwVouF727poG2+PagJ/bOWvam
         HuUYYLRrPkXgiZUPCYkV1MWwTEk1JAmkmT4CnHONKlVBu3Vv8ZA0No7QNyXflALfa1Cq
         DtMcqerXoklQj5ALSFdupHb81vg1w846yW9BQd2L1W10ClUOkravolMpbtaxdcbzpyss
         QBRQ==
X-Gm-Message-State: AOAM533nfc23rg1UDRJsgFE1aMSmnGoL5Jwp9Iv/fokqkOo3RhWGvOMV
        awdk3dUvoC6Dn7/5QVv5NkUokw==
X-Google-Smtp-Source: ABdhPJzzSZKdii7IwEyI38w9KApzOhoLGDuRizDSSh2SuFTQg6qzwwnyTi5JBx4V9Ly4YmLV0Wi4PQ==
X-Received: by 2002:a17:902:d891:b029:de:369c:6bc7 with SMTP id b17-20020a170902d891b02900de369c6bc7mr10035732plz.31.1610680608722;
        Thu, 14 Jan 2021 19:16:48 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q26sm6346318pfl.219.2021.01.14.19.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:16:48 -0800 (PST)
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
Subject: [PATCH v7 3/4] pinctrl: qcom: Properly clear "intr_ack_high" interrupts when unmasking
Date:   Thu, 14 Jan 2021 19:16:23 -0800
Message-Id: <20210114191601.v7.3.I32d0f4e174d45363b49ab611a13c3da8f1e87d0f@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
References: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In commit 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for
msm gpio") we tried to Ack interrupts during unmask.  However, that
patch forgot to check "intr_ack_high" so, presumably, it only worked
for a certain subset of SoCs.

Let's add a small accessor so we don't need to open-code the logic in
both places.

This was found by code inspection.  I don't have any access to the
hardware in question nor software that needs the Ack during unmask.

Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
It should be noted that this code will be moved in the next patch.  In
theory this could be squashed into the next patch but it seems more
documenting to have this as a separate patch.

(no changes since v6)

Changes in v6:
- Remove unneeded parenthesis.

Changes in v5:
- ("pinctrl: qcom: Properly clear "intr_ack_high" interrupts...") new for v5.

 drivers/pinctrl/qcom/pinctrl-msm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 2f363c28d9d9..192ed31eabf4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -96,6 +96,14 @@ MSM_ACCESSOR(intr_cfg)
 MSM_ACCESSOR(intr_status)
 MSM_ACCESSOR(intr_target)
 
+static void msm_ack_intr_status(struct msm_pinctrl *pctrl,
+				const struct msm_pingroup *g)
+{
+	u32 val = g->intr_ack_high ? BIT(g->intr_status_bit) : 0;
+
+	msm_writel_intr_status(val, pctrl, g);
+}
+
 static int msm_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
@@ -797,7 +805,7 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 	 * when the interrupt is not in use.
 	 */
 	if (status_clear)
-		msm_writel_intr_status(0, pctrl, g);
+		msm_ack_intr_status(pctrl, g);
 
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
@@ -890,7 +898,6 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
-	u32 val;
 
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
@@ -902,8 +909,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = g->intr_ack_high ? BIT(g->intr_status_bit) : 0;
-	msm_writel_intr_status(val, pctrl, g);
+	msm_ack_intr_status(pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 		msm_gpio_update_dual_edge_pos(pctrl, g, d);
-- 
2.30.0.284.gd98b1dd5eaa7-goog

