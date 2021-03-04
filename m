Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1CE32CD71
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 08:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236109AbhCDHQN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 02:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236069AbhCDHPt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 02:15:49 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725C0C061574;
        Wed,  3 Mar 2021 23:15:09 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v15so26439077wrx.4;
        Wed, 03 Mar 2021 23:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbi0/zSDfqpExL2iKeV4Ictngk3yYjpQUCXbloIk4xo=;
        b=fSpjjTt/iu/Ri4/cKsxdvwBpwnRGAeGri7/qOnLAtplTSj+eecKDNhslZ/ykv9U1if
         fKiKQ9HTY07emeSo5YCC01W/1uIBzmVTtbJdEmFVC2Y0NJMSrbtlVuPw/j9TsHjDluVl
         73P7fGJZzQJqxcbpTdxYrtuBn7ULN9sFWQrwwqDKLXtyVYWVYlwZclHrcY5hwkgzwQX5
         Jnrc5Odrei6rFlA+id75Az8l8pl8SHjGIYZ8ujdmbq2ngJGa+bG3sXxcnYKCreVU4Vkf
         s61ADz0OXdKa8YgMGncU+KF6lnkJ/J4d97pWUH5CpYEacNEQ3RB8s3mOphon5E1oukfG
         Ytmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbi0/zSDfqpExL2iKeV4Ictngk3yYjpQUCXbloIk4xo=;
        b=POT9lPbcOpOWkWPsYiDHEUYdd11tJUObAn8rYqhUyzzUvVyV4eSiyaKSsApHdlkrZS
         uGgF65298/pExHXR0WOt88C3ChPpW0WjxeN6a1tBD2QElPdrJIoP0MYq6Cvt50XC0jFl
         PY9u1KTNmb3w++HBU/UrQNyZITLqimJFthfWBb7mgnX4EouES2a1A542g0PauDZ7KyFx
         0ereHTa31YBXmXEg5wskTM1ghV01CDrG6fSdTH4fepcj5evABpvpmLcmsXIHRQuGAgiX
         x5kbj2oI+G7PSXzEZPEDtNNo1HkMA4Tr1Zqo/y5LJ7yAx8MG6jogkNjG4u7I4Hvv2wXc
         asZQ==
X-Gm-Message-State: AOAM5308aErv1uJqMAWxrlwKCJ9ZdSboI8i75LIokzvPlBXINuNSN2KX
        pnvTpQdS1o6OxdqcnSgKVaw=
X-Google-Smtp-Source: ABdhPJzmV9E65gMgd8RZlLZp+UWQkn23JklLuKsjRWcbnOsWdQ+WBGcQXake7HsM9cdc+Rs9PPPBMg==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr2301582wrs.317.1614842108190;
        Wed, 03 Mar 2021 23:15:08 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id w18sm8800031wrr.7.2021.03.03.23.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 23:15:07 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2] gpio: regmap: set gpio_chip of_node
Date:   Thu,  4 Mar 2021 08:15:06 +0100
Message-Id: <20210304071506.18434-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is needed for properly registering gpio regmap as a child of a regmap
pin controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 v2: split this patch from the bcm63xx-pinctrl series

 drivers/gpio/gpio-regmap.c  | 1 +
 include/linux/gpio/regmap.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index fed1e269c42a..8898ab3e1d59 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
+	chip->of_node = config->of_node ?: dev_of_node(config->parent);
 	chip->base = -1;
 	chip->ngpio = config->ngpio;
 	chip->names = config->names;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index ad76f3d0a6ba..566d76d0dbae 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -4,6 +4,7 @@
 #define _LINUX_GPIO_REGMAP_H
 
 struct device;
+struct device_node;
 struct gpio_regmap;
 struct irq_domain;
 struct regmap;
@@ -15,6 +16,7 @@ struct regmap;
  * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
  * @parent:		The parent device
  * @regmap:		The regmap used to access the registers
+ * @of_node:		(Optional) The device node
  *			given, the name of the device is used
  * @label:		(Optional) Descriptive name for GPIO controller.
  *			If not given, the name of the device is used.
@@ -57,6 +59,7 @@ struct regmap;
 struct gpio_regmap_config {
 	struct device *parent;
 	struct regmap *regmap;
+	struct device_node *of_node;
 
 	const char *label;
 	int ngpio;
-- 
2.20.1

