Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F0C7CC302
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbjJQMWi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbjJQMWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:22:24 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02292127
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:41 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-408382da7f0so623215e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544340; x=1698149140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpzD63FKTnDkoNuJq4Z0rqQ6O9C3QSfgDXXMR4608kY=;
        b=xmLWG77w0bEq+1RNuhrsipkHXOek3Bx81ExShFZZAr30vxnBFDQlhQBndxa4uJapEO
         19bTKgYfgb8iD2IDc66tMgIGwDK+DDrPHF4i/Q/rOuOVmprUkR09UVf9T8gzbXNHdLZQ
         5ROPTTfaoaMTiEbSUe1hc36nFEJmVliO1V6708eLMIUgTPSpIlwTUZyzrHfOHQ0m8oQY
         y6F4vhayXsWUnyio0XIJttxHVkUxvc+BzGfscDeSH97evYnnF849m8fpHhDH/FFYnhDO
         K4A6g/HfgD0Ny15zXA8rKMOfoBOdWkZjsTdW7jPwj7jTtPDpDGwRhMYs0oxERQXYEFz3
         WLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544340; x=1698149140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpzD63FKTnDkoNuJq4Z0rqQ6O9C3QSfgDXXMR4608kY=;
        b=DcOSvs6nNwT0e7ym/lVxWnH5Xlw75rhJDgsce0v5lWguOqsfWUSGhG8L9noD7UQSuF
         TzTp+je9SL3i7sDkf7Vdub2/lThvEm/v5QNpFCnpe8c1EmrSyQ18XP0MP+omftAy/t7p
         HSQOjqWoghq6wCpSPTMqNiTIS7uA2mfHMKLpz73CIUYSlV7F1XYSOB7mlSAy0BbhxUzd
         TRj2VSps9lLmtTaCKXaDFnI6Ady+rbGxEIO4ckwDr/UliBuhh2uSEBvnEWCH9cr2LBj8
         gX8ieL16Bmq2xOcWoMXMqWwpbyslCrSB26xq9kAel56yEXq50QGzaRii3XVBhllkNvct
         nb0A==
X-Gm-Message-State: AOJu0YwXdbIPTqyn7ACbXo+NgNv3r5jsCmO2wZEelzB0Y4pCdjl3TCrW
        So7dLzCWi8EgCkZeaSFenLrCWDT9aOK+DCthLF4=
X-Google-Smtp-Source: AGHT+IFQ4s1y11wlkTn4KHGm3cMaFynX33qrPaSxSiQBylbccwIVK/48jQ16/iA51GQIQbVpC+ySug==
X-Received: by 2002:a05:600c:a01:b0:405:3f19:fc49 with SMTP id z1-20020a05600c0a0100b004053f19fc49mr1487521wmp.34.1697544339820;
        Tue, 17 Oct 2023 05:05:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 53/73] pinctrl: intel: lynxpoint: drop the wrappers around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:11 +0200
Message-Id: <20231017120431.68847-54-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pinctrl_gpio_direction_input() now has the same signature as the
wrappers around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index e6878e4cf20c..303aaca341ea 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -539,11 +539,6 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
-static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int lp_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				    int value)
 {
@@ -799,7 +794,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
-	gc->direction_input = lp_gpio_direction_input;
+	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = lp_gpio_direction_output;
 	gc->get = lp_gpio_get;
 	gc->set = lp_gpio_set;
-- 
2.39.2

