Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8F82C2F29
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 18:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403909AbgKXRrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 12:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403958AbgKXRrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 12:47:46 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCAA2C0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:47:44 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q10so19239969pfn.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2020 09:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ckt5NlFQBUj9ad7Wcfnzxmq4bS87/8gcDcZUE4/+ro=;
        b=PuNaFOUDQZ0VIxY0XaAbtfd5SDpQK9q04/AaC1rPeDrPSW0yP8HpXqIEpt1foMV/oZ
         acqddNjTYpYjz8E1ABr/T1xxKkisF8YQMgh7Do4VcCJ9MqRQzxvpQjKt984jxMK2N1Ik
         TkgrOAosOxTyzdpiK/sbdu5uZrvWO5Tv20GoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ckt5NlFQBUj9ad7Wcfnzxmq4bS87/8gcDcZUE4/+ro=;
        b=BwJZpXoOq8CVUJsepHOq5zPCVbTXHD5/sI7Gcn4FBForvhTY6xwKgfdle17GtuoJcy
         +FNxrn7ovKV4n/R+yqjR+Xw8Dmppm0xuyVIPyxbcAAG7Y0Uq5SAjBIWxUarjUKZcTfQR
         PNAxRRDqfnmzEFnmItWqMnbdXW9wzQlR6R2EF7kXIOPBYsl1JcCF2iD1E67jT7IlF3eQ
         1dKwvjnNxDAXeofj9BBLXPSS7QbKQm4hszxkLk50BscC2jQFvFolN72iwVEiQjrcrA8Q
         OnP+H1uR7MyLs4zVzfYQ6SAeU4Bzgw/akDpl2F2Lz2TgZxMhrZaGpSKlJuLmrzVyHx1q
         BBsQ==
X-Gm-Message-State: AOAM531lH9HfFHZYk8AwpGiZYeFQCxtpQGUgGkFXsJ9YATucR25gfrem
        /oxLofWBO9lhgblfkvOQY64M8w==
X-Google-Smtp-Source: ABdhPJwoLRiT+KykvFRT+U8sBkabFveCDhERGqz1LJCJk2ftAle9VsTy6P52AxNwRMydIWiUKQQz0A==
X-Received: by 2002:a63:34c:: with SMTP id 73mr4524428pgd.172.1606240064368;
        Tue, 24 Nov 2020 09:47:44 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id i4sm13480459pgg.67.2020.11.24.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 09:47:43 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Archana Sathyakumar <asathyak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] irqchip: qcom-pdc: Fix phantom irq when changing between rising/falling
Date:   Tue, 24 Nov 2020 09:47:19 -0800
Message-Id: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
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

Fixes: f55c73aef890 ("irqchip/pdc: Add PDC interrupt controller for QCOM SoCs")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---
There are no dependencies between this patch and patch #2/#3.  It can
go in by itself.  Patches are only grouped together in one series
because they address similar issues.

Changes in v2:
- 0 => false
- If irq_chip_set_type_parent() fails don't bother clearing.
- Add Fixes tag.

 drivers/irqchip/qcom-pdc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index bd39e9de6ecf..f91e7d5aea25 100644
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
+	 * Clear it.  Specifically the phantom shows up if a line is already
+	 * high and we change to rising or if a line is already low and we
+	 * change to falling but let's be consistent and clear it always.
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
2.29.2.454.gaff20da3a2-goog

