Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F787C0496
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 13:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfI0Lsk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 07:48:40 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34967 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfI0Lsk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 07:48:40 -0400
Received: by mail-lf1-f68.google.com with SMTP id w6so1703051lfl.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2019 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFDpkukXEfU9tBx0F5yg7RZhEDdxtF7LeVvjbzzhvz8=;
        b=vlaaHSfwdULnq2917DCg7xxUVx3tXBwbhXuy9YmIbneJ1XULVOakNhuzop+ws1zxWX
         E8br64wJYaTSyokIxipxJg5Y1zrGrwuUF4tWUPGaGA2opAj+AQzKbvTHEsoH1+p6H3Et
         c0hZ5aoEwGKflD1IX0WdVRzgtODQuQ8zmOULCu34lyWogFrKgUeW4IUTP5Ldr4NMPaxA
         DarBpPhBVDHS/fnFyiNA7odVuq51FmcCElHLbFHIBIaUka1iMSqgrAA9znlxEVV3UI8R
         6EwoRrExWoATTPlpEw7+zsG0KpbBk0UrFJRJO8uGs283/Q2kT+wT8YvZnObrKXcIRxHZ
         4Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFDpkukXEfU9tBx0F5yg7RZhEDdxtF7LeVvjbzzhvz8=;
        b=KkLtufg1qiOQDQ8+8fD9po7JFn38VUjq4WouIi6/GGyRj6Mia5xEPFvmO3lUE3UDok
         zMkDqJK/yIhPrRwN4U4SJlq3GRTDwvWTAcgZ+I4X2tZnoLw1Xgoc2OV4byN+KeRtQYKw
         J28aouyE4QOV4qEG5YCL/fRLtKUnDW9iumtDuboFuB+2q4QlV3tBHRA3GAWiuMW6ye0E
         mdUaLlyC1g+C7yQXxrjwX1JaamUDjgWXESq9d2671pTJ9QZrjWHVsrDcxivDh1WHLCsl
         lNpgHXB8OYRrVpyBebUX/nXLSpLJjJDd27BvFz63tlspNVlH2QLyITzWkj2o4pd369u6
         L3OA==
X-Gm-Message-State: APjAAAVsl4BCEj+0eKFUwJjga6hqhMFZo6hNerJ7rfmoCzRys4HmzwJ0
        FNVvKs73QSg3QJLPlGbvv9swnb/BHbKczg==
X-Google-Smtp-Source: APXvYqxKjBfNJup5xvk+08oKCUvTq6X62CvXe7DXPn1mtn0paJq9cgllkUqOdZhOhBidGKqsVu6yIA==
X-Received: by 2002:ac2:5a19:: with SMTP id q25mr2504854lfn.178.1569584917836;
        Fri, 27 Sep 2019 04:48:37 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v1sm408631lji.89.2019.09.27.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 04:48:36 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hongwei Zhang <hongweiz@ami.com>,
        Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] gpio: aspeed-sgpio: Rename and add Kconfig/Makefile
Date:   Fri, 27 Sep 2019 13:48:33 +0200
Message-Id: <20190927114833.12551-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This renames the "gpio-aspeed" driver to conform with other
GPIO drivers as "gpio-aspeed-sgpio.c". All GPIO drivers
should start with the string "gpio-" no special exceptions.

Also the Kconfig and Makefile entries should normally
go with the driver but I missed this in my review, sorry
for mistake. "CONFIG_GPIO_ASPEED_SGPIO" is used to
activate this driver.

Cc: Hongwei Zhang <hongweiz@ami.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig                                 | 8 ++++++++
 drivers/gpio/Makefile                                | 1 +
 drivers/gpio/{sgpio-aspeed.c => gpio-aspeed-sgpio.c} | 0
 3 files changed, 9 insertions(+)
 rename drivers/gpio/{sgpio-aspeed.c => gpio-aspeed-sgpio.c} (100%)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e6925f..7138290cdd36 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -120,6 +120,14 @@ config GPIO_ASPEED
 	help
 	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
+config GPIO_ASPEED_SGPIO
+	bool "Aspeed SGPIO support"
+	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Aspeed AST2500 SGPIO functionality.
+
 config GPIO_ATH79
 	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
 	default y if ATH79
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d2fd19c15bae..e4599f90f702 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
 obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
+obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
 obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BD70528)		+= gpio-bd70528.o
diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/gpio-aspeed-sgpio.c
similarity index 100%
rename from drivers/gpio/sgpio-aspeed.c
rename to drivers/gpio/gpio-aspeed-sgpio.c
-- 
2.21.0

