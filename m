Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB2DEFA7F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387832AbfKEKJs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:09:48 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43984 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbfKEKJs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:09:48 -0500
Received: by mail-lf1-f68.google.com with SMTP id j5so14639698lfh.10;
        Tue, 05 Nov 2019 02:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JQPRcLd0uLcAKTHYVKqDK6+ILBFDwguU7fA6hw9exs8=;
        b=rEV5jyF9h5MMUoYTvRHU7WdZDekLwgKT8eM/26vluETBp7sa7e9QP7A7WIrGiohLfg
         gtKSNziNOkptvjdyLfgYiVr/AT/3Yhq/J6rTSHobcaCF1QsbNCZ5meZQWNUVNseS4GVi
         G7uP3Ur36obQ12VBAVJErbGgMU/P7kL28k1b4+0DJ+235YvEBfnKIgc5NI4gmhOGqIuD
         qv7iBF37NAoTRny+4D/RGb9Pl+I6Jx+zQayxeVyTEUXV7BDBJxTSX/DXERfEoiGOqphE
         NkFJOvDYT9AwI0hH2cWfbKHAC4BklJ//8yi9SCB/GVO/UZj6MFUa0tfTjVw88gq0SmGq
         oYaA==
X-Gm-Message-State: APjAAAXwwKbzSiLX3lygmcyeiiEiQRJIQULAAqYtoQLyFYtWl5N1uDQL
        QPOFDzsZJymmfwYZk/XHd/4=
X-Google-Smtp-Source: APXvYqwVRS9dXhY7PSoPAV3rw7Cc+GQeNcjZmQL9PrdG6tzUTnIxEDp1F2iLtggAxtQtYAmz5IT4yA==
X-Received: by 2002:a19:7511:: with SMTP id y17mr20686258lfe.19.1572948586144;
        Tue, 05 Nov 2019 02:09:46 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id d16sm9121052ljh.74.2019.11.05.02.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:09:45 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:09:37 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/62] gpio: Add definition for GPIO direction
Message-ID: <9e233d62cc282f3b03196d638f2188d9ab394b75.1572946026.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572946026.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572946026.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

At least for me it is difficult to remember the meaning of GPIO
direction values. Define GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT so that occasional GPIO contributors would
not need to always check the meaning of hard coded values 1 and 0.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 include/linux/gpio/driver.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5dd9c982e2cb..cc9ade4552d9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -22,6 +22,9 @@ enum gpio_lookup_flags;
 
 struct gpio_chip;
 
+#define GPIO_LINE_DIRECTION_IN	1
+#define GPIO_LINE_DIRECTION_OUT	0
+
 /**
  * struct gpio_irq_chip - GPIO interrupt controller
  */
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
