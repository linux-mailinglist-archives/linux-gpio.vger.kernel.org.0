Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955C931AB06
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Feb 2021 12:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhBML1W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Feb 2021 06:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhBML1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Feb 2021 06:27:12 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E522CC061756
        for <linux-gpio@vger.kernel.org>; Sat, 13 Feb 2021 03:26:30 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id m1so2366867wml.2
        for <linux-gpio@vger.kernel.org>; Sat, 13 Feb 2021 03:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k/YMRgzTFrs6z62URGG8KDtcSToOtuKZn+r+kNRlu3Y=;
        b=gmCvzE9rR946iY1RLr1aaI+s8qM0QQfOH8/UD1RPsDhqxWbwXYyu5fY30ac0LB1AY9
         WpK3W7lI5EUNNi3c64WO8QNNVpzD5Iqe4IdeSVmu7ef/tE47got2F/LKtg50uDAP/EbL
         e4LjzuwmMxhGf52K0uH1z882RAEJMG4gJRNBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k/YMRgzTFrs6z62URGG8KDtcSToOtuKZn+r+kNRlu3Y=;
        b=AEAyb+evoRuZGK/WdgIXHKJPbVbHBu2OWk3W3s30UsaIRpA/Tv+QsBqaxxGGRwWdA+
         kcWJFYvY+VKM5SvPRQTQzkoidP0zGOrk+TGJnAKDAzSCxupUR7udsItNB3gh1E3eL747
         rdFzx5atjIQ974O0O7DQJvTMiPjIvY6tlFjUPSL/z2mW+yrapWjMSEH4NVD/eq4GfWFs
         PkThqc1O6fZLU4OLAdEDmfXhBvra9I/oZfzHKS+GUB+FWR8ngMKv2vegQvIAhq3inodv
         W6nG4PtwGljO3EFPEAwS9jlVmqxGdpYMf6BcBKVwfb+dg6+A4RKi2V/Xo76YOeCZPyge
         2IQQ==
X-Gm-Message-State: AOAM533rgQPKE2k6OuBTidJsRs236PtlErzb4mE58SRMLylX97dDmYhU
        ncnTapss8O0exoI/RYJPf3R/TZPHn+mdM/pHe22wWw==
X-Google-Smtp-Source: ABdhPJxg57H5gBCt+CFRR+XKNceZnnXN7lDrf+njVXGixPWG60cuQXEmRR3WzORqbQhd01PWI2R3kIE1HO6tZLuqMZo=
X-Received: by 2002:a1c:40d4:: with SMTP id n203mr6410811wma.46.1613215589262;
 Sat, 13 Feb 2021 03:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20210130082128.3778939-1-michael@amarulasolutions.com>
 <CAOMZO5DyKDj_RjHM-qwcU9gcuROL6OYzDj3a_fdRRqCwOxWcdw@mail.gmail.com>
 <CAOf5uwmSR1MjGdFd2ShHWchrdL6Kxo1HJOys9JoVP1vCDX57Lw@mail.gmail.com>
 <CACRpkdbmZY-v4PD5MieT63uCTTzoYb8CbwWE7rrCCELjCUzrug@mail.gmail.com> <CAOf5uw=JbB_hyxvcbLVz9_N0-T-ogXReNeY15VF5rETggnA1+Q@mail.gmail.com>
In-Reply-To: <CAOf5uw=JbB_hyxvcbLVz9_N0-T-ogXReNeY15VF5rETggnA1+Q@mail.gmail.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Sat, 13 Feb 2021 12:26:17 +0100
Message-ID: <CAOf5uwnCQ0um3Ya=wD2H_uBGHrEUoXt925eA2OLxY+b6oKqYcQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Support pin that does not support configuration option
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Fabio

On Fri, Feb 12, 2021 at 9:31 AM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi
>
> On Fri, Feb 12, 2021 at 9:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Mon, Feb 1, 2021 at 12:54 PM Michael Nazzareno Trimarchi
> > <michael@amarulasolutions.com> wrote:
> > > On Mon, Feb 1, 2021 at 12:47 PM Fabio Estevam <festevam@gmail.com> wrote:
> > > >
> > > > Hi Michael,
> > > >
> > > > On Sat, Jan 30, 2021 at 5:21 AM Michael Trimarchi
> > > > <michael@amarulasolutions.com> wrote:
> > > > >
> > > > > Some of the iMX25 pins have not an associated configuration register so
> > > > > when they are configured the standard way through the device tree the
> > > > > kernel complains with:
> > > > >
> > > > > imx25-pinctrl 43fac000.iomuxc: Pin(MX25_PAD_EXT_ARMCLK) does not support
> > > > > config function
> > > >
> > > > Could you please share your device tree that causes this warning?
> > > >
> > > > Shouldn't you pass 0x80000000 in the devicetree for this pad then?
> > > >
> > > > 0x80000000 means that the kernel should not touch the PAD_CTL register
> > > > and use the default configuration from the bootloader/POR.
> > >
> > > arch/arm/boot/dts/imx25-lisa.dts:
> > > MX25_PAD_EXT_ARMCLK__GPIO_3_15  0x80000000
> > >
> > > The problem that exists pad that can be muxed but not configured
> >
> > Did you reach any conclusion on this?
> >
> > I need Fabio's consent to apply the patch, but it seems maybe the
> > DTS should be changed instead?
> >
>
> Let me re-check with the latest linux code. I did not find any change
> there. It's on my side
> now

Looking at the code (I will ask to check on real hw) seems that
conf_reg is -1 when there is no conf_reg.
the pinmux core set_state just calls the pin_config_set and one pin
can have the mux supported and the config
not supported. And imx25 has several of them that are only muxed.
Seems that this NO_CTL_PAD is something
that is nxp

 clk_osc_audio: clk-osc-audio {
                compatible = "gpio-gate-clock";
                pinctrl-names = "default";
                pinctrl-0 = <&pinctrl_clk26mhz_osc>;
                clocks = <&clksis>;
                #clock-cells = <0>;
                enable-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
        };

this is my use case
 pinctrl_clk26mhz_osc: clk26mhzosc {
                        fsl,pins = <
                                MX25_PAD_EXT_ARMCLK__GPIO_3_15  0x80000000
                        >;
                };

Michael




>
> Michael
>
> > Yours,
> > Linus Walleij
>
>
>
> --
> Michael Nazzareno Trimarchi
> Amarula Solutions BV
> COO Co-Founder
> Cruquiuskade 47 Amsterdam 1018 AM NL
> T. +31(0)851119172
> M. +39(0)3479132170
> [`as] https://www.amarulasolutions.com



-- 
Michael Nazzareno Trimarchi
Amarula Solutions BV
COO Co-Founder
Cruquiuskade 47 Amsterdam 1018 AM NL
T. +31(0)851119172
M. +39(0)3479132170
[`as] https://www.amarulasolutions.com
