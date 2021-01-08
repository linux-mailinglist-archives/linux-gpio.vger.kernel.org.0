Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F49E2EF36B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbhAHNrc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:47:32 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:34385 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbhAHNrc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 08:47:32 -0500
Received: by mail-lf1-f51.google.com with SMTP id o19so23069653lfo.1;
        Fri, 08 Jan 2021 05:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+x0U9gnubjMksUUz9hbmIwV7xJqnGYTXvOaJN2bErmc=;
        b=QG3ty2PCDxRtOR2mxkp/NGnoe26zPqsmA5kkWGedHeaGzmdTUrLbUdZtVVYcyqwCip
         gg6RV48Bl1X8XrMGsW0damjOVgLLLDmVMNfH49ttE5DoNRmFycKFar5/f9rLzsYS32sT
         tQOsbbwPnFLZN3f4alhPYP4GvgaW8/RiZkvpKEitSXNUTvI1sOSEc8lYdrqkVfRLGnel
         uaoe/MTg0mZzdTrCzf8jqFwxDEQAID0Ms5kzHeqMYprazA/GvcXqm2VAwPgickJ/vWEx
         KIZd7Docgb0OmlvGZA4S9cEKt53adx64m04ci70qiDxWOaWTSud49kdl094SQ+4b/+tO
         p4rQ==
X-Gm-Message-State: AOAM530ltY2jstDqqbSIlLZ24sd836/Xj1WDxgg0cwjqg+luRx7wdBWg
        BQmnntfpUvSRPcGcaIM08FQ=
X-Google-Smtp-Source: ABdhPJzmVghMpIe305ILIR0E7GrTBajPwttVkPIpoBA4YIcTQBEZ6Tl2OPTRdU85zO0Mb2fyzVU3rg==
X-Received: by 2002:a19:381c:: with SMTP id f28mr1593368lfa.339.1610113609383;
        Fri, 08 Jan 2021 05:46:49 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id j20sm2149802ljc.47.2021.01.08.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:46:48 -0800 (PST)
Date:   Fri, 8 Jan 2021 15:46:42 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH 15/15] MAINTAINERS: Add ROHM BD71815AGW
Message-ID: <8b2cbbb783607500af5bbc529e3b17411027f1ad.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainer entries for ROHM BD71815AGW drivers.
New regulator and GPIO drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 281de213ef47..eac1875ec788 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15102,18 +15102,21 @@ F:	Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
 F:	Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt
 F:	drivers/clk/clk-bd718x7.c
 F:	drivers/gpio/gpio-bd70528.c
+F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
 F:	drivers/mfd/rohm-bd70528.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/power/supply/bd70528-charger.c
 F:	drivers/regulator/bd70528-regulator.c
+F:	drivers/regulator/bd71815-regulator.c
 F:	drivers/regulator/bd71828-regulator.c
 F:	drivers/regulator/bd718x7-regulator.c
 F:	drivers/regulator/rohm-regulator.c
 F:	drivers/rtc/rtc-bd70528.c
 F:	drivers/watchdog/bd70528_wdt.c
 F:	include/linux/mfd/rohm-bd70528.h
+F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
 F:	include/linux/mfd/rohm-generic.h
-- 
2.25.4


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
