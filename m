Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC231CDDB7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 16:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbgEKOxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 10:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730474AbgEKOxK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 May 2020 10:53:10 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63298C05BD09
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2020 07:53:10 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:702c:fb99:3097:2049])
        by andre.telenet-ops.be with bizsmtp
        id dSsy220060GoAb601Ssy9H; Mon, 11 May 2020 16:53:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jY9ne-00082e-2B; Mon, 11 May 2020 16:52:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jY9ne-0005zT-0R; Mon, 11 May 2020 16:52:58 +0200
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
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v7 2/6] mfd: sm501: Use GPIO_LOOKUP_IDX() helper macro
Date:   Mon, 11 May 2020 16:52:53 +0200
Message-Id: <20200511145257.22970-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511145257.22970-1-geert+renesas@glider.be>
References: <20200511145257.22970-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

i801_add_mux() fills in the GPIO lookup table by manually populating an
array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP_IDX()
helper macro instead, to relax a dependency on the gpiod_lookup
structure's member names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
v7:
  - Add Acked-by,

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

