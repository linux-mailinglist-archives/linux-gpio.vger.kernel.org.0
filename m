Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319B4140B19
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 14:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgAQNkO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 08:40:14 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36473 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgAQNkO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 08:40:14 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so7688102wma.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 05:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=x0v+Cpelm9h83Fd8YoEOutozcn/2jODQn8Ym6ta3pDI=;
        b=poWzvnimT8QTMy+z+ojdYjNwWKCfVW89Yxmci6IP1hOwVnknCtXaCr8i8dPxqfj1c6
         6NHh9Vy22UuVjsdvRslMJxmzZ2r72OldpIzBGyTPzKMTdk2Z9oSf67RccUHaMNaQhd+k
         lm/c63jSCsXUx2RU7tiHMS5C5Y2FizJpTWV+bQFZk8UuOie9JPNvsSkh5+vGRPhAp0aq
         HK0OQ1Srf/D3qXPwbVceBBawRHCIp88uRHmu2HP+uHbb1PD3am4Blq1K6Lz24AmMxi2p
         OWYnjJ/q+UHi4g8eny5q5ITFQpVAiYSQZTcj7rH44ZY1d2LCEmOKY9qNl6Wk1issBSPO
         JpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=x0v+Cpelm9h83Fd8YoEOutozcn/2jODQn8Ym6ta3pDI=;
        b=lLWD8OzitmVCQHV6fVM6zz5OCpjAgx11JC22MZuU+0QuEU14nalziPcEG9LweU6Uhf
         k3mnovvfvjVOpS36HBGFL3jbV6CyAvv+gWy6R3jxRuHMvTOefJQeoOzdFuvmxmfxL1z6
         2/TnfkJVbDXhrzPnzXw2zxbtbHRdFjK0UO+QCasIbQrivUqbNeniwwGDMtKI48vSU/JA
         SWKLWsWeK3KpmfsHsN2RV9jxnkOGzACr5zsqO82DLBY3Dvqn0dpYEcDSYJiO/CF9eEoT
         VN1rvmTk+aIlgmGcsfmxIgt1oQ2pzeqoKuPT66DyVdL8gqjTEplJ8LdSFbKAugYMYO4c
         eaqA==
X-Gm-Message-State: APjAAAXu269PLeivKaILi18ske5m0t6VxprNGMrp7+lgct1Qs0lXBK6N
        xPQjlN4ogZhES+/oyrZVbSBtjw==
X-Google-Smtp-Source: APXvYqxGyR41SDvj5mCeLz1WXPpVshSUQyPXa3ccVTn3jG4GO+EYu0SQxB8cs1Dtg2CXlW/4Esj78Q==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr4598002wmk.116.1579268411354;
        Fri, 17 Jan 2020 05:40:11 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id s8sm32993260wrt.57.2020.01.17.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 05:40:10 -0800 (PST)
Date:   Fri, 17 Jan 2020 13:40:26 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v10 08/13] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Message-ID: <20200117134026.GM15507@dell>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <def409ab024717e6cd917c488e62fe04ad66bd52.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <20200117102854.GF15507@dell>
 <4bd035fb2c78e96f18006f06c5d8d9d2f1a1b70d.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd035fb2c78e96f18006f06c5d8d9d2f1a1b70d.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 17 Jan 2020, Vaittinen, Matti wrote:

> Hello Lee,
> 
> On Fri, 2020-01-17 at 10:28 +0000, Lee Jones wrote:
> > On Fri, 17 Jan 2020, Matti Vaittinen wrote:
> > 
> > > Few ROHM PMICs allow setting the voltage states for different
> > > system states
> > > like RUN, IDLE, SUSPEND and LPSR. States are then changed via SoC
> > > specific
> > > mechanisms. bd718x7 driver implemented device-tree parsing
> > > functions for
> > > these state specific voltages. The parsing functions can be re-used 
> > > by
> > > other ROHM chip drivers like bd71828. Split the generic functions
> > > from
> > > bd718x7-regulator.c to rohm-regulator.c and export them for other
> > > modules
> > > to use.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > Acked-by: Mark Brown <broonie@kernel.org>
> > > ---
> > > no changes since v9
> > > 
> > >  drivers/regulator/Kconfig             |   4 +
> > >  drivers/regulator/Makefile            |   1 +
> > >  drivers/regulator/bd718x7-regulator.c | 183 ++++++++------------
> > > ------
> > >  drivers/regulator/rohm-regulator.c    |  95 +++++++++++++
> > >  include/linux/mfd/rohm-generic.h      |  66 ++++++++++
> > >  5 files changed, 221 insertions(+), 128 deletions(-)
> > >  create mode 100644 drivers/regulator/rohm-regulator.c
> > 
> > [...]
> > 
> > > diff --git a/include/linux/mfd/rohm-generic.h
> > > b/include/linux/mfd/rohm-generic.h
> > > index ff3dd7578fd3..6cc5a0819959 100644
> > > --- a/include/linux/mfd/rohm-generic.h
> > > +++ b/include/linux/mfd/rohm-generic.h
> > > @@ -4,6 +4,9 @@
> > >  #ifndef __LINUX_MFD_ROHM_H__
> > >  #define __LINUX_MFD_ROHM_H__
> > >  
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/driver.h>
> > > +
> > >  enum rohm_chip_type {
> > >  	ROHM_CHIP_TYPE_BD71837 = 0,
> > >  	ROHM_CHIP_TYPE_BD71847,
> > > @@ -17,4 +20,67 @@ struct rohm_regmap_dev {
> > >  	struct regmap *regmap;
> > >  };
> > >  
> > > +enum {
> > > +	ROHM_DVS_LEVEL_UNKNOWN,
> > > +	ROHM_DVS_LEVEL_RUN,
> > > +	ROHM_DVS_LEVEL_IDLE,
> > > +	ROHM_DVS_LEVEL_SUSPEND,
> > > +	ROHM_DVS_LEVEL_LPSR,
> > > +#define ROHM_DVS_LEVEL_MAX ROHM_DVS_LEVEL_LPSR
> > 
> > Haven't seen this before.  Is it legit?
> > 
> 
> I don't know why it wouldn't be :) I kind of grew used to that when I
> still did some networking stuff.

Networking it not a good example.

It's full of odd little quirks to the standard styling.

> It doesn't really matter in this case but for example the netlink
> headers do:
> 
> enum {
>    foo,
> #define foo foo
>    bar,
> #define bar bar
> ...
> };
> 
> https://elixir.bootlin.com/linux/v5.5-rc6/source/include/uapi/linux/rtnetlink.h
> 
> What is the good here is that this allows one to nicely exclude
> unsupported stuff using preprocessor:
> 
> #include <header_with_or_without_foo_dependng_on_version.h>
> 
> #ifdef foo
> use_foo(foo);
> #endif
> 
> What about:
> > 
> >      ROHM_DVS_LEVEL_MAX = ROHM_DVS_LEVEL_LPSR
> 
> Anyways, I don't see why define wouldn't be Ok here - but sure it can
> be changed if you insist ;) Just let me know if you can accept the
> define or not :)

Let's go for not in this instance. :D

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
