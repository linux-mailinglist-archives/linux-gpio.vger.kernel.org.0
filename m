Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8840F48ABBF
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 11:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238019AbiAKK4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 05:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56284 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237950AbiAKK4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 05:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641898600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Sx0bVyil13cXnvelkgvonB3O44nr3D0XzjKCPxKtzKw=;
        b=RsrLGSsanc2vxlK0k5/OTpmiMREYbKIDeO2N+8dRtK4wuKj00gbEgBSZZG+8HDPMU0B7kA
        8c2ewENkOxACX4WHGURtfDxqKeVw2QVBiS12wxV2+wBQQNeT8oH3VwAgnSGi/0mPnHDyTI
        661Ga3VFM9EcoK3QQOCxdqXbVp33FiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-RA3Fn3WWN2ugbpvSSL-_XQ-1; Tue, 11 Jan 2022 05:56:36 -0500
X-MC-Unique: RA3Fn3WWN2ugbpvSSL-_XQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7124189DF41;
        Tue, 11 Jan 2022 10:56:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.151])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 557F47A8C7;
        Tue, 11 Jan 2022 10:56:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2] gpio: tps68470: Allow building as module
Date:   Tue, 11 Jan 2022 11:56:32 +0100
Message-Id: <20220111105632.219581-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
itself gets instantiated by a special MFD driver from
drivers/platform/x86/intel/int3472/tps68470.c

This MFD driver itself can be built as a module, so it makes no sense to
force the gpio-tps68470 driver to always be built-in.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Fix some spelling errors in the commit msg
- Remove blank line between tps68470_gpio_driver decleration and
  module_platform_driver(tps68470_gpio_driver)
---
 drivers/gpio/Kconfig         | 6 +-----
 drivers/gpio/gpio-tps68470.c | 5 ++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 60d9374c72c0..3ac5860e0aeb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1393,7 +1393,7 @@ config GPIO_TPS65912
 	  This driver supports TPS65912 GPIO chip.
 
 config GPIO_TPS68470
-	bool "TPS68470 GPIO"
+	tristate "TPS68470 GPIO"
 	depends on INTEL_SKL_INT3472
 	help
 	  Select this option to enable GPIO driver for the TPS68470
@@ -1403,10 +1403,6 @@ config GPIO_TPS68470
 	  input or output as appropriate, the sensor related GPIOs
 	  are "output only" GPIOs.
 
-	  This driver config is bool, as the GPIO functionality
-	  of the TPS68470 must be available before dependent
-	  drivers are loaded.
-
 config GPIO_TQMX86
 	tristate "TQ-Systems QTMX86 GPIO"
 	depends on MFD_TQMX86 || COMPILE_TEST
diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index 423b7bc30ae8..aaddcabe9b35 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -154,5 +154,8 @@ static struct platform_driver tps68470_gpio_driver = {
 	},
 	.probe = tps68470_gpio_probe,
 };
+module_platform_driver(tps68470_gpio_driver);
 
-builtin_platform_driver(tps68470_gpio_driver)
+MODULE_ALIAS("platform:tps68470-gpio");
+MODULE_DESCRIPTION("GPIO driver for TPS68470 PMIC");
+MODULE_LICENSE("GPL v2");
-- 
2.33.1

