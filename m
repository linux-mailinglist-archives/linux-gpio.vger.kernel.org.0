Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B57FFF13
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 07:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfKRG7Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 01:59:16 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33267 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfKRG7Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 01:59:16 -0500
Received: by mail-lf1-f65.google.com with SMTP id d6so12875480lfc.0;
        Sun, 17 Nov 2019 22:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RVKdKnG5iMjHQu+/M/QLPFA/qXZ5FAYTgqHPWRNz/Jo=;
        b=GyD7I2IoZCsLOwwSThc7+Ia5MdGie2xT9EUQqlmr94Ip6nS2Fbbeej7pQJ0mjgLMht
         AP33ZaAsAmKGAeM59O4KUSc/UMe7HlayEQyQRlk0OUZOXwvzSctZ+YmNff+4f6IFBuai
         ROcgwleIT9pHAg+anuQxwJpWHzH/Z5r53aqL/YFLEUuFXR9AGC/DJc/5hb37Esy8Eqv6
         bN/pPKsrKXjfXw55jHtrb9SwM+U75uOsvtWN4sRI6P9AW1Jkhlf1As41fJDt0NuHzOr1
         1ZLiCkKHBhdvjDQAI3QbzXvwH7KRQKBfXfqVcP7hmvFCPrvAAvhCNI2yb5O7SOTpDNvb
         EwoQ==
X-Gm-Message-State: APjAAAVV3uE0GXyJiRiH7xaPf+1rcg2OYPhEulmOlWZfOzmLlMihv53K
        dJV6ln0qVqc7KEXMlXsSCWQ=
X-Google-Smtp-Source: APXvYqwx7G9VcP+/z4cDuqMlpv8QELf5eGMZ7QPVskjmAQOk5ZM/OixXGXzNrVqeBtXE7ttYO2LX3A==
X-Received: by 2002:a19:c6d6:: with SMTP id w205mr17987978lff.17.1574060351964;
        Sun, 17 Nov 2019 22:59:11 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v203sm8427153lfa.25.2019.11.17.22.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 22:59:11 -0800 (PST)
Date:   Mon, 18 Nov 2019 08:59:00 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v5 11/16] docs: driver-model: Add missing managed GPIO array
 get functions
Message-ID: <b6e5a44339b297815a6ed9c1d0c0967b475cd2e9.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

devm_gpiod_get_array and devm_gpiod_get_array_optional were missing
from the list. Add them.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 Documentation/driver-api/driver-model/devres.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 1b8302ba405b..b60d0702412d 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -267,6 +267,8 @@ DRM
 
 GPIO
   devm_gpiod_get()
+  devm_gpiod_get_array()
+  devm_gpiod_get_array_optional()
   devm_gpiod_get_index()
   devm_gpiod_get_index_optional()
   devm_gpiod_get_optional()
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
