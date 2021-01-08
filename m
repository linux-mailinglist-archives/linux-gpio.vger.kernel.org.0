Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C480F2EF32F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbhAHNiT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:38:19 -0500
Received: from mail-lf1-f43.google.com ([209.85.167.43]:38729 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbhAHNiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 08:38:18 -0500
Received: by mail-lf1-f43.google.com with SMTP id h205so22973326lfd.5;
        Fri, 08 Jan 2021 05:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MKoKf/OyfMVtWU3ErTlCqeOXZrC1PMXrNyIy9HpDMkA=;
        b=s0ilOzV0Uzc32QgNJNIckEo5tmMULGzqXtNY1ZwM1OL1VYHGaFBpka67KMPOMO4OY/
         nrQu+H+qs0IkWh+UpJaO4WKXcz+Xr+Gc0b63IihTAhHUzklunltPPumYtqcftturPEly
         rNgh481/vWP2X98PML4WMqVpex0a+8NJcTJ+pzRreJrt36DMOSb4VNSLCR54DVrycvPt
         G0h0jFwc9c0cTtMrRzL1nKLPD2cJX8m0gcZZb2mSCfg2iuKqdkktvh4+XRZlMFjV944B
         Pc+ol6KfLsNK7fzUorpKxdTSKwHKZtnPebkxfROZN6r6GAItTGclbWWqgeLVHG0h5dw6
         H3UA==
X-Gm-Message-State: AOAM5303TWdKsAJ9z0detgJuJslkMX5OVKzs1E47Nd2WirBojjgv/rRE
        p9vfEqJGoZUkwkhxiCmr9LY=
X-Google-Smtp-Source: ABdhPJyGw8yBKyGaJ0A2CAbSxn72P0swr01JriV52bTQTkyicmfr8AmEHALKYgyMNl73a6TEniBB/g==
X-Received: by 2002:a05:651c:1129:: with SMTP id e9mr1475251ljo.135.1610113054853;
        Fri, 08 Jan 2021 05:37:34 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id s25sm2078709ljo.106.2021.01.08.05.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:37:34 -0800 (PST)
Date:   Fri, 8 Jan 2021 15:37:27 +0200
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
Subject: [PATCH 07/15] mfd: Add ROHM BD71815 ID
Message-ID: <12a4bbe227375756b612ca7d51473655ff12db86.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add chip ID for ROHM BD71815 and PMIC so that drivers can identify
this IC.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 include/linux/mfd/rohm-generic.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index 4283b5b33e04..e99e569d3cc1 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -12,6 +12,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD70528,
 	ROHM_CHIP_TYPE_BD71828,
+	ROHM_CHIP_TYPE_BD71815,
 	ROHM_CHIP_TYPE_AMOUNT
 };
 
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
