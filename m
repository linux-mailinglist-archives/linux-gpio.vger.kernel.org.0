Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2569CD24C
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 16:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfJFOm7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 10:42:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55315 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfJFOm7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 10:42:59 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iH7kO-00035R-Th; Sun, 06 Oct 2019 14:42:56 +0000
From:   Colin King <colin.king@canonical.com>
To:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: 104-idi-48e: make array register_offset static, makes object smaller
Date:   Sun,  6 Oct 2019 15:42:56 +0100
Message-Id: <20191006144256.23733-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array register_offset on the stack but instead make it
static. Makes the object code smaller by 63 bytes.  Also add the int type
specifier to clean up a checkpatch warning.

Before:
   text	   data	    bss	    dec	    hex	filename
   9212	   5712	   1408	  16332	   3fcc	drivers/gpio/gpio-104-idi-48.o

After:
   text	   data	    bss	    dec	    hex	filename
   9085	   5776	   1408	  16269	   3f8d	drivers/gpio/gpio-104-idi-48.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-104-idi-48.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index ff53887bdaa8..c95c93ec0bd7 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -65,7 +65,7 @@ static int idi_48_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
 	unsigned i;
-	const unsigned register_offset[6] = { 0, 1, 2, 4, 5, 6 };
+	static const unsigned int register_offset[6] = { 0, 1, 2, 4, 5, 6 };
 	unsigned base_offset;
 	unsigned mask;
 
-- 
2.20.1

