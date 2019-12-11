Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5692411A814
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbfLKJsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:48:08 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42943 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728265AbfLKJsI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:48:08 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so16116854lfl.9;
        Wed, 11 Dec 2019 01:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=19FDIcIh0eLCmoyfPMd3dDpgdXcHYQVwcwKhC99UDNQ=;
        b=NzJIQ06xjBtDQbn3b7ETuCtDjGMK1Yy+EzLX7TXO5TAgM1oRIG+fVa6/j5SUDbdnxI
         5it1tsKbcDiiGSDOWqZjC7VbWaWBGDzfnEPE0Fxg1hIH2XHWDck9EWnBBKRAMQFKmMn/
         Ugl2Qa93WkzvL+VbsnfaIU0y2qmhxz49pZl5J8rD9SicyBs+8V/870lRgBoPxaPPgrCN
         XtHzS4bNybf4OLKxT+bCZ7soLUOge77qpus+iRewce/45EIbWAWZTjb1hBqZCBvdNmZK
         UtMhaJ9kGvHOuUqx4LArZhfih0OnXajW7xPbwFugyS7QGBZyU7DS5x797yw2FRnDeQZh
         xE0Q==
X-Gm-Message-State: APjAAAV2FjPpVOh/7xlSvElX63BPIE9BwS036SGGUINYWpXBT3XaKlFv
        0H5izL6qzXc96NrZeK84DOo=
X-Google-Smtp-Source: APXvYqwsewrh0K1+H7ca5K2daM3BS/oqc4W967lmPx2AIGwdblv1rSMLf5R4fw8+yQUtw0Xa6miFRA==
X-Received: by 2002:a19:c697:: with SMTP id w145mr1534257lff.54.1576057684808;
        Wed, 11 Dec 2019 01:48:04 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id l8sm795614ljj.96.2019.12.11.01.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 01:48:04 -0800 (PST)
Date:   Wed, 11 Dec 2019 11:47:57 +0200
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
Subject: [PATCH v6 11/15] docs: driver-model: Add missing managed GPIO array
 get functions
Message-ID: <f56dce4fcb71592cbcf0fc48a841f86f52770d4c.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

devm_gpiod_get_array and devm_gpiod_get_array_optional were missing
from the list. Add them.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes sinnce v5

 Documentation/driver-api/driver-model/devres.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index f5d3594b29b8..e0813ef1f041 100644
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
