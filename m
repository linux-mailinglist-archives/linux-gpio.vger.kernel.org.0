Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 575EDFAAA6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 08:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfKMHLA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 02:11:00 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40106 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfKMHLA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 02:11:00 -0500
Received: by mail-lj1-f195.google.com with SMTP id q2so1303187ljg.7;
        Tue, 12 Nov 2019 23:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=4KMLVvREWKxLr4LB9g5/Vm1S14nk0c09BGMXFpgNmeg=;
        b=niv7NGzemgYMr+K4qrKX5JPqn3sjTw0sl6bNPd3PZcJVFtY3UQMaIgQb5aPih/68n8
         KYObdkkwY9eTDrg5K+7hhrxmuFubSSWSOspvs3Ky/m7Iu9tHhw0+sWcDmqKiMZ9fNT4t
         sRIvAcA2qMOdpBtQsx1yq/DryyNlUcrUF116XOX5f9lp/umPAFdFnXBXTC3DWUvAveZX
         3dj9vSaDhA6UjTtoMLsz7ij+V+ONHbes3fmJJnopb6jrMrLzpdH3eFHqsb3RJeoZTJ8S
         a+CwR4qTFxhhqaOkk5pHthSJZg0SqLbpR3ba5crTanGfi61CcxkIlV7BaY/cK0g6qce1
         iznA==
X-Gm-Message-State: APjAAAWWWpk+KEoI/azIMt7CWdKIWY/KAzMERrBqa7ivJTVdK30s44Fb
        Alr/rZgDpM/MOp8sbnxtGco=
X-Google-Smtp-Source: APXvYqz0xPpVNHucYfZn/+JYHKGQXEeMbz2uUSTgoYfXe7nklrIXUyDRr45bgpXaEWLlaO66RANVzA==
X-Received: by 2002:a2e:9149:: with SMTP id q9mr1403625ljg.49.1573629058069;
        Tue, 12 Nov 2019 23:10:58 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id d17sm519689lja.27.2019.11.12.23.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 23:10:57 -0800 (PST)
Date:   Wed, 13 Nov 2019 09:10:45 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] pinctrl: rza1: remove unnecessary static inline
 function
Message-ID: <20191113071045.GA22110@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Having static inline oneliner does not benefit too mucg when it is
only called from another oneliner function. Remove some of the
'onion'. This simplifies also the coming usage of the gpiolib
defines. We can do conversion from chip bits to gpiolib direction
defines as last step in the get_direction callback. Drivers can
use chip specific values in driver internal functions and do
conversion only once.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v1: Subject fixed as pointed out by Geert.

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
