Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F757EC249
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbfKALuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:50:08 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38159 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKALuI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:50:08 -0400
Received: by mail-lf1-f68.google.com with SMTP id q28so7049622lfa.5;
        Fri, 01 Nov 2019 04:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xIvChrDm8pc/4fCjdw5Y6dd8M5WCjju9FF9KgJVWuEk=;
        b=Ii2UY6F6vOB0yMntY1LC12GFix+XjnBuhdYyMfeUrdUY7XPLOPbOeWkMyAZeJCX9by
         79/UyhA4oZXSyJUTGIVE1kzzUAjtyosk5ugB521lIk95I8ZPq2jeN+tXFedeQFlY1GgJ
         7uRZcBNiaXm97ASoBwu3RloOEWHVYctTiKSBjoyH803LpwaqROTQIc2NYyIO+/Xrd5nf
         Bl+I4ZtXr/dz1DgcfKINYOV9WwAydGl/ZdDQ/5a76kEegAYo9tLXWxQijfSZ4RIFuDiB
         OJ/+FyYbEW2VvB20Mg7l3OQAXR7sJPtSrRk1AztHwIHhlh2+9FqLI8HpmA7HHByLycQv
         9L6g==
X-Gm-Message-State: APjAAAW1kod6mxIephRvfvi4pZbdnQ3jTbGSEizFJiNrWtiJXGTnPybl
        YbGiTpyBX1C0ojImRc/QvLg=
X-Google-Smtp-Source: APXvYqwyVQLhs4JtkxGmdWTCtQZaL4WU+3TQPxnhpTidiTjGp0Lgni8MqXhOUYbKffg3CylhF48ntw==
X-Received: by 2002:a19:9202:: with SMTP id u2mr6993855lfd.1.1572609005965;
        Fri, 01 Nov 2019 04:50:05 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id b28sm3030293ljp.9.2019.11.01.04.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:50:05 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:49:53 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v3 14/15] gpio: Add definition for GPIO direction
Message-ID: <f08d265c12ebf185c0e1dbbfe0a3f86de4907194.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

At least for me it is difficult to remember the meaning of GPIO
direction values. Define GPIO_IN and GPIO_OUT so that occasional
GPIO contributors would not need to always check the meaning of
hard coded values 1 and 0.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes since v2 - new patch

 include/linux/gpio/driver.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5dd9c982e2cb..e83d3f519507 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -22,6 +22,9 @@ enum gpio_lookup_flags;
 
 struct gpio_chip;
 
+#define GPIO_IN		1
+#define GPIO_OUT	0
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
