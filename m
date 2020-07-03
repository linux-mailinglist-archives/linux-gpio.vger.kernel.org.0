Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDD82130E3
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2020 03:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgGCBS4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 21:18:56 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:49717 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgGCBSz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2020 21:18:55 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9A580806A8;
        Fri,  3 Jul 2020 13:18:50 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1593739130;
        bh=z6uXglLM1apjA8ADkgnQIQcIwy9dTO+rNH4jQNq4seQ=;
        h=From:To:Cc:Subject:Date;
        b=iuLVEDZPCQ+m0eZ6892aQXJJfumNC41P6BLE9LVs8m3GNbMDlOOcXu7cJx65PSq7p
         hOU6jtNN1baGhuUhKgbx609wTN+d2L13mXuQDHi0arllmGmpgl2e3xcCT4PhEZ1oy1
         8Ro2GtbuJtVh8hm3aEZn6HJDhsANUgbjvGxQxJ+NzkGpkiQwUL8S3DlCH1odTNWl2V
         1wRAEvQqSc1o+gKZ4JjDhnUs0DU7gEzLU0IGGUWCNwEIKDf5VOR5FUGjqI2G7A6BYz
         1BDkuRQW9rQKGJFZdcAyborGCkKgXJBwBmjcSMxmN7ZIWGHzOXE9n7v7kJuH+31K+V
         LJ0HYTcLybrAg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5efe877b0000>; Fri, 03 Jul 2020 13:18:51 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id 1C07413EEBA;
        Fri,  3 Jul 2020 13:18:50 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 4C7D53404A4; Fri,  3 Jul 2020 13:18:50 +1200 (NZST)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     ray.jui@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        sbranden@broadcom.com
Cc:     linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH v2] pinctrl: nsp: Set irq handler based on trig type
Date:   Fri,  3 Jul 2020 13:18:30 +1200
Message-Id: <20200703011830.15655-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rather than always using handle_simple_irq() as the gpio_irq_chip
handler, set a more appropriate handler based on the IRQ trigger type
requested. This is important for level triggered interrupts which need
to be masked during handling. Also, fix the interrupt acknowledge so
that it clears only one interrupt instead of all interrupts which are
currently active. Finally there is no need to clear the interrupt during
the interrupt handler, since the edge-triggered handler will do that for
us.

Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
Changes in v2:
- Don't perform unnecessary acks.

 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm=
/pinctrl-nsp-gpio.c
index bed0124388c0..a00a42a61a90 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -154,15 +154,9 @@ static irqreturn_t nsp_gpio_irq_handler(int irq, voi=
d *data)
 		level &=3D readl(chip->base + NSP_GPIO_INT_MASK);
 		int_bits =3D level | event;
=20
-		for_each_set_bit(bit, &int_bits, gc->ngpio) {
-			/*
-			 * Clear the interrupt before invoking the
-			 * handler, so we do not leave any window
-			 */
-			writel(BIT(bit), chip->base + NSP_GPIO_EVENT);
+		for_each_set_bit(bit, &int_bits, gc->ngpio)
 			generic_handle_irq(
 				irq_linear_revmap(gc->irq.domain, bit));
-		}
 	}
=20
 	return  int_bits ? IRQ_HANDLED : IRQ_NONE;
@@ -178,7 +172,7 @@ static void nsp_gpio_irq_ack(struct irq_data *d)
=20
 	trigger_type =3D irq_get_trigger_type(d->irq);
 	if (trigger_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
-		nsp_set_bit(chip, REG, NSP_GPIO_EVENT, gpio, val);
+		writel(val, chip->base + NSP_GPIO_EVENT);
 }
=20
 /*
@@ -262,6 +256,12 @@ static int nsp_gpio_irq_set_type(struct irq_data *d,=
 unsigned int type)
=20
 	nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_POLARITY, gpio, falling);
 	nsp_set_bit(chip, REG, NSP_GPIO_INT_POLARITY, gpio, level_low);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
=20
 	dev_dbg(chip->dev, "gpio:%u level_low:%s falling:%s\n", gpio,
@@ -691,7 +691,7 @@ static int nsp_gpio_probe(struct platform_device *pde=
v)
 		girq->num_parents =3D 0;
 		girq->parents =3D NULL;
 		girq->default_type =3D IRQ_TYPE_NONE;
-		girq->handler =3D handle_simple_irq;
+		girq->handler =3D handle_bad_irq;
 	}
=20
 	ret =3D devm_gpiochip_add_data(dev, gc, chip);
--=20
2.27.0

