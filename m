Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3762B467848
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 14:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352445AbhLCNdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 08:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352253AbhLCNdu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 08:33:50 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A68BC06174A
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 05:30:26 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id c4so5715079wrd.9
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 05:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sS1opnsxYro85V5S3ivgztdl1gAyjYFuzaHv2So6/ZM=;
        b=5cubeU/IGRkNU9acHT4VX/9BUBtA1J5/dj0OBDkz2F1HyO2sQueMUfw1/ql44IAulH
         2gZbn2KwPKwXy9vgQTNSqHaygJQGidbRkroYjtqrA49+A+pO4dpcPJdHngUUsHcfTZe4
         hqnQ2L3ut0SfjIcDRnBsOuRiZBIGls+SJNyIu6bBM7Ob9DU8UN0InoFgzvPxVJA3MqRc
         1ZQXxfO7Bwz2iTlpxKY0GH397022Ea4DNG7oM++xJfjbyRW+qAtvCsOABQFAqBer5Pb9
         5+YenZeDvmEnT3/DizCoe9K6KGl5pxujnQmfBgOMHuUFdJbVR2bb2vmY9cBJ5UGOrLMo
         uMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sS1opnsxYro85V5S3ivgztdl1gAyjYFuzaHv2So6/ZM=;
        b=sAohitkQoLxEncSxoZOFiWbh9C17gkjD6q0ReWe1glLipFHyQbr1Wa9Cjs+VevHuGj
         zBlRmHPXxqwAb3Jua9gp0RFRuiPjaKamO9W3Ud3g0h00UyIXJYoy47sTaV8GMM5rlWoi
         bSdSOWH9reIJEM4ESH3x9bx1Wy+8/SZ/KTW3NeXyO4kgardk3oY9tNGkeug9nzhi9JqR
         a42hUVzLYUvceIqEpEUGPZ4Ch0Q0GrCP1sNWlQx2COAwOWs1zGpBo98ISMVwMQKkwo1A
         ia1R7mxTlAzVVFs6UxJoZRvmM5xjn+R3DirGStHFPzWK69Xr+CGOBaZcebjJlttMhCl3
         fqmQ==
X-Gm-Message-State: AOAM530B5eBuCWye5hwMbO47SC260CoWZiC8yKhBxxRlUQMHUF3y8rc8
        tmkeog0p6NjsVhHCKBG/PJ0U1c8FAZs/5Fhj
X-Google-Smtp-Source: ABdhPJwNXyVIxcA2xd8CTeTMpCouQ9RuPhwFYijQnlniWxOxz4aa6kCRMJikbX7hAwoiUQ80k0TqmQ==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr22096420wrv.548.1638538225033;
        Fri, 03 Dec 2021 05:30:25 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j11sm2755910wrt.3.2021.12.03.05.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 05:30:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v12 1/7] gpiolib: provide gpiod_remove_hogs()
Date:   Fri,  3 Dec 2021 14:29:57 +0100
Message-Id: <20211203133003.31786-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211203133003.31786-1-brgl@bgdev.pl>
References: <20211203133003.31786-1-brgl@bgdev.pl>
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

