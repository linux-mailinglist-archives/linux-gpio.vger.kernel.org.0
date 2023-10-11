Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E90F7C5330
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346422AbjJKMLG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346728AbjJKMKN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:10:13 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3015AD41
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:41 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40651a726acso62579315e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026169; x=1697630969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdciYkeI9ojIVFf6NUkn/u7//A2Bey8sZm2LXyWrQBM=;
        b=lbRlGdsddzuxZX0OBbBSiiUDbqJC0QX3Ch30M5gMRYizVpUF9YvXXzXDZ5JnVRZI42
         a87tSMk1D6axceX5ultk1tpGeHAKBGuGigC+PQwx5eD2zDDfpjXLqR9qo297GrMRVMzm
         sPVZTXvpjO+h8z9Rl67bXnaj88KnEQ52BgbCpMNRkpBnblpXIIbclZ+yCJzGPuf6YDlv
         2LerYGVpXZhWax9xNWPMFHLJDD2Z5P1rlpjRD2zaMk2z/6C6RMTyLzW55UkaH/70NQXj
         uOEnzRpPn7TVJ/gnCycXySi22+boakFIXlmbJ3roRA1O+4mMakLHHa92lj6HufzfU4C7
         EO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026169; x=1697630969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdciYkeI9ojIVFf6NUkn/u7//A2Bey8sZm2LXyWrQBM=;
        b=AI9+vr3QSb2H6+ipCtZqk+yDWcC3TxoVweHdIU0eE8zuEbmMEDkPUb0lEBOCfeeqgm
         WqGndUwdfOtmyVOHkZvI1NfJUggk6rOUPvrDkiXOANIBxELLlEv+2ffMH4IYUfh0+SCi
         GGkHeTozvpRYo77g5fEPxpdVI/Oifc7wNnoqOzyAqCV9Z4puyQaPGUvaZGmLK3UF4Cec
         hoef756RpirLVhlCFjKFRwb1mHVdzOnhE0KgT2L7tjWLuf3ATo59cHP6V5lzJ/SXMhrT
         EpHsw0aAQf8+0qgrDP/oRRPiIjY62YCI8nDyudgEFxQKODOL7YeeoUmy8Il2U6T6jb4r
         3QXw==
X-Gm-Message-State: AOJu0YxD0kdXSrmD7MXloUGDlbh4uUc4pj7iI7vUPMJmJ5uB7/wGJoPh
        5bmtWoKJpsnbWL5WCPoP7fc+zg==
X-Google-Smtp-Source: AGHT+IFvsykFPLsR/DZxmt/oXTkLreB1wB/q0xWf2n0gxG0O+ZL8ee7uCpjNkE15mHaC562G4pWzkw==
X-Received: by 2002:a05:600c:1d8f:b0:407:3630:f35 with SMTP id p15-20020a05600c1d8f00b0040736300f35mr13381234wms.9.1697026169023;
        Wed, 11 Oct 2023 05:09:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 24/62] pinctrl: vt8500: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:52 +0200
Message-Id: <20231011120830.49324-25-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index 6fac30de1c6a..1a313295611e 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -528,14 +528,14 @@ static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 
 static int wmt_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
 	wmt_gpio_set_value(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static const struct gpio_chip wmt_gpio_chip = {
-- 
2.39.2

