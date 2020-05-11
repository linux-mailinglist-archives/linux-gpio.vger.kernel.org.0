Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041BC1CDDBC
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 16:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730563AbgEKOxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 10:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730540AbgEKOxL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 May 2020 10:53:11 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F153C05BD0F
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2020 07:53:10 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:702c:fb99:3097:2049])
        by baptiste.telenet-ops.be with bizsmtp
        id dSsy2200E0GoAb601SsyU5; Mon, 11 May 2020 16:53:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jY9ne-00082b-0K; Mon, 11 May 2020 16:52:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jY9nd-0005zR-UX; Mon, 11 May 2020 16:52:57 +0200
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
Subject: [PATCH v7 1/6] i2c: i801: Use GPIO_LOOKUP() helper macro
Date:   Mon, 11 May 2020 16:52:52 +0200
Message-Id: <20200511145257.22970-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511145257.22970-1-geert+renesas@glider.be>
References: <20200511145257.22970-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

i801_add_mux() fills in the GPIO lookup table by manually populating an
array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP() helper
macro instead, to relax a dependency on the gpiod_lookup structure's
member names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
This is now commit be1b92c133cc91b2 ("i2c: i801: Use GPIO_LOOKUP()
helper macro") in i2c/for-next.

v7:
  - Add Reviewed-by,

v6:
  - New.
---
 drivers/i2c/busses/i2c-i801.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a9c03f5c34825a95..4f333889489c882a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1439,9 +1439,9 @@ static int i801_add_mux(struct i801_priv *priv)
 		return -ENOMEM;
 	lookup->dev_id = "i2c-mux-gpio";
 	for (i = 0; i < mux_config->n_gpios; i++) {
-		lookup->table[i].chip_label = mux_config->gpio_chip;
-		lookup->table[i].chip_hwnum = mux_config->gpios[i];
-		lookup->table[i].con_id = "mux";
+		lookup->table[i] = (struct gpiod_lookup)
+			GPIO_LOOKUP(mux_config->gpio_chip,
+				    mux_config->gpios[i], "mux", 0);
 	}
 	gpiod_add_lookup_table(lookup);
 	priv->lookup = lookup;
-- 
2.17.1

