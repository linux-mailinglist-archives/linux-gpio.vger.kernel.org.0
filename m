Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3405DE19E5
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 14:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405278AbfJWMWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 08:22:05 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36302 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfJWMWF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 08:22:05 -0400
Received: by mail-lf1-f67.google.com with SMTP id u16so15915478lfq.3;
        Wed, 23 Oct 2019 05:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=xkXwREeBStAj9upykTUmZ3LVJRMdaPsgaMN2GgOTWoU=;
        b=Aq93TynFyD7BNc6JK918UXM5nETc77RaS0a4HknTzslS09BpYlfNHH3OHh37xOSZFZ
         54ar6Wsftobeib4B9nCKsCkWjgtUE3nplnwPFZWOEse4YFsm45xYQPzuzUekD/yHEyKa
         jkrE99+Q+HSjUjAiVDBX7jrpxrrpwCOCDI8WnPUjNDsJh1sV+C5tQy0rStGstuB7PuDx
         RLvcg2Xmkmu5WIXstrB6mT5PtLEDjeJ40+WrEk/5KLuJp8f9CmFK0yRj/fc+t85LToOl
         1zWtnPZYtj5u/Yq/rBRSD2e5xYIcxK94u3bb/I4vIdxVZY/4VOiFonPNO2SuYpgGG2q+
         mVpA==
X-Gm-Message-State: APjAAAXpo2R4q40/yRexg9TU/xYiwck4l9QPvx8tf8a3PMy1z/hOePfG
        95plpzKhpKkJ3pvmXruNKUE=
X-Google-Smtp-Source: APXvYqwM3bQU5wHBNEVk5BRziUfB39YFyB5gjHz3Riyjo7ybB6x2Y/GeZghncf9QAcn7kt/vNPQKfA==
X-Received: by 2002:a19:ee05:: with SMTP id g5mr10547186lfb.70.1571833323119;
        Wed, 23 Oct 2019 05:22:03 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id b10sm9381660lji.48.2019.10.23.05.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 05:22:02 -0700 (PDT)
Date:   Wed, 23 Oct 2019 15:21:50 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: bd70528: Add MODULE ALIAS to autoload module
Message-ID: <20191023122150.GA2524@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bd70528 GPIO driver is probed by MFD driver. Add MODULE_ALIAS
in order to allow udev to load the module when MFD sub-device cell
for GPIO is added.

Fixes: 18bc64b3aebfa ("gpio: Initial support for ROHM bd70528 GPIO block")
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
I'm not really sure if this is a bug-fix or feature but I guess the
Fixes tag won't harm, right?

 drivers/gpio/gpio-bd70528.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
index fd85605d2dab..8123260a92a2 100644
--- a/drivers/gpio/gpio-bd70528.c
+++ b/drivers/gpio/gpio-bd70528.c
@@ -230,3 +230,4 @@ module_platform_driver(bd70528_gpio);
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_DESCRIPTION("BD70528 voltage regulator driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:bd70528-gpio");
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
