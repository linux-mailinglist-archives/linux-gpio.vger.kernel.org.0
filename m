Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6C313BBE5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 10:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbgAOJF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 04:05:56 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44771 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbgAOJF4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 04:05:56 -0500
Received: by mail-lf1-f68.google.com with SMTP id v201so12086649lfa.11;
        Wed, 15 Jan 2020 01:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RPxM58KftHxJAM+nPlRg/hGQEelhpre9yEtcVj8KnWU=;
        b=eB99C8vwlmH3SJ2xWJ43us67NNvIRJFbSyhRjXc1MkNuQcJ5UiQDdomGWN1N6DRAjw
         Qq4Qqwnq892T3NpYTeblKpR/xZgj7sfzA4nubZeuz77ds4bC2b2a8GDbcG1sc9t9mhJf
         PyN+zba++MwD7MK0ji1gpWC5rAelmImo2VqvgMrHMHi1gpWT/6V05bJ2Zacn+Y705xqa
         YcfNGAVbvv8MltZPPJNY7kmS+1HrFW8GIrJyuYCaeOiupvELbABRadmMvr6AGPgEmCfX
         IPlamYJbnnTmtJZ+3WDK4NXUTX+4dI1//4H0Vewpq685AdKzk4UNoA7YmULEfuxMkULI
         hKiA==
X-Gm-Message-State: APjAAAWZo+34EQkkXIxrxHKXnJOQw0twTF/On+AzeenmV59Xa6fMQbYM
        nVqvDNwJeIZJZgHF4y335/Q=
X-Google-Smtp-Source: APXvYqyR1yygAvwuDNJThhVTSa6EDW6voSS9BS87vSXtrJyXUemCAZ86mRsxdtBkOFa/eDTBZaCw4A==
X-Received: by 2002:a19:2486:: with SMTP id k128mr4324853lfk.16.1579079153548;
        Wed, 15 Jan 2020 01:05:53 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id m189sm8558534lfd.92.2020.01.15.01.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 01:05:53 -0800 (PST)
Date:   Wed, 15 Jan 2020 11:05:45 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
Subject: [RESEND PATCH v9 04/12] mfd: bd718x7: Add compatible for BD71850
Message-ID: <b6c2980cc937598bc1e11c6830c43e9df5d1a4b3.1579078681.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579078681.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579078681.git.matti.vaittinen@fi.rohmeurope.com>
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
No changes since v8

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
