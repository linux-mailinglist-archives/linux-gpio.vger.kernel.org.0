Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF13452E9D9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 12:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348117AbiETKZb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 06:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348116AbiETKZa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 06:25:30 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FC9F689A
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 03:25:28 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
        by michel.telenet-ops.be with bizsmtp
        id YyRT2700938adXi06yRT5m; Fri, 20 May 2022 12:25:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzp0-000zwX-Or; Fri, 20 May 2022 12:25:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzp0-003vMq-6u; Fri, 20 May 2022 12:25:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Emil Renner Berthing <kernel@esmil.dk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pinctrl: starfive: Use existing variable gpio
Date:   Fri, 20 May 2022 12:25:25 +0200
Message-Id: <93595278e4775788a5c3e1d0a354c608444dc18f.1653042265.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the existing variable "gpio", instead of obtaining the hwirq number
again.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Feel free to fold into commit 48bd5c381c4a750b ("pinctrl: starfive: Make
the irqchip immutable"), if possible.
---
 drivers/pinctrl/pinctrl-starfive.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/pinctrl-starfive.c
index f82a72f8016f59cc..669aeb45d70dd57b 100644
--- a/drivers/pinctrl/pinctrl-starfive.c
+++ b/drivers/pinctrl/pinctrl-starfive.c
@@ -1079,7 +1079,7 @@ static void starfive_irq_mask(struct irq_data *d)
 	writel_relaxed(value, ie);
 	raw_spin_unlock_irqrestore(&sfp->lock, flags);
 
-	gpiochip_disable_irq(&sfp->gc, d->hwirq);
+	gpiochip_disable_irq(&sfp->gc, gpio);
 }
 
 static void starfive_irq_mask_ack(struct irq_data *d)
@@ -1108,7 +1108,7 @@ static void starfive_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 value;
 
-	gpiochip_enable_irq(&sfp->gc, d->hwirq);
+	gpiochip_enable_irq(&sfp->gc, gpio);
 
 	raw_spin_lock_irqsave(&sfp->lock, flags);
 	value = readl_relaxed(ie) | mask;
-- 
2.25.1

