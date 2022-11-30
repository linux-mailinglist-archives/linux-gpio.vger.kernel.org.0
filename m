Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBD363D5D4
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbiK3MnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235084AbiK3Mmv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:51 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BCC2611F
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:46 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id o5so17881720wrm.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZEJJxh2XaMBv4jBFweZR3RGB2Sg6NR3wHGmrq3luIQ=;
        b=zhyI9XpBkTltr35y55zqhU2COjvOkMrFg7IV+5xnJoEUC0wczqrY2j3R05pqciYBje
         VMOl0g0/TjJwQc0Wn796sUQTur5duKO0gRqqGI989L/oAqb6Xwy9ugu13E0b4JmGNiGQ
         +Hy3tFuOjXHiMyF5UFU2p6WgDf76txfdWopDj1Rcv8jjjaj067oXYR2ZmcJKWml71En1
         7ebsSYKc2VkqQ1k4da+zKTSIteDY1JpCtJEBut8IEA0d/pMBvUDH6lhkvfo+Dai/A2G/
         LdFt++g7t/h2y7oGN84x7TPKGyiH0JoncmH8ilpBqx3KmzwEIrwq85SBHKAy4W5tSfxk
         M0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZEJJxh2XaMBv4jBFweZR3RGB2Sg6NR3wHGmrq3luIQ=;
        b=53JQ1fS5u9GbD23JUnviHZevskA2Rrm8l9DRxqx5w6UvqaRbk5Xei4roJ3tHI5Cpon
         0OHArvwCnSaCCUlay2GULTG9O9oZA1bf5qHSI/MjNwi/ZOyKqJn0uzdr/xvfnRjHUVFD
         B/PtWg7GXINMkCbSl866a1YArer9b09bDGjJDoRYzztxlDa1RBzhY1aNNBMs5EsicA3J
         eqlPwgV68vUWWBNf6ZPRGxZYpNB0WdcbjAIpxJBA25OD92AOfiGDFn5heZElhtifGeFK
         ljzQQo+mLaobTRSOzWhfRSNADMCYYca6SZWzEQ9SXQBBQVD/HbJpW8DdtMWN4mz4YY2c
         XDDA==
X-Gm-Message-State: ANoB5pmuZjdyVffPicP7dXFB9zCrOTR/PGojcRuw11MOck8HrffzKzh7
        IYauCj5SELhwL50Zoj+Rer1upg==
X-Google-Smtp-Source: AA0mqf4v1agqbKlMFyKdoPqa50oxuX67XEvWKvEwylQidu89jyBAehw4fMxEXic7Rn2DIc/UmIZ2XA==
X-Received: by 2002:a05:6000:783:b0:241:bc34:3149 with SMTP id bu3-20020a056000078300b00241bc343149mr32173543wrb.351.1669812165081;
        Wed, 30 Nov 2022 04:42:45 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 11/11] bindings: python: extend setup.py
Date:   Wed, 30 Nov 2022 13:42:31 +0100
Message-Id: <20221130124231.1054001-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
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

Add additional information to setup.py. This will be visible in the EGG
file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/setup.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index c90d7d7..7ad5de3 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -39,4 +39,9 @@ setup(
     packages=find_packages(include=["gpiod"]),
     ext_modules=extensions,
     version=__version__,
+    author="Bartosz Golaszewski",
+    author_email="brgl@bgdev.pl",
+    description="Python bindings for libgpiod",
+    platforms=["linux"],
+    license="LGPLv2.1",
 )
-- 
2.37.2

