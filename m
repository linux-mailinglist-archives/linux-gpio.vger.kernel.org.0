Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 811EB1F4FBA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 09:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgFJH4U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 03:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgFJH4T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 03:56:19 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C018C08C5C3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 00:56:19 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f185so882710wmf.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Cjs3WhIrv+bZ6tn9UnNffYVU8+Ox2fEIN+JVYQ0tTkQ=;
        b=hYehp6XskwVDZoGE5ageQYvHlfDRosdHG6iYynruU1WqmbKbXefVWCnOKYS8Uh1fwG
         Ieijl7uUSji9Zdxkh7TeS/tMfiqEdwSx5IohccvO5W6XGiQLULHFi30N3+oPGSts+oPh
         PQ/hitEMIo40Zaoi36s0Jfn1ThnSezQMlenC+D9osIYBJ1Van6hfMeZP8OPEV2ietICv
         oldT+A22CuexgCG9cM3mXYKbrzmtA2Pf2pspXcpOx2j/ZaZzIoT6EpPhx/28u48D2BBX
         D7y8l6udc4EsrQJcpl6guFRmu3cpVFmH8r0txjOLugD/nif96/2cI3cicci7RAgSLdqW
         ol7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Cjs3WhIrv+bZ6tn9UnNffYVU8+Ox2fEIN+JVYQ0tTkQ=;
        b=FpkxAC9/AZsYYB+A1WMtoqzY7teZrwFeql6GPDztt8hMU5N3O4O9+RASqO5HifjQGG
         bVBCrc1x4j4DJAXbQezSOKCjO776Hod6oQrRegaqfqLgUWY6FvtRTBCeIbZ6qy6+ukRm
         jGN6xqPYndBiBUDO3iKNgg8ma3xT/nn6TpCZG96qzlVEpsZmd+qwl1wAhlnx+U1zrzna
         wdtQoGlfM22AQefaSP/rB/Gy4gCVmw9OuJFMAX4sDY1s8YYLRdUZP8ANXTQql7OhPCZp
         UJ0z69S22bU144YWX4mweuY3/DWCwn+0Km3u9r97NuEySI0zfLEr1yMRr1Ql7YSGQSni
         lIhA==
X-Gm-Message-State: AOAM530jSZn5hj+4gga8I+kE+CGrCjaIkPdCi+pmtZtqdGJyBNJou7zU
        u/7bkWolm+DUWplzHV+8A9YIGA==
X-Google-Smtp-Source: ABdhPJylShHmodnuyhsFhzN3mLes6/LNfzgEosdeRQ8I8kMe2B7dQDQ69G3lIdZnvQwR99SfqAy50w==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr1841279wma.101.1591775777865;
        Wed, 10 Jun 2020 00:56:17 -0700 (PDT)
Received: from dell ([2.27.167.101])
        by smtp.gmail.com with ESMTPSA id k26sm5924954wmi.27.2020.06.10.00.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 00:56:17 -0700 (PDT)
Date:   Wed, 10 Jun 2020 08:56:15 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        david.m.ertman@intel.com, shiraz.saleem@intel.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 02/11] mfd: Add support for Kontron sl28cpld
 management controller
Message-ID: <20200610075615.GT4106@dell>
References: <20200608185651.GD4106@dell>
 <32231f26f7028d62aeda8fdb3364faf1@walle.cc>
 <20200609064735.GH4106@dell>
 <32287ac0488f7cbd5a7d1259c284e554@walle.cc>
 <20200609151941.GM4106@dell>
 <95e6ec9bbdf6af7a9ff9c31786f743f2@walle.cc>
 <20200609194505.GQ4106@dell>
 <3a6931248f0efcaf8efbb5425a9bd833@walle.cc>
 <20200610071940.GS4106@dell>
 <f7b2b690750edd022000ab56d2f58154@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7b2b690750edd022000ab56d2f58154@walle.cc>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 10 Jun 2020, Michael Walle wrote:

> Am 2020-06-10 09:19, schrieb Lee Jones:
> > On Wed, 10 Jun 2020, Michael Walle wrote:
> > > Am 2020-06-09 21:45, schrieb Lee Jones:
> > > > On Tue, 09 Jun 2020, Michael Walle wrote:
> > > > > > We do not need a 'simple-regmap' solution for your use-case.
> > > > > >
> > > > > > Since your device's registers are segregated, just split up the
> > > > > > register map and allocate each sub-device with it's own slice.
> > > > >
> > > > > I don't get it, could you make a device tree example for my
> > > > > use-case? (see also above)
> > > >
> > > >     &i2cbus {
> > > >         mfd-device@10 {
> > > >             compatible = "simple-mfd";
> > > >             reg = <10>;
> > > >
> > > >             sub-device@10 {
> > > >                 compatible = "vendor,sub-device";
> > > >                 reg = <10>;
> > > >             };
> > > >    };
> > > >
> > > > The Regmap config would be present in each of the child devices.
> > > >
> > > > Each child device would call devm_regmap_init_i2c() in .probe().
> > > 
> > > Ah, I see. If I'm not wrong, this still means to create an i2c
> > > device driver with the name "simple-mfd".
> > 
> > Yes, it does.
> > 
> > > Besides that, I don't like this, because:
> > >  - Rob already expressed its concerns with "simple-mfd" and so on.
> > 
> > Where did this take place?  I'd like to read up on this.
> 
> In this thread:
> https://lore.kernel.org/linux-devicetree/20200604211039.12689-1-michael@walle.cc/T/#m16fdba5962069e7cd4aa817582ee358c9fe2ecbf
> 
> > 
> > >  - you need to duplicate the config in each sub device
> > 
> > You can have a share a single config.
> > 
> > >  - which also means you are restricting the sub devices to be
> > >    i2c only (unless you implement and duplicate other regmap configs,
> > >    too). For this driver, SPI and MMIO may be viable options.
> > 
> > You could also have a shared implementation to choose between different
> > busses.
> 
> Then what is the difference between to have this shared config in the
> parent driver only and use the functions which are already there, i.e.
> dev_get_regmap(parent). But see, below, I'll wait with what you're
> coming up.

The difference is the omission of an otherwise pointless/superfluous
driver.  Actually, it's the difference between the omission of 10
pointless drivers!

> > > Thus, I'd rather implement a simple-mfd.c which implement a common
> > > I2C driver for now and populate its children using
> > > devm_of_platform_populate(). This could be extended to support other
> > > type of regmaps like SPI in the future.
> > > 
> > > Also some MFD drivers could be moved to this, a likely candidate is
> > > the smsc-ece1099.c. Although I don't really understand its purpose,
> > > if don't have CONFIG_OF.
> > > 
> > > Judging from the existing code, this simple-mfd.c wouldn't just be
> > > "a list of compatible" strings but also additional quirks and tweaks
> > > for particular devices in this list.
> > 
> > Hold off on the simple-mfd.c idea, as I'm not taken by it yet and
> > wouldn't want you to waste your time.  I have another idea which would
> > help.  Give me a few days to put something together.
> 
> Sure. I'm just glad there is now a discussion about this issue.

It's very much in my mind.

I've been meaning to do something about it for quite some time.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
