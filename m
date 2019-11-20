Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2AEC103FC5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 16:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbfKTPpc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 10:45:32 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:51876 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730378AbfKTPpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 10:45:31 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id UFlV2100J5USYZQ01FlVea; Wed, 20 Nov 2019 16:45:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iXSAb-0002mv-96; Wed, 20 Nov 2019 16:45:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iXSAb-0004FN-6U; Wed, 20 Nov 2019 16:45:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: of: Fix bogus reference to gpiod_get_count()
Date:   Wed, 20 Nov 2019 16:45:21 +0100
Message-Id: <20191120154521.16273-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The recommended function is called gpiod_count(), not gpiod_get_count().

Fixes: f626d6dfb7098525 ("gpio: of: Break out OF-only code")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bd06743a5d7cd2cc..dc27b1a88e9343a8 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -27,7 +27,7 @@
  * This is used by external users of of_gpio_count() from <linux/of_gpio.h>
  *
  * FIXME: get rid of those external users by converting them to GPIO
- * descriptors and let them all use gpiod_get_count()
+ * descriptors and let them all use gpiod_count()
  */
 int of_gpio_get_count(struct device *dev, const char *con_id)
 {
-- 
2.17.1

