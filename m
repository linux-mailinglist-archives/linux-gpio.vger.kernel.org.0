Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDBEA56102
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 05:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfFZDyz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 23:54:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37682 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfFZDyz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 23:54:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id y8so508239pgl.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 20:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=719FaO+aWRnw4XYLOoRXM4pdoeDNZsMJ0pALAIoQ1Wo=;
        b=lA6OWLRPXyboTpNjyNCaECY2SHWENw5Pj9/nFMod/706hmcpKd+bkwMZUWfmQvemq3
         8eUVJaZwJr9DNvZSnAN0EJBKihi3EV7t2PWPc50kfQA/rKpwEfmZ+GJ741fN06ComEEH
         Hsgxo1XaNrWg1Mx+02QItB0Ft2JXCa2VdPriA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=719FaO+aWRnw4XYLOoRXM4pdoeDNZsMJ0pALAIoQ1Wo=;
        b=dPjxDqnSxQGkYUhSPpplv5S5Wn0d4VDJLbk5BlcBW/V9LED0QPQNHeZDuiIOO30kFV
         YRsIoFqlQgA2h/L6eIakxR7kJkYhNKKpRK+/WHdN15gpV0gwV8HtSPnQCNz9g9I8JyVR
         Q5jd60gr1O9XkQH5Rik0Rs5rbpxTGEqMMUtpqC/Kg9i3aV6Ejjm3rVttZablmN9lqglH
         sUQIqJE5JRHoClC9eXYn9gJ7v6Y/4ZeGObgQJf0lXrDVnp33UmHWaI4EZZ3s7W8ll0lq
         rnRDvMxYFRGok0g17L04dCL+76uXLS6StggOk14drnhjScEQe6LUYkSQtgi/zb7QnlZC
         aaAg==
X-Gm-Message-State: APjAAAUgulgohbj8fiPPjDt5z6NAXTGmeUwZLwqrj9ArKrP3yk6JoP2r
        WdoshfulPEK0zjONkNSEEeWrJA==
X-Google-Smtp-Source: APXvYqzEr4WarL5EQWcWiyFDaW7OQxJFmSAIRXLv347QjxmkHy1Yf6fmqfZUNLYsCAeo4B8P7muyMw==
X-Received: by 2002:a17:90a:37ac:: with SMTP id v41mr1815513pjb.6.1561521294178;
        Tue, 25 Jun 2019 20:54:54 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id b17sm19000599pgk.85.2019.06.25.20.54.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 20:54:53 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH v2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Date:   Wed, 26 Jun 2019 11:54:45 +0800
Message-Id: <20190626035445.236406-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During suspend/resume, mtk_eint_mask may be called while
wake_mask is active. For example, this happens if a wake-source
with an active interrupt handler wakes the system:
irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
that it can be handled later on in the resume flow.

However, this may happen before mtk_eint_do_resume is called:
in this case, wake_mask is loaded, and cur_mask is restored
from an older copy, re-enabling the interrupt, and causing
an interrupt storm (especially for level interrupts).

Step by step, for a line that has both wake and interrupt enabled:
 1. cur_mask[irq] = 1; wake_mask[irq] = 1; EINT_EN[irq] = 1 (interrupt
    enabled at hardware level)
 2. System suspends, resumes due to that line (at this stage EINT_EN
    == wake_mask)
 3. irq_pm_check_wakeup is called, and disables the interrupt =>
    EINT_EN[irq] = 0, but we still have cur_mask[irq] = 1
 4. mtk_eint_do_resume is called, and restores EINT_EN = cur_mask, so
    it reenables EINT_EN[irq] = 1 => interrupt storm as the driver
    is not yet ready to handle the interrupt.

This patch fixes the issue in step 3, by recording all mask/unmask
changes in cur_mask. This also avoids the need to read the current
mask in eint_do_suspend, and we can remove mtk_eint_chip_read_mask
function.

The interrupt will be re-enabled properly later on, sometimes after
mtk_eint_do_resume, when the driver is ready to handle it.

Fixes: 58a5e1b64b ("pinctrl: mediatek: Implement wake handler and suspend resume")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Acked-by: Sean Wang <sean.wang@kernel.org>

---

Applies on top of linux-pinctrl.git/fixes.

Changes from v2:
 - Added Fixes tag
 - Reworded the commit message, added an example. Sean: I hope
   that's what you had in mind, I can reword further, if needed.

Note that IRQCHIP_MASK_ON_SUSPEND does not work here, as it does
not handle lines that are enabled as a wake source, but without
interrupt enabled (e.g. cros_ec driver does that), which we do want
to support.

Also, Stephen Boyd suggested refactoring the genirq layer to make
it aware of such IRQ controllers. I may try to look at this in the
future, but don't have the cycles right now ,-(

 drivers/pinctrl/mediatek/mtk-eint.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 737385e86beb807..7e526bcf5e0b55c 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -113,6 +113,8 @@ static void mtk_eint_mask(struct irq_data *d)
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
 						eint->regs->mask_set);
 
+	eint->cur_mask[d->hwirq >> 5] &= ~mask;
+
 	writel(mask, reg);
 }
 
@@ -123,6 +125,8 @@ static void mtk_eint_unmask(struct irq_data *d)
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
 						eint->regs->mask_clr);
 
+	eint->cur_mask[d->hwirq >> 5] |= mask;
+
 	writel(mask, reg);
 
 	if (eint->dual_edge[d->hwirq])
@@ -217,19 +221,6 @@ static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
 	}
 }
 
-static void mtk_eint_chip_read_mask(const struct mtk_eint *eint,
-				    void __iomem *base, u32 *buf)
-{
-	int port;
-	void __iomem *reg;
-
-	for (port = 0; port < eint->hw->ports; port++) {
-		reg = base + eint->regs->mask + (port << 2);
-		buf[port] = ~readl_relaxed(reg);
-		/* Mask is 0 when irq is enabled, and 1 when disabled. */
-	}
-}
-
 static int mtk_eint_irq_request_resources(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
@@ -384,7 +375,6 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 
 int mtk_eint_do_suspend(struct mtk_eint *eint)
 {
-	mtk_eint_chip_read_mask(eint, eint->base, eint->cur_mask);
 	mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
 
 	return 0;
-- 
2.22.0.410.gd8fdbe21b5-goog

