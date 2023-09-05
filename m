Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25286792E7F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Sep 2023 21:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbjIETL7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Sep 2023 15:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242034AbjIETL5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2023 15:11:57 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F05DE52
        for <linux-gpio@vger.kernel.org>; Tue,  5 Sep 2023 12:11:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-307d20548adso2423253f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2023 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693941037; x=1694545837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y08y4soco06KI/f6qh6fDW5G+nl2ifTZ323XD3WrKbY=;
        b=Mndet9l4+QvIKAyhw31vzQS0XY77aN3qjnj+hyo8aVZT3YBDYYfEW/EcLnXiTyRjw4
         QmIE6v7tP6/gzflgqog6lr9+Nz3z2rfNhwudEw7eT45QDvklx5jV9iq88hvgN8IhcM6r
         p0RQEGQZPalsouR3C0ngWaQ7f0oYoIFBNIYGuXBekG0yaWt6IOWQaM7J2v41P3hqZ3t+
         ny9dU70ebHqx8nx3EchKbxU6D+jTmMQBLMrIzPn67r3d/c9cyDj5iGcpxXk29YTckkvT
         2YLpPEhjIaD5Aqh8Pz0RIsOIy+xOlC72jSymJHGj8qZx4oR8PjBvwWKbSvFYy5zT1b0r
         PD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941037; x=1694545837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y08y4soco06KI/f6qh6fDW5G+nl2ifTZ323XD3WrKbY=;
        b=IlNdGIUIzeRZGVMOEym0GZ7kf/YQ5eY7qbiy/qhh6hBKSHfqNwtlsr/iTZn4RZ3izC
         2/WWpY5Ue9fFlepohtJXVsCoy9FHy0bkQ8yftq362O6eEbT61+9Zy8lNETzsuHr/fnV5
         2z6ma/baNx1Mzy/0dTi0MqLlIxX56vaUv2JKleefLH08w57EYuQIMEpFPv/rF1SAaI3E
         bcMdgzbN1muZrUQe9KbDTyjjTs2QFfxQOHLEzi7jIFwlDNvXzrSHk+DtsOfayT/kTWxj
         tl/jj3tLsn+ZXdjHMXKanbQGSlS/1LI0lkOaFDfWJ5NHq8PSSpwWcuEm9vNBZL26PFAA
         btNQ==
X-Gm-Message-State: AOJu0Yy5C3cewyORIrEcTCizVQABVfVG8o/6QEDEoCalA0or2akmmUeG
        USIUPcqguo0fpFHwRFeYgyU6IcQ7HzxK0IR+r/c=
X-Google-Smtp-Source: AGHT+IEgNpZG6hg0L74CESnSvpfFz6XeLAbhQH8cNkX0kwXYqx/uTGgV7V6lKbCtezy+q5QbzDETKg==
X-Received: by 2002:a05:600c:21cd:b0:401:38dc:8916 with SMTP id x13-20020a05600c21cd00b0040138dc8916mr474754wmj.10.1693940030455;
        Tue, 05 Sep 2023 11:53:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 20/21] gpio: sysfs: drop the mention of gpiochip_find() from sysfs code
Date:   Tue,  5 Sep 2023 20:53:08 +0200
Message-Id: <20230905185309.131295-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have removed all callers of gpiochip_find() so don't mention it in
gpiolib-sysfs.c.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 50503a4525eb..6f309a3b2d9a 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -814,7 +814,7 @@ static int __init gpiolib_sysfs_init(void)
 		 * gpiochip_sysfs_register() acquires a mutex. This is unsafe
 		 * and needs to be fixed.
 		 *
-		 * Also it would be nice to use gpiochip_find() here so we
+		 * Also it would be nice to use gpio_device_find() here so we
 		 * can keep gpio_chips local to gpiolib.c, but the yield of
 		 * gpio_lock prevents us from doing this.
 		 */
-- 
2.39.2

