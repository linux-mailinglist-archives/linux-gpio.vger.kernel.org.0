Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6645A7963
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 10:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiHaIuE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 04:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiHaIuB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 04:50:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6301313F81
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 01:49:56 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id m7so10056560lfq.8
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 01:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=BbGXI2YCY3XUSrCOvVOXTVgTGtDb7xZxpHBEVpjJpyM=;
        b=LrpxOGf3mAiFYVWcyPEo7nU0H9rpxAHn+/XuXqFev78gf4OrNSgUPMUeGqFckXatSd
         X89u/El32JY0I1zc96BjKE2yKtRNZMkkEul7H8YjRCo2mk6NkagRxC4+3Ykl6oOCY0PE
         LTu41fHgDP39kHN7FpO5wkbThuXsxpLWB3JXoB/31HtTPAKSTGriH5+rbD5bF3QYrexw
         fpevvYG8E5BfbgqRPkzQJryHefE442TGU1oTlwwiWM0b5N95G1JbP3E/g/G+g2gxk9oZ
         z+6BcoO8UIRiLnaMM6pXPCRcH6gfS9Mm+JA34TeEuyOqwViL8iuEHbpCedeKLr7u13fl
         j9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=BbGXI2YCY3XUSrCOvVOXTVgTGtDb7xZxpHBEVpjJpyM=;
        b=e9omqxeAbhg0JYeenwiB+uUmY0pMBv6Cyfuh3qlU2zOwKSn9oeu7fDO807jSUvz9IU
         FRjVmSHLRNenyQW1WoeZ0Ck9IP5ebtFDv0XYDJjlcMBGvkP5QqTspJBUVdGsDFtraixK
         herOHJNhNtcC/U7btc6yQWY7nS+2vvP6SZZ5oodQTniAGM2tMDNKhS4MAUE6pKSAeADX
         p23szxW4NEE/zhB0AUM4TBr0Jrx888vpcgB3isRy7ll8zjU0g/IEIoxlShRrYFdLiyHY
         J/AF4/XdytTKtBJ03dTlK80NnBXF8r5DLv1ar26iVtgOZOGarsVXlEwOKk1/GeXv8W8A
         qWGw==
X-Gm-Message-State: ACgBeo3b+ugpH3DpGitNWe9xBbZxSsvY0Tkxt7iDukdTJczzmpXeG2uF
        UYSshDtYNNhuMG1Eg8IQBCO+BIXOHEb8LA==
X-Google-Smtp-Source: AA6agR6TmW+GMP+Yh0BrVN/MOj8irDyZBkChD1mLxUvVlK+irXidXUayMtkYeDQVQFL9c1G6O4giMA==
X-Received: by 2002:a05:6512:3e11:b0:492:c5ef:442b with SMTP id i17-20020a0565123e1100b00492c5ef442bmr9733848lfv.434.1661935795094;
        Wed, 31 Aug 2022 01:49:55 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0048af3ff2d0bsm1905892lfs.234.2022.08.31.01.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 01:49:54 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: ucb1400: Use proper header
Date:   Wed, 31 Aug 2022 10:47:50 +0200
Message-Id: <20220831084750.490310-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The UCB1400 implements a GPIO driver so it needs to include the
<linux/gpio/driver.h> header, not the legacy <linux/gpio.h> header.
Compile tested on pxa_defconfig.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ucb1400.c | 1 +
 include/linux/ucb1400.h     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index 386e69300332..676adf1f198a 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -7,6 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/ucb1400.h>
+#include <linux/gpio/driver.h>
 
 static int ucb1400_gpio_dir_in(struct gpio_chip *gc, unsigned off)
 {
diff --git a/include/linux/ucb1400.h b/include/linux/ucb1400.h
index 22345391350b..2516082cd3a9 100644
--- a/include/linux/ucb1400.h
+++ b/include/linux/ucb1400.h
@@ -23,7 +23,7 @@
 #include <sound/ac97_codec.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 /*
  * UCB1400 AC-link registers
-- 
2.37.2

