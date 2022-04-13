Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251564FF853
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 16:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbiDMOEI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 10:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiDMOEH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 10:04:07 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BD847068
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 07:01:45 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso4061455wma.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DTI5aKv+Llz9a6eH5cPOwZke9qYbkp9XtBDCcwx/bdw=;
        b=oS95j73fR3+vosP7yR0hB/NfaUUiMsI9CRzXH79noDkneJGFCGDr7U501avBE0sDkD
         w5vXv+3LHyeZpWp5UpIvj325ThHw25LCeWJZncZti/wuUKpWPVsD1YzrdH4WFQi1T+6q
         IBwN77JR7evl8svl0PemG7rOF6eNwAHU5QJHqhKBu3rK9GGHngA7ljOTvPAxidIC5EpL
         wA/BpDkA1RopEXQyPfUPg0QMjSk3Cxo8B2PC6+0Ao1rLTdI6nLA7+qOwR2SBhN4qzrrv
         zhSrASTig7N0m+mUeCV7s+cWYF+GcGW8iwi3wx4LTfPDjDO+zhE+u3o2SsAKMh74E2TJ
         uRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DTI5aKv+Llz9a6eH5cPOwZke9qYbkp9XtBDCcwx/bdw=;
        b=5rt98y+LorGHeBZADbWkVRQAjcm8BLvOQptKMEhAfgZbu46z5QnDSoWFZ+G9M5XDJ4
         jQRaEeEE/mvE4n8uMLhGaW8VUB+XGeDfzByM6qNrHb5RibqqEMDcVExSTwu1JryYojg8
         gVDsxAvpfUgHrS6nRCnttjKQNE0yX3jLtHLZY87UwIVHnOFl8IQ5WQWGBot5NWQ5pLAn
         pwPsIowIKBSXpcr5C2loMBGLou9mF+oCXZUWWYcwJ8jmyfVYkFbeErIo1dJBzNsfHDAR
         e8RitU61t4YMK0HyLUTOTQLcgM6DWUBH3GlNfZ0BJZo7TYDfpDw+AQJQB0p5F8CYQinT
         XUGQ==
X-Gm-Message-State: AOAM533k+sR0DinVHw6zcfS9B2X3iGibpXQ/v6HsBK0cCowYFmgGm9hB
        QZMkr8aiEC7UGOCEYDxF5CWIt5AqbXD1hj/W
X-Google-Smtp-Source: ABdhPJzgc2lgi92TiqfkjIvUbTtRFT8RLl3JsThFjpis+TU/Z+jZb74O4DrydZ+C81HbiU8wLdQ69w==
X-Received: by 2002:a05:600c:1d18:b0:38f:f19c:37ee with SMTP id l24-20020a05600c1d1800b0038ff19c37eemr60529wms.88.1649858503913;
        Wed, 13 Apr 2022 07:01:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:756e:dffc:3f22:6bcd])
        by smtp.gmail.com with ESMTPSA id v1-20020adf9e41000000b00205c3d212easm32745997wre.51.2022.04.13.07.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 07:01:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, stable@vger.kernel.org
Subject: [PATCH] gpio: sim: fix setting and getting multiple lines
Date:   Wed, 13 Apr 2022 16:01:32 +0200
Message-Id: <20220413140132.286848-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to take mask into account in the set/get_multiple() callbacks.
Use bitmap_replace() instead of bitmap_copy().

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-sim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 8e5d87984a48..41c31b10ae84 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -134,7 +134,7 @@ static int gpio_sim_get_multiple(struct gpio_chip *gc,
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->lock);
-	bitmap_copy(bits, chip->value_map, gc->ngpio);
+	bitmap_replace(bits, bits, chip->value_map, mask, gc->ngpio);
 	mutex_unlock(&chip->lock);
 
 	return 0;
@@ -146,7 +146,7 @@ static void gpio_sim_set_multiple(struct gpio_chip *gc,
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->lock);
-	bitmap_copy(chip->value_map, bits, gc->ngpio);
+	bitmap_replace(chip->value_map, chip->value_map, bits, mask, gc->ngpio);
 	mutex_unlock(&chip->lock);
 }
 
-- 
2.32.0

