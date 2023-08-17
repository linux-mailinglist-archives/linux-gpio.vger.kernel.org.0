Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C824577FEAE
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 21:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354735AbjHQTpI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 15:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354732AbjHQToz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 15:44:55 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9DF8359C
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 12:44:53 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so2317465e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 12:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692301492; x=1692906292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZLCso6zuPoBhdzbDgAWu843pgchVyTms6QlPoq9Bew=;
        b=khPTLfujzns+b+B00amG6wdlyOi2e0rA84cAx9nGVy9MDxDdeB+o/RlxXHQJcVT/kR
         oE2JrffnSldIsYD7G+USOFl05lYpIovbs0B2nmHgrGk46DwA1yCb+RO1C9Qmjp36dGVq
         bC2o8fGLftdEdaGKo9MlKSfxna3I9M3KLqScwCLv8MkrgcJ13afZ/Z4KEAsv6ELm3VlE
         44mEaU0LlY8RFm44YRsn55nAD/9B/4DoKtRZCseS0dWsGvl+rak1TnqGwB0DPL5PaslW
         3JZ2cCS3GSJWkbXiqRiPzZQTqDv4XTpmO2Lfl2Zgb6GAyNArytHdYwUmixYlIw9BufmT
         UKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692301492; x=1692906292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZLCso6zuPoBhdzbDgAWu843pgchVyTms6QlPoq9Bew=;
        b=crx8yIOLL4XqC/hqrlVhFENhggatL0Q0aJuvr5VuWXgVnUhFDgqwR+wGJC4w8Dj6H0
         46RU1YCG2ecklFFPkDoBXS9jRZ3A/ln9M694eeYf5PV5s7DSQMKQOzXqrPgkivYfs7ok
         h+OrxerKsxBsHG3NtgwWx1M+9uiHlhzjMIsjDdH4EVgaz+AUidNOKFP2HqIGyvCLHOs/
         Dqk7Pi0wuvk1qrnxH37wRjT1l7wPMEIK/qFN1yP6tlRKtg7qB7a9HjAKOP64pUs+TL3N
         kHvFCmYi36+IOT5IkjurOd8PN1hdeWH5cAbaQ5JopiSQ6O+mwAdipCV+FKuA67s7dCXe
         kimA==
X-Gm-Message-State: AOJu0Yw/n6uOsXAalmLD2LdDqHVBND0uHDQ4HpSGu5bYhVFBqLdYe3su
        UbV2vcJbCZTbYvIy6YAd/ICkKQ==
X-Google-Smtp-Source: AGHT+IFoUrSyiPFnBh/EUK3V+/gt+gh2TJExw7tuToDOynOmdOg2AXMCLK21J35oNYeN+qqA3M2ZHw==
X-Received: by 2002:a7b:cd0c:0:b0:3fe:14af:ea21 with SMTP id f12-20020a7bcd0c000000b003fe14afea21mr577743wmj.21.1692301492396;
        Thu, 17 Aug 2023 12:44:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2f99:c690:b4da:e3d2])
        by smtp.gmail.com with ESMTPSA id t12-20020a5d6a4c000000b003179d5aee63sm197177wrw.91.2023.08.17.12.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 12:44:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: pca9570: fix kerneldoc
Date:   Thu, 17 Aug 2023 21:44:49 +0200
Message-Id: <20230817194449.26447-1-brgl@bgdev.pl>
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

While renaming one of the fields in the driver data struct, the kerneldoc
was not updated which apparently angers the test robot now.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308171538.nKKUOtbg-lkp@intel.com/
Fixes: a3f7c1d6ddcb ("gpio: pca9570: rename platform_data to chip_data")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pca9570.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index d8db80ef1293..d37ba4049368 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -30,7 +30,7 @@ struct pca9570_chip_data {
 /**
  * struct pca9570 - GPIO driver data
  * @chip: GPIO controller chip
- * @p_data: GPIO controller platform data
+ * @chip_data: GPIO controller platform data
  * @lock: Protects write sequences
  * @out: Buffer for device register
  */
-- 
2.39.2

