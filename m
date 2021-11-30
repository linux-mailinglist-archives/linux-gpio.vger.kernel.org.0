Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A30B463A51
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 16:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbhK3Poy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 10:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239067AbhK3Pox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 10:44:53 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3382FC061756
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 07:41:34 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id y196so17834551wmc.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 07:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sS1opnsxYro85V5S3ivgztdl1gAyjYFuzaHv2So6/ZM=;
        b=MnvKrF98X5TbJ7Rk6jhDx0IGnySKIostGPUKQDBs1J5fP7gDzkyIi8aParbRmZ6TaE
         +ihnvLjHON1gwlMykcsn2gvB4cimMh04GPK15fx0O7E43uEp6et4Xc/H8WibLl5VH2xM
         6ndjT8b+tlw2k9WPwGvHuQ01Rpg84WaiJPZjIkTet07D9S0gvSaaMtfY12iO4lG/JGZz
         WQYRSJ6ORe0CH+mvellEtP3xxUcKkKDhJLh7EkUJSSsmZvs3Pr847OLGCfKv9zj+Daa5
         YVcXIpdfRm3eYEeXarPu5QqeEVnhavdIQNEEHmZJe/P5UXt53XkTjE4e3DXIm5DACdB5
         aUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sS1opnsxYro85V5S3ivgztdl1gAyjYFuzaHv2So6/ZM=;
        b=TYX2+XfrJ3BjRo8rbi7wnsc8+DlEfuo8o4LFRCDdxZ2DbhY9VhidNJvIu9BgCxAFVn
         hCbePQUA+owGu7urS7ufpvl40ynGcKa45Kes8+xVtIhQPoSwZAV6eoI5ESL+KZnP7pH3
         nIMZMHgQz06SRBnX+yZYeyBm12vCrF7wvOS6npn5zbLjx+j7xKovXBPrLABZxueNXqgU
         E/M439NFdFaCeJpaN4jYm9Z0vuH0ypsavU6bDoKdmppyTNUJHIgFYrbMY9jfz21VTkpS
         PpNegAffAJebPuJrJ8IZ1WnQ8XPnIoDiA0grKkgldtyoaIA6MIWP2tvh4YVe2rULca6j
         iyQw==
X-Gm-Message-State: AOAM5311pMRomiOJd2jEeEioqmT0bdrmptR60tLPWkIsNLweNJ5ky1xy
        w/Y+KFgSdOQjs2TbQGw5bVQvxfLWDsKJkWuz
X-Google-Smtp-Source: ABdhPJwxyU9Jel01LTbZMRFqp7vMf79S5T678a6nBbcvKBPcgdpobt0ijvejLEVPmZeDlRkPSZm0Sw==
X-Received: by 2002:a05:600c:b43:: with SMTP id k3mr150831wmr.159.1638286892688;
        Tue, 30 Nov 2021 07:41:32 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id l2sm2962792wmq.42.2021.11.30.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 07:41:32 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v11 1/6] gpiolib: provide gpiod_remove_hogs()
Date:   Tue, 30 Nov 2021 16:41:22 +0100
Message-Id: <20211130154127.12272-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211130154127.12272-1-brgl@bgdev.pl>
References: <20211130154127.12272-1-brgl@bgdev.pl>
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

