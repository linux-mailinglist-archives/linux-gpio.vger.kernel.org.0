Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA6B10ABF3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 09:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfK0InJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 03:43:09 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:48476 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK0InJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 03:43:09 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Wwiu2100T5USYZQ01wiuc1; Wed, 27 Nov 2019 09:43:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0000xh-LV; Wed, 27 Nov 2019 09:42:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0004OX-JP; Wed, 27 Nov 2019 09:42:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/7] gpiolib: Add support for gpiochipN-based table lookup
Date:   Wed, 27 Nov 2019 09:42:48 +0100
Message-Id: <20191127084253.16356-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127084253.16356-1-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently GPIO controllers can only be referred to by label in GPIO
lookup tables.

Add support for looking them up by "gpiochipN" name, with "N" either the
corresponding GPIO device's ID number, or the GPIO controller's first
GPIO number.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
If this is rejected, the GPIO Aggregator documentation must be updated.

The second variant is currently used by the legacy sysfs interface only,
so perhaps the chip->base check should be dropped?

v3:
  - New.
---
 drivers/gpio/gpiolib.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c9e47620d2434983..d24a3d79dcfe69ad 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1746,9 +1746,29 @@ static int gpiochip_match_name(struct gpio_chip *chip, void *data)
 	return !strcmp(chip->label, name);
 }
 
+static int gpiochip_match_id(struct gpio_chip *chip, void *data)
+{
+	int id = (uintptr_t)data;
+
+	return id == chip->base || id == chip->gpiodev->id;
+}
+
 static struct gpio_chip *find_chip_by_name(const char *name)
 {
-	return gpiochip_find((void *)name, gpiochip_match_name);
+	struct gpio_chip *chip;
+	int id;
+
+	chip = gpiochip_find((void *)name, gpiochip_match_name);
+	if (chip)
+		return chip;
+
+	if (!str_has_prefix(name, GPIOCHIP_NAME))
+		return NULL;
+
+	if (kstrtoint(name + strlen(GPIOCHIP_NAME), 10, &id))
+		return NULL;
+
+	return gpiochip_find((void *)(uintptr_t)id, gpiochip_match_id);
 }
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
-- 
2.17.1

