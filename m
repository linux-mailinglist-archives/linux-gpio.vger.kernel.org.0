Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627E628CA71
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 10:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403912AbgJMIqL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 04:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403884AbgJMIqL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 04:46:11 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4650C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 01:46:08 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id o18so19669392ill.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c7TbymQaVbjWqMuiptoI/59p2mdYjjbzdD1erzg5t2g=;
        b=HdB3ROCh1JhhyoRepBbaKYixEsMI7usqyuQ4RaMgt4vJo5bOUluepocWSs9ZnElR2K
         frfTFBMbVHxBbTXRxi3RDs2gGEbzviPsuo7O4a3TGeaqDCShu8RAzhidgZBY8FOxY+qU
         p8bKupo5U0BtRJBBm/oM93HK6hDzF4Y3wZsb5V62F7SuTZESkaHZ6iuBUgV3mCswmAgR
         MSEcV6xuxkVFSl8hhir6WDfxz9V/Wq+uX5JAE17Q9W/C8GD6W7iI9OvCkoB05zpS0XZi
         6ZhBZyJBdwJsfCB+kMLGIkwZ6QWQJ9qw+XSOes+diFeNZc1o5ZdAypdzO68l0l/LBfqk
         OjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c7TbymQaVbjWqMuiptoI/59p2mdYjjbzdD1erzg5t2g=;
        b=J2XekDoggMVn1ikQGtBzlGdNX0TkzOFHAdsVo7PU5o3mQKTCsaqygyUqJScQiYq7ke
         nK07evs6in79kxduFVSbxPU5JJTbMja0j3GH2JolkAR2nNr7d3VtnV97k9qs2tYD/8+p
         Yv8r0Ge8q/RfrH6qT1irng8mUq4Q2xalxX/6QWt8TD0JDDIov3mwYrLtrVOw4nkmTMME
         xfy2c4rfRMW652VXTnwjzZIK0S18Zfv2zA00e4p8MmiVBoGNenaqyHdZQq7WglRXtNM4
         f61k2RYUK5eZH5L6FYZ7Fv8/2t4V6S5kuumUGZOl26B7nNFbbCy5OQJgUy2TYEPdbq24
         9Aig==
X-Gm-Message-State: AOAM5329O0yBlf4HEnMmoiIW/o/VTlAQyz9wvl9r062/TPYEQzpyHG3r
        mN/9QaIN5c8zyJDFDWeCWKL6CFypXSS4kXMOywY9hg==
X-Google-Smtp-Source: ABdhPJyLo8Vknhn6fT7NUEETE9bOci7H68GuhJ59RLfv82OTHk9St3+7i3PL42S0KAKbD2jxx1nRWgZ7k4GSpkpb1cM=
X-Received: by 2002:a05:6e02:df0:: with SMTP id m16mr2179991ilj.220.1602578768081;
 Tue, 13 Oct 2020 01:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
 <CAHp75Vfy8un3APcYqWyO9b8aFMAyKVSkAbn=6kxpbSthgq4jxA@mail.gmail.com>
 <CAMRc=MfP9EBqUCvcKUmwF4Zd+yFO-yfC6718ZXeM1PbtEqYWNQ@mail.gmail.com>
 <CAHp75VdCfLrTcM5BeEgxyoRR5ptYDqQQQthrUmNoc7Fy9SwTXA@mail.gmail.com>
 <CAMRc=MdavJ6w3S=5F+00oD7AxtUtC6KgvQm7GvJqX04CVrPjcw@mail.gmail.com> <HK0PR01MB24504356D7FA20A34AECAABAE2070@HK0PR01MB2450.apcprd01.prod.exchangelabs.com>
In-Reply-To: <HK0PR01MB24504356D7FA20A34AECAABAE2070@HK0PR01MB2450.apcprd01.prod.exchangelabs.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Oct 2020 10:45:57 +0200
Message-ID: <CAMRc=Mdu=ptWC2-trOsE5npne+coCsHxf6xpz99EhVbSif140g@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v1.6 released
To:     =?UTF-8?B?U1ogTGluICjmnpfkuIrmmbop?= <SZ.Lin@moxa.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 5:18 PM SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA) <SZ.Li=
n@moxa.com> wrote:
>
> Hi,
>
> <snip>
>
> > I personally don't care much about how desktop distros handle this - I'=
m mostly
> > interested in bespoke embedded distros built with yocto or buildroot. I=
'm Cc'ing
> > SZ Lin who maintains the libgpiod debian package.
>
> Nowadays, many embedded distros are derived from Debian, such as Raspberr=
y Pi OS
> (previously called Raspbian). Moreover, the meta-debian [1] provides the =
recipes for the
> Poky build system to build images using Debian source packages within the=
 Yocto project [2].
>
> [1] https://github.com/meta-debian/meta-debian
> [2] https://www.yoctoproject.org/learn-items/deby-reproducible-and-mainta=
inable-embedded-linux-environment-with-poky/
>
> >
> > SZ Lin: libgpiod will get a new major release in the following months
> > - the API will become v2.x and ABI v3.x - do you think it's important t=
o make it
> > possible for two major versions of libgpiod to live together in a singl=
e system? I
>
> It's possible, but I think it's *no strongly needed* and there are no oth=
er Debian
> packages depend on libgpiod, as shown below.
>
> =3D=3D=3D
> apt rdepends libgpiod2
> libgpiod2
> Reverse Depends:
>   Depends: libgpiod-dev (=3D 1.5.2-1)
>   Depends: python3-libgpiod (=3D 1.5.2-1)
>   Depends: gpiod (>=3D 1.5.1)
> =3D=3D=3D
>
> All of the above binary packages are built from the same (libgpiod) sourc=
e package.
>
> > would like to avoid having to rename everything and use libgpiod2.0
> > everywhere - this information is already stored in the API version. Doe=
s debian
> > support something like yocto's virtual providers maybe? How do you see =
this for
> > a desktop distro.
>
> I'm not familiar with Yocto's mechanism, but in this case, the ABI change=
s seem that
> are not backward-compatible; we normally require changing the SONAME of t=
he library
> and the shared library package name.
>

For the SONAME it's clear: current libgpiod.so.2 will become
libgpiod.so.3. For the library package name: this is already handled
by distros - for instance the package in debian is called libgpiod2. I
guess it will become libgpiod3 then. I think we're good in that regard
then.

Bartosz
