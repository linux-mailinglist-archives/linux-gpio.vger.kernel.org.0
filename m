Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D1C227370
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 02:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbgGUAEm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 20:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgGUAEm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 20:04:42 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E46AC0619D2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 17:04:42 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id h17so15830052oie.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 17:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xOY9CX+MZHC2V2Y5UgG6sQVWIz0SPS7mgtXJ/kyBZLQ=;
        b=OI1GkTyWGwpZMaOMU8iZTFA5YLZeTO4J0Gi6nqF6lqBL8xCBBte3BfsQtK+anpB/UZ
         WagIowBQjTb81OiMOAVj9dHWBzpmq1XzrYVi5LKy0cODqOLYm0NgkKgyxVD0ZNC5Wlf5
         JfRr4uQ3/RTR4r/PU1cg2DbuaPGaos3ufKUlJYYkW+bDqbjuTedVYKYGILWMdD84AefQ
         Ob1vx8oKp2oFepYfJS2UAmvnOVVQuq6wqAwDnXIjfQFza5V8BrrRC1xeV8aJNCYNG/zp
         7BqyIfKubSLmw/3cB1q40v0c6kAairj9PAnDAJoMrAV2K5yLUdZIH0wBYVZYhJSki4aW
         y9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xOY9CX+MZHC2V2Y5UgG6sQVWIz0SPS7mgtXJ/kyBZLQ=;
        b=lKhrJqhJP3QcpBoRbGoJCB76zbjEjm12Ny2R7653wk4uYXiumloVjOe53XF70AUvGX
         br8jCYM5rVHLImPvbV4eXBulq4syKN6VTnBD0ekyDWfSe+Ywef7ozwh1H9GQKfQDa9k3
         A6lI6JrNKL9duBUkQmDYQHLGx+NCcCGwYHJa3YNaTWjVSrnMV14soTpsZ10OaAJl2qJD
         qWGdN+Z0PF2Nj4E1vZP/xjRoEWCOUOCqy/9e6IzoYEmR+mkv71gGCd+ssFENSBBRVeNc
         tZgZ1sEQ/x67pj1GBukgXqCOo/+rwiGBqrzyahbRbYjQX5tWaLRF8i40kfY9Sx0tHvxP
         ciKQ==
X-Gm-Message-State: AOAM532HkcGr90TGX+quqRG/7SCiBYzFH0ivTacoTJv8/VLSaf3C7Me0
        NPFLkBHtJzvMCMqmw1We4/pVrQ+UfQmKeWx9yJZ3wA==
X-Google-Smtp-Source: ABdhPJyIw00yYkCMTNNebpkMhEf28WTWCiIulbWVh7SUKb/B3kYYrZ5+9kuSB5UUB54aX4xHfjaezDWAR76+kzAr4kc=
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr1225134oif.169.1595289881299;
 Mon, 20 Jul 2020 17:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
In-Reply-To: <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 20 Jul 2020 17:04:29 -0700
Message-ID: <CALAqxLWy7PuNeq7383x5naGSC05+otJjGC=dHuT2RUEehoe+=A@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Anson Huang <anson.huang@nxp.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jon Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 5:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Greg, John,
>
> we need some guidance here. See below.
>
> On Thu, Jul 16, 2020 at 4:38 PM Anson Huang <anson.huang@nxp.com> wrote:
> > [Me]
> > > On Wed, Jul 15, 2020 at 4:44 AM Anson Huang <anson.huang@nxp.com>
>
> > > > I tried to replace the subsys_initcall() with
> > > > module_platform_driver(), but met issue about "
> > > > register_syscore_ops(&mxc_gpio_syscore_ops);" which is called in
> > > > gpio_mxc_init() function, this function should be called ONLY once,
> > > > moving it to .probe function is NOT working, so we may need to keep the
> > > > gpio_mxc_init(), that is another reason that we may need to keep
> > > > subsys_initcall()?
> > >
> > > This looks a bit dangerous to keep like this while allowing this code to be used
> > > from a module.
> > >
> > > What happens if you insmod and rmmod this a few times, really?
> > > How is this tested?
> > >
> > > This is not really modularized if that isn't working, just that modprobing once
> > > works isn't real modularization IMO, it seems more like a quick and dirty way
> > > to get Androids GKI somewhat working with the module while not properly
> > > making the module a module.
> > >
> > > You need input from the driver maintainers on how to handle this.
> >
> > As far as I know, some general/critical modules are NOT supporting rmmod, like
> > clk, pinctrl, gpio etc., and I am NOT sure whether Android GKI need to support
> > rmmod for these system-wide-used module, I will ask them for more detail about
> > this.
> >
> > The requirement I received is to support loadable module, but so far no hard requirement
> > to support module remove for gpio driver, so, is it OK to add it step by step, and this patch
> > series ONLY to support module build and one time modprobe?
>
> While I am a big fan of the Android GKI initiative this needs to be aligned
> with the Linux core maintainers, so let's ask Greg. I am also paging
> John Stultz on this: he is close to this action.
>
> They both know the Android people very well.
>
> So there is a rationale like this going on: in order to achieve GKI goals
> and have as much as possible of the Linux kernel stashed into loadable
> kernel modules, it has been elevated to modus operandi amongst
> the developers pushing this change that it is OK to pile up a load of
> modules that cannot ever be unloaded.
>
> This is IIUC regardless of whether all consumers of the module are
> actually gone: it would be OK to say make it impossible to rmmod
> a clk driver even of zero clocks from that driver is in use. So it is not
> dependency-graph problem, it is a "load once, never remove" approach.
>
> This rationale puts me as subsystem maintainer in an unpleasant spot:
> it is really hard to tell case-to-case whether that change really is a
> technical advantage for the kernel per se or whether it is done for the
> greater ecosystem of Android.
>
> Often I would say it makes it possible to build a smaller kernel vmlinux
> so OK that is an advantage. On the other hand I have an inkling that I
> should be pushing developers to make sure that rmmod works.
>
> As a minimum requirement I would expect this to be marked by
>
> struct device_driver {
>    (...)
>     /* This module absolutely cannot be unbound */
>    .suppress_bind_attrs = true;
> };
>
> So that noone would be able to try to unbind this (could even be an
> attack vector!)
>
> What is our broader reasoning when it comes to this? (I might have
> missed some mail thread here.)

Sorry for being a little late here, was out for a few days.

So yea, wrt to some of the Android GKI related efforts I've been
involved with, loading once and not unloading is fine for the usage
model.

I can understand it being a bit ugly compared to drivers with proper
unloading support, and I think for most new driver submissions,
maintainers can reasonably push to see proper unloading being
implemented.

But there are some pragmatic cases with low-level drivers (as you
mentioned: clk, pinctrl, gpio, etc) where sorting out the unloading is
particularly complicated, or there is some missing infrastructure, and
in those cases being able to load a "permanent" module seems to me
like a clear benefit.  After all, it seems a bit strange to enforce
that drivers be unloadable when the same code was considered ok to be
merged as a built-in.

So I think there's a reasonable case for the preference order to be:
"built-in" < "permanent module" < "unloadable module".

And of course, it can be more complicated, as enabling a driver to be
a module can have rippling effects on other code that may call into
it. But I think maintainers have the best sense of how to draw the
line there.

thanks
-john
