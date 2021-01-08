Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D892EF095
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 11:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbhAHKVN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 05:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbhAHKVM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 05:21:12 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE729C0612F8
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 02:20:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id EALU2400D4C55Sk06ALUtZ; Fri, 08 Jan 2021 11:20:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxosd-001zdl-W8; Fri, 08 Jan 2021 11:20:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxosd-008Ufo-EJ; Fri, 08 Jan 2021 11:20:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 2/3] gpio: rcar: Optimize GPIO pin state read on R-Car Gen3
Date:   Fri,  8 Jan 2021 11:20:25 +0100
Message-Id: <20210108102026.2024478-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108102026.2024478-1-geert+renesas@glider.be>
References: <20210108102026.2024478-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, the R-Car GPIO driver treats R-Car Gen2 and R-Car Gen3 GPIO
controllers the same.  However, there exist small differences, like the
behavior of the General Input Register (INDT):
  - On R-Car Gen1, R-Car Gen2, and RZ/G1, INDT only reflects the state
    of an input pin if the GPIO is configured for input,
  - On R-Car Gen3 and RZ/G2, INDT always reflects the state of the input
    pins.
Hence to accommodate all variants, the driver does not use the INDT
register to read the status of a GPIO line when configured for output,
at the expense of doing 2 or 3 register reads instead of 1.

Given register accesses are slow, change the .get() and .get_multiple()
callbacks to always use INDT to read pin state on SoCs where this is
supported.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3:
  - Add Reviewed-by, Tested-by,
  - Reformat comment block to match coding style,
  - Rebase on top of commit 3a57026a83ba363e ("gpio: rcar: Remove
    redundant compatible values"),

v2:
  - New.
---
 drivers/gpio/gpio-rcar.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index f3b8c4b44cabdfd2..edded6478792f7b8 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -35,6 +35,7 @@ struct gpio_rcar_bank_info {
 struct gpio_rcar_info {
 	bool has_outdtsel;
 	bool has_both_edge_trigger;
+	bool has_always_in;
 };
 
 struct gpio_rcar_priv {
@@ -302,9 +303,11 @@ static int gpio_rcar_get(struct gpio_chip *chip, unsigned offset)
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	u32 bit = BIT(offset);
 
-	/* testing on r8a7790 shows that INDT does not show correct pin state
-	 * when configured as output, so use OUTDT in case of output pins */
-	if (gpio_rcar_read(p, INOUTSEL) & bit)
+	/*
+	 * Before R-Car Gen3, INDT does not show correct pin state when
+	 * configured as output, so use OUTDT in case of output pins
+	 */
+	if (!p->info.has_always_in && (gpio_rcar_read(p, INOUTSEL) & bit))
 		return !!(gpio_rcar_read(p, OUTDT) & bit);
 	else
 		return !!(gpio_rcar_read(p, INDT) & bit);
@@ -324,6 +327,11 @@ static int gpio_rcar_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	if (!bankmask)
 		return 0;
 
+	if (p->info.has_always_in) {
+		bits[0] = gpio_rcar_read(p, INDT) & bankmask;
+		return 0;
+	}
+
 	spin_lock_irqsave(&p->lock, flags);
 	outputs = gpio_rcar_read(p, INOUTSEL);
 	m = outputs & bankmask;
@@ -383,11 +391,19 @@ static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
 static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
 	.has_outdtsel = false,
 	.has_both_edge_trigger = false,
+	.has_always_in = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
 	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
+	.has_always_in = false,
+};
+
+static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
+	.has_outdtsel = true,
+	.has_both_edge_trigger = true,
+	.has_always_in = true,
 };
 
 static const struct of_device_id gpio_rcar_of_table[] = {
@@ -399,8 +415,7 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 		.data = &gpio_rcar_info_gen2,
 	}, {
 		.compatible = "renesas,rcar-gen3-gpio",
-		/* Gen3 GPIO is identical to Gen2. */
-		.data = &gpio_rcar_info_gen2,
+		.data = &gpio_rcar_info_gen3,
 	}, {
 		.compatible = "renesas,gpio-rcar",
 		.data = &gpio_rcar_info_gen1,
-- 
2.25.1

