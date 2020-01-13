Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75BE31390DA
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2020 13:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgAMMK4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 07:10:56 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41170 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgAMMKx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 07:10:53 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so8296957wrw.8
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 04:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WBfLyLnxB/57Tfgm5ZKZyPtCmfHaakxN3M7SxJ598pA=;
        b=gUIejq+FCx8Kd6HvjLMU8Nn1XtbcJ8M/jb0ryLOxB4/zVBuKYX4Af8SLra9eJs4rcB
         mghg3QF8PPQNWvjwOAiVdwcSKLrvUlD57Ufq0i7SOK/qR+0UNHRDR60OFB5lvntqzNTu
         cu/o0c5QoHplbht9CBc/FT8dE/Qs9MJ/hHR+zNX6ciZxIM+gEzATdOQ6DekDQYvxm+Hq
         coYzl5K4gougiM/zugUm0SpSjhtHCDP5PDewrpJ7SkFqDI7kQoZhX7RBBi+Kp8J/QRj8
         b9h5efbNYhOIsDtIFMb0+S+PQKoOuQsMHi34A9odAr2wmItf2LEGgYfuYCF0f/xhMBSL
         mEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WBfLyLnxB/57Tfgm5ZKZyPtCmfHaakxN3M7SxJ598pA=;
        b=VDdA2FUyycrmeySGs63BzwWcFfHHIVAIJdLVI8Y+7a2ebmmAhLRd+GzgnRvsPq/VE6
         8xIwmgwMFTq72g40ZdAtdq+6Rs62e/97K+amUBsV/tK+QITbsTkvOyL+CyVQg0KR7ZZk
         w7mG7bvE14YpHZJIhGnidgRw/Sq2P0/jJVzFrn7WeRiJr8MPz5sS+e8UDIYjQVOtssmZ
         7fxfEw+VyP1UXLzM68PbVyrw4/tnZaFFcw9bIVZJtOAcMmovFD3130FJZje9dwU0WdiS
         P5iROSkmY9MUaVY3hjgEGBSMjRBa2ZNPnnHsSaMb1KAuBfQ3ctnpcnyiDIqZLRdPgUhu
         /9cQ==
X-Gm-Message-State: APjAAAXb3tvRkRnvtbgIx7qC5ZdNoEnLDKPMAyEQX705ZqganN01aTXT
        GIsQ7zpJkpTF1pAF+skX0ghh2A==
X-Google-Smtp-Source: APXvYqwEQVVqvqvjsj+6jgiSXpHXeqdDkCbyvYTNsbrb9Hsh7vYWqFLAsxhpBg00+gIiid7GIRicMQ==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr18025079wro.310.1578917449742;
        Mon, 13 Jan 2020 04:10:49 -0800 (PST)
Received: from dell ([95.147.198.95])
        by smtp.gmail.com with ESMTPSA id s3sm14052259wmh.25.2020.01.13.04.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 04:10:49 -0800 (PST)
Date:   Mon, 13 Jan 2020 12:11:09 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v8 08/12] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Message-ID: <20200113121109.GG5414@dell>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
 <d247d71e183b388dd7f211aee1235965cff979b4.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
 <20200107124124.GI14821@dell>
 <32f8fa4201ae99df64e7a39c6a69be2bef179f7b.camel@fi.rohmeurope.com>
 <20200113105301.GF5414@dell>
 <ab72ce13d008a0d5e9cd753b87fe397953210f70.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab72ce13d008a0d5e9cd753b87fe397953210f70.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 13 Jan 2020, Vaittinen, Matti wrote:

> Hello Lee,
> 
> On Mon, 2020-01-13 at 10:53 +0000, Lee Jones wrote:
> > On Wed, 08 Jan 2020, Vaittinen, Matti wrote:
> > 
> > > Hello Lee,
> > > 
> > > On Tue, 2020-01-07 at 12:41 +0000, Lee Jones wrote:
> > > > On Mon, 30 Dec 2019, Matti Vaittinen wrote:
> > > > 
> > > > > Few ROHM PMICs allow setting the voltage states for different
> > > > > system states
> > > > > like RUN, IDLE, SUSPEND and LPSR. States are then changed via
> > > > > SoC
> > > > > specific
> > > > > mechanisms. bd718x7 driver implemented device-tree parsing
> > > > > functions for
> > > > > these state specific voltages. The parsing functions can be re-
> > > > > used 
> > > > > by
> > > > > other ROHM chip drivers like bd71828. Split the generic
> > > > > functions
> > > > > from
> > > > > bd718x7-regulator.c to rohm-regulator.c and export them for
> > > > > other
> > > > > modules
> > > > > to use.
> > > > > 
> > > > > Signed-off-by: Matti Vaittinen <
> > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > Acked-by: Mark Brown <broonie@kernel.org>
> > > > > ---
> > 
> > [...]
> > 
> > > > > +#if IS_ENABLED(CONFIG_REGULATOR_ROHM)
> > > > > +int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config
> > > > > *dvs,
> > > > > +				  struct device_node *np,
> > > > > +				  const struct regulator_desc
> > > > > *desc,
> > > > > +				  struct regmap *regmap);
> > > > 
> > > > Does these really need to live in the parent's header file?
> > > 
> > > I don't know what would be a better place?
> > 
> > You don't have a regulator header file?
> > 
> > It seems over-kill to create one for this, so leave it as is.
> > 
> > > > What other call-sites are there?
> > > 
> > > After this series the bd718x7-regulator.c and bd71828-regulator.c
> > > are
> > > the in-tree drivers using these. rohm-regulator.c is implementing
> > > them.
> > > And I hope we see yet another driver landing in later this year. 
> > > 
> > > Anyways, I will investigate if I can switch this to some common
> > > (not
> > > rohm specific) DT bindings at some point (I've scheduled this study
> > > to
> > > March) - If I can then they should live in regulator core headers.
> > > 
> > > But changing the existing properties should again be own set of
> > > patches
> > > and I'd prefer doing that work independently of this series and not
> > > delaying the BD71828 due to not-yet-evaluated bd718x7 property
> > > changes.
> > 
> > That's fine.
> 
> Glad to hear :) By the way, I already sent the v9 ;)

It's in my queue.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
