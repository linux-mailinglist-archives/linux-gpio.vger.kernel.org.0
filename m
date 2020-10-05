Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081CD283739
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 16:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgJEOCY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 10:02:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:54056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725954AbgJEOCY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Oct 2020 10:02:24 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF4492085B;
        Mon,  5 Oct 2020 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601906543;
        bh=rxc3XhX1nx8QuYTrJNvWee/HrGELRzW/U/KzDS85YDg=;
        h=From:To:Cc:Subject:Date:From;
        b=ju6CVsNsFA93xbg1UKUxKjShRajQ/HLrcgiXnddy29nUbWxNnJRf7+J6mTVH6W+Rt
         w4m2JALHdxvEcrxSQKRqm0+Afzu7qww67afRDxpJwdAOzuIqI/6V4LISaXISHX3sUy
         nXGOo5NPECZ74QJ4T0P95XWd+tlbOdW3vLe18lWE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPR4H-00HOH4-7u; Mon, 05 Oct 2020 15:02:21 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-team@android.com
Subject: [PATCH] gpio: pca953x: Survive spurious interrupts
Date:   Mon,  5 Oct 2020 15:02:17 +0100
Message-Id: <20201005140217.1390851-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pca953x driver never checks the result of irq_find_mapping(),
which returns 0 when no mapping is found. When a spurious interrupt
is delivered (which can happen under obscure circumstances), the
kernel explodes as it still tries to handle the error code as
a real interrupt.

Handle this particular case and warn on spurious interrupts.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpio/gpio-pca953x.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index fb61f2fc6ed7..c2d6121c48c9 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -824,8 +824,21 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 	ret = pca953x_irq_pending(chip, pending);
 	mutex_unlock(&chip->i2c_lock);
 
-	for_each_set_bit(level, pending, gc->ngpio)
-		handle_nested_irq(irq_find_mapping(gc->irq.domain, level));
+	if (ret) {
+		ret = 0;
+
+		for_each_set_bit(level, pending, gc->ngpio) {
+			int nested_irq = irq_find_mapping(gc->irq.domain, level);
+
+			if (unlikely(nested_irq <= 0)) {
+				dev_warn_ratelimited(gc->parent, "unmapped interrupt %d\n", level);
+				continue;
+			}
+
+			handle_nested_irq(nested_irq);
+			ret = 1;
+		}
+	}
 
 	return IRQ_RETVAL(ret);
 }
-- 
2.28.0

