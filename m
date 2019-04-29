Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EE1DAE6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 05:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfD2Dzb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Apr 2019 23:55:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36294 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfD2Dza (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Apr 2019 23:55:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id v80so49220pfa.3
        for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2019 20:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7lsB7l68Q2QXqBhtOyTwuTtF7RZuXTpMIg50jCRbpi0=;
        b=e6r9RTINdTkzBfmhCn0Zd/uS9VD+tKpBrRTZLnWJRhIaRQGsTalHikdiV1rFz9XJwT
         YG3UGzwrhVYHjCSpiCl9rA2tJ6OfZ4pgofHmyQ36rynN9F8Rqzjt+iFzzoZfg2lklROm
         8z/efRXO4gc+tbSEyy5VY+144Yd6nv2H+fBoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7lsB7l68Q2QXqBhtOyTwuTtF7RZuXTpMIg50jCRbpi0=;
        b=sBmfDqFAlSue9GZVSfwrt6ZmdtDZALQHbfa0Nt00O8srVwozhHeqLF1GdWBP8coV8f
         xL0ApxUSVO8LFouK4porG6MpP7XDkZ9SFcm8BXidy/fxC2kXrUZUqiK07yZSyTFgojWZ
         xy39/Oo7/iscmSczq925G5MrLB7QPrk5hIPlwh0tpDl+bihHV4EUmeP1QzKbS6G/V0Fl
         r7t2k9SrvIfzz7699xcwyPPBJZ4vpOkDpXtogJwi7n085y88iSn2Ak28ZSKA8kaU6i43
         tOq1rSIytGCAUXxYN+NGpu/PNMx/a+I1RUUqsqKdoV7yTn9zBCHMxnHIXZDHh8vFJ+Gy
         ANaQ==
X-Gm-Message-State: APjAAAX12xFrAVDN02F4X+Gj89D0cGAyeQgRXtvLCxrlFBvt5EkO/TER
        IiwFQewmrxB0MwbeaL/AQNDtf0s/1eo=
X-Google-Smtp-Source: APXvYqwtzrtpO7ganaV1Gc2uDvzrWfkie1Ma+Bpr6cXgpqNo8hY6cYwwk1o8w1b/+Ox9y8r8j8wwBw==
X-Received: by 2002:aa7:9116:: with SMTP id 22mr53588470pfh.165.1556510129598;
        Sun, 28 Apr 2019 20:55:29 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id x128sm55433585pfx.103.2019.04.28.20.55.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 20:55:29 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH 1/2] pinctrl: mediatek: Ignore interrupts that are wake only during resume
Date:   Mon, 29 Apr 2019 11:55:14 +0800
Message-Id: <20190429035515.73611-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190429035515.73611-1-drinkcat@chromium.org>
References: <20190429035515.73611-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Before suspending, mtk-eint would set the interrupt mask to the
one in wake_mask. However, some of these interrupts may not have a
corresponding interrupt handler, or the interrupt may be disabled.

On resume, the eint irq handler would trigger nevertheless,
and irq/pm.c:irq_pm_check_wakeup would be called, which would
try to call irq_disable. However, if the interrupt is not enabled
(irqd_irq_disabled(&desc->irq_data) is true), the call does nothing,
and the interrupt is left enabled in the eint driver.

Especially for level-sensitive interrupts, this will lead to an
interrupt storm on resume.

If we detect that an interrupt is only in wake_mask, but not in
cur_mask, we can just mask it out immediately (as mtk_eint_resume
would do anyway at a later stage in the resume sequence, when
restoring cur_mask).

Fixes: bf22ff45bed ("genirq: Avoid unnecessary low level irq function calls")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index f464f8cd274b75c..737385e86beb807 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -318,7 +318,7 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct mtk_eint *eint = irq_desc_get_handler_data(desc);
 	unsigned int status, eint_num;
-	int offset, index, virq;
+	int offset, mask_offset, index, virq;
 	void __iomem *reg =  mtk_eint_get_offset(eint, 0, eint->regs->stat);
 	int dual_edge, start_level, curr_level;
 
@@ -328,10 +328,24 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 		status = readl(reg);
 		while (status) {
 			offset = __ffs(status);
+			mask_offset = eint_num >> 5;
 			index = eint_num + offset;
 			virq = irq_find_mapping(eint->domain, index);
 			status &= ~BIT(offset);
 
+			/*
+			 * If we get an interrupt on pin that was only required
+			 * for wake (but no real interrupt requested), mask the
+			 * interrupt (as would mtk_eint_resume do anyway later
+			 * in the resume sequence).
+			 */
+			if (eint->wake_mask[mask_offset] & BIT(offset) &&
+			    !(eint->cur_mask[mask_offset] & BIT(offset))) {
+				writel_relaxed(BIT(offset), reg -
+					eint->regs->stat +
+					eint->regs->mask_set);
+			}
+
 			dual_edge = eint->dual_edge[index];
 			if (dual_edge) {
 				/*
-- 
2.21.0.593.g511ec345e18-goog

