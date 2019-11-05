Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BFDEFADE
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730699AbfKEKWM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:22:12 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39990 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730633AbfKEKWM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:22:12 -0500
Received: by mail-lf1-f65.google.com with SMTP id f4so14676478lfk.7;
        Tue, 05 Nov 2019 02:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9L58EzSLKcE9GwGbak6npuCDvAm3eZwiaRLQzP4rKQQ=;
        b=JtXtX2SE3ok6jO/+qKEMvLToLZJVvHH7in+EBgEoo90KTuFQ1m4Ao1m7JLFdxvJ/TL
         mcysL9MIiXxyOMbhiZ9+Urv7sG5OFXxMqjdjbD0gnr43OXQLL6Z0WIUqvYp5c1tcL3wO
         0KHkPaHPrpwWpeHQtM+XCOIFClE0SkY82sSisxUsQqhMF0RmEmhzMJUkvF6U15fM4sE7
         hMRPlRqtSeimPIfr2ErZxE5T67RW66NnsOpbxeJQJwV89Oy533pVGrxy7c8kg4Py4aOQ
         EGCRTi0UfiNeMSiFVMcOAOCYG+Ii7g3jIu/DOeEF1A762jmBKnO9WKb8qwZdgh+ai7Jo
         mLkA==
X-Gm-Message-State: APjAAAXBSGHOTmnqcFbaDa4bS43gN1u65O+fo/voNTY5BZ1Nbv7q1u7h
        XyyFiPjMGjVPvLbWAhuaCOw=
X-Google-Smtp-Source: APXvYqz2ZgcNJ4MCoGF8keVV4rB112hF71Xe9R9O8z7TzTWd6Yo0BErmrgMLUFAHk9Twa8zkPhyYiw==
X-Received: by 2002:ac2:44af:: with SMTP id c15mr20247815lfm.39.1572949330293;
        Tue, 05 Nov 2019 02:22:10 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id u67sm11689034lja.78.2019.11.05.02.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:22:09 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:21:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 22/62] gpio: gpio-mmio: Use new GPIO_LINE_DIRECTION
Message-ID: <196d96a4cf8bee0189269e4df86965a0ec1a7daf.1572945799.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945799.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945799.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-mmio.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 6f904c874678..cd07c948649f 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -370,15 +370,24 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
 	/* Return 0 if output, 1 if input */
-	if (gc->bgpio_dir_unreadable)
-		return !(gc->bgpio_dir & bgpio_line2mask(gc, gpio));
-	if (gc->reg_dir_out)
-		return !(gc->read_reg(gc->reg_dir_out) & bgpio_line2mask(gc, gpio));
+	if (gc->bgpio_dir_unreadable) {
+		if (gc->bgpio_dir & bgpio_line2mask(gc, gpio))
+			return GPIO_LINE_DIRECTION_OUT;
+		return GPIO_LINE_DIRECTION_IN;
+	}
+
+	if (gc->reg_dir_out) {
+		if (gc->read_reg(gc->reg_dir_out) & bgpio_line2mask(gc, gpio))
+			return GPIO_LINE_DIRECTION_OUT;
+		return GPIO_LINE_DIRECTION_IN;
+	}
+
 	if (gc->reg_dir_in)
-		return !!(gc->read_reg(gc->reg_dir_in) & bgpio_line2mask(gc, gpio));
+		if (!(gc->read_reg(gc->reg_dir_in) & bgpio_line2mask(gc, gpio)))
+			return GPIO_LINE_DIRECTION_OUT;
 
 	/* This should not happen */
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
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
