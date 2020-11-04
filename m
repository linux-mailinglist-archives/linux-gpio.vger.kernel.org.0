Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45BBB2A6DF3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 20:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731243AbgKDTbn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 14:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731418AbgKDTbC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 14:31:02 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDFCC0613D4
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 11:31:02 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id x7so23325646wrl.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 11:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lQQN2ZXT/G4B3VsGNJyIkmXWhvmT1sWJqpvE2SPt6Is=;
        b=LOZfyrxq/o6RODMOyrU+qZOvySfL8SOerWyuvitpANZum1b/dHHL5T9VTGrvED/P7v
         SJbnq0ng7zQf0JTXyCeHdNGalGpL9J76qP6TXFf2rzvAysdIjIvvRGN3FtALlw7o1ijQ
         0qasCP7/Nz27WzdkvNctsAdGHcnR7M6UweKTyFp3NIeONAdb8rcGAyYTlCYTRJswfdPU
         altYpiuR03HPGxJkkfXZ/caBPmrcGskefyx1wHlgGeGHjP6XkSRn8imRRy89Yi2MSftH
         gM4lP6jXoigGMQf/THIJfmcaZZIpspe1JfYLS2RNKeS88LnI8LDVBEEm/9uqk7EGNw8X
         JNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lQQN2ZXT/G4B3VsGNJyIkmXWhvmT1sWJqpvE2SPt6Is=;
        b=C/Qg6Z3QvCxi1cSDOm7NlCIbBJNS/RsdHuPOYDm5vzwCogcG/LhcQeLEKiGQf8FDJu
         aQQdApo9URrpYzD60mj/5giY6mCNkcq3ZusKx8jeuteIhGnTsoc/g/AoKpCxJafNY0fD
         g/4dgKAravwmn4gbkEN/8cXY4Pq7V5Ez764AMC3g3AFTHennPHDQKHy5wNq+VCrUv9rs
         cwh/uFcYrsFsdvtiswm6tttIt7yHpz2uAt1wvde8zBn0o8vNkRxZgCWL70qPIrr6VIKJ
         47fioT8PwYT4oFopH+0UYEDg6uYJjJ3rcTWk1kj9VFAh6Ij5ALm6w8Ukv9zmaWYAPG6W
         wrww==
X-Gm-Message-State: AOAM530AMMIgIcDFZn0kFM5TlQmUvqbJyUeZ7v4KkXMzslMc8QJrjSYB
        zDa0RhAyCrL5XrJvFXaFGV9MgkiIEGM5Jg==
X-Google-Smtp-Source: ABdhPJzmTo8yA7ign+6yiLlNRhedMA3K+hOB2l+5S9JH8N4LOgtiSZUZ5B6M4pznPp3esfra16yrwA==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr32482428wru.232.1604518261207;
        Wed, 04 Nov 2020 11:31:01 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m12sm4051671wrs.92.2020.11.04.11.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:31:00 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/8] gpio: exar: switch to a simpler IDA interface
Date:   Wed,  4 Nov 2020 20:30:47 +0100
Message-Id: <20201104193051.32236-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104193051.32236-1-brgl@bgdev.pl>
References: <20201104193051.32236-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't need to specify any ranges when allocating IDs so we can switch
to ida_alloc() and ida_free() instead of the ida_simple_ counterparts.

ida_simple_get(ida, 0, 0, gfp) is equivalent to
ida_alloc_range(ida, 0, UINT_MAX, gfp) which is equivalent to
ida_alloc(ida, gfp). Note: IDR will never actually allocate an ID
larger than INT_MAX.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 1941ae533418..752e8437ff80 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -149,7 +149,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 	mutex_init(&exar_gpio->lock);
 
-	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
+	index = ida_alloc(&ida_index, GFP_KERNEL);
 	if (index < 0) {
 		ret = index;
 		goto err_mutex_destroy;
@@ -179,7 +179,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	return 0;
 
 err_destroy:
-	ida_simple_remove(&ida_index, index);
+	ida_free(&ida_index, index);
 err_mutex_destroy:
 	mutex_destroy(&exar_gpio->lock);
 	return ret;
@@ -189,7 +189,7 @@ static int gpio_exar_remove(struct platform_device *pdev)
 {
 	struct exar_gpio_chip *exar_gpio = platform_get_drvdata(pdev);
 
-	ida_simple_remove(&ida_index, exar_gpio->index);
+	ida_free(&ida_index, exar_gpio->index);
 	mutex_destroy(&exar_gpio->lock);
 
 	return 0;
-- 
2.29.1

