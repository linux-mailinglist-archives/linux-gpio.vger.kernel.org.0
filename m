Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE37729CFF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 16:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240981AbjFIOg1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 10:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241224AbjFIOg0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 10:36:26 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4A52D55
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 07:36:25 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f70fc4682aso14311445e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 07:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686321384; x=1688913384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=43lTEtC/Bem8EYdjWbDkZc2zL5sUKt+AnLwz2BmdcmA=;
        b=0VtrKRdmhXWitBnXXF9xDeRNJ3dweVRkZQaaW10r1f0KP4Hpi3sYGLH6KEEVr5K5t6
         A22S3HrjE9KSXK9a0Pv/x6Zxv2VE6FUh2ws7S/3bd/6mceOURlef2UKBgd/I/2c8mVVt
         JgchTX64J+kjV5VvsefMOR77eTSF1dyr/+AaV61VWx2GuwJN+FaXL7PgtRYgJ/M94SUN
         HzZXrF3GNhDmG1Wq8PLGAnzUq8X14hSQNjVgBQNmyJSpVtQKQKRm+GrOLX5p7d83I6SZ
         jQ+a4f0AcCJAKbK+Xfo/ou6603k1Dq102Q8cIpsG7GtdkUGUDVzAgOVH02l8z+0ldbOQ
         bdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686321384; x=1688913384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43lTEtC/Bem8EYdjWbDkZc2zL5sUKt+AnLwz2BmdcmA=;
        b=EgzwmN5TiboVcbVcIx27gXoVfXnq3oZZcc4RalrexRX6Nf6MmURIiKXgqqYdyezX7v
         KF5mRTKRNdcTLpPBVQyOAf6N/eA0IH9Y0kZyiJmvKuyH/VHwDILLwvrFMEihpZ+8uMlt
         hhqJoPflIIDDCrRfwTWWUoLtCi/uTFsH3d4stxjIUUOcaQl7+U/qDd+kdOvY2WEt2LH/
         e173cUcRE3cik7u/N9SbG3+3bdsZMWO1dLxd3qEjQHfwxMuse7V5GalzOu6l0O6KcjA1
         +vDKK89Fo5urG4a28BoORoZBibrpaL3uVSgJQ3s3GO4v0JwCIAkLtHBFNMCiDU01NwUF
         FzqQ==
X-Gm-Message-State: AC+VfDyCBuBNNUeXB/v5+qRIa8FoWhnD/h0ODznXAg87FP9PAIZ8W/hD
        Pk99MnL3w9xA1p5JaiKhkGZyRw==
X-Google-Smtp-Source: ACHHUZ7PPK8je+1Y843D8izrp8IMhUWniL8Kr9ObTugoAauPwa+/VxLbPXj+/eteriBXrheYSONA5g==
X-Received: by 2002:a7b:c40b:0:b0:3f4:27ff:7d48 with SMTP id k11-20020a7bc40b000000b003f427ff7d48mr1105081wmi.19.1686321383949;
        Fri, 09 Jun 2023 07:36:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5cfb:aa74:b923:261b])
        by smtp.gmail.com with ESMTPSA id m19-20020a7bcb93000000b003f7f4b7f286sm2911846wmi.12.2023.06.09.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:36:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] of: unittest: drop assertions for GPIO hog messages
Date:   Fri,  9 Jun 2023 16:36:09 +0200
Message-Id: <20230609143609.209373-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

These have now been demoted to debug and are normally hidden. Drop the
assertions entirely.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/of/unittest.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 0060334a98a7..5386efeaf710 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1844,26 +1844,10 @@ static void __init of_unittest_overlay_gpio(void)
 	unittest(overlay_data_apply("overlay_gpio_02b", NULL),
 		 "Adding overlay 'overlay_gpio_02b' failed\n");
 
-	/*
-	 * messages are the result of the probes, after the
-	 * driver is registered
-	 */
-
-	EXPECT_BEGIN(KERN_DEBUG,
-		     "gpio-<<int>> (line-B-input): hogged as input\n");
-
-	EXPECT_BEGIN(KERN_DEBUG,
-		     "gpio-<<int>> (line-A-input): hogged as input\n");
-
 	ret = platform_driver_register(&unittest_gpio_driver);
 	if (unittest(ret == 0, "could not register unittest gpio driver\n"))
 		return;
 
-	EXPECT_END(KERN_DEBUG,
-		   "gpio-<<int>> (line-A-input): hogged as input\n");
-	EXPECT_END(KERN_DEBUG,
-		   "gpio-<<int>> (line-B-input): hogged as input\n");
-
 	unittest(probe_pass_count + 2 == unittest_gpio_probe_pass_count,
 		 "unittest_gpio_probe() failed or not called\n");
 
@@ -1888,17 +1872,11 @@ static void __init of_unittest_overlay_gpio(void)
 	probe_pass_count = unittest_gpio_probe_pass_count;
 	chip_request_count = unittest_gpio_chip_request_count;
 
-	EXPECT_BEGIN(KERN_DEBUG,
-		     "gpio-<<int>> (line-D-input): hogged as input\n");
-
 	/* overlay_gpio_03 contains gpio node and child gpio hog node */
 
 	unittest(overlay_data_apply("overlay_gpio_03", NULL),
 		 "Adding overlay 'overlay_gpio_03' failed\n");
 
-	EXPECT_END(KERN_DEBUG,
-		   "gpio-<<int>> (line-D-input): hogged as input\n");
-
 	unittest(probe_pass_count + 1 == unittest_gpio_probe_pass_count,
 		 "unittest_gpio_probe() failed or not called\n");
 
@@ -1935,17 +1913,11 @@ static void __init of_unittest_overlay_gpio(void)
 	 *   - processing gpio for overlay_gpio_04b
 	 */
 
-	EXPECT_BEGIN(KERN_DEBUG,
-		     "gpio-<<int>> (line-C-input): hogged as input\n");
-
 	/* overlay_gpio_04b contains child gpio hog node */
 
 	unittest(overlay_data_apply("overlay_gpio_04b", NULL),
 		 "Adding overlay 'overlay_gpio_04b' failed\n");
 
-	EXPECT_END(KERN_DEBUG,
-		   "gpio-<<int>> (line-C-input): hogged as input\n");
-
 	unittest(chip_request_count + 1 == unittest_gpio_chip_request_count,
 		 "unittest_gpio_chip_request() called %d times (expected 1 time)\n",
 		 unittest_gpio_chip_request_count - chip_request_count);
-- 
2.39.2

