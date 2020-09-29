Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BDC27C201
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgI2KK4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbgI2KKW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 06:10:22 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F1CC0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g4so4707154wrs.5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3rBuEbcYA2LHM9EtzTttUwU6XI5h8fPFHgRL7rmnAS0=;
        b=B4TDcjbDnwRc0wOOOY4XKP5zejDGwyrEibnQWSD5KUxjuu+fUXiaIUFaVq+2udfjQc
         SqDWumSaxoC0F25U/b6c7xtVCkbHqBOaB9lvRmhH5h7OrZdiKMI+EP9jEz+uQ9zj+h05
         ScfcZGTKfew/MOWfT1n89KJ3MWcSAfNNBPFurdh1eMruQm4xG5lGBVoo98XUm6SGEBBX
         zTWQweO8LlfUV5QfTIxOnvFFrsMljDs027RRiWUGA7C7oedi7tZpPidc94r3hJs3PPZA
         1xDpMulgeWPdphlK/ZzPR4qy3IsHKp24qNfdckY4Zov1ScqSzry9fbuqU0kkJMM7CBRA
         9rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3rBuEbcYA2LHM9EtzTttUwU6XI5h8fPFHgRL7rmnAS0=;
        b=dN85TxcyNL+ZE32Jy4dB0Y4k2KR4Cd7HXxnduzQDhqy/emAERuF7p3bRZAsmteRlix
         V/vtxFRL0Dkvn35k9UWlkpc3bYSLdKEh9X6SbGWNTQORVERGbWPAjDzgkwJcSKgRLZE+
         1xXpqf7m+ux1JVh3ARhtf6Uy0O7H4THsxdifE10bYnkvKElRE9774rdYdL5po4FSURyh
         BbO9ICKmJzJ9hLvCgNhraqPXwTTg0cvavpU92Cxu6OiqJ0o66TQDTUPBwceyQL5H2H65
         irtCx2yExxZXqVgweiHSwxbcnWblH32w/yyqN0yN8LqBBUHNBvdjCbZmUaayRwLdOM7A
         0kjQ==
X-Gm-Message-State: AOAM532UXf82gcSB8KXZbhMy4PirlKt08PhFtKV4L19NLAlbfrXOIuyQ
        cTgn9afqwXiHMTwqhGAT4ZV1Gw==
X-Google-Smtp-Source: ABdhPJzG1lzz3E8liFeu2XnZVZrjcbtNNl1WiaXfuepg9mtIdQtiP1yiwEIOvrujpjXpodYLtEZ3DQ==
X-Received: by 2002:adf:de11:: with SMTP id b17mr3371840wrm.82.1601374218978;
        Tue, 29 Sep 2020 03:10:18 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 04/10] gpio: mockup: use KBUILD_MODNAME
Date:   Tue, 29 Sep 2020 12:09:58 +0200
Message-Id: <20200929101004.20288-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Drop the definition for the driver name. Let's use KBUILD_MODNAME for
the log format and use the "gpio-mockup" value directly in the only
place where it's relevant: in the name of the device.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index c5092773afd8..90a1d6c2775f 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -21,7 +21,6 @@
 
 #include "gpiolib.h"
 
-#define GPIO_MOCKUP_NAME	"gpio-mockup"
 #define GPIO_MOCKUP_MAX_GC	10
 /*
  * We're storing two values per chip: the GPIO base and the number
@@ -31,7 +30,7 @@
 /* Maximum of three properties + the sentinel. */
 #define GPIO_MOCKUP_MAX_PROP	4
 
-#define gpio_mockup_err(...)	pr_err(GPIO_MOCKUP_NAME ": " __VA_ARGS__)
+#define gpio_mockup_err(...)	pr_err(KBUILD_MODNAME ": " __VA_ARGS__)
 
 /*
  * struct gpio_pin_status - structure describing a GPIO status
@@ -500,7 +499,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 
 static struct platform_driver gpio_mockup_driver = {
 	.driver = {
-		.name = GPIO_MOCKUP_NAME,
+		.name = "gpio-mockup",
 	},
 	.probe = gpio_mockup_probe,
 };
@@ -572,7 +571,7 @@ static int __init gpio_mockup_init(void)
 			properties[prop++] = PROPERTY_ENTRY_BOOL(
 						"named-gpio-lines");
 
-		pdevinfo.name = GPIO_MOCKUP_NAME;
+		pdevinfo.name = "gpio-mockup";
 		pdevinfo.id = i;
 		pdevinfo.properties = properties;
 
-- 
2.26.1

