Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9B3EFB94
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388148AbfKEKkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:40:43 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45777 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388098AbfKEKkn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:40:43 -0500
Received: by mail-lj1-f195.google.com with SMTP id n21so7597288ljg.12;
        Tue, 05 Nov 2019 02:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IHVLnZpvti7kYubzGuAOCqnl9G7u/7Mk5Hsa0dcUqxo=;
        b=Qj05WPsZkUWaDiG76jKMe0nwvzzOxMPIBoNUxmYwrAQfYA/sQ0XtD7MxucIFgf7Lgv
         f9ikR2bn/T1pfVYjI3WSKIGPm1+lbAXN7HoYHmM8dsGzpKUg9RXQHIKX/gTdSWW3ooQU
         DT/+6suvzcyi4BVmHGv+/orhgqjP5XlQS09xcTgttCVC4bMtXpBYkaITou1uiaxQ4uM5
         7/eL5yN/PNeWo5OIMFPPTnWWi+PsseUpdbnzAtYFfgzgKU53ptcAkVVaXdl1oUL8oB8F
         2J9n4iUsaCS7pzCkMNSupUPjgX8jgrKxw+i2o2eSF6h56aTlAm8lwArVOz3S/TTgdCw4
         Q16Q==
X-Gm-Message-State: APjAAAXPZREtsYPcJsI4Naqkz0xCaDSEhbT4eJPHPfo54nnonHb7G0ov
        4pRzsxuSMRD+WwHjywapEFI=
X-Google-Smtp-Source: APXvYqwimd8o/BHmE5NIoxB7Pal0yHYLbggrwuzo9Wj10a1ugIpMkJVn+AXIoXE/WqvLKNk0aYNS8g==
X-Received: by 2002:a2e:8654:: with SMTP id i20mr23048472ljj.238.1572950441184;
        Tue, 05 Nov 2019 02:40:41 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id i8sm10605111ljj.11.2019.11.05.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:40:40 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:40:35 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 60/62] gpio: gpio-zynq: Use new GPIO_LINE_DIRECTION
Message-ID: <e3a74a28d9c0831fe798909d95695dc978d43030.1572946015.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572946015.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572946015.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-zynq.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index cd475ff4bcad..4c3f6370eab4 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -360,7 +360,7 @@ static int zynq_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
  *
  * This function returns the direction of the specified GPIO.
  *
- * Return: 0 for output, 1 for input
+ * Return: GPIO_LINE_DIRECTION_OUT or GPIO_LINE_DIRECTION_IN
  */
 static int zynq_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
 {
@@ -372,7 +372,10 @@ static int zynq_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
 
 	reg = readl_relaxed(gpio->base_addr + ZYNQ_GPIO_DIRM_OFFSET(bank_num));
 
-	return !(reg & BIT(bank_pin_num));
+	if (reg & BIT(bank_pin_num))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 /**
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
