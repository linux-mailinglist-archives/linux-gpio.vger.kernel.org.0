Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193D836F29E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 00:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhD2WfR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 18:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhD2WfR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 18:35:17 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5F9C06138C
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 15:34:29 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id v123so15577855ioe.10
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 15:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4/CBPJmmorp9wRvE6qOkTgg1jysVhBrmkTVBuHe6QQ=;
        b=U2bio64BQ8Wz3mb2blawMVJjOkMenmh+TW/n8wt1su4ybLHJZbq0Qclep6aw5ZN5bN
         1HqdGR3v11kybihvRTWcYYwsit9rKGPsw84yLsP6i3ycJDM2Li1FjOIQ6HpfEM6z43Dd
         AM8Xf8FMLtW7cUtUyAhjxtBeC+ddXA+ASk8C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4/CBPJmmorp9wRvE6qOkTgg1jysVhBrmkTVBuHe6QQ=;
        b=AahGnenfW7PLFt3g3IrSlTPfEO8Fjex067pLo8hy4rAQw5jyARW0cOmVgyQ6oUEB9+
         sSRC5BIQvia2E1nY7z/ECbYMrqsqL+KisrHkbTvjD+p/WCdpX47hck+JXruJvRgkErpL
         kzGcyOvQwRZEMmM0t4iRKV8zuBjZzGBChDv7UPKuCoqZYOqpWC4PiR8iEDRPeQhkIMSJ
         O4ZwQzSXIIps6JX11RrPJKkKv4/MKgni+T89tkoIZyb81czJwmMj5ustvkpuOQPfX29O
         bgEqR1ZrMMfwBo6TGw/cmf2O7ayMfQ8Ak+3ZJLM+NzxLDAoBhpR4WUhP/TGtfHkZ1gvz
         qqZw==
X-Gm-Message-State: AOAM530wDEGtWaj9ByHtTC1tIuXKYfzwNBWfqCH5b9yA5IsXIYMNfQiB
        tx3lMcQEt9UeNwHq1oIXcO2eddoh1x5nKg==
X-Google-Smtp-Source: ABdhPJwx2FmDvSaSoJMnMUkOhkH4tC+t0JNKguzmILeYGpWGPk/JWDXqmVVJm9N6xY/S4+EuHufriw==
X-Received: by 2002:a05:6602:81e:: with SMTP id z30mr1431268iow.90.1619735669154;
        Thu, 29 Apr 2021 15:34:29 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h184-60-195-141.arvdco.broadband.dynamic.tds.net. [184.60.195.141])
        by smtp.gmail.com with ESMTPSA id o26sm554177ioo.7.2021.04.29.15.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 15:34:28 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-gpio@vger.kernel.org
Cc:     kramasub@chromium.org, Raul E Rangel <rrangel@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: amd: Implement irq_set_wake
Date:   Thu, 29 Apr 2021 16:34:24 -0600
Message-Id: <20210429163341.1.I7631534622233689dd81410525e0dd617b9b2012@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This allows the OS to control which devices produce wake events.

$ grep enabled /sys/kernel/irq/*/wakeup
/sys/kernel/irq/24/wakeup:enabled

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/pinctrl/pinctrl-amd.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 899c16c17b6d..27ad759e5958 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -399,6 +399,29 @@ static void amd_gpio_irq_unmask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
+static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	u32 pin_reg;
+	unsigned long flags;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
+	u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
+			BIT(WAKE_CNTRL_OFF_S4);
+
+	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
+
+	if (on)
+		pin_reg |= wake_mask;
+	else
+		pin_reg &= ~wake_mask;
+
+	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
+	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return 0;
+}
+
 static void amd_gpio_irq_eoi(struct irq_data *d)
 {
 	u32 reg;
@@ -513,9 +536,16 @@ static struct irq_chip amd_gpio_irqchip = {
 	.irq_disable  = amd_gpio_irq_disable,
 	.irq_mask     = amd_gpio_irq_mask,
 	.irq_unmask   = amd_gpio_irq_unmask,
+	.irq_set_wake = amd_gpio_irq_set_wake,
 	.irq_eoi      = amd_gpio_irq_eoi,
 	.irq_set_type = amd_gpio_irq_set_type,
-	.flags        = IRQCHIP_SKIP_SET_WAKE,
+	/*
+	 * We need to set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND so that a wake event
+	 * also generates an IRQ. We need the IRQ so the irq_handler can clear
+	 * the wake event. Otherwise the wake event will never clear and
+	 * prevent the system from suspending.
+	 */
+	.flags        = IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND,
 };
 
 #define PIN_IRQ_PENDING	(BIT(INTERRUPT_STS_OFF) | BIT(WAKE_STS_OFF))
-- 
2.31.1.527.g47e6f16901-goog

