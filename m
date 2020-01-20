Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73CE71426F1
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 10:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgATJSP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 04:18:15 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37580 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgATJSP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 04:18:15 -0500
Received: by mail-lf1-f68.google.com with SMTP id b15so23449461lfc.4;
        Mon, 20 Jan 2020 01:18:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nwutvSRr8XpFBMA7LDbRxN1JeFf/PyimQjlchz5hegw=;
        b=KuvE8oSloEjkyzdU5ZOhvAFsGdy5ZVuBX03ce9qkBN31C+82MLJYjtrxsXaoS9sw1I
         5Xx2EqqTjONEkpsTT1pWjOZE9xZnera1Mz2QCQglqEuNE3l1Fg2i/Z4B3n1UCp1/oLhV
         TnXEPmwpORfb3bsvhhboTxqAEEAwcWMJzt77n09t6KM8DYS4/7q1H8IM7Itk+RfgrdcP
         v4f3cGDcaQTNROhmGD6AksJkPFaDP/ZflNMJ726CmSno05TfvmC1ytOSRrsZLVrDfvQC
         YvE1Kvnqbuv41k3jrplFJerjHbbiELRL0eEaGJeJZdjsqdf4cMtS5EQi80pLVI0WzDJA
         n7GQ==
X-Gm-Message-State: APjAAAWwA4OnwZdXcn6Ls8EmVFgrJeMWeS/ULlVWtL2OxnvnXXh0HNg6
        k5ac/aRCZSmGgGU00G7oFns=
X-Google-Smtp-Source: APXvYqzGmlceGIGxqnTTb4ogSsD55VphI9d20VIdttEiFFRgXpZsSgt7CUJUuomP+PUbty41gZSk4g==
X-Received: by 2002:ac2:4214:: with SMTP id y20mr10467480lfh.212.1579511891792;
        Mon, 20 Jan 2020 01:18:11 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id u16sm19117059lfi.36.2020.01.20.01.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 01:18:10 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:18:04 +0200
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
Subject: [PATCH v12 04/10] mfd: bd718x7: Add compatible for BD71850
Message-ID: <9771850fe04040c30ff3668fcba7002f7f0681fd.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
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

ROHM BD71850 PMIC is almost identical to BD71847. Main difference is some
initial voltage values for regulators. The BD71850 can be handled by
BD71847 driver but adding own compatible makes it clearer for one who
creates the DT for board containing this PMIC and allows SW to be
differentiating PMICs if needed.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
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
