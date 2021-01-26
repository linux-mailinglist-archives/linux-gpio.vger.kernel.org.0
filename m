Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F29C304667
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 19:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbhAZRWm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 12:22:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbhAZIaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 03:30:15 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF7AC061574
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 00:29:58 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id 6so15486628wri.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YoJL14Xv0wOFOwwfdYEM7FDsz0s8zH6rRaAdm+Z0noo=;
        b=N9q340mh/XXjb5TgWj8TYxDHhMvw0SQDVqzJT7gTk1jWzzU6rnuLTWfxlwMLE4fgjO
         oSxBMJvMSV5+PAnGV9dLO2FvlyIhf9kUAF5SArfY/qhY6791nqI5K8eBW98EYHSQ4hng
         2IjhIjiLTMIo73OrwBKjKhQA/XimrXP4aOOvHk4fYWsuiHJRlwj9c5QJm7u8UiTyDt1s
         dsO8yKXFqfAV562YWVQpYdSMYkFszkUmyk+lk59dEPNR4Q76jw3PyI0s/+nxktbW4OLd
         r08RutR+HVJ+L+R65x+9xO6FgBofh5Cwc24HUw+UMBr4m5c+QSjpgRKBEdSOW6GULuzq
         UNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YoJL14Xv0wOFOwwfdYEM7FDsz0s8zH6rRaAdm+Z0noo=;
        b=abHFk89atcyu37P7og/WaARgiwN0hbUPJpwww8r/Kmo3G4R27Ug6doDZbyFmczs5IZ
         FzNdXqRi1rONfHY/M6QOqrGlB0AWQ94LNVSe67iudhQD8E6SF2+5sSfEdjOQHZ+6+s3x
         QSmFnqUh9xa4dj4GO3CbgscaQ0wzIJMKFS+TSJAJa/c5Ho8iMvVxmMD2rSQufLpwx/Xt
         PmM8nUpEIP2pc9do7CSfaqX0t0z1TmK11xOxv1bRAFBFM/2B8lM/w5Q7tG2dtc8RcYXY
         KJUzNvchcTyWOgBqKZiOfQ/AmBqyPJeZrDCf2vz5H1rI7q6pgsW94TAQKxF6jnBUk/i6
         KJ8Q==
X-Gm-Message-State: AOAM5334QYDbS7PHkusGV6o24m5dVy86jwzhHQbvDSprVKzjLr0KES0W
        o/hFeANj5Q1/uprH8CaBQOio0w==
X-Google-Smtp-Source: ABdhPJxYE9Gyzn2ngzlcXkb2Xzeys3TeVUOi9ycUWgcWATBm1ZwQkahSXfclXSohvAZRxDPm00lwSg==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr4848964wru.268.1611649797348;
        Tue, 26 Jan 2021 00:29:57 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i59sm28235856wri.3.2021.01.26.00.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 00:29:56 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:29:54 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 09/17] mfd: Support for ROHM BD71815 PMIC core
Message-ID: <20210126082954.GF4903@dell>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <14480ca837005aecd7053202c2347e36ad29faee.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <20210125141044.GZ4903@dell>
 <7a3d897d6af9f4310e5cc98ca74123192da49e27.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a3d897d6af9f4310e5cc98ca74123192da49e27.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 25 Jan 2021, Matti Vaittinen wrote:

