Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A35935BDB0
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 16:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbfGAOKM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 10:10:12 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:47744 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbfGAOKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 10:10:12 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id XSA92000M05gfCL01SA9c6; Mon, 01 Jul 2019 16:10:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hhx0T-00082W-AE; Mon, 01 Jul 2019 16:10:09 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hhx0T-0006Q1-84; Mon, 01 Jul 2019 16:10:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Documentation: gpio: Fix reference to gpiod_get_array()
Date:   Mon,  1 Jul 2019 16:10:05 +0200
Message-Id: <20190701141005.24631-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function is called gpiod_get_array(), not gpiod_array_get().

Fixes: 77588c14ac868cae ("gpiolib: Pass array info to get/set array functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/driver-api/gpio/consumer.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index 23d68c321c5c7c7d..9559aa3cbcef25a2 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -364,7 +364,7 @@ accessed sequentially.
 The functions take three arguments:
 	* array_size	- the number of array elements
 	* desc_array	- an array of GPIO descriptors
-	* array_info	- optional information obtained from gpiod_array_get()
+	* array_info	- optional information obtained from gpiod_get_array()
 	* value_bitmap	- a bitmap to store the GPIOs' values (get) or
 			  a bitmap of values to assign to the GPIOs (set)
 
-- 
2.17.1

