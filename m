Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC5711C5F6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 07:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfLLGep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 01:34:45 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38388 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfLLGep (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 01:34:45 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so943546ljh.5;
        Wed, 11 Dec 2019 22:34:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XaT0mQSTPp24MN650YkdiQloudL58RSz/+EV4tv1Bu0=;
        b=Xmi21QiKn2zDCH3nS0Zm4YeUh9HrZZkzEjVw7sqJBzN8Vta/LkpDDzg/4dxMsmxgxf
         SootWIVqbNE0dmcARSzXdu57r3cAFQ+kwhXT9yszEhhyPFsuF+o6qdSvBO4keGXi91rj
         Zo7qnHZ3xMAZLVnZ1XZ5aNY7F3IAn3SVa094tQmmjZSLazJWJmd8MPeZaIUGenFFg7I3
         MJOtOUJBj38p2xrVUg5kHov0VW/axClh9DBlvBlX0Igik2HXhhYJFgVRolqEqH/X/JvT
         7l4E4EOzv0bO908sn9/aPfqSKaWVpl+yI+xhPV3s7KQL0aMJQGktsnMU/CqJQEQzLu0F
         zTFg==
X-Gm-Message-State: APjAAAUcIlM0L3syxoOZOpQHSH3n+qhiEra/EHcqhJAPCR1txUteFqcs
        RNweAwvaaI0Nv+humcCMTD0=
X-Google-Smtp-Source: APXvYqwOjuTEwNQ0dlVXsI9sM9pSrkSPqnROfMb5KG1Nc5TKGJETF5upONj4y3FqsuHzHQvG5SSQmA==
X-Received: by 2002:a2e:850f:: with SMTP id j15mr4689740lji.91.1576132483670;
        Wed, 11 Dec 2019 22:34:43 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id z9sm2330605ljm.40.2019.12.11.22.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 22:34:43 -0800 (PST)
Date:   Thu, 12 Dec 2019 08:34:32 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] pinctrl: pinctrl-intel: Use GPIO direction definitions
Message-ID: <2cd75bd04932d076708fae87d8b003778d876a1c.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
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
---
 drivers/pinctrl/intel/pinctrl-intel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 4860bc9a4e48..2ba2ad8a55d9 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -944,7 +944,10 @@ static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (padcfg0 & PADCFG0_PMODE_MASK)
 		return -EINVAL;
 
-	return !!(padcfg0 & PADCFG0_GPIOTXDIS);
+	if (padcfg0 & PADCFG0_GPIOTXDIS)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
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
