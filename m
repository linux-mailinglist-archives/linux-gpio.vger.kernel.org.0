Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D39495BE39
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 16:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbfGAO05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 10:26:57 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:52122 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbfGAO05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 10:26:57 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id XSSu2000j05gfCL01SSu1R; Mon, 01 Jul 2019 16:26:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hhxGg-000887-Kd; Mon, 01 Jul 2019 16:26:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hhxGg-0006Xw-It; Mon, 01 Jul 2019 16:26:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpiolib: Document new gpio_chip.init_valid_mask field
Date:   Mon,  1 Jul 2019 16:26:50 +0200
Message-Id: <20190701142650.25122-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A new field init_valid_mask was added to struct gpio_chip, but it was
not documented.

Fixes: f8ec92a9f63b3b11 ("gpiolib: Add init_valid_mask exported function")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/gpio/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 02698c0f34eaef16..269a4433f70cf6d8 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -194,6 +194,8 @@ struct gpio_irq_chip {
  * @dbg_show: optional routine to show contents in debugfs; default code
  *	will be used when this is omitted, but custom code can show extra
  *	state (such as pullup/pulldown configuration).
+ * @init_valid_mask: optional routine to initialize @valid_mask, to be used if
+ *	not all GPIOs are valid.
  * @base: identifies the first GPIO number handled by this chip;
  *	or, if negative during registration, requests dynamic ID allocation.
  *	DEPRECATION: providing anything non-negative and nailing the base
-- 
2.17.1

