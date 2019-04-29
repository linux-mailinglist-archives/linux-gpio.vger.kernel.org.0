Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29729DAE8
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 05:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfD2Dzd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Apr 2019 23:55:33 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35060 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfD2Dzc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Apr 2019 23:55:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id t21so4650222pfh.2
        for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2019 20:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WAZlyDzGKVIdVMC388n6S7o0DOasFYjgOEfAKf4uteY=;
        b=nSEa1MJ4YGhP7t6ZTTKWFurbopRUMivjdQCEUKmamdRbDSTbxUQbmsdw/JeTlHj47P
         e9Rjsu7YKOeUFG6lZbHcj2EFQJ2rW7yuNvBuXJVi0gyadnS0GlwtOvda8IRiGsZRqzsr
         tU5oaOTdgfubtwUJH0ZWA4QUdgzfJLmwUBugM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WAZlyDzGKVIdVMC388n6S7o0DOasFYjgOEfAKf4uteY=;
        b=Bb31KelM8D3Bwkb9an8Y8nad6Xhx2k0FLfC8/wvy7iAQ+gi+5ircdHZZSmbsy1o993
         TcTI3j6VF5Jl3Du/tik9r6ArcL0ugm/acDqL61IhSo/gRny2x/XG8KZ3itRHzR0cOxFN
         h4F8Ege4dU+SBjCGn6LJlp48+nhPfzElJ+LE0wi8Pse5OJiCOsV2EIF2yFON3XlJN8KM
         snWg3eJbsxL+TFYDr3sKs6BcrZHmTR6yahPLZOPwvWR0EmvFKbNJ7sroYg5RfBc8SHmu
         xhmxDb6OvGcGK4/ANd8G6b2Z2dFAMZYHriyzSmPxLzTmK/65xSLKjcp3jeJVyuyM9uVe
         KKtg==
X-Gm-Message-State: APjAAAV6/wq3ixVW6WdRY45uBGjcKoeAAXUB+phmTUZg+mgdlxrnNhb5
        Tu66/kgFWD7ryA0C0/LCVvCmT6FgqOs=
X-Google-Smtp-Source: APXvYqx3TFhPNmuhW9pXjaa8z9fORbLQnXGmeqzBi0NVBXmBzyMccsPh3dh+KK5grUYlUW8sKt9sow==
X-Received: by 2002:a62:a219:: with SMTP id m25mr60974348pff.197.1556510131833;
        Sun, 28 Apr 2019 20:55:31 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id x128sm55433585pfx.103.2019.04.28.20.55.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 20:55:31 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Date:   Mon, 29 Apr 2019 11:55:15 +0800
Message-Id: <20190429035515.73611-3-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190429035515.73611-1-drinkcat@chromium.org>
References: <20190429035515.73611-1-drinkcat@chromium.org>
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

Instead, we just record mask/unmask changes in cur_mask. This
also avoids the need to read the current mask in eint_do_suspend,
and we can remove mtk_eint_chip_read_mask function.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
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
2.21.0.593.g511ec345e18-goog

