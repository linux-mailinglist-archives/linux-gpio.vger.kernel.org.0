Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C807330BA3
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 11:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbhCHKqF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 05:46:05 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:41136 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbhCHKpw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 05:45:52 -0500
Received: by mail-lf1-f45.google.com with SMTP id q25so20240671lfc.8;
        Mon, 08 Mar 2021 02:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=scj6590os1eA48Uwmp8IjLfDALuVaAXiJhdeu5i0Feo=;
        b=hnTbztR3tzFrBMdaWYfEcmGcK9XMPK4/tNZ3yxGWXy5M+KhbzgObxQkdWKXgrEJNsp
         fb63CRIekSqPDDfcCLx4e5nw2BLtGhaaSriW3CUFHVvYI5q/p9nJE0fCtmmHMc3afmqk
         VYR4HUBAqpIBp2XQW1sjQP6wLtUENO4yUV9zdU/RGWYbSxywQMV74K6KoFEqek1Vki9y
         bA1xiM5xjGoaGSzjyVlqk2BHEBgqLtcz/RmTV/grxLtL6BsUkC4nkYZkME94y6RLpWi+
         QhLjb39b0w65FkFPuqlQB3yH051xbLzvOoGVqTtvrqUk2/Dy457oM6zD+xuOiqapfxuF
         yyBg==
X-Gm-Message-State: AOAM5314T+xDwu1D2M3IivHs9bqa+ZG1z7LNocxJiY8PhNGmKvkJEpN+
        p+QfClfvDx3IyCtejUsAUdc=
X-Google-Smtp-Source: ABdhPJx3O+o2xGGkev21iCH55Gk+EjK/5NDUKlb0GrPN9ZlLNYR3hNjQmvCkrauFPWbVHOAFbEtkCQ==
X-Received: by 2002:a19:6109:: with SMTP id v9mr14466171lfb.546.1615200350696;
        Mon, 08 Mar 2021 02:45:50 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id r7sm1349227lfr.230.2021.03.08.02.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:45:50 -0800 (PST)
Date:   Mon, 8 Mar 2021 12:45:44 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v3 15/15] MAINTAINERS: Add ROHM BD71815AGW
Message-ID: <c73fdf1ef1da3538d93035a75029103fdb87b8c8.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainer entries for ROHM BD71815AGW drivers.
New regulator and GPIO drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..ac6eb095ab0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15452,18 +15452,21 @@ F:	Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
 F:	Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt
 F:	drivers/clk/clk-bd718x7.c
 F:	drivers/gpio/gpio-bd70528.c
+F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
 F:	drivers/mfd/rohm-bd70528.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/power/supply/bd70528-charger.c
 F:	drivers/regulator/bd70528-regulator.c
+F:	drivers/regulator/bd71815-regulator.c
 F:	drivers/regulator/bd71828-regulator.c
 F:	drivers/regulator/bd718x7-regulator.c
 F:	drivers/regulator/rohm-regulator.c
 F:	drivers/rtc/rtc-bd70528.c
 F:	drivers/watchdog/bd70528_wdt.c
 F:	include/linux/mfd/rohm-bd70528.h
+F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
 F:	include/linux/mfd/rohm-generic.h
-- 
2.25.4


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
