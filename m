Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7A029D8A0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388032AbgJ1Wep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387997AbgJ1Wb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:31:57 -0400
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [IPv6:2a02:1800:110:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D83C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:31:57 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLrFD42qKzMv9T8
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:15:12 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id lSFC2300L4C55Sk01SFCF4; Wed, 28 Oct 2020 15:15:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEJ-000oZ8-UU; Wed, 28 Oct 2020 15:15:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEJ-007Fpj-Ev; Wed, 28 Oct 2020 15:15:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] gpio: rcar: Implement gpio_chip.get_multiple()
Date:   Wed, 28 Oct 2020 15:15:04 +0100
Message-Id: <20201028141504.1729093-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028141504.1729093-1-geert+renesas@glider.be>
References: <20201028141504.1729093-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for getting the state of multiple pins using a minimum of
register reads.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index b33d1a2076eaa2e5..0b572dbc4a36801d 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -310,6 +310,35 @@ static int gpio_rcar_get(struct gpio_chip *chip, unsigned offset)
 		return !!(gpio_rcar_read(p, INDT) & bit);
 }
 
+static int gpio_rcar_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+				  unsigned long *bits)
+{
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
+	u32 bankmask, outputs, m, val = 0;
+	unsigned long flags;
+
+	bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
+	if (chip->valid_mask)
+		bankmask &= chip->valid_mask[0];
+
+	if (!bankmask)
+		return 0;
+
+	spin_lock_irqsave(&p->lock, flags);
+	outputs = gpio_rcar_read(p, INOUTSEL);
+	m = outputs & bankmask;
+	if (m)
+		val |= gpio_rcar_read(p, OUTDT) & m;
+
+	m = ~outputs & bankmask;
+	if (m)
+		val |= gpio_rcar_read(p, INDT) & m;
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	bits[0] = val;
+	return 0;
+}
+
 static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
@@ -478,6 +507,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->get_direction = gpio_rcar_get_direction;
 	gpio_chip->direction_input = gpio_rcar_direction_input;
 	gpio_chip->get = gpio_rcar_get;
+	gpio_chip->get_multiple = gpio_rcar_get_multiple;
 	gpio_chip->direction_output = gpio_rcar_direction_output;
 	gpio_chip->set = gpio_rcar_set;
 	gpio_chip->set_multiple = gpio_rcar_set_multiple;
-- 
2.25.1

