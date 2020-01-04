Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E04213040C
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2020 20:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgADToI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Jan 2020 14:44:08 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46973 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgADToH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Jan 2020 14:44:07 -0500
Received: from orion.localdomain ([95.114.65.70]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MPowd-1j1nSY1V7j-00MvYn; Sat, 04 Jan 2020 20:44:05 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: gpiolib: fix confusing indention
Date:   Sat,  4 Jan 2020 20:43:34 +0100
Message-Id: <20200104194334.12237-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:VSnHjBtowquaHDz3s11P22E7IDcTUzcZ9mINbE5EWAKNnSN92s7
 hx/bspigrYp2d8V0TUrbtMbd6F/R+3i/25QY/9V52vwxxShJqEhYzSarR9qowqL9dHR6j9c
 pZFAbf6KCPwW2RulXZGTLhNLWI5AW8fyU9QdrKG4eSu9QtGDxFrJwAIlZAJWQHrPnJOVGI+
 s8uQcvblKparC48NREwUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1q/hc+k8g1s=:ee7gVCzko2TTX5bG6IC675
 tdffMwREnVE0smBQCp1D8VfuR4LTv3yyzmFDjhtUv6f8KNwU/Y7EWpDNh/tW07Tqtj5qPC7WM
 1aCCoDs8hqIabqa60ObCg5IXN/fChOdz7T9R11hSY/9gqYbkWUB7z7qQhrW/FtxdbsbxaTd96
 1nsnETd29ezGzV0eTfsAr23/YFkLdv9Zt2jh/1IY0dyo51IDJ7JHrh9McsDxuejuIbeig2guk
 xF3GPJzrPfIrP6Gw6Hdnd8R5J/dndtLjN6FkS9kS2lEDZ7tk6FLyW4Z8cP+b+WjPsui0wHCQR
 AEMkijUB+2qP0MLWIoSaH5Aj4bzye6kivmTyzCbvO4ZR5LW0GyDNP9Lz/JEOklukcMgmakDd0
 kYcm8McCINnQgR7ujOCpCJ3uU8ZqW8DeFXQpOTT/7BRXiKyEa/LHSqbCjBuaODYz84yyv2LuA
 n4JMnlPU0uh4O4jMA0nx70hD+abRHMP1Vxv0xsVczQhvFD7hTfFEbNrazNJpvW1+JN5iSoHqB
 DU14f2ejvm71UqJ2UzicFT/7XFMPnQSCxqZrZ/pxZd2liRZLl79AEPaV6OTLwQeqfin5YMZwV
 kEPCGSDcEVTJ5WXLx0v04Or4chfdtnnzm7UNTFLgmr65+vLmJNlCXAMmAyrnu4/x7QUvT3bPQ
 Ya0p7C5gk1RsE7CuMY3stmPdEm82R8Le4we0RbmSlHowLgQwMmmwkWtUGJ6AazGE+7GJmNXZR
 7LqrLc23tZFLjplwPGpkwi83fEPUHvKw00MCpTyci2qVodc6PwQNpmff+y0p0hSpPt+X+Gk+o
 DburMAEJq5aWnAH+ClxId3TIXYL7RHloZVAau43VuqkmspUq7qYjgn5iBnEDJGQ14ExoKUqBh
 YMUJUhBMEHo48m68LIug==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There's a confusing indention in gpiochip_add_data_with_key(), which
could be misinterpreted on a quick walkthrough. Fixing this in order
to improve code readability a bit.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3fa2f4d3cdce..d77695cc82ef 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1447,7 +1447,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	if (chip->ngpio > FASTPATH_NGPIO)
 		chip_warn(chip, "line cnt %u is greater than fast path cnt %u\n",
-		chip->ngpio, FASTPATH_NGPIO);
+			  chip->ngpio, FASTPATH_NGPIO);
 
 	gdev->label = kstrdup_const(chip->label ?: "unknown", GFP_KERNEL);
 	if (!gdev->label) {
-- 
2.11.0

