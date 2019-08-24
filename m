Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16DE89C106
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2019 01:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfHXXhq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Aug 2019 19:37:46 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:40764 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfHXXhp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Aug 2019 19:37:45 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id E542D77F67F; Sun, 25 Aug 2019 01:37:43 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v1 2/2] gpiolib: print an error name instead of a plain number in error string
Date:   Sun, 25 Aug 2019 01:37:24 +0200
Message-Id: <20190824233724.1775-2-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190824233724.1775-1-uwe@kleine-koenig.org>
References: <20190824233724.1775-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is an example that makes use of the just introduced printk format
%dE that prints (e.g.) "EIO" when the matching integer is -EIO (or EIO).

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f497003f119c..b50ea24f087f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1247,7 +1247,7 @@ static void gpiochip_setup_devs(void)
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		err = gpiochip_setup_dev(gdev);
 		if (err)
-			pr_err("%s: Failed to initialize gpio device (%d)\n",
+			pr_err("%s: Failed to initialize gpio device (%dE)\n",
 			       dev_name(&gdev->dev), err);
 	}
 }
-- 
2.20.1

