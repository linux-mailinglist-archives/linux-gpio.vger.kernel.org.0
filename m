Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B74D313BB10
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 09:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729266AbgAOI31 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 03:29:27 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38016 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729256AbgAOI3V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 03:29:21 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so14828013wrh.5
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 00:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3GK5Djc6Es4Lf2bms5LobhRrB6cfPeA6TPSSmCtuW7o=;
        b=pxINdBipIObKzAeju8UwLEZAh1c5Lz1AFYRX/gAiXp8HUgwfqjdIyb/QJQy8cq+DGJ
         G1TfipKXPwr+RZM/eigUSHh5njYxyxJZKjJKCrRroT1Rn0/X8060NszcvuJnUWQ3pKq9
         i9lA5p3Q1AUb8ZoVC/koPJs1YWYGrmRXX7YlokbI2szyEJ84euHOPRCiCyQGQEUfLhKF
         lN/1qkVsQZSmhhBxica9csSceRRk4mUwyx3bsn93E4AuWl8gLuDD8fxO0lc5XB8QUORb
         94ecpjrpXdaL3osYQWCL5R3SF0gGpKlUlb6qqYB9ywtCqBxyDGWk1lOqGWUu/kpCRtiy
         Gn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3GK5Djc6Es4Lf2bms5LobhRrB6cfPeA6TPSSmCtuW7o=;
        b=ih0JPglfs/u+BFQikeh0MNWAmA5eqvS4EsinV73deMIp4l4/7cGJc6zi4NI7DBc9ZU
         VCfiRlHvMVt4iFpEFVXC5w1e2Brav7olaEhjvuMxG7ZcsyVOnzA6LdLQsKcW5y0+auPU
         Rg/Njj/5vUrfG6anYAlY8z8hBCnn22oklq/snxtf4CgpNvsRl/LSNCdtRHo8fReZrW4b
         Ux3IJqVOJBHkmQtHkJ6GVoL3ydi4Mj7mnD/E0Cbud9KNREeiAR9HJgwQigh8iUCbDfjh
         DdUKPrB/2fWnIbcxikIBLkh7ev7ZnGaLSHFOeKAeXQykoPKat5x2XcYwcAOD7RTdzUM7
         UgsA==
X-Gm-Message-State: APjAAAW9cV/Xdtk4jUeLvy1gEPgSCs4uWkKXcYe4BnWHEBsO/bUBGAlv
        jvBOwtpCNX8L26JKN9PeowGYjg==
X-Google-Smtp-Source: APXvYqxg5fYMbpzJkbMnE9bwu+VJEIcsdrHoYIUzhPAxEC31+lysJdWQxte1D3bkl5SWo9KJvHl4Nw==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr29019061wrm.290.1579076959924;
        Wed, 15 Jan 2020 00:29:19 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id b16sm24408442wrj.23.2020.01.15.00.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 00:29:18 -0800 (PST)
Date:   Wed, 15 Jan 2020 08:29:37 +0000
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
Message-ID: <20200115082937.GD325@dell>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
 <d247d71e183b388dd7f211aee1235965cff979b4.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
 <20200107124124.GI14821@dell>
 <32f8fa4201ae99df64e7a39c6a69be2bef179f7b.camel@fi.rohmeurope.com>
 <20200113105301.GF5414@dell>
 <ab72ce13d008a0d5e9cd753b87fe397953210f70.camel@fi.rohmeurope.com>
 <20200113121109.GG5414@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200113121109.GG5414@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 13 Jan 2020, Lee Jones wrote:
> On Mon, 13 Jan 2020, Vaittinen, Matti wrote:
> > On Mon, 2020-01-13 at 10:53 +0000, Lee Jones wrote:
> > > On Wed, 08 Jan 2020, Vaittinen, Matti wrote:
> > > > On Tue, 2020-01-07 at 12:41 +0000, Lee Jones wrote:
> > > > > On Mon, 30 Dec 2019, Matti Vaittinen wrote:
> > > > > 
> > > > > > Few ROHM PMICs allow setting the voltage states for different
> > > > > > system states
> > > > > > like RUN, IDLE, SUSPEND and LPSR. States are then changed via
> > > > > > SoC
> > > > > > specific
> > > > > > mechanisms. bd718x7 driver implemented device-tree parsing
> > > > > > functions for
> > > > > > these state specific voltages. The parsing functions can be re-
> > > > > > used 
> > > > > > by
> > > > > > other ROHM chip drivers like bd71828. Split the generic
> > > > > > functions
> > > > > > from
> > > > > > bd718x7-regulator.c to rohm-regulator.c and export them for
> > > > > > other
> > > > > > modules
> > > > > > to use.
> > > > > > 
> > > > > > Signed-off-by: Matti Vaittinen <
> > > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > > Acked-by: Mark Brown <broonie@kernel.org>
> > > > > > ---
> > > 
> > > [...]
> > > 
> > > > > > +#if IS_ENABLED(CONFIG_REGULATOR_ROHM)
> > > > > > +int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config
> > > > > > *dvs,
> > > > > > +				  struct device_node *np,
> > > > > > +				  const struct regulator_desc
> > > > > > *desc,
> > > > > > +				  struct regmap *regmap);
> > > > > 
> > > > > Does these really need to live in the parent's header file?
> > > > 
> > > > I don't know what would be a better place?
> > > 
> > > You don't have a regulator header file?
> > > 
> > > It seems over-kill to create one for this, so leave it as is.
> > > 
> > > > > What other call-sites are there?
> > > > 
> > > > After this series the bd718x7-regulator.c and bd71828-regulator.c
> > > > are
> > > > the in-tree drivers using these. rohm-regulator.c is implementing
> > > > them.
> > > > And I hope we see yet another driver landing in later this year. 
> > > > 
> > > > Anyways, I will investigate if I can switch this to some common
> > > > (not
> > > > rohm specific) DT bindings at some point (I've scheduled this study
> > > > to
> > > > March) - If I can then they should live in regulator core headers.
> > > > 
> > > > But changing the existing properties should again be own set of
> > > > patches
> > > > and I'd prefer doing that work independently of this series and not
> > > > delaying the BD71828 due to not-yet-evaluated bd718x7 property
> > > > changes.
> > > 
> > > That's fine.
> > 
> > Glad to hear :) By the way, I already sent the v9 ;)
> 
> It's in my queue.

Although you didn't submit the whole set to me, so I only have a few
of the patches.  Why did you choose to do that this time?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
