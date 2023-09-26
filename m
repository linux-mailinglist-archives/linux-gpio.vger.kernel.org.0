Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19B47AEF58
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 17:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbjIZPAC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 11:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbjIZPAB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 11:00:01 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9DC10E
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 07:59:54 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-307d58b3efbso7691032f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695740393; x=1696345193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOR2X/AoUnTx42nPhZDbyArkpmdX3bsMYj2lZRsFUms=;
        b=zOZwMSAXHjeLQGWcL2Uhltnz2hlI7XNV9ewI0AYTJIyufx2fw5+odUKZX3SF3OdVo2
         UlQEE0zam+rMuUY+dmj78myXlrMmWSkfn37NQb+yQn2yRzuAYt1mHQeX69fRpj3LWgoq
         DnRkDh1CFa3VtNEjAJi12cVCeQPSzMIuLFEBnrWlbPdaoXkN0akjsISOdCiNgMPoHRLF
         r7kNO0MescDjiY5P31lLEnDKROy/OtDt6ZI8ox9V10HkOMJPo00rSnEjLYDdN9ij1f9G
         l36r3oZGDy/tqplSiP6d6VejCSKVhHopDn8QC2mOJlzpGtJlbgtq+H3NJEoLoy5x/ooi
         jU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740393; x=1696345193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOR2X/AoUnTx42nPhZDbyArkpmdX3bsMYj2lZRsFUms=;
        b=unhyKDeWUDbz+qYseszSA53lQQmrO8XfospEtiHQhwFJ8Fwf0CPCkiWe9I4DUqXQzK
         fQPPuzDtmHihRPiHLjX5roT4kYS339VhdQAziz7djjYL/ubUI5n/0/XdSRdHKRfVlZRM
         Ma4wzvSLJyNfCrURNjWfd+/4YDgGH4GObeRW2IzBO1kRUvRAgrEPQBoUKGFIfj3tpKYp
         9H/EDytz2evDOU1mDPjJCBklMAlsPOlWw4qnRJGPxIz1AORDF6t2A0ydttZhQixMdw0G
         sBICsztC/0nF/e9T00LaGXs+9QOYTWYyE3RrZ9cpPuUCg7VbfbX1F6mqVDntXK68XSjw
         +XAA==
X-Gm-Message-State: AOJu0Yzhkx0Z6sdgOrpAsgf09fH4vpWBrTWYO/HNPsom53n3yzv2zjpY
        MWRIQOBrUwdWealUlOQcqkYI2A==
X-Google-Smtp-Source: AGHT+IFvuYKk7b6vwmISUaGLDlo/gV93nTCl+wOrw03xkUp5qRrel4E8uHLcxNK3RPdoDpL8HMIuqw==
X-Received: by 2002:adf:f044:0:b0:319:7134:a3cf with SMTP id t4-20020adff044000000b003197134a3cfmr9483453wro.31.1695740393042;
        Tue, 26 Sep 2023 07:59:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:686:c497:30b1:d2b9])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d5102000000b0031f82743e25sm14871634wrt.67.2023.09.26.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:59:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFT PATCH 2/4] platform/x86: int3472: led: don't use gpiod_toggle_active_low()
Date:   Tue, 26 Sep 2023 16:59:41 +0200
Message-Id: <20230926145943.42814-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230926145943.42814-1-brgl@bgdev.pl>
References: <20230926145943.42814-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), use
temporary lookup tables with appropriate lookup flags.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/intel/int3472/led.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index bca1ce7d0d0c..62e0cd5207a7 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -25,18 +25,14 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
 	if (int3472->pled.classdev.dev)
 		return -EBUSY;
 
-	int3472->pled.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
-							     "int3472,privacy-led");
+	int3472->pled.gpio = skl_int3472_gpiod_get_from_temp_lookup(
+				int3472->dev, path, agpio->pin_table[0],
+				"int3472,privacy-led", polarity,
+				GPIOD_OUT_LOW);
 	if (IS_ERR(int3472->pled.gpio))
 		return dev_err_probe(int3472->dev, PTR_ERR(int3472->pled.gpio),
 				     "getting privacy LED GPIO\n");
 
-	if (polarity == GPIO_ACTIVE_LOW)
-		gpiod_toggle_active_low(int3472->pled.gpio);
-
-	/* Ensure the pin is in output mode and non-active state */
-	gpiod_direction_output(int3472->pled.gpio, 0);
-
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
 	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
 		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
-- 
2.39.2

