Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 179A3142718
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 10:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgATJWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 04:22:07 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34904 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgATJWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 04:22:07 -0500
Received: by mail-lj1-f195.google.com with SMTP id j1so33020755lja.2;
        Mon, 20 Jan 2020 01:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5QNVtAV9LaUH05D29OP9f7feVsXbDJBH0BokQEGeup4=;
        b=t60JVTyOZzFzeG+t3trU/QAN7yFrEZeQsUbo1kGGfnovaRRiPyzPw+dDuv6xx5BxxQ
         w1sxTC0oiCo9LM2fdprgCP/DG0gnNrFdpDhpC1zGwJlvXaYhmAsMiJsXqdP17OInIUCA
         0vAH63VWXtPvyd8GgdKypfP76SyKAE7SsV9A5E87OrPAH0jwMLzFHf8TZlkdVL13ckeC
         iBf6qlY36VyU/inI7wx2ZYupnNzCNcVq4F+nVrd7Io6PmnVGwMT+rI9jGxUiV8qxhyGo
         iblzaHeacBZTiJHlsWwtoAkT+m6qzSPT330atNvB8ANVAYwWoAU4hhsVQHl7k3cW+o3p
         rzOA==
X-Gm-Message-State: APjAAAWT1fPmsclUqod3iL6ItUgDGM4+noYk3Pg0uqrQmS9OarPipKym
        txp+bn0wT2GPT464d0Mz2jo=
X-Google-Smtp-Source: APXvYqzZrImG4w7dSD6Ts2Pz2OrkRSy9Df8jJq2qJSfOwYXgHA1ytm6kJdHuPWz6JJbI8W/ij8K5Yg==
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr13149472ljj.77.1579512124272;
        Mon, 20 Jan 2020 01:22:04 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id u23sm3593470lfg.89.2020.01.20.01.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 01:22:03 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:21:51 +0200
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
Subject: [PATCH v12 09/10] mfd: bd70528: Fix hour register mask
Message-ID: <e9925290a4f78a9729a74c6abbf9e8fd16632ce8.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
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
