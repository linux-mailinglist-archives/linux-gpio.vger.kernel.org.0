Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25BEB11AD7E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 15:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbfLKOci (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 09:32:38 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36744 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729791AbfLKOci (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 09:32:38 -0500
Received: by mail-lf1-f65.google.com with SMTP id n12so16880425lfe.3;
        Wed, 11 Dec 2019 06:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+LrjmXEDHAWD8D/nfsHsPfYpxxDVLV4SbgFUsF+OLNI=;
        b=B6AZYASLgmOqsETp85PWYQT/uXHDJ/DeF0ZEviUfZar35KhdFMu5ksr2DDESAW4WMZ
         3hplK7PAPqNFCs+/WybVSa4BBf59j23Qg6Od7W6gcWmfDAsJFsd6lmB4Ez3Ihatn01PK
         0Dsar4x35HDIEec2VsBCCpCJyU0iO1suF0dmxnJ8pJUBaD7DoqL15+6+jE6Pdfp2+nfx
         iZZbjzi8NUA4cdz0GgV4BMTEZTVSRuK8eWZkm7VynX9IA2WjlG3mVHiAlE15oxSYhH+j
         q/teh2anXJ9bVN70EsbEyF0+vq2RO4me5ArdTW0Xji5nzL9ULus8G+IENJIn/8btkCD+
         9udw==
X-Gm-Message-State: APjAAAUx1rkIwfYZM1JDB0xoNqfIG6shbb9J3hvFPNkyGqyZ9Ae0gig5
        CEPWAM/EIL2tdKk0NPYRvLg=
X-Google-Smtp-Source: APXvYqy5kCCWhoHVOcEeKgXhF2Tk8x/uttuI9860O6BB82DMhQIMic6BIeM3gASU97uiuy0efWDNXQ==
X-Received: by 2002:a19:dc1e:: with SMTP id t30mr2471646lfg.34.1576074756348;
        Wed, 11 Dec 2019 06:32:36 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id y11sm1474057lfc.27.2019.12.11.06.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 06:32:35 -0800 (PST)
Date:   Wed, 11 Dec 2019 16:32:24 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: pinctrl-intel: Use GPIO direction definitions
Message-ID: <b14ba01f6fcbaffbbfbfe1f257fd25691671c652.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use new GPIO_LINE_DIRECTION_IN and GPIO_LINE_DIRECTION_OUT when
returning GPIO direction to GPIO framework.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 4860bc9a4e48..821da94cfa6c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -944,7 +944,8 @@ static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (padcfg0 & PADCFG0_PMODE_MASK)
 		return -EINVAL;
 
-	return !!(padcfg0 & PADCFG0_GPIOTXDIS);
+	return padcfg0 & PADCFG0_GPIOTXDIS ? GPIO_LINE_DIRECTION_IN :
+					     GPIO_LINE_DIRECTION_OUT;
 }
 
 static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
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
