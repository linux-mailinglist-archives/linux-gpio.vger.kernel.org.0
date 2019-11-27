Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147A310AD0B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 10:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfK0J7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 04:59:23 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52232 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK0J7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 04:59:23 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id WxzL2100c5USYZQ01xzL2C; Wed, 27 Nov 2019 10:59:20 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZu6S-0001tZ-L5; Wed, 27 Nov 2019 10:59:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZu6S-00016h-IZ; Wed, 27 Nov 2019 10:59:20 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexandre Courbot <acourbot@nvidia.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpiolib: Fix error message on out-of-range GPIO in lookup table
Date:   Wed, 27 Nov 2019 10:59:19 +0100
Message-Id: <20191127095919.4214-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When a GPIO offset in a lookup table is out-of-range, the printed error
message (1) does not include the actual out-of-range value, and (2)
contains an off-by-one error in the upper bound.

Avoid user confusion by also printing the actual GPIO offset, and
correcting the upper bound of the range.
While at it, use "%u" for unsigned int.

Sample impact:

    -requested GPIO 0 is out of range [0..32] for chip e6052000.gpio
    +requested GPIO 0 (45) is out of range [0..31] for chip e6052000.gpio

Fixes: 2a3cf6a3599e9015 ("gpiolib: return -ENOENT if no GPIO mapping exists")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9913886ede904bb0..dce0b31f4125a6b3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4472,8 +4472,9 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 
 		if (chip->ngpio <= p->chip_hwnum) {
 			dev_err(dev,
-				"requested GPIO %d is out of range [0..%d] for chip %s\n",
-				idx, chip->ngpio, chip->label);
+				"requested GPIO %u (%u) is out of range [0..%u] for chip %s\n",
+				idx, p->chip_hwnum, chip->ngpio - 1,
+				chip->label);
 			return ERR_PTR(-EINVAL);
 		}
 
-- 
2.17.1

