Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F407F91C3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 15:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbfKLOSD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 09:18:03 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39059 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfKLOSD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 09:18:03 -0500
Received: by mail-lf1-f68.google.com with SMTP id j14so4380903lfk.6;
        Tue, 12 Nov 2019 06:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=noLT2aGm698xuw2frzZtoGQnaskmek6kKUVIzW/nFbM=;
        b=MvTCjxlAotb1U4xPOADQtXZBXhKBTSVb9++Aj1BN5rzTDqpxS64kYsAG7ytdnmB9W6
         j5ZvO7AZHKrLHmK11qXS4Q4KR012ODSJl3xH8R11FCUkl/oykKnfbJsCRgx5vpiTCTFA
         9LQWbRyItje81r+qm+lcYOmWg9q8CTA124wnIvUkh07CaLmGja3yBwN/oTLtTlvw9XdB
         ALsziLHkgNtf77pqkdM7C0FaleBOky6XiXpLDbGQT8IKMVAIZbL4BZZCyWdnyr4LZ/55
         2DIvjXLphUFo2z5koeEr+TBKJ8YDs0iU8Dyb+C0/nRHxA517Utjj5ONoLx8oF9oqJBSb
         s8GQ==
X-Gm-Message-State: APjAAAWTP4LrdeH9uIT5bo+fpi0y0H6kKTTpcc3d8u9ZkKL05WQxYsrN
        DrxgL6sjXrafm7wV28oeuyc=
X-Google-Smtp-Source: APXvYqxDGCMrmWRGR1WTJsmYqkazUN2CI18QD8EA4irdT0j3PIL9joXHCr2eKeWKmiMP/RudUuOXBw==
X-Received: by 2002:a19:23c1:: with SMTP id j184mr14858467lfj.107.1573568280891;
        Tue, 12 Nov 2019 06:18:00 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id t16sm8346945lft.6.2019.11.12.06.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 06:18:00 -0800 (PST)
Date:   Tue, 12 Nov 2019 16:17:48 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] pinctrl: rza1: remove unnecerssary static inline function
Message-ID: <20191112141748.GA22061@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Having static inline oneliner does not benefit too much when it is
only called from another oneliner function. Remove some of the
'onion'. This simplifies also the coming usage of the gpiolib
defines. We can do conversion from chip bits to gpiolib direction
defines as last step in the get_direction callback. Drivers can
use chip specific values in driver internal functions and do
conversion only once.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 017fc6b3e27e..215db220d795 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -617,12 +617,6 @@ static void rza1_pin_reset(struct rza1_port *port, unsigned int pin)
 	spin_unlock_irqrestore(&port->lock, irqflags);
 }
 
-static inline int rza1_pin_get_direction(struct rza1_port *port,
-					 unsigned int pin)
-{
-	return !!rza1_get_bit(port, RZA1_PM_REG, pin);
-}
-
 /**
  * rza1_pin_set_direction() - set I/O direction on a pin in port mode
  *
@@ -783,7 +777,7 @@ static int rza1_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct rza1_port *port = gpiochip_get_data(chip);
 
-	return rza1_pin_get_direction(port, gpio);
+	return !!rza1_get_bit(port, RZA1_PM_REG, gpio);
 }
 
 static int rza1_gpio_direction_input(struct gpio_chip *chip,

base-commit: 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c
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
