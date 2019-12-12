Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8870D11C5FB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 07:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbfLLGgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 01:36:06 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45067 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfLLGgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 01:36:06 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so761975lfa.12;
        Wed, 11 Dec 2019 22:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=52GRzE2LrbCdRaFMXkD1n/FkbMFyp9p/ZmIw21up4vE=;
        b=q6OcrcVbM+A8DdWsv/LtCELRpSeU42vPkQgKnJ/M2pOZ0HDcjCXD718U0LlvWWXOUx
         1eyiWiDaNNKPY8vYZ1pyiPwqA2sYGpMLPAle7uCH9DW0satUTOT2+OId42aRuiZHzjs/
         XHWWryGHfVTXm+dk++Hwd1NsriObguFrFGrFjK74FSNl6R+ZfhGM4p5CGuxIY8GZRayr
         14+GVMVEp99iBrRykFgw8PVV89AyBCv1BVz52iePzqEltDhXM7XWgfKYxZQj2YjO2fZy
         P/rApNBpCQL0FX5Dy91JVO7RTFXnMj2B6QESKoQtUqbIlBzJiCjEDtk5Ii0Oob+WwdlR
         oL6g==
X-Gm-Message-State: APjAAAXFoEBZrgq2kyj6QQzJSR3CnB0Nq4ZBIxCn0ZGafMV7d/cjxths
        PMCv90es4/gaX84KPJ5RQg4=
X-Google-Smtp-Source: APXvYqwxxrMCCWuOBCo0HRT3e+PdDzA5S9WWiy6/6joBzScC56EHuKPoH87AL6B09DWxdgKbyvDxDg==
X-Received: by 2002:a19:4351:: with SMTP id m17mr4754990lfj.61.1576132564072;
        Wed, 11 Dec 2019 22:36:04 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id q25sm2381778lji.7.2019.12.11.22.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 22:36:03 -0800 (PST)
Date:   Thu, 12 Dec 2019 08:35:52 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] pinctrl: pinctrl-baytrail: Use GPIO direction
 definitions
Message-ID: <0e8c584bff32da970510201b504e43a84a340cae.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use new GPIO_LINE_DIRECTION_IN and GPIO_LINE_DIRECTION_OUT when
returning GPIO direction to GPIO framework.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9ffb22211d2b..362276ad5640 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1160,9 +1160,9 @@ static int byt_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
 	if (!(value & BYT_OUTPUT_EN))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 	if (!(value & BYT_INPUT_EN))
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
 	return -EINVAL;
 }
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
