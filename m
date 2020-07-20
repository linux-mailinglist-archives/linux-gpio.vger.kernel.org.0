Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3C92258D5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 09:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgGTHnS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 03:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgGTHnR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 03:43:17 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813FFC0619D6
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 00:43:17 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 17so24115202wmo.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 00:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=m6yytUMdKpAiiKF/+CcuV8LMm9NpXNcKGc9Sb6F7cqo=;
        b=IVK09e1ld+9cwoXx1bqDODaFImU/E8BERDq0mWlu1Dh3gZ8IilQ3NLb5AgUJs2EZ6A
         DOpTQs9i1N8ia2cP2g7Hb9P6XoaJ7E0SsvqJvP109FQdN1+ZnJhAs2U+kTjtokXyi7kX
         KZWHKc+5M16aNSA+dKO3bVZQ3Ch6eBOqPwHOhmW6ZcCXCA9lkNv0mus2J2Dg295523dN
         wlMsuRQmfpFIbc8P/E473L2Usu9r1pSH6N0HzqC+VSRl0++AZtaLlfi6afz/RKsfOi1+
         pBDqXeB4fWSWXBmqduD5AQBaV8vSZx9hm2B0U5J2k7sG/cAbFhzBStssMGIksHjKYPH5
         ApOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=m6yytUMdKpAiiKF/+CcuV8LMm9NpXNcKGc9Sb6F7cqo=;
        b=IoPwuPEAVcc4+W867FhfnztTGlV55wVDiW+u/eeCsHbFbzt5CJugG3cR9xxljXVnlw
         axjLxZky+NTBMY+hC0d65Q5jCfivOP1KWl48II+0XgzG5+S+f3eZMJQEdWZ9AXebPshb
         aJIzWLyZMkRQ/U40cuJKUHlnFNWP6wW7IfhCKBruvOjPNRMnsmfadkYfPmbWLqsFOlYs
         iPM/kVIFklnmEeGN7EMmzq/wA4cSy/9dAiWjOP3hhbZ7R9Da33StaEQH1DRTY/5CA0gb
         +uAWZ3FGO/wQZj7uH5lWQGaAZzQaNKv8NIYjmQbKrlB/6uZfEC4wmsFfhpdimPRrmDFh
         iHQA==
X-Gm-Message-State: AOAM531uPG24cWsvmyjgFxddiHlPZwR2whnoUVQ2gbO/rWc0DWGxh2Su
        0ne0xNQPIRz1TwZySLFQRgTMiA==
X-Google-Smtp-Source: ABdhPJzdJSdBbBWM2quCXUnipLg3+n/33qPK8Rxd7dlcJHIfTbXk90f6awCJz9w28J/D1s9VK8ooPw==
X-Received: by 2002:a1c:408b:: with SMTP id n133mr20209577wma.88.1595230995865;
        Mon, 20 Jul 2020 00:43:15 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id o7sm17531643wrv.50.2020.07.20.00.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 00:43:15 -0700 (PDT)
Date:   Mon, 20 Jul 2020 08:43:12 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 02/13] mfd: add simple regmap based I2C driver
Message-ID: <20200720074312.GL3165313@dell>
References: <20200706175353.16404-1-michael@walle.cc>
 <20200706175353.16404-3-michael@walle.cc>
 <20200717090656.GF3165313@dell>
 <52d85ea1ddc488762df547168e2001e9@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52d85ea1ddc488762df547168e2001e9@walle.cc>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 20 Jul 2020, Michael Walle wrote:

> Am 2020-07-17 11:06, schrieb Lee Jones:
> > On Mon, 06 Jul 2020, Michael Walle wrote:
> > 
> > > There are I2C devices which contain several different functions but
> > > doesn't require any special access functions. For these kind of
> > > drivers
> > > an I2C regmap should be enough.
> > > 
> > > Create an I2C driver which creates an I2C regmap and enumerates its
> > > children. If a device wants to use this as its MFD core driver, it has
> > > to add an individual compatible string. It may provide its own regmap
> > > configuration.
> > > 
> > > Subdevices can use dev_get_regmap() on the parent to get their regmap
> > > instance.
> > > 
> > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > ---
> > > Changes since v4:
> > >  - new patch. Lee, please bear with me. I didn't want to delay the
> > >    new version (where a lot of remarks on the other patches were
> > >    addressed) even more, just because we haven't figured out how
> > >    to deal with the MFD part. So for now, I've included this one.
> > > 
> > >  drivers/mfd/Kconfig          |  9 +++++++
> > >  drivers/mfd/Makefile         |  1 +
> > >  drivers/mfd/simple-mfd-i2c.c | 50
> > > ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 60 insertions(+)
> > >  create mode 100644 drivers/mfd/simple-mfd-i2c.c
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 33df0837ab41..f1536a710aca 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1162,6 +1162,15 @@ config MFD_SI476X_CORE
> > >  	  To compile this driver as a module, choose M here: the
> > >  	  module will be called si476x-core.
> > > 
> > > +config MFD_SIMPLE_MFD_I2C
> > > +	tristate "Simple regmap based I2C devices"
> > 
> > Doesn't look like tristate to me.
> > 
> > Haven't you made this builtin only?
> 
> Mh yeah, I forgot to change it to module in the driver. I don't
> know whats better though, have it tristate or just offer a boolean
> option because it should be small anyway. What do you think?
> My interrupt driver will force it to boolean anyway.

Better to give consumers the choice I think.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
