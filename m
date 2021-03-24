Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E175F3472B1
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 08:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbhCXHbx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 03:31:53 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:35784 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235585AbhCXHbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 03:31:34 -0400
Received: by mail-lj1-f176.google.com with SMTP id a1so28964399ljp.2;
        Wed, 24 Mar 2021 00:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=egthqhzn5ZpLM0FjZqjc5wIxAZteYh+EG3fvKfyV1Xo=;
        b=EznT9iUM4wlaU53v6bN0lfpwk5vpPTny423iglllQzddjbtpUBSQR1O4LsAd/UfqGm
         lqizPenc0jMDq9pcd2azJvy5LoAi1MYuLq8uufueNjcPwrIQqO9n92Ehw69SJuNapCaN
         7Qhoo+Rm7NRkgKsfyyGsLWVoU4k/auKVFVPGRzeL2XOnMNSvddQ580i602CqPpy+5alw
         PsyG7Ga9yrFdhf6giCGmuw9q9fpEZMdaIdVNp9y0f6RzrUB9y7HhwcLgCe5cYipMCQSl
         QcNzM3bQJpvxQIYd5CmPl9ZMOtlT0wLCPvsuKIIRdkepjYHjztwuu4FPcK79bvamDjgC
         Mojg==
X-Gm-Message-State: AOAM532c31x1v5kpuaXoHXJedqZHUQvqhrCTd0a0r9ybmX9be3LCkO9l
        efCu6BqXzpKF+vLPhEm970o=
X-Google-Smtp-Source: ABdhPJz5K9P8nQJZ66vs1+1FB+uo5iOT3gHJVZTdAlkQGcCA1g+y5NbDWwjvWXJO7qZopt0ciN1MGw==
X-Received: by 2002:a2e:b88e:: with SMTP id r14mr1222519ljp.450.1616571092979;
        Wed, 24 Mar 2021 00:31:32 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id v10sm143682lfb.238.2021.03.24.00.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 00:31:32 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:31:26 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
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
Subject: [PATCH v4 16/16] MAINTAINERS: Add ROHM BD71815AGW
Message-ID: <55471f9afe9ee89c8469323e92dbd88b7bfeb7ea.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add maintainer entries for ROHM BD71815AGW drivers.
New regulator and GPIO drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changes since v3:
 - No changes
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e876927c60d..c251af6bfc03 100644
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
