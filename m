Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E11FFEFAF1
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388224AbfKEKXk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:23:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43500 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388167AbfKEKXj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:23:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id y23so10246228ljh.10;
        Tue, 05 Nov 2019 02:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ppoAUF69jc850//5V8PML8lsgMuag5xwp3ksvqa8AOs=;
        b=i9dZbv0YyryUFJ6GWaNzYoQ9fuvAy+mKVopUzZSzQU6yyAu/VTJa2wuRYQhvQMeNr4
         6E9r23hAMwfKTPI4IzHllyY6VdUto6zPXL4BUIscytvyz5ibA1eU8hqzu4IaTtgOiGBC
         o2NUuzRh4dZqt4TQq57MMj8ocvc9jP4UKkcbp4OgpMXguVo69NBxN4neDRnW4adga3a7
         5k9xik5Ws9BraY0IUtgK+dX5CnutBjMQRJDeCfCC5vfOgG02ss1fPAqYSNkdPpAEAf6l
         Jxo5Qpovf+B9dv984BoxTZR7eFd8pMgxuEzpvPZkCc/2semZr1PAfbovhx7tYX6JSyz5
         sZeQ==
X-Gm-Message-State: APjAAAVIVJUmyz01vJdifWDPxOsOXtD7X3wEaG5QxHxeWNV+4NBCdlKf
        89d0JnKflVjBeZDT9d4MeyBSEvRW/xA=
X-Google-Smtp-Source: APXvYqzx/CIcT5sHxay54rlFG5oAjXyQYoexKeKby44uU1p7vbWAt0EIa+vP1MdCJ7tE1qsQ5rA23g==
X-Received: by 2002:a2e:2a05:: with SMTP id q5mr14462156ljq.170.1572949417465;
        Tue, 05 Nov 2019 02:23:37 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id r22sm2966317lji.71.2019.11.05.02.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:23:37 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:23:28 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 24/62] gpio: gpio-mockup: Use new GPIO_LINE_DIRECTION
Message-ID: <5decca7b37c6fa4171b7617aec64856d3c5c7c69.1572945811.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945811.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945811.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use GPIO_LINE_DIRECTION_IN and GPIO_LINE_DIRECTION_OUT instead of defining
own enums.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-mockup.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 213aedc97dc2..47c172b2f5ad 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -34,14 +34,9 @@
 
 #define gpio_mockup_err(...)	pr_err(GPIO_MOCKUP_NAME ": " __VA_ARGS__)
 
-enum {
-	GPIO_MOCKUP_DIR_IN = 0,
-	GPIO_MOCKUP_DIR_OUT = 1,
-};
-
 /*
  * struct gpio_pin_status - structure describing a GPIO status
- * @dir:       Configures direction of gpio as "in" or "out", 0=in, 1=out
+ * @dir:       Configures direction of gpio as "in" or "out"
  * @value:     Configures status of the gpio as 0(low) or 1(high)
  */
 struct gpio_mockup_line_status {
@@ -152,7 +147,7 @@ static int gpio_mockup_dirout(struct gpio_chip *gc,
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->lock);
-	chip->lines[offset].dir = GPIO_MOCKUP_DIR_OUT;
+	chip->lines[offset].dir = GPIO_LINE_DIRECTION_OUT;
 	__gpio_mockup_set(chip, offset, value);
 	mutex_unlock(&chip->lock);
 
@@ -164,7 +159,7 @@ static int gpio_mockup_dirin(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->lock);
-	chip->lines[offset].dir = GPIO_MOCKUP_DIR_IN;
+	chip->lines[offset].dir = GPIO_LINE_DIRECTION_IN;
 	mutex_unlock(&chip->lock);
 
 	return 0;
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
