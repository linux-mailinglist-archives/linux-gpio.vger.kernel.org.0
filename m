Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFFC125E14
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 10:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLSJuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 04:50:05 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40148 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfLSJuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 04:50:05 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so5488915ljk.7;
        Thu, 19 Dec 2019 01:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=99AhJaSdW15gDZwBJyXN+zdCrikCpz2d/muq40fL6cQ=;
        b=IP5gPRKZFU44y8nYGugV6PVyOjQqiQSqPdV+IEWQ5dZDSPU52jZcfVte3VN78f6yzf
         bNbev02o5ol5dtGyCl4ZjgGKPamr54mmTD4I3n66ycQ6zJAICv1S43mHfLP7+/h7TNMt
         aq5vCQlJsCAhvAtZTlmEQc0xpPpZj9ybgvW9C8nFRcSomtyS6GKzL9IsvZK/OZmeP27P
         YZcTH0Hp0de6BbAwgDZN+I/74pISjveqIkp9UOLC4NGB1a1z4h4WFiC0K9UYvM1FZRqb
         v/X22DBM8Y+c4JXYRuOg0v6HXFaNp9yYICuOklix8GSsJsoTtliIp3/UO782aSy5hxz7
         uRdA==
X-Gm-Message-State: APjAAAVoRXzt1BCIjYZJ4jd/4xnJFza6UaWaxHhKV7/KLG5Kc+i1SHtu
        DBKEHlWEwmb6j8K4ApcHOH0=
X-Google-Smtp-Source: APXvYqzwW6neyqJcKN5pKaaVZYwUT2/1wsIUTIA6aP5VHadsgVlR2lDrpoAO0STDtMsL14PxpdlNRQ==
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr5291094lji.256.1576749002348;
        Thu, 19 Dec 2019 01:50:02 -0800 (PST)
Received: from localhost.localdomain (dyt4gctb359myxd0pkwmt-4.rev.dnainternet.fi. [2001:14bb:430:5140:37cf:5409:8fcc:4495])
        by smtp.gmail.com with ESMTPSA id l21sm2369334lfh.74.2019.12.19.01.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:50:01 -0800 (PST)
Date:   Thu, 19 Dec 2019 11:49:54 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v7 04/12] mfd: bd718x7: Add compatible for BD71850
Message-ID: <6e6295c62cea1093970d2812c842871b37d32c46.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ROHM BD71850 PMIC is almost identical to BD71847. Main difference is some
initial voltage values for regulators. The BD71850 can be handled by
BD71847 driver but adding own compatible makes it clearer for one who
creates the DT for board containing this PMIC and allows SW to be
differentiating PMICs if needed.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

This is a new patch and added to this series only to avoid conflicts
with other bd718x7 changes introduced in this series. Please drop this
patch if it is not Ok to apply it in this series. DT binding doc for
this new compatible was sent in:
https://lore.kernel.org/lkml/20191217084824.GA26539@localhost.localdomain/

 drivers/mfd/rohm-bd718x7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index bb86ec829079..c32c1b6c98fa 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -213,6 +213,10 @@ static const struct of_device_id bd718xx_of_match[] = {
 		.compatible = "rohm,bd71847",
 		.data = (void *)ROHM_CHIP_TYPE_BD71847,
 	},
+	{
+		.compatible = "rohm,bd71850",
+		.data = (void *)ROHM_CHIP_TYPE_BD71847,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bd718xx_of_match);
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
