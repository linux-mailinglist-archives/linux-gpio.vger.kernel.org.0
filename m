Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CC129D830
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387696AbgJ1WaW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:30:22 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:51724 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387688AbgJ1WaV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:30:21 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4CLrFD63XmzMr7pG
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:15:12 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id lSFC2300Z4C55Sk01SFCxa; Wed, 28 Oct 2020 15:15:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEK-000oZ7-6t; Wed, 28 Oct 2020 15:15:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEJ-007Fpe-DQ; Wed, 28 Oct 2020 15:15:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] gpio: rcar: Rework hardware features handling
Date:   Wed, 28 Oct 2020 15:15:03 +0100
Message-Id: <20201028141504.1729093-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028141504.1729093-1-geert+renesas@glider.be>
References: <20201028141504.1729093-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reuse gpio_rcar_info inside gpio_rcar_priv instead of duplicating the
individual members, so gpio_rcar_parse_dt() can copy them in one go.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index a7fb0ec78e44a3ed..b33d1a2076eaa2e5 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -32,6 +32,11 @@ struct gpio_rcar_bank_info {
 	u32 intmsk;
 };
 
+struct gpio_rcar_info {
+	bool has_outdtsel;
+	bool has_both_edge_trigger;
+};
+
 struct gpio_rcar_priv {
 	void __iomem *base;
 	spinlock_t lock;
@@ -40,8 +45,7 @@ struct gpio_rcar_priv {
 	struct irq_chip irq_chip;
 	unsigned int irq_parent;
 	atomic_t wakeup_path;
-	bool has_outdtsel;
-	bool has_both_edge_trigger;
+	struct gpio_rcar_info info;
 	struct gpio_rcar_bank_info bank_info;
 };
 
@@ -123,7 +127,7 @@ static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
 	gpio_rcar_modify_bit(p, EDGLEVEL, hwirq, !level_trigger);
 
 	/* Select one edge or both edges in BOTHEDGE */
-	if (p->has_both_edge_trigger)
+	if (p->info.has_both_edge_trigger)
 		gpio_rcar_modify_bit(p, BOTHEDGE, hwirq, both);
 
 	/* Select "Interrupt Input Mode" in IOINTSEL */
@@ -162,7 +166,7 @@ static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
 						      false);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		if (!p->has_both_edge_trigger)
+		if (!p->info.has_both_edge_trigger)
 			return -EINVAL;
 		gpio_rcar_config_interrupt_input_mode(p, hwirq, true, false,
 						      true);
@@ -238,7 +242,7 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 	gpio_rcar_modify_bit(p, INOUTSEL, gpio, output);
 
 	/* Select General Output Register to output data in OUTDTSEL */
-	if (p->has_outdtsel && output)
+	if (p->info.has_outdtsel && output)
 		gpio_rcar_modify_bit(p, OUTDTSEL, gpio, false);
 
 	spin_unlock_irqrestore(&p->lock, flags);
@@ -347,11 +351,6 @@ static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-struct gpio_rcar_info {
-	bool has_outdtsel;
-	bool has_both_edge_trigger;
-};
-
 static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
 	.has_outdtsel = false,
 	.has_both_edge_trigger = false,
@@ -418,8 +417,7 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	int ret;
 
 	info = of_device_get_match_data(p->dev);
-	p->has_outdtsel = info->has_outdtsel;
-	p->has_both_edge_trigger = info->has_both_edge_trigger;
+	p->info = *info;
 
 	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
 	*npins = ret == 0 ? args.args[2] : RCAR_MAX_GPIO_PER_BANK;
@@ -553,7 +551,7 @@ static int gpio_rcar_suspend(struct device *dev)
 	p->bank_info.intmsk = gpio_rcar_read(p, INTMSK);
 	p->bank_info.posneg = gpio_rcar_read(p, POSNEG);
 	p->bank_info.edglevel = gpio_rcar_read(p, EDGLEVEL);
-	if (p->has_both_edge_trigger)
+	if (p->info.has_both_edge_trigger)
 		p->bank_info.bothedge = gpio_rcar_read(p, BOTHEDGE);
 
 	if (atomic_read(&p->wakeup_path))
-- 
2.25.1

