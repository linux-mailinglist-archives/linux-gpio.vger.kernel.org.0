Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E6A25DE66
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgIDPty (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbgIDPqx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:46:53 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE8CC0611E2
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a65so6472775wme.5
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/oJst/31Ve7sN2p8SCKacvVyyAcOuKLg7HZEv9T1Bg=;
        b=uPvmch86FehCHUzRin+H5CXUohTvqZcGHApZczW8eq9lu/MJzFf9k2ReFbXCNCKyKp
         QAnbVmcbSwdGJkgvs9p8KOl0pQFjMwybe/CpY7Hh8XOol4HEQj390odpGv/D8NzqLzMQ
         AvpKvNqhVW5l5nuN1vqDrYMGBJRpIjjleROe9WsZdIidLQSeFxFz28InaQK6FDuGaHh5
         abODV06AGHy0/63WGITnhu2uh99JLKd0WdxfAiAeP2mKsEWCMrGiumxY/dt5qdEeKyOV
         cuO2DAPfpRJIBrUcEDpHpmxvfKAlccqkdA/9Vos4EFtb0JOtN0HxFexJBPe9MvVF5WWw
         hEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/oJst/31Ve7sN2p8SCKacvVyyAcOuKLg7HZEv9T1Bg=;
        b=Ze/SQI2eGXp0NwosiYUd0XnEPt2ly/Gkya1JDxbRcuWRr4jtokt/tY/XTV6Ketmse3
         dgvZ7IED7aL1cH7QSFy9YuJl+dLhP0+Tfm6qLqTkosWnwmgIYS7QVBxRUWAdcrk2UbK6
         pqH59V4wGz2ziftEnHHlDnlba3HswHE8wk2LAZD7/nCrRjtxQBO7AeoCvdWH6wqbkuzK
         vIkQ8st0+Ff3SuId4NFvWdPniWepTvc8aiG6MGJXc/FKZsb86gQiWwPVQVKJeavhirn3
         FO+VeeNgB1Za5GmgSpBlCbKG3viaiRAf7esYZcshGMo9fsMAllOu2HYumlM26h7ocfs9
         q7PA==
X-Gm-Message-State: AOAM531nMLS7Ir8DrswwDiJ++FpDPVOd1Dq49IeQE+Q+wgBG0S/671xQ
        tY4had+UuVRapUA3IaJvbERkiA==
X-Google-Smtp-Source: ABdhPJxeZd3+cr0IB9roZ5GLjIlStXJyf7rbMppNX/92diAh72W08u+6KqmM8T0vs4cn4upk6ZXE0Q==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr7896110wmh.115.1599234402232;
        Fri, 04 Sep 2020 08:46:42 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 09/23] gpio: mockup: use KBUILD_MODNAME
Date:   Fri,  4 Sep 2020 17:45:33 +0200
Message-Id: <20200904154547.3836-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Drop the definition for the driver name. Let's use KBUILD_MODNAME for
the log format and use the "gpio-mockup" value directly in the only
place where it's relevant: in the name of the device.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 73cd51459c2a..78c97f7b6893 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -22,9 +22,8 @@
 #include "gpiolib.h"
 
 #undef pr_fmt
-#define pr_fmt(fmt)		GPIO_MOCKUP_NAME ": " fmt
+#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
 
-#define GPIO_MOCKUP_NAME	"gpio-mockup"
 #define GPIO_MOCKUP_MAX_GC	10
 /*
  * We're storing two values per chip: the GPIO base and the number
@@ -501,7 +500,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 
 static struct platform_driver gpio_mockup_driver = {
 	.driver = {
-		.name = GPIO_MOCKUP_NAME,
+		.name = "gpio-mockup",
 	},
 	.probe = gpio_mockup_probe,
 };
@@ -572,7 +571,7 @@ static int __init gpio_mockup_init(void)
 			properties[prop++] = PROPERTY_ENTRY_BOOL(
 						"named-gpio-lines");
 
-		pdevinfo.name = GPIO_MOCKUP_NAME;
+		pdevinfo.name = "gpio-mockup";
 		pdevinfo.id = i;
 		pdevinfo.properties = properties;
 
-- 
2.26.1

