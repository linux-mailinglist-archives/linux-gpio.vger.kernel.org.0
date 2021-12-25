Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27F447F32A
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Dec 2021 13:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhLYMAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 07:00:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31914 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229827AbhLYMAp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Dec 2021 07:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640433645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ncLZ10RziAYxRYvsypSZ1WLJ4bmcu28FExAIvhN+O2w=;
        b=Bzl/4TIkkQtjDwn6rdZVW9vci6zrQG85GoGb7LXphoR50uhhyftdO7UkU6OmR41sKVAzxH
        R7HmHMyNjVsjKUCm1iTSG/8tuESviU6gizMgy7404YK9Orrs7lq13xRP/2kxgE0/pzTCi9
        AL0wnwwY+IavzA1UymEl4hKc/P9Acd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-Y74cXq0rNiiLhC4ccmAyQg-1; Sat, 25 Dec 2021 07:00:43 -0500
X-MC-Unique: Y74cXq0rNiiLhC4ccmAyQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 310B318460E6;
        Sat, 25 Dec 2021 12:00:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 378FB9AA2C;
        Sat, 25 Dec 2021 12:00:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] gpio: tps68470: Allow building as module
Date:   Sat, 25 Dec 2021 13:00:25 +0100
Message-Id: <20211225120026.95268-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
itself gets instantiated by a special MFD driver from
drivers/platform/x86/intel/int3472/tps68470.c

This MFD driver itself can be build as a module, so it makes no sense to
force the gpio-tps68470 driver to always be builtin.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/Kconfig         | 6 +-----
 drivers/gpio/gpio-tps68470.c | 6 +++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

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
index 423b7bc30ae8..ce12c5a54fd4 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -155,4 +155,8 @@ static struct platform_driver tps68470_gpio_driver = {
 	.probe = tps68470_gpio_probe,
 };
 
-builtin_platform_driver(tps68470_gpio_driver)
+module_platform_driver(tps68470_gpio_driver);
+
+MODULE_ALIAS("platform:tps68470-gpio");
+MODULE_DESCRIPTION("GPIO driver for TPS68470 PMIC");
+MODULE_LICENSE("GPL v2");
-- 
2.33.1

