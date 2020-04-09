Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 162311A2D66
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 03:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgDIBlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 21:41:13 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:36643 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgDIBlN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2020 21:41:13 -0400
Received: by mail-il1-f195.google.com with SMTP id p13so8757872ilp.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2020 18:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UsuV1XC9F0zUSNLW/lcGod5OvR07l0XsNTDcgl+q3cU=;
        b=Txssr3a+IYMjEYumEe9phixDEvGEehJXijq/DurjwQzk9idcuRuuWSYehQN2WZ8Umf
         kI15JnDMMYCo4GPb7FzCDCB4l/Mwtelqw4aPdNTg7+sGUxqvuSxkhOdU7f9UNgm4kQyp
         uy8UITWyJxNNvfXTelPWkwt5IxihzSGoYSJH5DGfsKC0o4wzLOQkDIdrUjEvXRqqvIP9
         oyDS9QhnyY1Czz2lDROPrKXFj2FhnlG5OGE2d6inPcBXE788lhpSo6IIhnCA8HqNY7z5
         WFq3+aA+cwdKUgx6imhlX3weUmkpQjrAyEVxc6BdRzcxnHnr9AkoJ7JKgceNl+QS7qq9
         BgdA==
X-Gm-Message-State: AGi0PuajC7xLIH1ln3TgtekK3MVS6xGN5u0iTfSGjpPpzl6zHSgUlHdt
        iHah+U2gCrQbZCxFUWT1fw==
X-Google-Smtp-Source: APiQypINeHbzb+NYBIE8EG6FUqEg8T2imkw5bLeSjZTQarMw7AnVIG3U4B7YC6BT3jj9NYjkyM0XYQ==
X-Received: by 2002:a92:cb49:: with SMTP id f9mr10672046ilq.193.1586396472971;
        Wed, 08 Apr 2020 18:41:12 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id s26sm188222ioe.27.2020.04.08.18.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 18:41:12 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: pl061: Support building as module
Date:   Wed,  8 Apr 2020 19:41:10 -0600
Message-Id: <20200409014110.27254-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable building the PL061 GPIO driver as a module.

This does change the initcall level when built-in. This shouldn't be a
problem as any user should support deferred probe by now. A scan of DT
based platforms at least didn't reveal any users that would be a
problem.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpio/Kconfig      | 2 +-
 drivers/gpio/gpio-pl061.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b8013cf90064..f1ef878f615b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -422,7 +422,7 @@ config GPIO_OMAP
 	  Say yes here to enable GPIO support for TI OMAP SoCs.
 
 config GPIO_PL061
-	bool "PrimeCell PL061 GPIO support"
+	tristate "PrimeCell PL061 GPIO support"
 	depends on ARM_AMBA
 	select IRQ_DOMAIN
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 5df7782e348f..cf0d5e9b6f2c 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/module.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
 #include <linux/device.h>
@@ -413,6 +414,7 @@ static const struct amba_id pl061_ids[] = {
 	},
 	{ 0, 0 },
 };
+MODULE_DEVICE_TABLE(amba, pl061_ids);
 
 static struct amba_driver pl061_gpio_driver = {
 	.drv = {
@@ -424,9 +426,6 @@ static struct amba_driver pl061_gpio_driver = {
 	.id_table	= pl061_ids,
 	.probe		= pl061_probe,
 };
+module_amba_driver(pl061_gpio_driver);
 
-static int __init pl061_gpio_init(void)
-{
-	return amba_driver_register(&pl061_gpio_driver);
-}
-device_initcall(pl061_gpio_init);
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

