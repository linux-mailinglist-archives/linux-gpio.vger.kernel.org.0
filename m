Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D562E13CBE4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 19:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbgAOSPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 13:15:53 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:53994 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbgAOSPp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 13:15:45 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id qiFR2100W5USYZQ01iFRmd; Wed, 15 Jan 2020 19:15:43 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1irnCP-00012W-F4; Wed, 15 Jan 2020 19:15:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1irnCP-000692-Cf; Wed, 15 Jan 2020 19:15:25 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 1/5] gpiolib: Add support for gpiochipN-based table lookup
Date:   Wed, 15 Jan 2020 19:15:19 +0100
Message-Id: <20200115181523.23556-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115181523.23556-1-geert+renesas@glider.be>
References: <20200115181523.23556-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently GPIO controllers can only be referred to by label in GPIO
lookup tables.

Add support for looking them up by "gpiochipN" name, with "N" the
corresponding GPIO device's ID number.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
v4:
  - Add Reviewed-by,
  - Drop support for legacy sysfs interface based name matching,
  - Replace complex custom matching by a simple additional check in the
    existing gpiochip_match_name() function,
  - Add kerneldoc() for find_chip_by_name(), documenting matching order.

v3:
  - New.
---
 drivers/gpio/gpiolib.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9fd2dfb658546159..114325b366ae33d5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1738,9 +1738,18 @@ static int gpiochip_match_name(struct gpio_chip *chip, void *data)
 {
 	const char *name = data;
 
-	return !strcmp(chip->label, name);
+	return !strcmp(chip->label, name) ||
+	       !strcmp(dev_name(&chip->gpiodev->dev), name);
 }
 
+/**
+ * find_chip_by_name() - Find a specific gpio_chip by name
+ * @name: Name to match
+ *
+ * Return a reference to a gpio_chip that matches the passed name.
+ * This function first tries matching on the gpio_chip's label, followed by
+ * matching on dev_name() of the corresponding gpio_device.
+ */
 static struct gpio_chip *find_chip_by_name(const char *name)
 {
 	return gpiochip_find((void *)name, gpiochip_match_name);
-- 
2.17.1

