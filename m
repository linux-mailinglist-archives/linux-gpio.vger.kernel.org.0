Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F280E41D967
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235538AbhI3MM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235496AbhI3MM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 08:12:26 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66B1C06176A;
        Thu, 30 Sep 2021 05:10:43 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id b10so7186335ioq.9;
        Thu, 30 Sep 2021 05:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/H19VMeHPHLcJ06LAM4+A5MKt7wKf+JL7zYWBJSiYO8=;
        b=Yr7Wb87f1/ZonLFP7b5ML5RbSI+Vpy5Au3q01XDNgVR2iSL0vwnmJbMNeBrKhd3yHZ
         PHhikSaIY2X7sggItziqLeWHcx1lLjYVs991IYYhmIha23sI17pgXa/6mu/VdilLF8+R
         t9O4GSekAw9285QuLoDb/11OaRa1Q+GDFJ7eg8FtUbA+YmPnlro/ulOsnd2FEShFfUIX
         dWbxgW4eLk1NLj66f/zkQ9Yoq3mKfgVPetvv3+OXJQ0n9JvtqWLjQP3jqDnqqne/goDi
         Vb4TFBx6l7NoZtUlTQRKYKxUdclDgqqlRdgVpfw4qspnAAQ4KA1H+cwucgEwt25gEj8h
         aB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/H19VMeHPHLcJ06LAM4+A5MKt7wKf+JL7zYWBJSiYO8=;
        b=pnArlJI8chEszZKPvQwcNck6ErXTFDkg4ucyKH4leSl63PvQ85ORKWdiDoei1K20M2
         y1LZwK5ELZ8kx2AuD2qozr5nBaJozmV0bs9QBN3Yfj0naI/f5WiooRBNrUxc4u8A+nCH
         jZFCmuKVfoPID2Rpla91aEkldbarvoe+hD0+dszG9WEipgednvRNZnCBzN7sS1HyqbwR
         FPqFF5ol0/YPwNi0oYiWOyWgIR8nKgHqqiZYoLyap3bw/dy57rGGgfW80+Scl8FFEZ/2
         o2kQAMf+hV61mI2pEzrKK/CXx5WGjsX/1+zwmVZA46LxGKGlje86Pu/qX1G0V9NAgypg
         dtVA==
X-Gm-Message-State: AOAM532DSoUS0qFwNmch9WRJwUcyR77TCKl/tIzVRMTD9cgVilOmEDf5
        JG4JSENCubeMB+QQgw3fEIvchmTYkM+xa6RCfmg=
X-Google-Smtp-Source: ABdhPJyDE/fHF8Go39XQLUDMUg7KWsnWeLHUYGDXFcFskCLtdEwGdTm/ec/DD3W40EaB4cSIogxjgG4JOgK04Ywj3to=
X-Received: by 2002:a02:2544:: with SMTP id g65mr4460916jag.13.1633003842886;
 Thu, 30 Sep 2021 05:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
 <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com> <YVWkxnc8wTdBgRsv@google.com>
In-Reply-To: <YVWkxnc8wTdBgRsv@google.com>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Thu, 30 Sep 2021 21:10:31 +0900
Message-ID: <CA+Ln22FBy2ks9gX3df=rQw-6W3iftMVoqsoqBPchGCqDDoMaLg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 20:51 Lee Jones <lee.jones@li=
naro.org>:
>
> On Thu, 30 Sep 2021, Tomasz Figa wrote:
>
> > 2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 18:23 Lee Jones <lee.jone=
s@linaro.org>:
> > >
> > > I've taken the liberty of cherry-picking some of the points you have
> > > reiteratted a few times.  Hopefully I can help to address them
> > > adequently.
> > >
> > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > Reminder: these are essential drivers and all Exynos platforms must=
 have
> > > > them as built-in (at least till someone really tests this on multip=
le
> > > > setups).
> > >
> > > > Therefore I don't agree with calling it a "problem" that we select
> > > > *necessary* drivers for supported platforms. It's by design - suppo=
rted
> > > > platforms should receive them without ability to remove.
> > >
> > > > The selected drivers are essential for supported platforms.
> > >
> > > SoC specific drivers are only essential/necessary/required in
> > > images designed to execute solely on a platform that requires them.
> > > For a kernel image which is designed to be generic i.e. one that has
> > > the ability to boot on vast array of platforms, the drivers simply
> > > have to be *available*.
> > >
> > > Forcing all H/W drivers that are only *potentially* utilised on *some=
*
> > > platforms as core binary built-ins doesn't make any technical sense.
> > > The two most important issues this causes are image size and a lack o=
f
> > > configurability/flexibility relating to real-world application i.e.
> > > the one issue we already agreed upon; H/W or features that are too
> > > new (pre-release).
> > >
> > > Bloating a generic kernel with potentially hundreds of unnecessary
> > > drivers that will never be executed in the vast majority of instances
> > > doesn't achieve anything.  If we have a kernel image that has the
> > > ability to boot on 10's of architectures which have 10's of platforms
> > > each, that's a whole host of unused/wasted executable space.
> > >
> > > In order for vendors to work more closely with upstream, they need th=
e
> > > ability to over-ride a *few* drivers to supplement them with some
> > > functionality which they believe provides them with a competitive edg=
e
> > > (I think you called this "value-add" before) prior to the release of =
a
> > > device.  This is a requirement that cannot be worked around.
> >
> > [Chiming in as a clock driver sub-maintainer and someone who spent a
> > non-insignificant part of his life on SoC driver bring-up - not as a
> > Google employee.]
> >
> > I'd argue that the proper way for them to achieve it would be to
> > extend the upstream frameworks and/or existing drivers with
> > appropriate APIs to allow their downstream modules to plug into what's
> > already available upstream.
>
> Is that the same as exporting symbols to framework APIs?
>
> Since this is already a method GKI uses to allow external modules to
> interact with the core kernel/frameworks.  However, it's not possible
> to upstream these without an upstream user for each one.

Not necessary the core frameworks, could also be changing the ways the
existing drivers register to allow additional drivers to extend the
functionality rather than completely overwrite them. It's really hard
to tell what the right way would be without knowing the exact things
they find missing in the upstream drivers. As for upstream users, this
is exactly the point - upstream is a bidirectional effort, one takes
from it and should contribute things back.

Generally, the subsystems being mentioned here are so basic (clock,
pinctrl, rtc), that I really can't imagine what kind of rocket science
one might want to hide for competitive reasons... If it's for an
entire SoC, I wonder why Intel and AMD don't have similar concerns and
contribute support for their newest hardware far before the release.
