Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBF91B83C7
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2020 06:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgDYErA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Apr 2020 00:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726035AbgDYErA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Apr 2020 00:47:00 -0400
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com [IPv6:2607:f8b0:4864:20::a49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5067AC09B04A
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2020 21:47:00 -0700 (PDT)
Received: by mail-vk1-xa49.google.com with SMTP id j206so45266vke.11
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2020 21:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=jQasBASmzZvgAc1R1m8mPSZq7B0Wu40p8fXTKkugFFs=;
        b=fNJ9qFOryV/cL4BhCoo/faBK8fdD2fEtF5bc+SixZfbajBIGTmLjmLvVG4h5jFs3+i
         6ror8rgE8rm2nCrnBsxGuY71UCTQ+p1klTbivXi21TFZRHswGw0EgPwRd1CNYxvMjm8A
         91i5PoL9QM6utU++fmfPitpNQQfqyiwlz7vOh9Hadhb5XqMVed1e3/NnVDm6ibiXQ2io
         iBwrS2YMUYcW3KthUq12K/H6Enj6YW/bgiId0s79JRoGzpEwPxoudQeqnzyGKdXviTjt
         d8Ujw8GPgHe1MHA2rL9I9AXA/1M77M3bjZ/joEJaW0ub2ui9pOYHz/MNjIPaObP4xRa6
         Jl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=jQasBASmzZvgAc1R1m8mPSZq7B0Wu40p8fXTKkugFFs=;
        b=OH/OQHQfHq7xVQTJVIEcbcEXS1Cz8BSwe9zKUxr/BRIRtvsXVmpBguE7aKBQVrEzvN
         SZ+W3iGLJjmhaDlPgcOSbkKXIyBEOizo0aOzsqMBzBewsEbjxD+YPbzH8NCoA1xnMGD7
         LKekzYZoQX964LF+Vx01GonPgActJ1kIdeKWH9q7Qy0EWMfGMziKHDHlTiRwJARm8SMA
         ww1MC9V89iax1bnXF5TNQhgtuz6yY15we+ms/ij50zormqzZkj6/kjtmsEsbxrNzkSAF
         rOLsBYDfjDylJUO9BRKAX1S5s0AqH2iyTC85bSZmXbixKWIIPll3hxcJkoQL6pe/fjw5
         jVrw==
X-Gm-Message-State: AGi0PuZkbsKxt2HK/za7FHFdX4UoA8ob4B71d81E5+v+/Jfol+QAImgP
        Q2kNAC3st0qrZ8LqJrrhtBP+jM75Cv1g8w==
X-Google-Smtp-Source: APiQypJuJnBbTkL939ByiXiU5X6hKbgkYGOEkLIZWJvqa9f9zRDbPyZED72FPuhrne54zwgQBMFUy7jRB0Rhww==
X-Received: by 2002:a1f:3190:: with SMTP id x138mr10868420vkx.41.1587790019124;
 Fri, 24 Apr 2020 21:46:59 -0700 (PDT)
Date:   Fri, 24 Apr 2020 21:46:55 -0700
Message-Id: <20200425044655.166257-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH] gpio: of: Build fails if CONFIG_OF_DYNAMIC enabled without CONFIG_OF_GPIO
From:   David Gow <davidgow@google.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Frank Rowand <frank.rowand@sony.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The symbol 'gpio_of_notifier' doesn't exist without both CONFIG_OF_GPIO
and CONFIG_OF_DYNAMIC enabled, but is referenced when only
CONFIG_OF_DYNAMIC is enabled.

This broke building with 'make ARCH=um allyesconfig':
---------------
/usr/bin/ld: drivers/gpio/gpiolib.o: in function `gpiolib_dev_init':
./drivers/gpio/gpiolib.c:5293: undefined reference to `gpio_of_notifier'
collect2: error: ld returned 1 exit status
---------------

Fixes: 63636d956c45 ("gpio: of: Add DT overlay support for GPIO hogs")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 40f2d7f69be2..5c292fb3355c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5289,8 +5289,9 @@ static int __init gpiolib_dev_init(void)
 	gpiolib_initialized = true;
 	gpiochip_setup_devs();
 
-	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
-		WARN_ON(of_reconfig_notifier_register(&gpio_of_notifier));
+#if IS_ENABLED(CONFIG_OF_DYNAMIC) && IS_ENABLED(CONFIG_OF_GPIO)
+	WARN_ON(of_reconfig_notifier_register(&gpio_of_notifier));
+#endif /* CONFIG_OF_DYNAMIC && CONFIG_OF_GPIO */
 
 	return ret;
 }
-- 
2.26.2.303.gf8c07b1a785-goog

