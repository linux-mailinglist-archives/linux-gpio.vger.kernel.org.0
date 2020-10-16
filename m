Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA22290895
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 17:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408419AbgJPPg4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 11:36:56 -0400
Received: from foss.arm.com ([217.140.110.172]:39846 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408384AbgJPPg4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Oct 2020 11:36:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F05C13D5;
        Fri, 16 Oct 2020 08:36:55 -0700 (PDT)
Received: from entos-thunderx2-02.shanghai.arm.com (entos-thunderx2-02.shanghai.arm.com [10.169.212.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8D373F719;
        Fri, 16 Oct 2020 08:36:52 -0700 (PDT)
From:   Jia He <justin.he@arm.com>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia He <justin.he@arm.com>
Subject: [PATCH] gpio: dwapb: Fix missing conversion to GPIO-lib-based IRQ-chip
Date:   Fri, 16 Oct 2020 23:35:44 +0800
Message-Id: <20201016153544.162611-1-justin.he@arm.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 0ea683931adb ("gpio: dwapb: Convert driver to using the
GPIO-lib-based IRQ-chip") missed the case in dwapb_irq_set_wake().

Without this fix, probing the dwapb gpio driver will hit a error:
"address between user and kernel address ranges" on a Ampere armv8a
server and cause a panic.

Fixes: 0ea683931adb ("gpio: dwapb: Convert driver to using the
GPIO-lib-based IRQ-chip")
Signed-off-by: Jia He <justin.he@arm.com>
---
 drivers/gpio/gpio-dwapb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index a5b326754124..2a9046c0fb16 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -343,8 +343,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 #ifdef CONFIG_PM_SLEEP
 static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	struct dwapb_context *ctx = gpio->ports[0].ctx;
 	irq_hw_number_t bit = irqd_to_hwirq(d);
 
-- 
2.17.1

