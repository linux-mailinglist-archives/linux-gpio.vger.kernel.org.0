Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1089D137CD1
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2020 10:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgAKJuW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jan 2020 04:50:22 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41290 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbgAKJuW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jan 2020 04:50:22 -0500
Received: by mail-lj1-f195.google.com with SMTP id h23so4690611ljc.8;
        Sat, 11 Jan 2020 01:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RPxM58KftHxJAM+nPlRg/hGQEelhpre9yEtcVj8KnWU=;
        b=WiWUb9O27vUL7d8cgkJgJiLmS9Pvc4z/KSo8i4EgCtsGxkWfHI0NcGpCgJdJF+W6JI
         EwP+D2h2xMPv1NTjLin3rC9/ZsusrRYutNlO9h7ZINa+3cnV2yU3WSXCJmHikKZK+US0
         mLA8UlkMu32XnL3xPOT1z5PpwGwYwU0P6OiOigeUjt97T2IO/B4mXDfF/I5G/sOVjBtV
         JrS9iGBeHZD3li1UBgIsXNod4iV+r0j2y7kLXh2nvVeqpfLcTw3UZjWAxvXwiLWHLZB7
         jHUNyvXTUWYKsNdZe/Z1+H4BlPzdYYFkr3XLX0UfL+Lusyb2HueCUTWEVCmvtwjGA/aS
         SxGw==
X-Gm-Message-State: APjAAAVz4d1ct0UIvt+tPYQBjj2WaAWcUC+2FikCwMjWKlvQGNUUA1P2
        pH8Nx2OoYI9LyQ1+F0jlOxE=
X-Google-Smtp-Source: APXvYqyLZan6NeieKOboZ+3FxvCsakx0qhqenJQ6gesFQTRRwQc/U0vlcEcDYBc+tp9D1sU+hFviAA==
X-Received: by 2002:a2e:9f17:: with SMTP id u23mr5245745ljk.112.1578736219212;
        Sat, 11 Jan 2020 01:50:19 -0800 (PST)
Received: from localhost.localdomain (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
        by smtp.gmail.com with ESMTPSA id r15sm2269410ljh.11.2020.01.11.01.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2020 01:50:18 -0800 (PST)
Date:   Sat, 11 Jan 2020 11:50:12 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
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
Subject: [PATCH v9 04/12] mfd: bd718x7: Add compatible for BD71850
Message-ID: <b6c2980cc937598bc1e11c6830c43e9df5d1a4b3.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
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
