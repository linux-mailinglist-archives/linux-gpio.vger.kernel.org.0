Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025752D81C8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 23:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406774AbgLKWQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 17:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406765AbgLKWQY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 17:16:24 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031B8C061793
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:15:44 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id u4so5274379plr.12
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eSXgvDLpVB7w74OUfv3cDJRgo0Ae+QBThzZ61gjo+zM=;
        b=RjZ/Yl0JAFwkfZgGfxUK6IM1WdZvS9NvWj2e7aH+rj+FX+LHVf5JZrhWKXJbGnGpeP
         tmUoJNEC3rB1oxmNbw52dkbdEvfZNA5zKbTD/+VmkdXldxrdyG4kRSbb2lPsxUWxGd61
         zQ5OS9TS9SSwyvVOyG+79q7i4gO/e4fmrsrfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eSXgvDLpVB7w74OUfv3cDJRgo0Ae+QBThzZ61gjo+zM=;
        b=TaCRWv8+qWxqYMn8xvKTn5r3GcGH/mgaEwOrtOF/AyqAb6rJ0tS6ouD5kUuX4xvS98
         H1T1E5burR3SHX8KeCYre+zaDLJc+9ay8ZgZG25Y1pUsfKGBx93Ht/u+d7hUdvu7GuFa
         1j8JjUg0s19LFg2TrqjzoZJ4jHZhg0KQgYb8Yi82q2xXuM1EiLgt3moqt3+GkVER94OT
         J+MovEQCzgnpKzLt5eAxgxfZjGyLbcN0d62r4RkuKkTwxWdcoOIMveQWDfYnY2EV/XbW
         t3Ku3DUrtAJaJVvXzDVdsuKL6CmVxQOI03EfG6V7peyM60hn9b25VjzlD5EStQ1+8tUM
         STQw==
X-Gm-Message-State: AOAM5312gMaCEAUdMkD5R+0FE+wWIWz8Gxo1f2j6/mpSdaozk/Eeb3x1
        3tWDN3VYN4H8KqsVGHGP+O5jZA==
X-Google-Smtp-Source: ABdhPJyIv2Jehmt+dPfzYJ96qnWSdOKGFV7nzHGwAGIYg+MmYfmO6vSXyTlAjfuNOW3jvr2yWdLwgQ==
X-Received: by 2002:a17:90a:f28f:: with SMTP id fs15mr15217771pjb.121.1607724943391;
        Fri, 11 Dec 2020 14:15:43 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id s21sm11832981pgk.52.2020.12.11.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 14:15:42 -0800 (PST)
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
        Andy Gross <agross@kernel.org>,
        Archana Sathyakumar <asathyak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] irqchip: qcom-pdc: Fix phantom irq when changing between rising/falling
Date:   Fri, 11 Dec 2020 14:15:35 -0800
Message-Id: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
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

Fixes: f55c73aef890 ("irqchip/pdc: Add PDC interrupt controller for QCOM SoCs")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
There are no dependencies between this patch and patch #2/#3.  It can
go in by itself.  Patches are only grouped together in one series
because they address similar issues.

Maulik has got confirmation from hardware guys and understands the
problem.  This patch is ready to land.

Changes in v4:
- No changes, this patch on its own ready to land.

Changes in v3:
- Adjusted the comment as per Maulik.

Changes in v2:
- 0 => false
- If irq_chip_set_type_parent() fails don't bother clearing.
- Add Fixes tag.

 drivers/irqchip/qcom-pdc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index bd39e9de6ecf..5dc63c20b67e 100644
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
@@ -187,9 +189,26 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
+	old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
 	pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
 
-	return irq_chip_set_type_parent(d, type);
+	ret = irq_chip_set_type_parent(d, type);
+	if (ret)
+		return ret;
+
+	/*
+	 * When we change types the PDC can give a phantom interrupt.
+	 * Clear it.  Specifically the phantom shows up when reconfiguring
+	 * polarity of interrupt without changing the state of the signal
+	 * but let's be consistent and clear it always.
+	 *
+	 * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
+	 * interrupt will be cleared before the rest of the system sees it.
+	 */
+	if (old_pdc_type != pdc_type)
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
+
+	return 0;
 }
 
 static struct irq_chip qcom_pdc_gic_chip = {
-- 
2.29.2.576.ga3fc446d84-goog

