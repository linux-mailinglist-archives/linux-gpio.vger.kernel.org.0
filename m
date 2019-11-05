Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A2BEFB30
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388203AbfKEKan (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:30:43 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38537 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKEKan (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:30:43 -0500
Received: by mail-lf1-f65.google.com with SMTP id q28so14730065lfa.5;
        Tue, 05 Nov 2019 02:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6AIokuiWLl19H7BGT6dn1FK3ZSR8YHgDjLrqhF1x1T8=;
        b=Y9TiLLqVtxq/y2fQM6oLmuC4AGT429o91VzCeazalm6d2tUNznN2q2QzBHAGnlgK2N
         G4VWJxCASDN1Rm/xYu+8ZPNdLswSPBrW8TrX7Ogk2WckaDcSPGwXdlBftKItzrGv+5Z1
         3qBCrVmWk62i6bNKCB98ob7T1Fr2i5IeDtUWfDz/gv4uEjlpC3EzGE6wVo3Aqd8gJ9zV
         rrHlrymUGair/ma7lhLk0EICAC+Po6+UAwM2Uc27Noo8XeCTOry0cGf3MJsBBTZ+J5Vz
         oxJS/o6ZwmHcfp+reNNvyJIA7r4NwY8kNu12jFG3gYfjyfiXSDwNllEiUdLtEQ9KGXWV
         i1/g==
X-Gm-Message-State: APjAAAWqtmA+Q2mOmfkJSzbvsWHYFJ9FJpcwaH0ZT/aweUEvGVDc+r4D
        dfgLZZtFEHj6ozfXwpH3dpjtTbEjhDw=
X-Google-Smtp-Source: APXvYqyHus6Atd6yI85+wTvHCaIyxPeAIRpnB6esIsSkkFyhvYgaWSOw/cEXsep3Yn3OjTSbA3pjRg==
X-Received: by 2002:a19:6a0d:: with SMTP id u13mr11298714lfu.86.1572949841518;
        Tue, 05 Nov 2019 02:30:41 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id b17sm7086420lfo.16.2019.11.05.02.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:30:41 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:30:36 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 39/62] gpio: gpio-sch: Use new GPIO_LINE_DIRECTION
Message-ID: <65558b9677120e31a842796cea22581655ede706.1572945894.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945894.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945894.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-sch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index fb143f28c386..c65f35b68202 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -127,7 +127,10 @@ static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
-	return sch_gpio_reg_get(sch, gpio_num, GIO);
+	if (sch_gpio_reg_get(sch, gpio_num, GIO))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static const struct gpio_chip sch_gpio_chip = {
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
