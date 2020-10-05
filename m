Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8527A28337D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 11:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgJEJjo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 05:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJEJjo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 05:39:44 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083D5C0613CE
        for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2020 02:39:43 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id y20so8343156iod.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2020 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fbtjCQo7LmXrooUrvQJDN/XI84FhAM0orlp9l5bsJ44=;
        b=TrsF76/5/69ebISeCnIhkpWeLoAZIB/IDUuYMKU4GPtvur2h9OxGh7IMAm5if+7lq6
         52WGYkoN0M9VDgcgIGohpsq9HXTr1f5A7ZnrW7f31esESa5SIrk9pDCYrXcL+qu8KZqa
         BqtgD4y4tfm3dZnuOHXHE1uhBdcKOy16DGBr8EJHe/WpNfxG/6nZuKf/8qqeeOLYo2H2
         xHMBoxqp6YHv4BZqqdIdl6uzULDF2UdcELplkgEPhuxmT1osy7KFCbMYzNRHuiYLHlIB
         H6QNqewfJJxWisN6Z6f8doOdIKOp+g+UpocCWa1Q/zRFbIqfKVOcPrIrj2vlAqxlRe2e
         ZdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fbtjCQo7LmXrooUrvQJDN/XI84FhAM0orlp9l5bsJ44=;
        b=UeM8wTGasEDc4Nyh4BtFnDceLYQv251/Q3gMM5NNTlh6ubiXnu4Kenf4ZjE8MtDdzN
         YE9nXC2V65/FwuRVY2Q6JS4CoCqscXmwzWGlCsWLDHTrmiqF30cHLhEkNrhMvX/Qhkim
         xbVPg8EQzTrmnnEMDgs+qdoXZ+LclFNYdWz5IGUXJadV4Fw+2/XGY7yL+1K44K+arEmf
         Iqy3ZWwv/j1+qzVPlqb+YfSw7KKt3jFMC2I3pMVYQpgH1FMHO24ZQHJdA/e+r9xpBiP6
         HKwpQmQDJhNzqE9MeYtsaexedJvunm6u1wfAUCdFS4IyozXkaU8+h/uZmdXrqzBrQae4
         t85A==
X-Gm-Message-State: AOAM532vNduzzgEybPbxadmCHDWJ+W1D3iLVRuQQqMH2F0JpX568qA+R
        I6e/fkcRjpqcUS4FhoHD2gsee1Q+9u2JYqvvPO10UqB8+LA=
X-Google-Smtp-Source: ABdhPJzpwBtT5z0kSsZApMZZmy6J/D64PG2evQJ9n7cPB0MkO4e9PVQKqLwxZk3rNv5Y4j6qh2CZAdp8RI7GdXp5UBI=
X-Received: by 2002:a05:6638:14c8:: with SMTP id l8mr12421453jak.136.1601890782010;
 Mon, 05 Oct 2020 02:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
 <CAHp75Vfy8un3APcYqWyO9b8aFMAyKVSkAbn=6kxpbSthgq4jxA@mail.gmail.com>
 <CAMRc=MfP9EBqUCvcKUmwF4Zd+yFO-yfC6718ZXeM1PbtEqYWNQ@mail.gmail.com> <CAHp75VdCfLrTcM5BeEgxyoRR5ptYDqQQQthrUmNoc7Fy9SwTXA@mail.gmail.com>
In-Reply-To: <CAHp75VdCfLrTcM5BeEgxyoRR5ptYDqQQQthrUmNoc7Fy9SwTXA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Oct 2020 11:39:31 +0200
Message-ID: <CAMRc=MdavJ6w3S=5F+00oD7AxtUtC6KgvQm7GvJqX04CVrPjcw@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v1.6 released
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        SZ Lin <sz.lin@moxa.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 2, 2020 at 4:48 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Oct 2, 2020 at 10:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Thu, Oct 1, 2020 at 4:56 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
>
> > > > 1. Switch the major version of libgpiod API to 2 and start working on
> > > > the new API (preferably starting out by simply porting the current
> > > > library to v2 uAPI).
> > > > 2. Indefinitely support v1.6.x branch with bug fixes.
> > > > 3. Consider v1.4.x as an LTS supported for as long as yocto uses v5.4
> > > > kernel as their LTS (this is because v1.4 is the last version to not
> > > > require v5.5 kernel headers to build).
> > > > 4. (maybe) Create a compatibility layer between v1.x and v2.x once
> > > > v2.0 is out that will ease the switch to the new release.
> > >
> > > I'm wondering if you are planning to develop v2.x with possibility to
> > > coexist with v1 on the same machine (like gtk2 / gtk3 and other
> > > examples).
> > >
> >
> > Personally I would prefer to avoid doing this. This isn't a very big
> > library so unlike gstreamer or gtk I think it won't take much to
> > switch to v2.0. If anything - I prefer a compatibility layer included
> > in the package where - if an option is passed to configure - the old
> > header would be installed alongside the v2.0 .so file + another .so
> > for translating the calls.
> >
> > If you see a very good reason to make them both live together - let me know.
>
> Aspects that come to my mind, that needs to be taken into account are
> the following:
>  - would ABI be kept on a library level (will binary built against v1
> be capable to run on v2)?

No, of course it won't be kept. This is the whole point of a new major release.

>  - would API be kept compatible (seems so according to Kent's patch)?
>

Same as above. The new major release will need a new API to support
new functionalities introduced by Kent.

> Main point that users that have compiled something for older kernel to
> work should be able to run this on newer distribution environments
> (like one, that would have only v2 of the library).
>

This has nothing to do with the kernel - nobody is changing the kernel
API v1 and it'll be supported by libgpiod v1.6.

In user-space, libraries only guarantee binary compatibility in
respect to the major ABI version. We've already changed the ABI in
libgpiod twice (it's at 2.x.y currently).

I personally don't care much about how desktop distros handle this -
I'm mostly interested in bespoke embedded distros built with yocto or
buildroot. I'm Cc'ing SZ Lin who maintains the libgpiod debian
package.

SZ Lin: libgpiod will get a new major release in the following months
- the API will become v2.x and ABI v3.x - do you think it's important
to make it possible for two major versions of libgpiod to live
together in a single system? I would like to avoid having to rename
everything and use libgpiod2.0 everywhere - this information is
already stored in the API version. Does debian support something like
yocto's virtual providers maybe? How do you see this for a desktop
distro.

Best regards,
Bartosz Golaszewski
