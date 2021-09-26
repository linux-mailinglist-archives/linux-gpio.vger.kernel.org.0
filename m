Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59DD64188B7
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 14:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhIZMuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 08:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbhIZMuH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Sep 2021 08:50:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90508C061570
        for <linux-gpio@vger.kernel.org>; Sun, 26 Sep 2021 05:48:31 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i4so63528198lfv.4
        for <linux-gpio@vger.kernel.org>; Sun, 26 Sep 2021 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIpGV/GRklO35bYRCxL3eYGLbT+mPVxEwRC9eyisulA=;
        b=mzfwO4Eur/THX2aecaHkpWFfSg0x3pAtiPPu8fqCXv2Fiibhk1j2rU5dvMNAHuE1Et
         MtH2KxYmeK3iaL3DR866TPNt8NW0UjNlY6UuGsvbFeHBNnvjp2MDL2MmJlODYQG6zQNK
         D4ixuOapOe8qLTsBs4el8W6CLtsW5PQDAxcJu5pptQVkWaa3unp+DhtTGqbZWNKZZz3g
         EjK8tFwx+wu22dX49NDlPotvVWlb80ntw07p84mdASOCHSfm018BUOcW5v2s/ba6ZNKq
         wfdZx0qYY1hA8xdUXs3u8yJTGwHMC4UoOb7E9TfIMSjhau9DG1Nb3rejLNyI0asxCYb8
         efNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIpGV/GRklO35bYRCxL3eYGLbT+mPVxEwRC9eyisulA=;
        b=6xfiv0NK1v9J2/PvEwb6aOCSMujPb6kqdrzI1beVMvNqrk89bwkv4PV1PufIKLhZBv
         kjTkWquHmmOC1zmDFnuKlJXtpg5KWxex0Xq4qIB3CTWVuCvtAdBKndlOgHEUBUYwDdkB
         aaHZcI19iY42owhw3pr5Z/PBlJbG7pImzeaJhcOMaNaCE9ghS9gINLAXHTcihr/3Mv1/
         oZfjW4sHqbBk/IwCCUPQvTlEugo1DypRh7HenxsPLRelKdt8DGmVNXj0xLFfr5l0oXU0
         WEVEiD2zkjs0otcnMs4+GgoCF07/GuEjNQZqj8kXTUJc9IPIx+e39SVEQGL1CWdwHgPh
         HpqA==
X-Gm-Message-State: AOAM531/q7pphpXsTNmBDEBdXIfNw21wjxR7vehfxShw5EPqi27gR8FK
        SIoj7SZl9mhjGutTeURbZm92FO5E008oIyd6MXZCig==
X-Google-Smtp-Source: ABdhPJw0Et5/szTBYyH4Yc6fVVOZXmjjDD3J0eUKWSVB+5dL/g4mlBS/XF9dVI2lj5imqnQ5vVfZfJmo6opUpUkfTIM=
X-Received: by 2002:a2e:b5a7:: with SMTP id f7mr22733433ljn.19.1632660509938;
 Sun, 26 Sep 2021 05:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
In-Reply-To: <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Sep 2021 14:48:18 +0200
Message-ID: <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Joey Gouly <joey.gouly@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 26, 2021 at 7:09 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Sep 25, 2021 at 4:45 PM Joey Gouly <joey.gouly@arm.com> wrote:
> > On Wed, Sep 22, 2021 at 10:20:39AM +0300, Andy Shevchenko wrote:

> > > > +   if (of_find_property(node, "interrupt-controller", NULL)) {
> > >
> > > Are you sure you need this check and OF core doesn't provide a generic way for this?
> > >
> > I don't think so, and pinctrl-equilibrium.c does something similar in
> > `gpiochip_setup`.
>
> Linus? Do we really need this?

I don't really see this as necessary, we don't need to check everything.
Not that it hurts either, so I would say maintainer preference?

> > > > +   if (of_parse_phandle_with_fixed_args(pdev->dev.of_node, "gpio-ranges",
> > > > +                   3, 0, &pinspec)) {
> > > > +           dev_err(&pdev->dev, "gpio-ranges property not found\n");
> > > > +           return -EINVAL;
> > > > +   }
> > > > +
> > > > +   pctl->npins = pinspec.args[2];
> > > > +   pin_base = pinspec.args[1];
> > >
> > >
> > > Isn't this being provided by pin control?
> >
> > Not that I am aware of. It is a similar pattern to other pinctrl drivers
> > like pinctrl-rza1.c and pinctrl-npcm7xx.c. The driver needs to get the
> > number of pins/base from the DT to setup the internal data structures.
>
> So, maybe you need to refactor the pin control core first and provide
> some stubs that will serve your purposes, but to me it sounds weird to
> have all these checks.
>
> Linus, what is your opinion / input here?

I don't remember right now how the review was going on the
mentioned drivers.

I did imagine that of_gpiochip_add_pin_range() would be the
sole parser of this, and drivers would then use the infrastructure
for any necessary cross-reference between the subsystems,
not second-code it.

What is it that you really need to do here?

I think npins should be known from the compatible (we know that
this version of the SoC has so and so many pins) and the base
should always be 0? It's not like we have several pin controllers
of this type in the SoC is it?

Yours,
Linus Walleij
