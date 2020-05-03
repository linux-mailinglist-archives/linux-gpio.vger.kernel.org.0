Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D29B1C2E02
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2020 18:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbgECQp4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 May 2020 12:45:56 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:57366 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbgECQpz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 May 2020 12:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588524353; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=Nhog8Xykrxx5yzjacYpj9MUuwiqwMw3Yyy5MMiDcsjY=;
        b=AXQDWN/ygi3g/SbExXFq7AWcd0xxz07yH7DK3znUyFA0rD8GuMRs89nDa4q6/3meN06bon
        s+V9/Q3oUFji2wOXyihJIwpOli1l06YyCSjVB7fnDQ7/53OPd2VDSPMcSVyD2n/KwR6iGG
        QaGnhEwPH2zez67rDFwu4uxuSR/C96A=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] pinctrl: ingenic: Add irq_{request,release}_resources callbacks
Date:   Sun,  3 May 2020 18:45:49 +0200
Message-Id: <20200503164549.163884-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These are called when a GPIO is to be used as IRQ.

Without these custom callbacks, when an interrupt is requested directly
and not through gpiod_to_irq(), the request fails because the GPIO is
not necesarily in input mode. These callbacks simply enforce that the
requested GPIO is in input mode.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 96f04d121ebd..f2b95ee31ffe 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1933,6 +1933,25 @@ static const struct pinctrl_ops ingenic_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
+static int ingenic_gpio_irq_request(struct irq_data *data)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+	int ret;
+
+	ret = ingenic_gpio_direction_input(gpio_chip, data->hwirq);
+	if (ret)
+		return ret;
+
+	return gpiochip_reqres_irq(gpio_chip, data->hwirq);
+}
+
+static void ingenic_gpio_irq_release(struct irq_data *data)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+
+	return gpiochip_relres_irq(gpio_chip, data->hwirq);
+}
+
 static int ingenic_pinmux_set_pin_fn(struct ingenic_pinctrl *jzpc,
 		int pin, int func)
 {
@@ -2296,6 +2315,8 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	jzgc->irq_chip.irq_ack = ingenic_gpio_irq_ack;
 	jzgc->irq_chip.irq_set_type = ingenic_gpio_irq_set_type;
 	jzgc->irq_chip.irq_set_wake = ingenic_gpio_irq_set_wake;
+	jzgc->irq_chip.irq_request_resources = ingenic_gpio_irq_request;
+	jzgc->irq_chip.irq_release_resources = ingenic_gpio_irq_release;
 	jzgc->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND;
 
 	girq = &jzgc->gc.irq;
-- 
2.26.2

