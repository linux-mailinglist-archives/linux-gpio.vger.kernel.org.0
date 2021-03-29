Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1BD34D0D6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 15:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhC2NBn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 09:01:43 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:34500 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhC2NBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 09:01:25 -0400
Received: by mail-lf1-f50.google.com with SMTP id i26so18250463lfl.1;
        Mon, 29 Mar 2021 06:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=egthqhzn5ZpLM0FjZqjc5wIxAZteYh+EG3fvKfyV1Xo=;
        b=fqdNo0jrNOKjK/JBcKWSZuirMuuOPQ4x9dvESe8QTn85IJxTSzHGDKoD4bqggFXeJN
         20s26mbZ5nVtdgV8dGCNinuN/lSJVxBZaNX+jTl0u2jspT3aXhF7jkUFPUScYeHnyjSY
         74nrVL4G8pr0HZjKO6dffiAdhp6YJ3n4m5q83zDyvJGOMf4/pF/WdgUnuiEEsyd+KCJA
         rjobmB1gCVcnqAhbQSoxwqosbfq9aZgX9AnC0gdzbl2tKwGtN2PvpZDDKjOBmgKUEftc
         TYx3/ljyO2xHj6YJ7UpVwvFlDeiShS5RYRtMODfPdd7573L+a8bmxsrXbifXxAiaFE6X
         ooTQ==
X-Gm-Message-State: AOAM533fFCmXlevapZAofZc7EeX7TxD5Oh9O6+PR6RnoV1CTTXIb9nzm
        1bCrHG15ioJIAHZ/W4giAmk=
X-Google-Smtp-Source: ABdhPJz/t/pzX0cY5Mt6X3cYJF2gO1TnhOQmbCB1RUE8aruUyLPGUXQ5PP5yS/WJgA6wlf8swZURAw==
X-Received: by 2002:a05:6512:1116:: with SMTP id l22mr16043625lfg.61.1617022883230;
        Mon, 29 Mar 2021 06:01:23 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id f11sm1917198lfm.230.2021.03.29.06.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 06:01:22 -0700 (PDT)
Date:   Mon, 29 Mar 2021 16:01:15 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
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
Subject: [PATCH v5 19/19] MAINTAINERS: Add ROHM BD71815AGW
Message-ID: <95272c5cf3919f725ce96f2cf3054fd2bdbeb06a.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainer entries for ROHM BD71815AGW drivers.
New regulator and GPIO drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changes since v3:
 - No changes
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e876927c60d..c251af6bfc03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15452,18 +15452,21 @@ F:	Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
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
