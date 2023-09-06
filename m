Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28FC793F7C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Sep 2023 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240740AbjIFOuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Sep 2023 10:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241809AbjIFOux (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2023 10:50:53 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B5C172C
        for <linux-gpio@vger.kernel.org>; Wed,  6 Sep 2023 07:50:50 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31aeedbb264so3539378f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Sep 2023 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694011849; x=1694616649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVthb6ZN5GYct/SSdnLN79qXHbRJTph85wddKtPDZCE=;
        b=VZ4RKZHBsRJIqffQ+z3m5dFiNflLcKJh/toyiuWSPIq9Bj4pRtqZBy/GHm7aBt8WeZ
         3gHH2NdGz91TrHVXqYJvRPTPX88O4MeN8+QnLnenAk2FEfOg2iWsfcmqRE5JCuCCRdkq
         Ze/QG/kyQT2eWlZnRXWlKjBkPBXTD2q58Xm8akViP8SsvusU9NFju9TUW51jkMRh7rMc
         W0J+NJNw7xSAZtQ2s91sxkgE3zD+2cyHS9WseZsdPeGG/w04wolyvvNjvfltkEjwYb6H
         W0ySMsVC+Ds2Xl/jxn8h9Ja3Pxq/rcYmvZgF/BW7xab7L655LiswkmfqkUW2/1ew1YaV
         wPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694011849; x=1694616649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVthb6ZN5GYct/SSdnLN79qXHbRJTph85wddKtPDZCE=;
        b=WTwztQh7gTJgW1fwJ13QmvpgFV+ba8/v9RCOsbsTDKoT9EuUTseRRrYEonxly1zvlF
         Q9F4bHfhcLADjzwmltJAp/wLqxBlyh5cH+RIiKWLgw44CTtoUAELYIGz78cTjiAc8+8a
         UlP8Hug13zjrM4k+cA5j0Z+Qmhmn51lylbIenB54KsMVzIWrc3fETEXKbG6ax+dcWMUt
         J2hMXY+SSjmzGrAnYGTKdXc8DCQRjraQJWZ1d0OAoark+y1GSoi2fQjfryHM6E+07tC1
         V0sKzv9oZVqDGmAI8KE7OmYZYH1uJ4mp/gR3Lzlei7Dyyhb92wYekP9LSCuBdEcROYoR
         HQtA==
X-Gm-Message-State: AOJu0Yw4a5uzZRJhKMazUQt+RGfGMctUCRIUaHt/WvB4/JbrMEaQHc6C
        ZuvbuJlfqzkEj/u1v69GGsxgslsdxBpEPxIIRFI=
X-Google-Smtp-Source: AGHT+IEJC0W51QkBL5cmqxw81ARfsV+dHb2q9U4TW9NoExSfFJ2TRR28GrLY4rwFF/Z8nLmRL2Tv+w==
X-Received: by 2002:a5d:4105:0:b0:314:3740:7f69 with SMTP id l5-20020a5d4105000000b0031437407f69mr2311960wrp.37.1694011848468;
        Wed, 06 Sep 2023 07:50:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:9866:d0f3:fca8:33c9])
        by smtp.gmail.com with ESMTPSA id p9-20020a1c7409000000b003fee53feab5sm20325433wmc.10.2023.09.06.07.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 07:50:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: dwapb: don't include gpiolib.h
Date:   Wed,  6 Sep 2023 16:50:45 +0200
Message-Id: <20230906145045.139657-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The gpiolib.h is unnecessarily included in the driver. None of its
symbols are used so drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-dwapb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c22fcaa44a61..4a4f61bf6c58 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -21,7 +21,6 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include "gpiolib.h"
 #include "gpiolib-acpi.h"
 
 #define GPIO_SWPORTA_DR		0x00
-- 
2.39.2

