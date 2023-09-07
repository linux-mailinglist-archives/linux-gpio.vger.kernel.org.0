Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB0179752B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 17:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjIGPqU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 11:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbjIGPYd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 11:24:33 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6FF1724
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 08:24:19 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bcc4347d2dso18593821fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694100257; x=1694705057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/2YQRFzw6VwClsyr++RExaQTGHU2Q9mZM8LcXjJixY=;
        b=AclUhgAyH1qJ9FuB+yQkbFOJ7UHPkdw529iFr5ldBmjwq1bkTXllN4ZBcKwgKHd+QB
         icuFj1bxfNhnDpcD/OCM8DDToQ2jwkNfCViGoWgg013TKwyHa5Z3EHxG2gPzaqH4L2Zt
         HG7uvSQpKhaebYTlLQ8Vxix/3kckHaqlFIx8tOraqNEX1w5y6pMAWJmzwofW/T6Pj3qv
         z56/5HbC53cCWhzukpIB5HOrcFYDgnUDD9QynBgzYur+WrGW5X72cN00bngOtNgsbF/4
         8y7fOev7t4wjixQV8hfKMgsAP1WoU3Jotwq8tLFO9o8lvVdgPGAsxTMG+0FcShj3OIhA
         yEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100257; x=1694705057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/2YQRFzw6VwClsyr++RExaQTGHU2Q9mZM8LcXjJixY=;
        b=Kech0PX3Skps6T9P627SH5VXJgLlLgxXOAqi/sF5nj6nkeLP23cA2rPXeWzuz+NKyX
         bkawnYI9uSzFWc8u+40cHZllhZ6ZKhVMBIk2MAvjNfwviFu1Kb1YFir2IUQWuNTHoDLy
         3HEOyHVSHp9hMvZLzLj8VTUYYd76Z37m2o3rY5BH5M2+TNaVRrTsmCwjg9AcQXDng3x1
         jALFGLYn7X3bjT3CkkHP0QuAg4A2tzhE0fjO8VurmIEufBbAjlv84GbkrUhzE9viXpiw
         JZW3b7Lq/ao2UrqnQVxi1bULhnlD1RVDywaDXbJlG5aevPPEHuJTb/ciu7rdPHg4JcJI
         mqmQ==
X-Gm-Message-State: AOJu0Yzf0DCsP3S7Qbl+Af8nN1G6vqCZ2a43eLaSVHEwoonYQ3W+0O9V
        PUO4lQAZz1yHdgCo8mIcDKuhQIzG456+G41LdO0=
X-Google-Smtp-Source: AGHT+IFNnMZUCfIg0VmYtVkkHWQ56jupSQhxmu9VyxODnOTBsDUjstLbANCvb1NNvJCUxIP8YGRitw==
X-Received: by 2002:a7b:ce94:0:b0:401:b204:3b85 with SMTP id q20-20020a7bce94000000b00401b2043b85mr5110118wmj.36.1694098354840;
        Thu, 07 Sep 2023 07:52:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:56f5:e2d4:1e04:b28e])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c020200b003feef82bbefsm2757588wmi.29.2023.09.07.07.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:52:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/5] gpio: mockup: deprecate the old testing module
Date:   Thu,  7 Sep 2023 16:52:28 +0200
Message-Id: <20230907145230.44085-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230907145230.44085-1-brgl@bgdev.pl>
References: <20230907145230.44085-1-brgl@bgdev.pl>
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

We have a much better alternative to the clunky old gpio-mockup. Don't
remove it just yet (there are tests depending on it out there) but make
Kconfig say that it should no longer be used in new projects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 673bafb8be58..913948876c93 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1790,9 +1790,11 @@ config GPIO_LATCH
 	  connected to other GPIOs.
 
 config GPIO_MOCKUP
-	tristate "GPIO Testing Driver"
+	tristate "GPIO Testing Driver (DEPRECATED)"
 	select IRQ_SIM
 	help
+	  This module is DEPRECATED. Please consider using gpio-sim instead.
+
 	  This enables GPIO Testing driver, which provides a way to test GPIO
 	  subsystem through sysfs (or char device) and debugfs.
 	  User could use it through the script in
-- 
2.39.2

