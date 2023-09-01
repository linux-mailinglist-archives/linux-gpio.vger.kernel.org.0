Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE8F78FC47
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Sep 2023 13:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349164AbjIAL3n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Sep 2023 07:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240050AbjIAL3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Sep 2023 07:29:42 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA76110D3
        for <linux-gpio@vger.kernel.org>; Fri,  1 Sep 2023 04:29:37 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401b393df02so19367065e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 04:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693567776; x=1694172576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tu4OfRROT7gdZwvbBdXio/1x3hbxyqPiGugfXIkYo/0=;
        b=DAXUbWrEMDr6aa6gKPQdalUC0woO6WUC9eV9ZhswcxFSAJgE42CoTE54uyF3xXe16P
         P0zTdoKIaOO7nGnUnCUelwl5YG2D3jtM+Ge4BgtmdDbZyjfbbrRrhReJ3mRedeK6DnL5
         izn55ET3+Ml8XDEC82Lp4RK+GvSVn0V4lkbY09zj3JlsDZankpJxDSk3ClDj3H0h41qP
         eXSs9/loDT8Bk//I9QMdOd8bXehd4QFNE6nbZ1ux3FN6fcPPNCw6IiOYfpxMMmqOqYR6
         cmOlTUbT9pkYeBj1oCFqyP8UgcEF2FvT8/45+EcwxQ3pLDC0xIHxKdq0CJZsGE/AO+VB
         WICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693567776; x=1694172576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tu4OfRROT7gdZwvbBdXio/1x3hbxyqPiGugfXIkYo/0=;
        b=IEWPinKfcJRneh0BB+YMvebYFR8fUhf14GgxSTtk7mnnYwUjNQjliu6VjPfJPuxvty
         e+cDeZ+2bZYBRxzX/nVQSNopZCR8ChKxK6AMLhqU2wkrjnj97BwK0WDoCcljIhaSQX+k
         ziSVhQYLGOrZlxUDp+tIJwCcp3PBpczz+DdQSscuUEaxYbs1G7C4SEUVAw/l+GPVL6JQ
         UHGt167DPJ59U+xk2nep/cfhPOOy8ZkBgQU3P18iJTYsDIz5rKuMJ34+lQpqYzRzX1ef
         FbR7YshcLaNeYiTSkCdC8rLTMGuvWKWC4pkY59OPF5BSV+Vu03PM0oAnxrfKtwr0U6TA
         CXfQ==
X-Gm-Message-State: AOJu0YyWocPW74Z5kWmUwc4pB9MN1F+AvCUBUBuEKwb6Bb+Dl3hXhm0W
        nZd7JMiMosA4KEcg8MY3C8eoRA==
X-Google-Smtp-Source: AGHT+IHIGzMxeHFtHXrQ21rQASy8FstyQyzoqQ5sDyEjiv5Strpzo00wvLahj0KIaTtmZ0GaoN5stA==
X-Received: by 2002:a05:600c:298:b0:401:c075:d5b with SMTP id 24-20020a05600c029800b00401c0750d5bmr1599260wmk.26.1693567776426;
        Fri, 01 Sep 2023 04:29:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e94b:1054:6760:aa27])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b00317f70240afsm4963426wrc.27.2023.09.01.04.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:29:36 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] pinctrl: da9062: don't include private GPIOLIB header
Date:   Fri,  1 Sep 2023 13:29:26 +0200
Message-Id: <20230901112926.13216-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901112926.13216-1-brgl@bgdev.pl>
References: <20230901112926.13216-1-brgl@bgdev.pl>
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

gpiochip_get_desc() now lives in linux/gpio/driver.h and there is no
longer any need to include GPIOLIB's private header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-da9062.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 9239b9cd9002..3998b27cbe0e 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -23,12 +23,6 @@
 #include <linux/mfd/da9062/core.h>
 #include <linux/mfd/da9062/registers.h>
 
-/*
- * We need this get the gpio_desc from a <gpio_chip,offset> tuple to decide if
- * the gpio is active low without a vendor specific dt-binding.
- */
-#include "../gpio/gpiolib.h"
-
 #define DA9062_TYPE(offset)		(4 * (offset % 2))
 #define DA9062_PIN_SHIFT(offset)	(4 * (offset % 2))
 #define DA9062_PIN_ALTERNATE		0x00 /* gpio alternate mode */
-- 
2.39.2

