Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B736778E1F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 16:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbfG2Ogg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 10:36:36 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:42397 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727404AbfG2Ogg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 10:36:36 -0400
Received: from orion.localdomain ([77.4.29.213]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MOiU5-1i1H9Z0xtX-00Q9FW; Mon, 29 Jul 2019 16:36:34 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: just plain warning when nonexisting gpio requested
Date:   Mon, 29 Jul 2019 16:36:33 +0200
Message-Id: <1564410993-22101-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:9JWgj9p0cDCFvXkzCyyPTFFHU5yanSU3CHvxiYNkCzHElSYEbkv
 tPRRuhjIdRM6PCuiJSu+21ero9peOygXrTw1QQL2eANlCXW1Cx8F3NcDzDA8EATPG4dcc9F
 wxGn2EVQdZLjtVenRfAubE5+IBjjmFdwWPAcFnCLuoKL3rzIijZz8dNkxyNCajkkKrpgxlA
 E9ZDcM+kjTQM2hLpdKCIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0nLuBilCz5M=:SyyZ91KbkxCbaNkDCFH0F6
 TiLZDQ6jyqIT+Lyd8/zK/JN9IDiNcuo4muXwBWHIONfvyPtCcUrPb6xGn2PXjZm8RRGv4hrrk
 yD4TV53hPrFEkoBRQ20RXJgvrA0cN3bDf1qa8sx8fFffbWnF1zNoyjo97SQWWUY1RxHfZCQyD
 F2g3vix3FIJ1vHKJ/iI9mkKyUKm0U5fflFwo9YH1Uf3/bU59s9eUO6RnjELgClYB7KYSerWgr
 A/U10ZlIh6k6h5bfu3X6woziwbx1REehB2u+eclTo5kl9DrqiUoUL4ATETEaA3z6ExPTsayVw
 LN6dE1PcKW+PSESZ7D8ptqyiV4ifLF44oKqsMJRwxlYemG0xhb2p8HAbuojCatrE8iRXS/xKo
 1ljDzfTaXqExNs6bJkB6j6aTWETY3fxlCw/9uh1S7f2zYk0Lzngnv5cSKKddPmf3dwvKoKSoi
 XXJHvHacv1tW9tzSf2WRVhssRQAAKB2lPPJ9/fZFWiP1o/ckMH4i79ES9hJSyiN8EAWN2ek9A
 gHDfyicvZ9tv7eHyMLX9YfiDFeDRdrJpypPU8c7PXajyBPgU+/iw1uchJXjOfvJ5gF7mucUro
 Xdx8ReVJFUNnxTONws7kK7G0XBLsWCngQL8sPAQXKUKnonsmN7/488oCY4Ef7UuPSKP6/kiDo
 RmKDqNWTgfSmeA9JrAnKNzvZS4m1zpzABuUZe6/dyTg2iginaoc6lNylBT5I3M/nRQhCdTi4h
 qEl0SX5bTZGFdMdARGeWyrIcM16dKZ16QbvouQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

When trying to export an nonexisting gpio ID, the kernel prints
outs a big warning w/ stacktrace, sounding like a huge problem.
In fact it's a pretty normal situation, like file or device not
found.

So, just print a more relaxed warning instead.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpiolib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3ee99d0..06eeedd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1,4 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/bitmap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -121,7 +124,7 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	if (!gpio_is_valid(gpio))
-		WARN(1, "invalid GPIO %d\n", gpio);
+		pr_warn("invalid GPIO %d\n", gpio);
 
 	return NULL;
 }
-- 
1.9.1

