Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09AF27AC1A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 12:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgI1Kml (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 06:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgI1KmJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:42:09 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F92CC0613D7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:05 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e11so4079413wme.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3rBuEbcYA2LHM9EtzTttUwU6XI5h8fPFHgRL7rmnAS0=;
        b=wW9p0ooFod3Bkjml4TY027l7RNbvLUML7kxvbOo9bzSOOntEK2jCMJxDR38WyLDSMt
         6r8tTb8wwE4Yp5tNej41crQLAPiH4p05LliJKqKB76w/y+7rIEYpcwKNgBjAhkOdTMg3
         gwaAYBty7mKHxoBWxJaNrFejILAEEQFGvnLvl+cw7oIsTKdPkTcuoHd54jqw3eVC1b72
         YkRdyvMfYpeAggJ6TeNSkLn8DhC2Qw2KuDUlDHrAbzgL+U01HRFE9gT158HhLUO0bjmX
         /S3OS2onmluX6QhO7vFsGuQ1ifHa6Ov0Pmh1p4NGn3Efhj2JLnPnWefFZ3JQnnjBC30L
         7wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3rBuEbcYA2LHM9EtzTttUwU6XI5h8fPFHgRL7rmnAS0=;
        b=lhY5SBcTjadoZsTg1Cnrmz2eyqcT3naFw57GiD3LuyO/PpxP6ndT/0ftXVFHq5HGaG
         MbuOaNIiBwxE5AvtLuxLvaL0FX2PgnreOu5azegG5ovXtdaZA5OQZj7DVKX+PAWT8VC1
         YO2AS9J0Ki/ckaHxUxYml6QZfx6Wwwj7mo/xawq43DxBt/LOdoRhUzzDkAmDoTPHudYd
         vMjP7dBnLWRgLsP5vgUfWhIwIwDWwiUr+j6CyU09JukWLJ7uR647Jmdh4gy4m6kmATBM
         3Kbqd1NDtVQZy+zRTQkikax2ooIXbBbxN6mfeuI+ZMEIBGWrfBxb/b2YRCWNg0KZhnJA
         e01Q==
X-Gm-Message-State: AOAM531opOEFtUkIkYGuAbkhSuL1uRZt9PJO1ljaoTq9LqF8xyAOfdA7
        hWmcpA2c35bwk4Yb0V/llLjOhg==
X-Google-Smtp-Source: ABdhPJzyLRcVrBW44bJaSnnG566begqm8JyC9mmAB8rWWDBs6CR4oZHMwIpQcBj0Q1o+qFGt6g/x8Q==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr954114wma.158.1601289723948;
        Mon, 28 Sep 2020 03:42:03 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/9] gpio: mockup: use KBUILD_MODNAME
Date:   Mon, 28 Sep 2020 12:41:50 +0200
Message-Id: <20200928104155.7385-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
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

