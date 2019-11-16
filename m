Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F09FF51E
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2019 20:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbfKPTAc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Nov 2019 14:00:32 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45910 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfKPTAc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Nov 2019 14:00:32 -0500
Received: by mail-lj1-f195.google.com with SMTP id n21so14200976ljg.12;
        Sat, 16 Nov 2019 11:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RVKdKnG5iMjHQu+/M/QLPFA/qXZ5FAYTgqHPWRNz/Jo=;
        b=RO3xjlchEvWtSek6P9Y5eKXuZxahe47/g/SWnmVLyTAbwkucqNLXx6p7P/cfnmqoKD
         olZVcdwPu70uiqpMToGV8A6sDVNKpfvKqUnr8/A9wmpxGyTRAIyYMCvwCPdeGb5GaG7G
         RsdnqLhZyQG43K2NNOxZLvfffROjM8zHYBlOPgiEX6xKFk6Gzd+QrLLFZJBGp+57qxbF
         lGlSe0/agRzlp3aWwTv8cg33AoW8znVOMC7FZJ+TYGrBBLs4iYjHa6piOPFonw0sTFP9
         WG+9KVXRvIx/tsiXuZtjRwAHPrtwTFbw/Utf6eprpZaRHFRgB4tXPoN5vNXyqM2xZJ9f
         ZXxA==
X-Gm-Message-State: APjAAAUSUatF4hQc7XlVvAU0sRTMXTMkN6GXoksqOyWOP9204U2Ea+hh
        xW1Pc9ln0TEr6fJrou7VBWo=
X-Google-Smtp-Source: APXvYqwbXAPiceY0F0PHx9M7MOUkiBPXnz1pYImV+kCsayFXlrr9gmJ7n0Z1OE1UvM2LT0WkYT8/Uw==
X-Received: by 2002:a2e:98c1:: with SMTP id s1mr16177721ljj.215.1573930829224;
        Sat, 16 Nov 2019 11:00:29 -0800 (PST)
Received: from localhost.localdomain (dyttqz39y2bkc1ryvyh3t-4.rev.dnainternet.fi. [2001:14bb:420:da5f:a0b0:502a:b811:1af])
        by smtp.gmail.com with ESMTPSA id n19sm6215390lfl.85.2019.11.16.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 11:00:28 -0800 (PST)
Date:   Sat, 16 Nov 2019 21:00:20 +0200
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
Subject: [PATCH v4 11/16] docs: driver-model: Add missing managed GPIO array
 get functions
Message-ID: <b6e5a44339b297815a6ed9c1d0c0967b475cd2e9.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
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
