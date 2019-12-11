Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08DB311AD81
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 15:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbfLKOdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 09:33:08 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35875 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729879AbfLKOdI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 09:33:08 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so24344578ljg.3;
        Wed, 11 Dec 2019 06:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3BUu4hjVmyNGvfCGERUU1pdR+MP17NUT2rzccP4t4nU=;
        b=eJoSidvkcWeeOf/sOXgMqoH5hjLAJiBrkJ5ldCUvVLvjY1lsKeuL1frzUXdvc7VUVW
         9WJuqj7D7Ts6FuajkPFOn/wQv7y/DZvHTJUqpLkJuBEF8LDkAhhACVcy08lpfd34zhUg
         FaTQojGRGWHAkkoog9eH9jrcfdQ0GrsxkpzxE4sfcxZUICl07LPmcBupN6N+cd1Jz/FM
         dwjbdGjaHcj7aQcZwOY1HJHe6p3q8QsZJ3ok9pSOOlo8KfYvlb13jXw19vkf9tZ9DcIg
         FJq6kW2WkHR8WOMj1uVPsxBLm65QM4NQlbzwhi7DIEIZJtweXdcU65PMIUNkYi1Aslgc
         NkdQ==
X-Gm-Message-State: APjAAAX4/ylntLB3phsLTT3w1CAUarcTa25dQsY27U/wOFoCiLS5KydS
        +YQDTaBk8lUQ5MGZL3en8Jvvy+gt
X-Google-Smtp-Source: APXvYqwM8eg8zOKlkXlr1dI6zhQIXZLwr2Tx5iKSGbba5UdWIPgu5Pn1frQYzR6BZ0Wi5VULUtPYgw==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr2323372ljj.47.1576074785503;
        Wed, 11 Dec 2019 06:33:05 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id s7sm1267624ljo.43.2019.12.11.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 06:33:05 -0800 (PST)
Date:   Wed, 11 Dec 2019 16:32:54 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pinctrl: pinctrl-cherryview: Use GPIO direction
 definitions
Message-ID: <1e962b7f5905a0336528eeb0a43eee0cf870879c.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/pinctrl/intel/pinctrl-cherryview.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 582fa8a75559..797a226e2043 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1287,7 +1287,8 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	direction = ctrl0 & CHV_PADCTRL0_GPIOCFG_MASK;
 	direction >>= CHV_PADCTRL0_GPIOCFG_SHIFT;
 
-	return direction != CHV_PADCTRL0_GPIOCFG_GPO;
+	return direction != CHV_PADCTRL0_GPIOCFG_GPO ? GPIO_LINE_DIRECTION_IN :
+						       GPIO_LINE_DIRECTION_OUT;
 }
 
 static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
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
