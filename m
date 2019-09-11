Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCEE8AFEE7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 16:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbfIKOjN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 10:39:13 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:47992 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbfIKOjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 10:39:13 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id 0Ef42100805gfCL01Ef4TC; Wed, 11 Sep 2019 16:39:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0006T3-Tj; Wed, 11 Sep 2019 16:39:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0003P0-SI; Wed, 11 Sep 2019 16:39:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v2 1/5] gpio: Export gpiod_{request,free}() to modular GPIO code
Date:   Wed, 11 Sep 2019 16:38:54 +0200
Message-Id: <20190911143858.13024-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190911143858.13024-1-geert+renesas@glider.be>
References: <20190911143858.13024-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export the gpiod_request() and gpiod_free() symbols, so modular GPIO
library code can make use of these functions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
ERROR: "gpiod_free" [drivers/gpio/gpiolib-fwd.ko] undefined!
ERROR: "gpiod_request" [drivers/gpio/gpiolib-fwd.ko] undefined!

Alternatives:
  - Force gpiolib-fwd builtin,
  - Call gpio_{,request,free}(desc_to_gpio(...)) instead, as the legacy
    functions are exported,
  - Call gpiod_put() instead of gpiod_free(), as the former is a simple
    exported wrapper around the latter.  Unfortunately there's no such
    alternative for gpiod_request().
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f1c1b5d4b00b40a7..dbecf266be5a5a2a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2733,6 +2733,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(gpiod_request);
 
 static bool gpiod_free_commit(struct gpio_desc *desc)
 {
@@ -2777,6 +2778,7 @@ void gpiod_free(struct gpio_desc *desc)
 		WARN_ON(extra_checks);
 	}
 }
+EXPORT_SYMBOL_GPL(gpiod_free);
 
 /**
  * gpiochip_is_requested - return string iff signal was requested
-- 
2.17.1

