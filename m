Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD23782D55
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 17:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbjHUPdr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 11:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235487AbjHUPdr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 11:33:47 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C55E2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 08:33:45 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31c479ede21so1074138f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 08:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692632024; x=1693236824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8R1/slw2ObDAER9IEfUgOB80CoZbmunAI+YkW3aWCw=;
        b=3/2Udm2k0WRG4OwIudeOQicDI/IsQoZ7sqFCfFwknq4HCZ1dBHbl+YbuSns1Vokt4/
         Syx9EfOasPSOKJgz0QE+oHtAJ5NqmgnBIJ9PMTKhIsfPhma6K1pkLbgZ9UKPFj2xaudP
         LfmHBfdylcrdmLVqpvx/c65pmMykCgd6Ltb4cJP5GkoTWOJ8B8xWeusTVWbxYqK24SOS
         ceqZ7yubGwsI1uTnIn2JYVoDzIa5j2tJVjpnmPIA7cmUy2Re4IZ9LFBE+eoUQtGgcreB
         BNati6WRfbODEHin+idl6dAdu7krn5ylGlNOYphBZD/0cd4v4jNwiSg4qK0ScFMe5OHa
         70iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632024; x=1693236824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8R1/slw2ObDAER9IEfUgOB80CoZbmunAI+YkW3aWCw=;
        b=ccksxOIcDFqVgDN74rfp5Yf/EizR3BSNKwhJWFhtlVr9+szTasuoy5ROWKMPQdUDY9
         gtQJSpub1T7YjfGXPDxZGHdefSARScYlFhAco0Z5Z3VZStzS5R5uIJTi/rskoftSRffs
         m1Hny9ZqEgG2Kb6Hasrvp8dCL/2hF9arDOtnjeSV5vUyreWBlcrifxnnmCH2Q08KoNsH
         LV4Xe5MbUNGaYvePmbi75mCrY30zYMjYX3j2HX7/xreQyVyrzLIo8p9R21SOMlQ9bG73
         3qemb50RH8vOjidYDRCMRuTmMAkpObl+Yq2mkXlU2ys4EpJ7r5LKpcVxeHGByFXu7GVh
         k5xg==
X-Gm-Message-State: AOJu0Yy4AiNNoIITYMsNGfuzqayjK/TqSQPQT4wPYvTQ9w9hJ2R3A9E6
        7a+kCrKnJL+rfFghs6aQbXx5hFYJFi13B4hZDoQ87A==
X-Google-Smtp-Source: AGHT+IGGwAhHolhP4hUrSPoxGxw5r7IPDLLkCF71hcVgj5yGI8+uoo5+NA0vuy3gLrBLIkCslk7yvA==
X-Received: by 2002:adf:f287:0:b0:315:7d2f:fc36 with SMTP id k7-20020adff287000000b003157d2ffc36mr5066885wro.20.1692632023873;
        Mon, 21 Aug 2023 08:33:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:677:995b:9c07:d7fc])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d4052000000b0031c5ce91ad6sm1256601wrp.97.2023.08.21.08.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:33:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod v1.6.x][PATCH] tests: mockup: unbind mockup devices before unloading the module
Date:   Mon, 21 Aug 2023 17:33:39 +0200
Message-Id: <20230821153339.26305-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpio-mockup relies on the GPIO devices being registered in module's __init
function and them being unregistered in __exit. This works with the GPIO
subsystem as it only takes a reference to the underlying owner module when
a GPIO descriptor is requested and not when the GPIO device is
instantiated.

This behavior may change in the future in the kernel so make the behavior
of libgpiomockup more correct and have it unbind all mockup devices over
sysfs before unloading the module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/mockup/gpio-mockup.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/mockup/gpio-mockup.c b/tests/mockup/gpio-mockup.c
index fa27bd7..387e449 100644
--- a/tests/mockup/gpio-mockup.c
+++ b/tests/mockup/gpio-mockup.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
  */
 
+#include <dirent.h>
 #include <errno.h>
 #include <libkmod.h>
 #include <libudev.h>
@@ -357,6 +358,51 @@ err_out:
 	return -1;
 }
 
+static int dir_filter(const struct dirent *entry)
+{
+	return !strncmp(entry->d_name, "gpio-mockup.", 12);
+}
+
+static void free_dirs(struct dirent **entries, size_t count)
+{
+	size_t i;
+
+	for (i = 0; i < count; i++)
+		free(entries[i]);
+	free(entries);
+}
+
+static int unbind_devices(void)
+{
+	struct dirent **entries;
+	int i, count, fd;
+	ssize_t ret;
+
+	count = scandir("/sys/bus/platform/drivers/gpio-mockup", &entries,
+			dir_filter, alphasort);
+	if (count < 0)
+		return -1;
+
+	fd = open("/sys/bus/platform/drivers/gpio-mockup/unbind", O_WRONLY);
+	if (fd < 0) {
+		free_dirs(entries, count);
+		return -1;
+	}
+
+	for (i = 0; i < count; i++) {
+		ret = write(fd, entries[i]->d_name, strlen(entries[i]->d_name));
+		if (ret < 0) {
+			close(fd);
+			free_dirs(entries, count);
+			return -1;
+		}
+	}
+
+	close(fd);
+	free_dirs(entries, count);
+	return 0;
+}
+
 EXPORT int gpio_mockup_remove(struct gpio_mockup *ctx)
 {
 	unsigned int i;
@@ -367,6 +413,10 @@ EXPORT int gpio_mockup_remove(struct gpio_mockup *ctx)
 		return -1;
 	}
 
+	rv = unbind_devices();
+	if (rv)
+		return -1;
+
 	rv = kmod_module_remove_module(ctx->module, 0);
 	if (rv)
 		return -1;
-- 
2.39.2

