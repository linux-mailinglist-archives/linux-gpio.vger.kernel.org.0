Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8F32C19BA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 01:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgKXACU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 19:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbgKXACT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 19:02:19 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25482C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 16:02:19 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q10so16606768pfn.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 16:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dVZAZuhnHNDw7eBlpqaNTuLy1qB5NlqAynArFyBMzdU=;
        b=oMy+quRSFEMEHuIZhuSvFxsJnohoLaGB1uP5Yc2aYTkic1+FuPSrNECJ/ysK1f6gWT
         ers6BO0+t5vhO1N1mWWI/Weilyqpvb2RNRGU8ocpD7IWHTijus14RXUthJJlRX5ZiOt8
         0wb18gTlJlXBwbt2oaLqZ9kgPv/QZWZlenQfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dVZAZuhnHNDw7eBlpqaNTuLy1qB5NlqAynArFyBMzdU=;
        b=EDT9p65a5CmlO6APmPwXZaAB3QrMs+kRgY6qXqBMPwRAHfDsBD7DC7frDcNJpvKDxf
         LZA8BtkEs/tXTlXqaofH+ja/ODLe1RTmjuZAfMKBlc9rW3R2uO4449o98bpuncp9dMyX
         E2NiN+oa6UW+/Wwl8RPMF5O3KQ1LOD80mCR1Y/Cz7IvxE++/TRgDqRnWbVVpUnQBgknO
         rjN9goZtA48S3qO3z/gOcJ9Z8XPFt6Y75jVmvA+vlNVp8NPlWVGJlvtZHTo6X0ZTZCmI
         BfFIvq6n4hQI1gCR6MRt3E84w/U4tGNXE9bsmukmfsD+e9c6OGkoA+vln209YoniRnEe
         GWzw==
X-Gm-Message-State: AOAM531czTev9SrZRPqDjwf2E+b5MrxmtzD8Yj/sy72b/VZPmNJXflJv
        UYDDzmfozKfIxcxEaXRmTDFZew==
X-Google-Smtp-Source: ABdhPJyPk8xbY5YVwigff7KJFU/YiJcXqrjKKsxb1ubCLKovQVsaw+FkeVdl3VD2BcK+j4hLt4IA0Q==
X-Received: by 2002:a63:215f:: with SMTP id s31mr1567453pgm.258.1606176138623;
        Mon, 23 Nov 2020 16:02:18 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id l133sm13091945pfd.112.2020.11.23.16.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 16:02:18 -0800 (PST)
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
Subject: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing between rising/falling
Date:   Mon, 23 Nov 2020 16:01:51 -0800
Message-Id: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have a problem if we use gpio-keys and configure wakeups such that
we only want one edge to wake us up.  AKA:
  wakeup-event-action = <EV_ACT_DEASSERTED>;
  wakeup-source;

Specifically we end up with a phantom interrupt that blocks suspend if
the line was already high and we want wakeups on rising edges (AKA we
want the GPIO to go low and then high again before we wake up).  The
opposite is also problematic.

Specifically, here's what's happening today:
1. Normally, gpio-keys configures to look for both edges.  Due to the
   current workaround introduced in commit c3c0c2e18d94 ("pinctrl:
   qcom: Handle broken/missing PDC dual edge IRQs on sc7180"), if the
   line was high we'd configure for falling edges.
2. At suspend time, we change to look for rising edges.
3. After qcom_pdc_gic_set_type() runs, we get a phantom interrupt.

We can solve this by just clearing the phantom interrupt.

NOTE: it is possible that this could cause problems for a client with
very specific needs, but there's not much we can do with this
hardware.  As an example, let's say the interrupt signal is currently
high and the client is looking for falling edges.  The client now
changes to look for rising edges.  The client could possibly expect
that if the line has a short pulse low (and back high) that it would
always be detected.  Specifically no matter when the pulse happened,
it should either have tripped the (old) falling edge trigger or the
(new) rising edge trigger.  We will simply not trip it.  We could
narrow down the race a bit by polling our parent before changing
types, but no matter what we do there will still be a period of time
where we can't tell the difference between a real transition (or more
than one transition) and the phantom.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/irqchip/qcom-pdc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index bd39e9de6ecf..7d097164aadc 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -159,6 +159,8 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 {
 	int pin_out = d->hwirq;
 	enum pdc_irq_config_bits pdc_type;
+	enum pdc_irq_config_bits old_pdc_type;
+	int ret;
 
 	if (pin_out == GPIO_NO_WAKE_IRQ)
 		return 0;
@@ -187,9 +189,24 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
+	old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
 	pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
 
-	return irq_chip_set_type_parent(d, type);
+	ret = irq_chip_set_type_parent(d, type);
+
+	/*
+	 * When we change types the PDC can give a phantom interrupt.
+	 * Clear it.  Specifically the phantom shows up if a line is already
+	 * high and we change to rising or if a line is already low and we
+	 * change to falling but let's be consistent and clear it always.
+	 *
+	 * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
+	 * interrupt will be cleared before the rest of the system sees it.
+	 */
+	if (old_pdc_type != pdc_type)
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
+
+	return ret;
 }
 
 static struct irq_chip qcom_pdc_gic_chip = {
-- 
2.29.2.454.gaff20da3a2-goog

