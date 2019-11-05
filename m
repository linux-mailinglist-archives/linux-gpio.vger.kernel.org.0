Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDDD1EFB15
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388224AbfKEK1W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:27:22 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46433 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388203AbfKEK1W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:27:22 -0500
Received: by mail-lj1-f195.google.com with SMTP id e9so7870166ljp.13;
        Tue, 05 Nov 2019 02:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j8Gc1QGqLuiDX4KtEcNe9mp0sStq7EkK4+n12XZ5wIk=;
        b=BAb+kI5DNNL2nCXF9L7Bj+3pECA62p321FvOnGnuamK9f8l/h7sbWwm3F92aWpf/OO
         j3vsnLr9L4mTwqygw3ELKutK2r8WksLB59zpQLcnm0cSUpPYiagNkOZssYn0P32NW0LS
         7EamiCcTSBv2Gv+7J1uTu1Iqcc2IblTiM50wgJ37w2pSaSOAigWbA+m27wMrlUEQ1fmB
         euVFU1nfMkw9IiyVVl8ANrR/zLTDlMBkfxA8e8ogZ18C9sfKGXEsoV5MmU1aK/AhdApl
         YcRemBw0jwMd7IjEoxzyVhPg575dRMt59ippQLcNCVyHuW/6f73AyQ61eroT2vaIsX3w
         U0ow==
X-Gm-Message-State: APjAAAXD1PSlCxRHPcd6lzH2kdsAUP07lJVAmLA7ATxai8h41e0oQB2P
        XW+DsduWvV9BbrLG/kiyAf/rsMaVskE=
X-Google-Smtp-Source: APXvYqw1lQ5JZxU599cpBWBgKP8Dn7Q55c1wIza4ZY3KUM6AnCaTrx0vKDQ9wbI0SmmR9S5PUqdDkA==
X-Received: by 2002:a2e:2e03:: with SMTP id u3mr5731752lju.115.1572949639908;
        Tue, 05 Nov 2019 02:27:19 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 81sm9139854lje.70.2019.11.05.02.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:27:19 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:27:10 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 32/62] gpio: gpio-pisosr: Use new GPIO_LINE_DIRECTION
Message-ID: <326a9336a621d0434adc54f4742c8bf5cc7055a9.1572945867.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945867.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945867.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-pisosr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index f809a5a8e9eb..1331b2a94679 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -65,7 +65,7 @@ static int pisosr_gpio_get_direction(struct gpio_chip *chip,
 				     unsigned offset)
 {
 	/* This device always input */
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int pisosr_gpio_direction_input(struct gpio_chip *chip,
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
