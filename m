Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E402EFA82
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbfKEKKq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:10:46 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35487 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730592AbfKEKKq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:10:46 -0500
Received: by mail-lf1-f67.google.com with SMTP id y6so14666966lfj.2;
        Tue, 05 Nov 2019 02:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tYcvmXdTKIR56XZdrFUaee7Q29xSvNddYBeYaP1WTqc=;
        b=rSLq1fD6aPla7r9Q6ZkMu03u0grdzBo65r3gi7oQaEO+XPtLOD8bmgKnZqlp29ly0x
         +QLFD6PqpdyRFQG4eOUU+bMB6Yx13FE/wuJWz0i75si2R6Vf4BKaV4sfDXzwD098p5+/
         0ZlTPrCOUGVzBwF+SkQoForuH7vyFNheV0+FJYeAVBefQne0ZZL3drDZVXNu3e4FlBaS
         JdMo3PhbobODZtLWHYd5KAdBXTE4Fxh9Wu6BkQ8kes3y3MWOddcu/c/wAhmfEHoNU3jz
         kPzo08vbK4SvwsZGL3Z+EpgU0cDF/b3XrKdo2i9zY/GfqVKYyIG0xZvRxv2Wys2PjIu7
         f+uw==
X-Gm-Message-State: APjAAAVVb+zqCeSRawnkPwlzXL0tNNKcgovKQE1OgXuNJ3RP/7CKRQOp
        uaAlprpUGhglVhNo6gShV+YMQmm/rJU=
X-Google-Smtp-Source: APXvYqx8eWkucIY2a7Rx0Ik95uOWHS158qzsq/qPPiscfFNDD/7WOTCvJfZv2sWHB2RIEU9EZjHFtg==
X-Received: by 2002:a19:820e:: with SMTP id e14mr19981164lfd.29.1572948644385;
        Tue, 05 Nov 2019 02:10:44 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id f3sm2721959lfp.0.2019.11.05.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:10:43 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:10:34 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/62] gpio: add gpio-104-idi-48: Use new GPIO_LINE_DIRECTION
Message-ID: <fa9b3cf2daeccfd6f3e56ca071d7ed78d577c441.1572945624.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945624.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945624.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-104-idi-48.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index ff53887bdaa8..73bedc2b6bdb 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -53,7 +53,7 @@ struct idi_48_gpio {
 
 static int idi_48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int idi_48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
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
