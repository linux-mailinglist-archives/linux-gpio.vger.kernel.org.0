Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2F91FEC89
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 09:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgFRHdp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 03:33:45 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:47028 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgFRHdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 03:33:44 -0400
Received: by mail-lf1-f65.google.com with SMTP id m26so2848295lfo.13;
        Thu, 18 Jun 2020 00:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=V2LuQUDFIIF5jl6wVGVy4hB7QYtw6Q/zQUKKaqApImE=;
        b=l7AhaIAlb31RPWcK/9tcQ8cCMaCr/3LP5PBkT5uoCdpwUGNXsYGHLxL4V6kjtlFius
         BegrRLPAGfK0LQqFWGIc6j3/lk4xbJ/hSiTlKHQzbCQ3uX+Og3+YdiQpVMj7yUoHm6ob
         05L6JFD9YMCv7k2G7WUBZ3T6aDDSwL1nbPitw3U8Qu9ff3fQZv69b/XFBzNZPUGtBkfD
         c7ERRjAioiCDwkX0xiWAUZ81dCkVkJchWHTbPAgjiigx5Qjqh8AXme+0i1BVQzP8Coep
         pYS6ij0tOC9yYH9EK+QLm9gcO5LjaypngiAid4BG4+Cq5i47t7x2YVVrDDywJI/Vf/gF
         CL4Q==
X-Gm-Message-State: AOAM530oghh3svvxFpJTtD1uVs01DzPJpq1+o2zNOcy79Hi+nTQnB3tB
        mDzGqnLj8gVIfBjdKVzzc1M=
X-Google-Smtp-Source: ABdhPJzhQPwQhZT7ChJeJQe7xVV2nqchjeSaUQ5xsLwlnbL7h83g4iEGu5DcJ3yDKPIb2+wZBqaZmw==
X-Received: by 2002:a19:8252:: with SMTP id e79mr1610797lfd.103.1592465621241;
        Thu, 18 Jun 2020 00:33:41 -0700 (PDT)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id u13sm453118ljo.75.2020.06.18.00.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 00:33:40 -0700 (PDT)
Date:   Thu, 18 Jun 2020 10:33:31 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Sebastian Reichel <sre@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-power@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: Add entry for ROHM power management ICs
Message-ID: <20200618073331.GA9403@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add entry for maintaining power management IC drivers for ROHM
BD71837, BD71847, BD71850, BD71828, BD71878, BD70528 and BD99954.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Sebastian Reichel <sre@kernel.org>
---
Morning Lee - could you take this in MFD? This is scattered all around
different subsystems anyways... I guess crafting bunch of patches to
each individual subsystems would just end up with lots of merge
conflicts.

Changes from v1:
- Dropped patch 2/2 (linear-ranges maintainer) which was already applied by Mark
- Added shiny new ROHM linux-power list so that I am no longer the lonely
  poor sod watching these at ROHM side :)
- sort few files to alphabethical order as checkpatch now nagged about
  that.

v1 was here:
https://lore.kernel.org/lkml/e11366fd280736844ae63791b6193bb84d6205bf.1589866138.git.matti.vaittinen@fi.rohmeurope.com/


 MAINTAINERS | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68f21d46614c..ce08617f63f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14704,6 +14704,13 @@ L:	linux-serial@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/tty/serial/rp2.*
 
+ROHM BD99954 CHARGER IC
+R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+L:	linux-power@fi.rohmeurope.com
+S:	Supported
+F:	drivers/power/supply/bd99954-charger.c
+F:	drivers/power/supply/bd99954-charger.h
+
 ROHM BH1750 AMBIENT LIGHT SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
@@ -14721,6 +14728,31 @@ F:	drivers/mfd/bd9571mwv.c
 F:	drivers/regulator/bd9571mwv-regulator.c
 F:	include/linux/mfd/bd9571mwv.h
 
+ROHM POWER MANAGEMENT IC DEVICE DRIVERS
+R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+L:	linux-power@fi.rohmeurope.com
+S:	Supported
+F:	Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
+F:	Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt
+F:	drivers/clk/clk-bd718x7.c
+F:	drivers/gpio/gpio-bd70528.c
+F:	drivers/gpio/gpio-bd71828.c
+F:	drivers/mfd/rohm-bd70528.c
+F:	drivers/mfd/rohm-bd71828.c
+F:	drivers/mfd/rohm-bd718x7.c
+F:	drivers/power/supply/bd70528-charger.c
+F:	drivers/regulator/bd70528-regulator.c
+F:	drivers/regulator/bd71828-regulator.c
+F:	drivers/regulator/bd718x7-regulator.c
+F:	drivers/regulator/rohm-regulator.c
+F:	drivers/rtc/rtc-bd70528.c
+F:	drivers/watchdog/bd70528_wdt.c
+F:	include/linux/mfd/rohm-bd70528.h
+F:	include/linux/mfd/rohm-bd71828.h
+F:	include/linux/mfd/rohm-bd718x7.h
+F:	include/linux/mfd/rohm-generic.h
+F:	include/linux/mfd/rohm-shared.h
+
 ROSE NETWORK LAYER
 M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org

base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
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
