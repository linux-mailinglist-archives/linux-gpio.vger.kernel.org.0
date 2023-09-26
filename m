Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B49AD7AEF6F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 17:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbjIZPAD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 11:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234984AbjIZPAC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 11:00:02 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7898D136
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 07:59:55 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31f71b25a99so8908256f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 07:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695740394; x=1696345194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95OtrKREF8DsDqawHPxVwUVS1xHqZyiLo+RbQA771N0=;
        b=w4ZxVzxqVCw4qjgnYaUWgjZiZ016hC+aZ3J5ft8os76UZ3+SpjZEUYYUqJx8S/PUm1
         hJzpz3PkJcRFX+7IvPfutngdq56J/H+jMnPhaoPysmc4Cb/1teL4yi0biPWA3yom6LD2
         IgsPVS9ps/GpLPkMU7AQMOj/xyKC79ID7av5cJCzt5K7X1qMqpUIHxX7EqpBAUi1Sm7L
         I2kM6WB2rlsfA/z7Cim9HzJon3X4w67OMGmaRPfHeinzXvThbOXmLDVZETuokriRt0nd
         FBLj3mIXozbwELB/6XvMziXDc+rh3mMIadt/4pmE7o6gYoarfc7aWNHDE6ivrzbEoLgy
         37Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740394; x=1696345194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95OtrKREF8DsDqawHPxVwUVS1xHqZyiLo+RbQA771N0=;
        b=ARPyyysrNzIHx61nX0Wyyhu/WEERpaPsLmi11y9htGR7nvZW8IflfnHRjG4OLi+3ZS
         o+E/h7TH8leXFab05h6qRzpmquA6xcEbXlIBAJQAhbZj/Mc9gLEFKhpi1vu0laWaNIjh
         fJRd95m4q4FxIBrwydBuAediw3FEvkqU+U6fiICibymFzI5EolFqUFx9LP32uZw75+8x
         g/XsQSCJYGUgh/PNNtncf14yniE+6eteVcBNGI8m5zh+jhXnv2NGdjn6vmNJq5vm4umb
         JjGdyGvN/pmPdBexfrrx1yE2WF8/wqkR2Aco9+Nncl8H++9UlxoAwaxEFDtefE5mpYGC
         YrCA==
X-Gm-Message-State: AOJu0YwEmx1EFwQXEzppPnFRCo2+7IsryypOCGIZLYLlfZ47Jm6Nmvsn
        c+xRNvCSjLGQbcqySwPtWtnazw==
X-Google-Smtp-Source: AGHT+IHI0VIKUHq7lfQylc1Bgqtnm9G/0hKS8DqAmHAu9aN6x76YmqNYZiupYJpDJhSqidCGXyqjpA==
X-Received: by 2002:adf:ff8c:0:b0:317:ef76:b773 with SMTP id j12-20020adfff8c000000b00317ef76b773mr8594149wrr.45.1695740393987;
        Tue, 26 Sep 2023 07:59:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:686:c497:30b1:d2b9])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d5102000000b0031f82743e25sm14871634wrt.67.2023.09.26.07.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:59:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFT PATCH 3/4] platform/x86: int3472: clk_and_regulator: use GPIO lookup tables
Date:   Tue, 26 Sep 2023 16:59:42 +0200
Message-Id: <20230926145943.42814-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230926145943.42814-1-brgl@bgdev.pl>
References: <20230926145943.42814-1-brgl@bgdev.pl>
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

Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), use
temporary lookup tables with appropriate lookup flags.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 22 ++++++++-----------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index ef4b3141efcd..ec4c4848a2c4 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -174,20 +174,16 @@ int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
 	if (int3472->clock.cl)
 		return -EBUSY;
 
-	int3472->clock.ena_gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
-							     "int3472,clk-enable");
+	int3472->clock.ena_gpio = skl_int3472_gpiod_get_from_temp_lookup(
+					int3472->dev, path, agpio->pin_table[0],
+					"int3472,clk-enable", polarity,
+					GPIOD_OUT_LOW);
 	if (IS_ERR(int3472->clock.ena_gpio)) {
 		ret = PTR_ERR(int3472->clock.ena_gpio);
 		int3472->clock.ena_gpio = NULL;
 		return dev_err_probe(int3472->dev, ret, "getting clk-enable GPIO\n");
 	}
 
-	if (polarity == GPIO_ACTIVE_LOW)
-		gpiod_toggle_active_low(int3472->clock.ena_gpio);
-
-	/* Ensure the pin is in output mode and non-active state */
-	gpiod_direction_output(int3472->clock.ena_gpio, 0);
-
 	init.name = kasprintf(GFP_KERNEL, "%s-clk",
 			      acpi_dev_name(int3472->adev));
 	if (!init.name) {
@@ -314,17 +310,17 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 						int3472->regulator.supply_name,
 						&int3472_gpio_regulator_ops);
 
-	int3472->regulator.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
-							     "int3472,regulator");
+	/* Ensure the pin is in output mode and non-active state */
+	int3472->regulator.gpio = skl_int3472_gpiod_get_from_temp_lookup(
+					int3472->dev, path, agpio->pin_table[0],
+					"int3472,regulator", GPIO_ACTIVE_HIGH,
+					GPIOD_OUT_LOW);
 	if (IS_ERR(int3472->regulator.gpio)) {
 		ret = PTR_ERR(int3472->regulator.gpio);
 		int3472->regulator.gpio = NULL;
 		return dev_err_probe(int3472->dev, ret, "getting regulator GPIO\n");
 	}
 
-	/* Ensure the pin is in output mode and non-active state */
-	gpiod_direction_output(int3472->regulator.gpio, 0);
-
 	cfg.dev = &int3472->adev->dev;
 	cfg.init_data = &init_data;
 	cfg.ena_gpiod = int3472->regulator.gpio;
-- 
2.39.2

