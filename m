Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5416844E644
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 13:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhKLMYc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 07:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhKLMYa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 07:24:30 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30919C061766;
        Fri, 12 Nov 2021 04:21:40 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id f4so36883851edx.12;
        Fri, 12 Nov 2021 04:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cjv9SgKREw+0nqAR2DLCRPPRsRIjSC7dbro1HCgzzk8=;
        b=ctLhkjd6BeyqraoFel1qmocIRYPT9sxr7XRQuBJU2IDelrM27vDHrJwzQq0c6z0SFr
         bs3w8GkHceb+DjdtzW+CiDdJbmLcROfipWbYrtKfWln/zjSjnoXwMADiENsrPkKp08bN
         onP5zjhTNSbh9+IYs5pC5y9yQpmdJ7xtqM4Bf1UuLg8tB3iQN4Oqj0OyTGDqSf00A2ta
         SKtg22VbFNT0ifJPx35zQtev2JZyF3y5ChO8MgAmDlUWe6fXBeSwvDGbub3WabFtUe03
         WQJb57hOJWH06hKo2ArqdQFKX6Vp+lEJ34VAsxjRV4yTiG9D42ZfWcHON7MdFLI9RcZX
         XdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cjv9SgKREw+0nqAR2DLCRPPRsRIjSC7dbro1HCgzzk8=;
        b=PrJLyLQesIGdGRVIJn7U4l17ZKDBY3mPfUcO0YofTT/w3Pwl+3uCXBgF6BrJVgEv3s
         FtX38t2DF3dMtzM+sf46R6VS37D7WCDs4d4+8rIB2cEAeE9RduriVZhxr5L8E0PbvEDJ
         8eigteifHgYBq0WSz8duBygVhh0BP4KcqJ78lA+dV7sK7Ly6l8d68A0SxY1Csg9QgwG+
         TtkFG+YJhvef9VI5j66QSjGbpB+0Xbk+WjjiE9aYxfj+QQAhaf/k7yEddFEDEboO3ouz
         17v/l3c0sDcver5hrk5XaX0k4DoZ1cVoW4fqxEuHJ9NzbGatwXWprq3/OHyX1tFGmnjf
         /yuw==
X-Gm-Message-State: AOAM532psB33MbfH9Yj5uSYEM7CJaQyRwrPNMFsBwM7o56v5kyCvlwpl
        FxOMPaiUzAqazKfKSf4IL7yx6WBxnl7RCZsxwb8=
X-Google-Smtp-Source: ABdhPJzp823acFx8ywEJwcGMT9lWWnu3C5b7C9J8L0SXubfzD8l/PUugaOhbYs/02bOccJnR6X16QQ19k5yhixdXWc4=
X-Received: by 2002:aa7:cb09:: with SMTP id s9mr20922158edt.359.1636719698689;
 Fri, 12 Nov 2021 04:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20211110231436.8866-1-zajec5@gmail.com> <CACRpkdbAS0JiqTQUU0R0yRhVCwagubwsNYLxj1DLE1Ldc+H_JQ@mail.gmail.com>
 <YY4+4Wb/H2ogKnQg@atomide.com> <CAHp75VeO4yr9fAx_-MHDnRGQn1paWF=59+o-9ZyP5PGSCPU8og@mail.gmail.com>
 <YY5bI+QzDA0zs/mN@atomide.com>
In-Reply-To: <YY5bI+QzDA0zs/mN@atomide.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 Nov 2021 14:20:55 +0200
Message-ID: <CAHp75Ve3GeM6UZExYhGdi59ogOHKt6_uzK9e+LMTyerpcHnwdQ@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: support specifying pins
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 12, 2021 at 2:16 PM Tony Lindgren <tony@atomide.com> wrote:
> * Andy Shevchenko <andy.shevchenko@gmail.com> [211112 11:22]:
> > > We only need the SoC specific data for the booted SoC, so devicetree
> > > and loadable modules makes more sense there compared to the current
> > > built-in setup.
> >
> > I'm against putting that into DT and here is why.
> >
> > DT is the thing that describes the _platform_. While it's fine to put
> > GPIO expander thingy (and we actually do this with labeling schema for
> > GPIOs, right?), the SoC level of things is a _hardware_ and with all
> > flexibility the DT gives us we will definitely have a deviations on
> > _different_ platforms with _the same_ SoC! To work around this we must
> > have a validation of the pin names and their functions in many places.
>
> I think you are misunderstanding what I mean here.

Ah, okay. Thanks for explaining!

>  Certainly the driver
> needs to know how to deal with the SoC specific hardware. And that we
> can easily do that in quite easily already. The device tree data I'm
> describing would be similar to the interrupts with instance offset and
> generic mux flags.
>
> See for example the driver for drivers/pinctrl/ti/pinctrl-ti-iodelay.c.
> For that driver we have the instance and picosecond iodelay values in
> the devicetree, and with #nr-pinctrl cells there could be some generic
> pinctrl mux flags. We are missing the generic pinctrl flags part AFAIK.
>
> > And last but not least the copying it in tons of DT feels like a
> > duplication effort.,
>
> Hmm I don't think we have any of that for what I'm describing. But
> please take a look at the iodelay example above, maybe I'm not
> following.
>
> > AFAIU the topic, the pin control lacks labeling schema that will
> > provide the view from the platform perspective, while driver provides
> > from HW perspective.
>
> Agreed we need a generic labeling schema.



-- 
With Best Regards,
Andy Shevchenko
