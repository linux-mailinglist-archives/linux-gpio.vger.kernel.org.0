Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F4E40D859
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 13:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237588AbhIPLVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 07:21:09 -0400
Received: from mx.socionext.com ([202.248.49.38]:27922 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237064AbhIPLVI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Sep 2021 07:21:08 -0400
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Sep 2021 20:19:47 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id C24852059034;
        Thu, 16 Sep 2021 20:19:47 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 16 Sep 2021 20:19:47 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 847F0AB192;
        Thu, 16 Sep 2021 20:19:47 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 1/3] gpio: uniphier: Fix void functions to remove return value
Date:   Thu, 16 Sep 2021 20:19:35 +0900
Message-Id: <1631791177-27229-2-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631791177-27229-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1631791177-27229-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The return type of irq_chip.irq_mask() and irq_chip.irq_unmask() should
be void.

Fixes: dbe776c2ca54 ("gpio: uniphier: add UniPhier GPIO controller driver")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/gpio/gpio-uniphier.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index f99f3c1..39dca14 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -184,7 +184,7 @@ static void uniphier_gpio_irq_mask(struct irq_data *data)
 
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, 0);
 
-	return irq_chip_mask_parent(data);
+	irq_chip_mask_parent(data);
 }
 
 static void uniphier_gpio_irq_unmask(struct irq_data *data)
@@ -194,7 +194,7 @@ static void uniphier_gpio_irq_unmask(struct irq_data *data)
 
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, mask);
 
-	return irq_chip_unmask_parent(data);
+	irq_chip_unmask_parent(data);
 }
 
 static int uniphier_gpio_irq_set_type(struct irq_data *data, unsigned int type)
-- 
2.7.4

