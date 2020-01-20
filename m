Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4634014239C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 07:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgATGkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 01:40:16 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41321 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgATGkP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 01:40:15 -0500
Received: by mail-lj1-f196.google.com with SMTP id h23so32581043ljc.8;
        Sun, 19 Jan 2020 22:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ti2mw/YL/6hGaTuHkBNAjoJ6DZuX9vUnGvzlaHyxER0=;
        b=AhljdnI9DUVmEnRRziU+dfdjd5D8+0PyhIimz3agvyLN6vjtfkBLg6Am6TGjpUIiz8
         rrebFynJG0hHFzxuQ7cpYBB5KmJduoxVD8u3qCJwM0YCNyXDNCVS6Vzy2LFiHAhlj06x
         o3dzo3G+z3yWEY8S25M68kvD8n/TQ1f7FkO40uukJ/nB0g98eFo2sWHimRY8ouezLcqI
         dgaFoJ50gYlhzwkXGsNQ6pTRjrFIGutRd88kEuZ3iV/JGHDiyma8wH9DFma1Hxbe3waL
         hYy4hPwMyGKAlIr1GFMbPrZs7YUkYG1C87veTAMU66UggEqJc7NmaCAFCU9QgtqBmGVY
         XHmg==
X-Gm-Message-State: APjAAAUtMTkELUCv9kBdEHdXH8Nuzi21UNpknzAzS2NZF1Jjf+WJB/Er
        +uL1poqanNV3PJtGeUvuB0U=
X-Google-Smtp-Source: APXvYqw020kK5mtjfTjdWee9gOV86bUZSOMv9XvQjnMy2HUyiAYNUgjIr+x0F4mLlx2K/chHyPvdOg==
X-Received: by 2002:a2e:9243:: with SMTP id v3mr12855882ljg.73.1579502412764;
        Sun, 19 Jan 2020 22:40:12 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id n3sm16175245lfk.61.2020.01.19.22.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2020 22:40:12 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:40:00 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v11 09/13] mfd: bd70528: Fix hour register mask
Message-ID: <eb5641dbaca97347d5cad1585bf031db1480c0c4.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When RTC is used in 24H mode (and it is by this driver) the maximum
hour value is 24 in BCD. This occupies bits [5:0] - which means
correct mask for HOUR register is 0x3f not 0x1f. Fix the mask

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
No changes since v10

 include/linux/mfd/rohm-bd70528.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
index 2ad2320d0a96..edae6f7afd8e 100644
--- a/include/linux/mfd/rohm-bd70528.h
+++ b/include/linux/mfd/rohm-bd70528.h
@@ -311,7 +311,7 @@ enum {
 #define BD70528_MASK_RTC_MINUTE		0x7f
 #define BD70528_MASK_RTC_HOUR_24H	0x80
 #define BD70528_MASK_RTC_HOUR_PM	0x20
-#define BD70528_MASK_RTC_HOUR		0x1f
+#define BD70528_MASK_RTC_HOUR		0x3f
 #define BD70528_MASK_RTC_DAY		0x3f
 #define BD70528_MASK_RTC_WEEK		0x07
 #define BD70528_MASK_RTC_MONTH		0x1f
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
