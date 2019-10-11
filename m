Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D27C9D4063
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 15:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbfJKNEu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 09:04:50 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45920 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbfJKNEt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 09:04:49 -0400
Received: by mail-lj1-f195.google.com with SMTP id q64so9716088ljb.12
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CzrNm2AjWVzkJ0E+5Ofw3CgMPwNJPVHtmauBF14gdvA=;
        b=nNuKSe5gDihX0cXhvxXjuW6ekAoTLbot9XA+9lg/pe8ukIa+/tg10XDdh9srWTXvQc
         TJZMXg34bOIsZoEbuxt2yxG2HLw3zONYuuIOOA+OM98rtF0JsTTnJwCRVggMge3x2pSj
         ITg8jPfGPd/RqX0EPAGcnndJH8RxqOsZCBTXGyrp9GaT6U7g82Rr2Aug9ny3OhL9uLSr
         HKNfTpUzWJ6oxplkQRGLfNQ2q4/2RT0/r2Shvhsx+hpgdj0m18Ew0VfLtm6in/Nkjlrh
         AEGkivsKvY7KY+sVAZRNuIOICLLIx9W0DIYhjXpnwUVJvY46ClWojSuZyxiJ6gxs//7j
         ArlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CzrNm2AjWVzkJ0E+5Ofw3CgMPwNJPVHtmauBF14gdvA=;
        b=dGxqU4Je+dlVw1cfvB8Vdmcsbsw4Q1aJSPUXSoObVpMXRMEC04v2+wAGNBAEQdl89k
         m1f5RSKT7LZ2lj3kY/6AWj04HunTvpRHarOON3BQX1FhXPtIfX/2DYY93Ya/BCFQ0vsM
         Ua3djLKn3CGlky7yLFNWL3Kfh4MhK2jfNVBn0eCAk9F+9KR0qy2suf10T/RMCAXAk6Lk
         aIqAsoUEyz3ygQsdg1i+/ywNFfUPnpb2PusFKwF7KSLRjcjrpuzlDJ+Qh83fIvx2TyOq
         7jQ8d+TQqwY1xcxZRpOG0JbVS38yDE6xfHTUGygdxwL9ho1u0UV/wRuMHSI+68TFhror
         Pz4A==
X-Gm-Message-State: APjAAAWu9hLSfkdshAS6lHxkYBuYcR+/TjOAgNUxE07aItrUxT5BtIKl
        k+21Lqt1nMqZ2uHFc92lFLaDg0fWTEj55/v49eU=
X-Google-Smtp-Source: APXvYqzZMfv5KzVs0pQUv9KPZy844zoB/RsVmznn04eNfqJxSRzs8R04iNWFhKs4CePXZGs0ytwk/kPT6wGbSbOehOQ=
X-Received: by 2002:a2e:6348:: with SMTP id x69mr9508557ljb.200.1570799086745;
 Fri, 11 Oct 2019 06:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191008232120.GA9225@sol> <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol> <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol> <20191009065524.GA4061@sol> <20191009133037.GA17244@x1>
 <20191009235938.GA10263@sol> <CAEf4M_D4C2v87XR7oyc4YLN9j9XhSctJcw1NCt8hPcuf0P_=DA@mail.gmail.com>
 <20191010101421.GA14692@sol> <20191010111705.GA17666@sol>
In-Reply-To: <20191010111705.GA17666@sol>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Fri, 11 Oct 2019 15:04:34 +0200
Message-ID: <CAEf4M_CpsGj159GrtqSO6tk+SYK--VLK-s6i=g4qAFnMoMcQeQ@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent, that makes sense to me. Hopefully, Bartosz and/or Linus will
advise if this is an issue.

thanks,
drew

On Thu, Oct 10, 2019 at 1:17 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Oct 10, 2019 at 06:14:21PM +0800, Kent Gibson wrote:
> > On Thu, Oct 10, 2019 at 09:47:35AM +0200, Drew Fustini wrote:
> > > On Thu, Oct 10, 2019 at 1:59 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > It is basically working for me on my Pi4:
> > > >
> > > > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > > > 0
> > > > pi@quoll:~ $ ./gpiodctl get -u gpiochip0 7
> > > > 1
> > > > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > > > 1
> > > > pi@quoll:~ $ ./gpiodctl get -d gpiochip0 7
> > > > 0
> > > > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > > > 0
> > > >
> > > > That is using the gpiodctl tool from my gpiod library.
> > > > My gpiod test suite also passes, but it doesn't do much to
> > > > exercise the UAPI.
> > > > I was intending to run my uapi test suite, which is more thorough,
> > > > but it turns out that only targets gpio-mockup, whereas my gpiod
> > > > test suite can target either.
> > > > Something else for the todo list.
> > > >
> > > > Hopefully it is obvious what gpiodctl is doing. (-u sets the
> > > > pull-up flag, -d sets the pull-down flag)
> > > > Looks like the pulls stick when the line is released, and the
> > > > subsequent get, without pull-up set, either doesn't clear the
> > > > pull-up/down or the line stays floating at the old pull level.
> > > > More investigation required, but that will have to wait til
> > > > I get back to this later in the day.
> > > >
> > > > Oh, and that is running on the rpi-5.3.3 kernel patched with everything
> > > > on my topic/gpio-uapi-config branch from 5.4-rc2 onward.
> > >
> > > Thanks for sharing your results.
> > >
> > > My Pi 3 had been running 5.3.0-v7+ from September 20th with my
> > > pull-up/down patch (82fc38f6ab59).
> > >
> > > I removed that patch and just cross-compiled 5.4-rc2 with
> > > multi_v7_defconfig for the Pi3.
> > >
> > > Are these the commits that I should apply from your topic branch?
> > >
> > > bdc9696a27ed pull up/down requires explicit input mode in lineevent_create
> > > 14ee636232d4 disallow pull up/down on outputs
> > > ce03bf5af1ec implement SET_CONFIG_IOCTL
> > > f38b7554eb52 pull common validation code into linehandle_validate_flags
> > > 31c0aa53ffc3 Add default values for setting output
> > > 3c7ec03efcd9 add support for pull up/down to lineevent_create
> > > 99b85d1c26ea gpio: add new ioctl() to gpio chardev
> > > 82fc38f6ab59 gpio: expose pull-up/pull-down line flags to userspace
> > > f6cfbbe2950b gpiolib: sanitize flags before allocating memory in
> > > lineevent_create()
> > >
> > Those are the ones.
> >
> > Plus there are now another 3:
> > 625cd0a0df3ad9 actively disable bias on outputs
> > 9d1f9db81b4dc4 actively disable bias on inputs when pull up/down not set
> > c6d4bf32c05189 add set_config to support pull up/down
> >
> > Those add pull up/down support to gpio-mockup, and fix the stuck pulls
> > I noted earlier - though they still remain applied until the next time
> > the line is requested.
> >
> > 9d1f9db81b4dc4 doesn't like being applied to the rpi kernel, I assume as
> > there have been conflicting changes between 5.3.3 and 5.4-rc2, so I
> > patched that one manually.
> >
> The disable bias changes I mentioned above are problematic - they break
> ABI backward compatibility by explicitly disabling bias when neither
> PULL_UP nor PULL_DOWN are set - which will be the case for legacy apps.
>
> We really need to handle 4 possible bias states - None, Pull Up, Pull
> Down and As Is, with the zero default being As Is.
> So I intend to reinterpret the pull up and down flags as a two bit field
> encoding the following:
>
> 0 - AsIs
> 1 - PullUp
> 2 - PullDown
> 3 - PullNone
>
> Any objections?
>
> Cheers,
> Kent.
