Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E552FB31B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbhASHgE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:36:04 -0500
Received: from mail-lj1-f172.google.com ([209.85.208.172]:42705 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729933AbhASHf0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:35:26 -0500
Received: by mail-lj1-f172.google.com with SMTP id j3so1081709ljb.9;
        Mon, 18 Jan 2021 23:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JWct8qE+bKVPZn4IYemDTwe9mInVpy5N2dPAxAeMJwQ=;
        b=MY3ONZmSBIhGIH7NATzyuZaOIvnrp50JUI97G/MlrasQBNPjihqFCIU5u0vj2ZEcHF
         1geL4i/Y+UjQGjcowQLjlDPd4hMX7gw3qOOeXSLDwzy/BYYFFWvA/AkrforzccsJhoqf
         LPTMT/1hVI+SlCLS2V5eivvVg9As8EwZfOudrosipiVF8TkCo5nNsgpEkwNTzyq8WAS7
         yn8OSeVnPbK2pG+k12Dir1uaJCTCESEYKusgt+m66K5VyCrcYvJjC/q/l3gkYGbXKo7f
         SqNbAuqE/KyQf7ipBLuldpgelojMIWxYTCFxfajYzNUj7/QLaxqVH9IyrISDVJRpSZyg
         d2BA==
X-Gm-Message-State: AOAM533cNXCDfXZYbc5hbOGmEPDeNZ/c8Bf1Q6GzNyn1kKeLa4iY4tQH
        QKa1js2HkbMcYA6iWdz6bXk=
X-Google-Smtp-Source: ABdhPJyyCa+HRTKGc9NdQ4FubBo/7JTiz0Mf6OAebqCk7YLDC0lQfAswubNxFHEz1ajkTKnF/CIoDg==
X-Received: by 2002:a2e:b0d5:: with SMTP id g21mr1340916ljl.372.1611041683990;
        Mon, 18 Jan 2021 23:34:43 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id 70sm2185331lfb.165.2021.01.18.23.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:34:43 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:34:34 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 17/17] MAINTAINERS: Add ROHM BD71815AGW
Message-ID: <9a704314c68f8fa1d0b0a297efc7f59c9c45437c.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
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
index cc1e6a5ee6e6..248e8023f31a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15332,18 +15332,21 @@ F:	Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
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
