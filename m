Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAAF1CFD39
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgELS1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:27:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:45015 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELS1Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:27:24 -0400
IronPort-SDR: l53a1/HTG3RRZGV5/S3fPvNbc3S4fJL8RuS+injar766DsHBTlJMssP7qUY/W7LDU1mYFFFPk7
 xUC7LoDqXOyg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:27:24 -0700
IronPort-SDR: VwnmomLs96sL0ouwJLrERolFf7XrW+rC9LRon6/axsFmckGW2RHQrL8FDuLallFsNL4W/YPgVb
 5gdR6V4rK/bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="280228711"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 12 May 2020 11:27:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EEA4676; Tue, 12 May 2020 21:27:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] gpio: xgene-sb: Drop redundant OF_GPIO dependency
Date:   Tue, 12 May 2020 21:27:19 +0300
Message-Id: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is nothing in the driver requires OF_GPIO. Moreover, driver
supports ACPI and OF_GPIO may be a quite overhead on such configurations.

Drop dependency for good and replace of_gpio.h to of.h since we have
one function to be defined from there.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig         | 2 +-
 drivers/gpio/gpio-xgene-sb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8ef2179fb9991b..739f179e28b184 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -638,7 +638,7 @@ config GPIO_XGENE
 
 config GPIO_XGENE_SB
 	tristate "APM X-Gene GPIO standby controller support"
-	depends on ARCH_XGENE && OF_GPIO
+	depends on ARCH_XGENE
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index b45bfa9baa26c5..203a268dd09c52 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -10,8 +10,8 @@
 
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/of_gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/acpi.h>
 
-- 
2.26.2

