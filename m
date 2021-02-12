Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D894F319B37
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 09:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBLIcg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 03:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhBLIcf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 03:32:35 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF3DC061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:31:54 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id r21so6906197wrr.9
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bFLMZJzO2X7AmTjGDgiekh+q0A7ao7IABpMZ8vcxjN8=;
        b=VD/cMWDz1r7yuuCWpoD2JYGRcBEvhXg0FtVgb09VK0kA4Mhz5aEeK0ca0o8HHw9ZJ/
         mmxZrhsCQIEIGkfkw60OvRm4UotEbksbGpNMGYRE70ppb3w/EQLUuIh6lMhB9fAVf4Q4
         N06puEYH9rh17nO3jz4CBY5+zYYgoI65jXJ2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bFLMZJzO2X7AmTjGDgiekh+q0A7ao7IABpMZ8vcxjN8=;
        b=WLqxUssRU/QXpsmHWqaGNHH6ioU02kE9X0g4LXQKFz/BRMQ8Sb7Cn+wTshSGu/FHfb
         IjRq+4w8SFpqH/5AbLYamGZzS8ur2htfYa6m70qpd5Vr9tj/Pgz0Mj+TYYT9lE4mf44c
         XrhbsXvLJV+tk1J081aIEGm10reGAnxzdlnVGk5Dm7mI9094tWm0qiFptHvNVH6U4Stb
         sE2x980f2DdyeIvlMlqEF+PlIWpAp1aL6UxZ6lehvOQIVyq2o7YnMt+VxIaTje573e/g
         dUuR5NkfSsIAQNTB4pYSLcUQ4TajEra0r6djTsvlZ3g82S+cXvwWLzN2jZAgD8f7s3E1
         qsXQ==
X-Gm-Message-State: AOAM533AU6besWg88O5n44YxZRCENy3c9HcheeEcVRl427EqwttrNaF/
        er7DPjCE/o3BUGyz2UmCtNKInN+gimLwHcNTFGWfcw==
X-Google-Smtp-Source: ABdhPJzSr6aLE29aM/ZlEZX/JDiDaDUgstNWlulXfXxAzZw6jEjWor+NQrBUqiPD9cTuvoM6S1L1nIDVoGjO/IA7c/0=
X-Received: by 2002:a05:6000:1043:: with SMTP id c3mr2189193wrx.140.1613118712788;
 Fri, 12 Feb 2021 00:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20210130082128.3778939-1-michael@amarulasolutions.com>
 <CAOMZO5DyKDj_RjHM-qwcU9gcuROL6OYzDj3a_fdRRqCwOxWcdw@mail.gmail.com>
 <CAOf5uwmSR1MjGdFd2ShHWchrdL6Kxo1HJOys9JoVP1vCDX57Lw@mail.gmail.com> <CACRpkdbmZY-v4PD5MieT63uCTTzoYb8CbwWE7rrCCELjCUzrug@mail.gmail.com>
In-Reply-To: <CACRpkdbmZY-v4PD5MieT63uCTTzoYb8CbwWE7rrCCELjCUzrug@mail.gmail.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Fri, 12 Feb 2021 09:31:40 +0100
Message-ID: <CAOf5uw=JbB_hyxvcbLVz9_N0-T-ogXReNeY15VF5rETggnA1+Q@mail.gmail.com>
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

Hi

On Fri, Feb 12, 2021 at 9:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Feb 1, 2021 at 12:54 PM Michael Nazzareno Trimarchi
> <michael@amarulasolutions.com> wrote:
> > On Mon, Feb 1, 2021 at 12:47 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > Hi Michael,
> > >
> > > On Sat, Jan 30, 2021 at 5:21 AM Michael Trimarchi
> > > <michael@amarulasolutions.com> wrote:
> > > >
> > > > Some of the iMX25 pins have not an associated configuration register so
> > > > when they are configured the standard way through the device tree the
> > > > kernel complains with:
> > > >
> > > > imx25-pinctrl 43fac000.iomuxc: Pin(MX25_PAD_EXT_ARMCLK) does not support
> > > > config function
> > >
> > > Could you please share your device tree that causes this warning?
> > >
> > > Shouldn't you pass 0x80000000 in the devicetree for this pad then?
> > >
> > > 0x80000000 means that the kernel should not touch the PAD_CTL register
> > > and use the default configuration from the bootloader/POR.
> >
> > arch/arm/boot/dts/imx25-lisa.dts:
> > MX25_PAD_EXT_ARMCLK__GPIO_3_15  0x80000000
> >
> > The problem that exists pad that can be muxed but not configured
>
> Did you reach any conclusion on this?
>
> I need Fabio's consent to apply the patch, but it seems maybe the
> DTS should be changed instead?
>

Let me re-check with the latest linux code. I did not find any change
there. It's on my side
now

Michael

> Yours,
> Linus Walleij



-- 
Michael Nazzareno Trimarchi
Amarula Solutions BV
COO Co-Founder
Cruquiuskade 47 Amsterdam 1018 AM NL
T. +31(0)851119172
M. +39(0)3479132170
[`as] https://www.amarulasolutions.com
