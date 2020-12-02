Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A002CBE94
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 14:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgLBNk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 08:40:27 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:45643 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbgLBNk1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 08:40:27 -0500
Received: from orion.localdomain ([77.7.48.174]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N64FC-1k8zv90JuS-016L9F; Wed, 02 Dec 2020 14:37:55 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2] gpio: just plain warning when nonexisting gpio requested
Date:   Wed,  2 Dec 2020 14:37:54 +0100
Message-Id: <20201202133754.32045-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:x509up239nMwUVSsvhFUtmNN65DNpopoJqJa79l9iIluvPMt7mE
 O8tNgzo6nCm7380ByRyvDalQu2XmVYYgV3WjLbn6SLEk7DyBH6v0j7ZOMtodXI43bzCh0XQ
 0iWNTu/+M3a5CJ5u0y8nsO4gpGaMXqat6Tn0VXr6+nBwD0+MkOvJbDtBRu18+xWvccmvTs1
 4ymIJsDS8ii7UwhjQYmtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tXWjYQRg/tM=:V2T8r2rk7sbhOVtBqb7/gN
 sQJf5ELXMjzzvsFV55QvSgzNYM4fYcyE49NUFavA8QfRAHCU3MHYEklZxIHM0FUz55RmytM3Y
 BMAv7oj+Ls3mQXk6NnO9qdaR2+sdSwrN205NYzAU7b7fzyXHCYQg6Lrxc93D3UO8h4BGgfin4
 9dM9rhBFfOXT5uXQ7qvwi4SmJCecF7uQNrvuIPGBuH3oZRPKJkdnUYTpq77PSHQahRUEVZJ8j
 UFfZQq5t70Rt+3S2/3QNA2yNdGRatY7KyR8jFOw0Pnkqd0rvaQmds9w0OoZFNFTByy2JhtS0g
 7l7Ap7myX2s6abYoSRvvxJ5k0EmoflwjkOUXqCvUo5HQ8eKADBkdrAmxoLzLJ2z4gq2s3pglW
 f321KB1gtnYS9/npsLJLicuJcIE4/XQFiCZoZFwd8mdaTAn4yKY8Kf5dk2TIH
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

When trying to export an nonexisting gpio ID, the kernel prints out a
big warning w/ stacktrace, sounding like a huge problem. In fact it's
a pretty normal situation, like file or device not found.

So, just print a more relaxed warning instead.

changes v2: drop defining pr_fmt()

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 089ddcaa9bc6..6639e7b77d6c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+
 #include <linux/bitmap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -119,7 +120,7 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	if (!gpio_is_valid(gpio))
-		WARN(1, "invalid GPIO %d\n", gpio);
+		pr_warn("invalid GPIO %d\n", gpio);
 
 	return NULL;
 }
-- 
2.11.0

