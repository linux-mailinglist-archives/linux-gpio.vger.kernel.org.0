Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05731191227
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 14:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgCXN5K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 09:57:10 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:56032 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgCXN5J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 09:57:09 -0400
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id JDwu2200M5USYZQ06Dwua8; Tue, 24 Mar 2020 14:57:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jGk34-0006Oi-JB; Tue, 24 Mar 2020 14:56:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jGk34-0001kb-Gc; Tue, 24 Mar 2020 14:56:54 +0100
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
        qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v6 3/8] mfd: sm501: Use GPIO_LOOKUP_IDX() helper macro
Date:   Tue, 24 Mar 2020 14:56:48 +0100
Message-Id: <20200324135653.6676-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324135653.6676-1-geert+renesas@glider.be>
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

i801_add_mux() fills in the GPIO lookup table by manually populating an
array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP_IDX()
helper macro instead, to relax a dependency on the gpiod_lookup
structure's member names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lee Jones <lee.jones@linaro.org>
---
While this patch is a dependency for "[PATCH v6 4/8] gpiolib: Add
support for GPIO lookup by line name", it can be applied independently.
But an Acked-by would be nice, too.

Cover letter and full series at
https://lore.kernel.org/r/20200324135328.5796-1-geert+renesas@glider.be/

v6:
  - New.
---
 drivers/mfd/sm501.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index e49787e6bb93e5c8..ccd62b963952814e 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1145,22 +1145,14 @@ static int sm501_register_gpio_i2c_instance(struct sm501_devdata *sm,
 		return -ENOMEM;
 
 	lookup->dev_id = "i2c-gpio";
-	if (iic->pin_sda < 32)
-		lookup->table[0].chip_label = "SM501-LOW";
-	else
-		lookup->table[0].chip_label = "SM501-HIGH";
-	lookup->table[0].chip_hwnum = iic->pin_sda % 32;
-	lookup->table[0].con_id = NULL;
-	lookup->table[0].idx = 0;
-	lookup->table[0].flags = GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN;
-	if (iic->pin_scl < 32)
-		lookup->table[1].chip_label = "SM501-LOW";
-	else
-		lookup->table[1].chip_label = "SM501-HIGH";
-	lookup->table[1].chip_hwnum = iic->pin_scl % 32;
-	lookup->table[1].con_id = NULL;
-	lookup->table[1].idx = 1;
-	lookup->table[1].flags = GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN;
+	lookup->table[0] = (struct gpiod_lookup)
+		GPIO_LOOKUP_IDX(iic->pin_sda < 32 ? "SM501-LOW" : "SM501-HIGH",
+				iic->pin_sda % 32, NULL, 0,
+				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN);
+	lookup->table[1] = (struct gpiod_lookup)
+		GPIO_LOOKUP_IDX(iic->pin_scl < 32 ? "SM501-LOW" : "SM501-HIGH",
+				iic->pin_scl % 32, NULL, 1,
+				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN);
 	gpiod_add_lookup_table(lookup);
 
 	icd = dev_get_platdata(&pdev->dev);
-- 
2.17.1