> Hello Lee,
> 
> Thanks again for the review!
> 
> On Mon, 2021-01-25 at 14:10 +0000, Lee Jones wrote:
> > On Tue, 19 Jan 2021, Matti Vaittinen wrote:
> > 
> > > Add core support for ROHM BD71815 Power Management IC.
> > > 
> > > The IC integrates regulators, a battery charger with a coulomb
> > > counter,
> > > a real-time clock (RTC), clock gate and general-purpose outputs
> > > (GPO).
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > > Changes since v1:
> > >   - Used BIT() for better readability
> > >   - removed some unused definitions
> > > 
> > >  drivers/mfd/Kconfig              |  15 +-
> > >  drivers/mfd/rohm-bd71828.c       | 416 +++++++++++++++++++++--
> > >  include/linux/mfd/rohm-bd71815.h | 561
> > > +++++++++++++++++++++++++++++++
> > >  include/linux/mfd/rohm-bd71828.h |   3 +
> > >  4 files changed, 952 insertions(+), 43 deletions(-)
> > >  create mode 100644 include/linux/mfd/rohm-bd71815.h
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index bdfce7b15621..59bfacb91898 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1984,19 +1984,20 @@ config MFD_ROHM_BD70528
> > >  	  charger.
> > >  
> > >  config MFD_ROHM_BD71828
> > > -	tristate "ROHM BD71828 Power Management IC"
> > > +	tristate "ROHM BD71828 and BD71815 Power Management IC"
> > >  	depends on I2C=y
> > >  	depends on OF
> > >  	select REGMAP_I2C
> > >  	select REGMAP_IRQ
> > >  	select MFD_CORE
> > >  	help
> > > -	  Select this option to get support for the ROHM BD71828 Power
> > > -	  Management IC. BD71828GW is a single-chip power management IC
> > > for
> > > -	  battery-powered portable devices. The IC integrates 7 buck
> > > -	  converters, 7 LDOs, and a 1500 mA single-cell linear charger.
> > > -	  Also included is a Coulomb counter, a real-time clock (RTC),
> > > and
> > > -	  a 32.768 kHz clock gate.
> > > +	  Select this option to get support for the ROHM BD71828 and
> > > BD71815
> > > +	  Power Management ICs. BD71828GW and BD71815AGW are single-
> > > chip power
> > > +	  management ICs mainly for battery-powered portable devices.
> > > +	  The BD71828 integrates 7 buck converters and 7 LDOs. The
> > > BD71815
> > > +	  has 5 bucks, 7 LDOs, and a boost for driving LEDs. Both ICs
> > > provide
> > > +	  also a single-cell linear charger, a Coulomb counter, a real-
> > > time
> > > +	  clock (RTC), GPIOs and a 32.768 kHz clock gate.
> > >  
> > >  config MFD_STM32_LPTIMER
> > >  	tristate "Support for STM32 Low-Power Timer"
> > > diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-
> > > bd71828.c
> > > index 210261d026f2..28b82477ce4c 100644
> > > --- a/drivers/mfd/rohm-bd71828.c
> > > +++ b/drivers/mfd/rohm-bd71828.c
> > > @@ -2,7 +2,7 @@
> > >  //
> > >  // Copyright (C) 2019 ROHM Semiconductors
> > >  //
> > > -// ROHM BD71828 PMIC driver
> > > +// ROHM BD71828/BD71815 PMIC driver
> > >  
> > >  #include <linux/gpio_keys.h>
> > >  #include <linux/i2c.h>
> > > @@ -11,7 +11,9 @@
> > >  #include <linux/ioport.h>
> > >  #include <linux/irq.h>
> > >  #include <linux/mfd/core.h>
> > > +#include <linux/mfd/rohm-bd71815.h>
> > >  #include <linux/mfd/rohm-bd71828.h>
> > > +#include <linux/mfd/rohm-generic.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_device.h>
> > >  #include <linux/regmap.h>
> > > @@ -29,12 +31,102 @@ static struct gpio_keys_platform_data
> > > bd71828_powerkey_data = {
> > >  	.name = "bd71828-pwrkey",
> > >  };
> > >  
> > > -static const struct resource rtc_irqs[] = {
> > > +static const struct resource bd71815_rtc_irqs[] = {
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd71815-rtc-alm-0"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd71815-rtc-alm-1"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC2, "bd71815-rtc-alm-2"),
> > > +};
> > > +
> > > +static const struct resource bd71828_rtc_irqs[] = {
> > >  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
> > >  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
> > >  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd71828-rtc-alm-2"),
> > >  };
> > >  
> > > +static struct resource bd71815_power_irqs[] = {
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_RMV, "bd71815-dcin-rmv"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_OUT, "bd71815-clps-out"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_IN, "bd71815-clps-in"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_OVP_RES, "bd71815-dcin-
> > > ovp-res"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_OVP_DET, "bd71815-dcin-
> > > ovp-det"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_MON_RES, "bd71815-dcin-
> > > mon-res"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_MON_DET, "bd71815-dcin-
> > > mon-det"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_UV_RES, "bd71815-vsys-uv-
> > > res"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_UV_DET, "bd71815-vsys-uv-
> > > det"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_LOW_RES, "bd71815-vsys-
> > > low-res"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_LOW_DET, "bd71815-vsys-
> > > low-det"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_MON_RES, "bd71815-vsys-
> > > mon-res"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_MON_RES, "bd71815-vsys-
> > > mon-det"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_WDG_TEMP, "bd71815-chg-
> > > wdg-temp"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_WDG_TIME, "bd71815-chg-
> > > wdg"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RECHARGE_RES, "bd71815-
> > > rechg-res"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RECHARGE_DET, "bd71815-
> > > rechg-det"),
> > > +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RANGED_TEMP_TRANSITION,
> > > +			     "bd71815-ranged-temp-transit"),
> > 
> > The new line limit is 100.  Feel free to run these out.
> 
> I learn new things every day it seems. This change is more than
> welcome!

Please see:

 bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column warning")

... for a more complete description.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
