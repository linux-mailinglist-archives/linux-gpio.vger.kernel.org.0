Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85D640D85D
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 13:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237805AbhIPLVL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 07:21:11 -0400
Received: from mx.socionext.com ([202.248.49.38]:62131 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237585AbhIPLVK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Sep 2021 07:21:10 -0400
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Sep 2021 20:19:49 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id A6B6A2059034;
        Thu, 16 Sep 2021 20:19:49 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 16 Sep 2021 20:19:49 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 39F52AB192;
        Thu, 16 Sep 2021 20:19:49 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 3/3] gpio: uniphier: Use helper functions to get private data from IRQ data
Date:   Thu, 16 Sep 2021 20:19:37 +0900
Message-Id: <1631791177-27229-4-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631791177-27229-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1631791177-27229-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use helper functions to get private data from IRQ data instead of direct
access. No functional changes intended.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/gpio/gpio-uniphier.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index dca96f5..19ce667 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -179,7 +179,7 @@ static int uniphier_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 
 static void uniphier_gpio_irq_mask(struct irq_data *data)
 {
-	struct uniphier_gpio_priv *priv = data->chip_data;
+	struct uniphier_gpio_priv *priv = irq_data_get_irq_chip_data(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
 
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, 0);
@@ -189,7 +189,7 @@ static void uniphier_gpio_irq_mask(struct irq_data *data)
 
 static void uniphier_gpio_irq_unmask(struct irq_data *data)
 {
-	struct uniphier_gpio_priv *priv = data->chip_data;
+	struct uniphier_gpio_priv *priv = irq_data_get_irq_chip_data(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
 
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, mask);
@@ -199,7 +199,7 @@ static void uniphier_gpio_irq_unmask(struct irq_data *data)
 
 static int uniphier_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
-	struct uniphier_gpio_priv *priv = data->chip_data;
+	struct uniphier_gpio_priv *priv = irq_data_get_irq_chip_data(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
 	u32 val = 0;
 
-- 
2.7.4

