Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B767CC26E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbjJQMHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234612AbjJQMGp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:45 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202F3199B
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:23 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so54072875e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544319; x=1698149119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4vMZiIUWAcFjSUyJWdkZqLSvd59iWFi9llO7wZj/o0=;
        b=QbCX45hNaLu6XKChuiuAhVoFLWZhUxIjoxLGFbcR2Qphvsl9w2WgkfLD1zItmatcJV
         HfPrLAP8DUqOLcJpxyWauMuzSNBZrWTSJ++x9vBQ1tUKAAW3zAXNWOnLRBETcxTcOY+w
         C1wiMAPtKbonTdI7qX5wBQcNXZtCF6sC54At9zqV8/DfIr+n8TnG9jCmZLvlok8/g9L0
         rqiLpu+PtPwoRbTz9h8Fxh0ibR4OOKxxA381tDnmgSP9jOqJ73nYf7RXVjd0J/LKOv5l
         yUpduYR8vb26/rqaoo0ZkvY1IC6cgp7Q80zJzBGfJ/7HPddSak3PYXzkCQhKuXHFqfV0
         89ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544319; x=1698149119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4vMZiIUWAcFjSUyJWdkZqLSvd59iWFi9llO7wZj/o0=;
        b=ohvkEQ6OnI86kcdixj3Zt4rYN9tnxlyn++vL/d27WcpVP4EtRqIQKj/b1Ywz2HkoaB
         GeHI8ttH3kWIJLRtjJZ2sPDyybCzeaDVqsuLPNt9W9T/KbTA9GZNzBjk991so9Iurf5G
         OGA1xjAxQBHh9nOjKrR7XKX4/049AkLMEPsTPx+U7LDWL3LFHKlYjqU+pX+RsbUEW5nv
         20B/++HoJxz3zdV8aSHy3ZzmdKylhqm9FnMFHyAUcjcx/nwSmTAJY2VSkG6a/KyO79hE
         1xRVawCa2xyYOWr3evfGcS5i8iIIoThELyLJ4TnOhD39RYn5YYYFVZo0B+7mqBwEpYJA
         a1rw==
X-Gm-Message-State: AOJu0YzOUyCsUpzvLeRMcAn5dN5gM/zSnM6Pdlnt/8V2tSJ/gE4pp7mI
        JK9U8Dm3AhW3niQw82HBLSEt4Q==
X-Google-Smtp-Source: AGHT+IF3y2rQr3XG8SJodLdmImsnXG0VynEltv/HXiA/nxoiiFZ9fjfV55isMP6Fs66+HofYAUOeuA==
X-Received: by 2002:a05:600c:818:b0:407:7e5f:ffac with SMTP id k24-20020a05600c081800b004077e5fffacmr1517642wmp.41.1697544319212;
        Tue, 17 Oct 2023 05:05:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 32/73] pinctrl: intel: cherryview: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:50 +0200
Message-Id: <20231017120431.68847-33-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index b1d8f6136f99..f806b7ce086b 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1148,14 +1148,14 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int chv_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				     int value)
 {
 	chv_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static const struct gpio_chip chv_gpio_chip = {
-- 
2.39.2

