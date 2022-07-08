Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B0456BD9B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 18:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbiGHP1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238412AbiGHP1G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:27:06 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142F072ED3
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 08:27:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a9so8555250ejf.6
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ndvNml/8P4SdhAWpCYCcRNKcsZRl843HLHUfSm3CXtQ=;
        b=n+iGOScU2/O2FOY4PuC5ag2SZ47t1xwYBfjwAZOgLzw4cOacerncetV5GiYYKV5psy
         8BoU6Z0ajpZbFmeBahWEnLUr3YTEiKtlCG2XVFxPYcA3z8LNjQ/BAa6wX2zHr25deFJg
         KHDA6v1Ju/y+czwSiPDfRagFy9ArM9gkxqI/gb2zowcSgI+MZzdGuvqCRB1YDKE+VEYJ
         gm90yGJ3kpoF5IpzBfi6lW1Ou5rjy2A9oT54Nx2uwuxFI/u3wH3HThsaPExnkvMjZo8J
         i7pBlLDlOxoXCMd7OvmT4XtANvi32UfC6bdIj9Eo7+BFb1K6idfhI7DoC+Oetus/OkZ7
         tC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ndvNml/8P4SdhAWpCYCcRNKcsZRl843HLHUfSm3CXtQ=;
        b=QKzyqWYWioChHegmcn5p75MTbM9XHsCgE7L773pstzpC95ib7FUHQ4JfgbV6xiy8mD
         BU0hYdul/iPQwc8an1quxd1u0kJjQHVAMqQ43f0MXtqcosZg/N7qd9PqghZkqeInqO0B
         oPd9XWKV87bhcBfEVGHyd3xWim9Ykj93L+NzK3raGMm9BQThK6iAVVICtsggZESHgJR8
         JjN2T4K4NaK5z9DsSBD62G6yS2gEKInKQglQgufyuf3x7epFAZ91Yc72H+BA7bpVwUGm
         M2kp/rhMF4B/N9z4A3bWJy3RczE0l1UYevhDYGFTXiOYukGB20KsIVVImgggMBdxzADR
         98xQ==
X-Gm-Message-State: AJIora+2rVm9V4EImqdlSomYz0J0wnhRHRL4YCVEeNLAXi+s9dPoLqzw
        T1YJJ4tlBH7Tg7FaKEsL5IhRa2lXUUBsr/1b34LmoA==
X-Google-Smtp-Source: AGRyM1sNzLjp6e5Z28so5RLeAS2LpL5v0iM+EBwH8I++NboN6eg8uk2hbeZSisbTc+QD11rLJ8BTwMam+XCmlxzbP5U=
X-Received: by 2002:a17:907:3e20:b0:726:2c09:3fa4 with SMTP id
 hp32-20020a1709073e2000b007262c093fa4mr4036165ejc.101.1657294023526; Fri, 08
 Jul 2022 08:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol> <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
 <20220707130955.GB66970@sol> <CAMRc=MfuzzjkApJ4LBARG0OpfvfBeMqVMTRnKJuj7zV4Gvez1Q@mail.gmail.com>
 <20220708013834.GA6484@sol> <CAMRc=MfGT_FZ=LToa4DPqc3UqjAbt+9dpT2NtKOmMqhcFKWLZQ@mail.gmail.com>
 <20220708105634.GA84979@sol> <CAMRc=McSN5MEOXW0husOaX62EQq+xZyahX1SuvmimuZHOT1RTw@mail.gmail.com>
In-Reply-To: <CAMRc=McSN5MEOXW0husOaX62EQq+xZyahX1SuvmimuZHOT1RTw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Jul 2022 17:26:52 +0200
Message-ID: <CAMRc=McupSnE+m0uOcMh3T9wm74J4Z+N5f_GKnQf5D2jxHoLVg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 1:28 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Jul 8, 2022 at 12:56 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
>
> [snip]
>
> > >
> > > The limitation of the uAPI is what keeps us from making it true in
> > > user-space (that each line can have its own config). As it is, only u=
p
> > > to 9-10 lines can have distinct configs and making the API look and
> > > behave as if it wasn't the case is more confusing (E2BIG errors) than
> > > simply admitting we have the concept of defaults and overrides (to
> > > which the interface is greatly simplified in the high-level
> > > libraries). The idea about making the most common config attributes
> > > become the defaults is simply bad. It would require the user to
> > > anticipate how the library will behave for every attribute and lead t=
o
> >
> > It requires nothing from the user.  They are not even aware of the
> > concept of "defaults" or "overrides".  They just set config on lines.
> > If that is too complicated, which is quite unlikely, then they get
> > E2BIG and they need to repartition their lines into multiple requests.
> >
> > Anyway, that horse is dead.
> >
>
> For a python user, this:
>
> lc =3D gpiod.LineConfig()
> lc.set_props(offsets=3D[2, 3], direction=3DDirection.OUTPUT)
> req =3D gpiod.request_lines("/dev/gpiochip0", line_cfg=3Dlc)
>
> is pretty much as simple as it gets. They still don't need to be aware
> of the underlying split into defaults and overrides. I believe it's
> GoodEnough=E2=84=A2.
>
> I imagine in Rust bindings we'll be able to chain set_props() as is
> customary and we'll get a one-liner out of that.
>

The code I posted here is wrong as it's missing the request config but
it made me think: how about in case of req_cfg=3DNone or not passed at
all, we derive the lines to request from overridden offsets in the
line config? In that case if the user does:

  lc =3D gpiod.LineConfig()
  lc.set_props(offsets=3D[0, 1], direction=3DDirection.OUTPUT,
output_value=3DValue.ACTIVE)
  lc.set_props(offset=3D4, direction=3DDirection.INPUT)
  req =3D gpiod.request_lines("/dev/gpiochip0", line_cfg=3Dlc)

Then it will be interpreted as lines=3D[0, 1, 4]?

I'm also thinking that we could allow the output values to be mapped
as <line name> -> <value> within gpiod.LineConfig like that:

  lc.set_props(lines=3D["foo", 4], direction=3DDirection.OUTPUT)
  lc.set_output_values({"foo": Value.Active, 4: Value.INACTIVE})

It would require us to retrieve the names of all lines from the chip
at the time of the request and store them in the request structure
(for reconfigure to work) but it would make the entire thing even more
"pythonic".

Bart
