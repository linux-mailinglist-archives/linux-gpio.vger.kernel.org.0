Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834B945B95A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 12:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241734AbhKXLqP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 06:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241726AbhKXLqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 06:46:14 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4A7C06173E
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:43:05 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id u1so3597649wru.13
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sS1opnsxYro85V5S3ivgztdl1gAyjYFuzaHv2So6/ZM=;
        b=ukqZb6Df8wk2BR7+RB3VNpoAiHEzybZ5wK7naDQW1uDkTqo/5SeXbH0bluZIgIK/y5
         yHsVSJeCbWnimbjYDhksjDQEBETXtrudYf0Rluz5BIrua02DG0wrDv9v6qVpB07EQFCC
         HgiJtMXCKAQ5FxV2r15Xq9wFWV38uVKAktJ1CK9RmcskvqAZ+0FuM60ay0BS/7jXJBOn
         rO1P/jEIRTtoJMiz2A6DC2x4WA0BO7bGQ8JcfNtz3m7tf3lFrvS0HdQsK8u0wJAMcJfG
         0FB6mmWh1sJJ54bScBM79u8uhThDWiNoGbBfp8GfZA7XVvBMoQICjkcAUX1X9Igd0FJ0
         81jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sS1opnsxYro85V5S3ivgztdl1gAyjYFuzaHv2So6/ZM=;
        b=ayFSWAnHHvYAGDoj0mThDi98rROo6lWkbRxK5go8zavy6CB2t+WsFVp6jE8mAWHEfC
         myoii/CrSiwpUiq1spTB1Wz03pUU6lpy1+8QubOmHS7qbu6YxPFTEtd+sgUGlO8v8jcE
         nb+2NG7S8Iok8HvkZqggPVv0UseWCh5fs0v5afZzefb4fF0GqbE+4SqA7qKiNa1FIUwI
         gyQv4N10ZLfD7SUj/JUJbuQnEWdIAynTw8uzzcnK97vpAL7TiE8b52UAGeZIee1BN7I0
         yPx7OFfphNQ54v1f9XKdasV9hTzEyL8ueoEwI8Ftb1J7QZYoh+E2ZL6lUbQG1G1dv8pt
         7qwQ==
X-Gm-Message-State: AOAM531x8KRIOqjYUCsPFAr1tJBZAK8IldhaZw10U2Av1YqeumjKYUOt
        xFsxocfprr+PcYWjUExH+QdYdeWrOcs3MfjH
X-Google-Smtp-Source: ABdhPJxKAZZnUDjolRDhLnzjAWh38EBmKg2rTlNyfnvjqE+5got5d7PmwHEdZRTCcGycM0SHq37agg==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr15957633wrp.18.1637754182346;
        Wed, 24 Nov 2021 03:43:02 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id s63sm5165173wme.22.2021.11.24.03.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:43:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v10 1/5] gpiolib: provide gpiod_remove_hogs()
Date:   Wed, 24 Nov 2021 12:42:53 +0100
Message-Id: <20211124114257.19878-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211124114257.19878-1-brgl@bgdev.pl>
References: <20211124114257.19878-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently all users of gpiod_add_hogs() call it only once at system
init so there never was any need for a mechanism allowing to remove
them. Now the upcoming gpio-sim will need to tear down chips with hogged
lines so provide a function that allows to remove hogs.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c       | 11 +++++++++++
 include/linux/gpio/machine.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abfbf546d159..22b98a590a88 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3540,6 +3540,17 @@ void gpiod_add_hogs(struct gpiod_hog *hogs)
 }
 EXPORT_SYMBOL_GPL(gpiod_add_hogs);
 
+void gpiod_remove_hogs(struct gpiod_hog *hogs)
+{
+	struct gpiod_hog *hog;
+
+	mutex_lock(&gpio_machine_hogs_mutex);
+	for (hog = &hogs[0]; hog->chip_label; hog++)
+		list_del(&hog->list);
+	mutex_unlock(&gpio_machine_hogs_mutex);
+}
+EXPORT_SYMBOL_GPL(gpiod_remove_hogs);
+
 static struct gpiod_lookup_table *gpiod_find_lookup_table(struct device *dev)
 {
 	const char *dev_id = dev ? dev_name(dev) : NULL;
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index d755e529c1e3..2647dd10b541 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -100,6 +100,7 @@ void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
 void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n);
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
 void gpiod_add_hogs(struct gpiod_hog *hogs);
+void gpiod_remove_hogs(struct gpiod_hog *hogs);
 #else /* ! CONFIG_GPIOLIB */
 static inline
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
@@ -108,6 +109,7 @@ void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n) {}
 static inline
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
 static inline void gpiod_add_hogs(struct gpiod_hog *hogs) {}
+static inline void gpiod_remove_hogs(struct gpiod_hog *hogs) {}
 #endif /* CONFIG_GPIOLIB */
 
 #endif /* __LINUX_GPIO_MACHINE_H */
-- 
2.25.1

