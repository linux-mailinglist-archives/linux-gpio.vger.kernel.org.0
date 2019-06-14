Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDDA2461E6
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 17:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfFNPAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 11:00:47 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:32538 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfFNPAr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jun 2019 11:00:47 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x5EF0NfZ011606;
        Sat, 15 Jun 2019 00:00:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x5EF0NfZ011606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560524423;
        bh=/s60AkWF0U1BOgzE1pN5P3jd9rwyhwm9G2111VynPfM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j3ka3syqoZGnKU6PIqP460OogrN7bfS2KlW/d0g1RrH94g8f+c0RcpyZzmFuWpRBX
         u8Qduu0UTW/pmCa5kJbCdYYPVvlODQMsAAthu2I8+xS67NsZZ/enduH0BYVSE83YUB
         +JEdn2Tiia9HBMDfbQNfrfK7J2DdrFFcSzK9LAdTRGsmCjEYu/PQDhhsOHRMVCL3qT
         O6BmNfJbPNG//EriZjzWF0TuozRBPgbHEQJhKp2pL9JsQvgh96B2xHLji32qeWZ3bd
         aVej2aN+08Nael3hI9B6Y93Y5B4A3iBBOSQiwvAPmBGzGniRn7D/+AVqgFMWJviQ82
         mBDdSpdnmkbZA==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id o2so995729uae.10;
        Fri, 14 Jun 2019 08:00:23 -0700 (PDT)
X-Gm-Message-State: APjAAAWiohvROaBHGZEChGfJz5JUSKLm/jlG68RD6xr8HpXzP4WofUUF
        M8TPCYc5wwZBlGVKpvBIzvbFxXr1k2b11Rq05DQ=
X-Google-Smtp-Source: APXvYqzUYCLJOr8aWbp0616zcs4Ga7lShn6QBAoUMQvxu9NG2N+7WApoM0G27MKsghofgy4I6fzNxJ9gMOI/ClIB1eQ=
X-Received: by 2002:ab0:5ea6:: with SMTP id y38mr24152907uag.40.1560524422353;
 Fri, 14 Jun 2019 08:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190613015532.19685-1-yamada.masahiro@socionext.com> <cc68b375-6011-6bbf-8f0b-c2963237a743@metux.net>
In-Reply-To: <cc68b375-6011-6bbf-8f0b-c2963237a743@metux.net>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 14 Jun 2019 23:59:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4KmXd0J2UYfi9WiisnfGa4g62BH2S46ELn4fYG05UcA@mail.gmail.com>
Message-ID: <CAK7LNAQ4KmXd0J2UYfi9WiisnfGa4g62BH2S46ELn4fYG05UcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: remove unneeded #ifdef around declarations
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 14, 2019 at 10:21 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 13.06.19 03:55, Masahiro Yamada wrote:
> > What is the point in surrounding the whole of declarations with
> > ifdef like this?
> >
> >   #ifdef CONFIG_FOO
> >   int foo(void);
> >   #endif
> >
> > If CONFIG_FOO is not defined, all callers of foo() will fail
> > with implicit declaration errors since the top Makefile adds
> > -Werror-implicit-function-declaration to KBUILD_CFLAGS.
> >
> > This breaks the build earlier when you are doing something wrong.
> > That's it.
>
> hmm, in general I like the idea of breaking the build as early as
> possible. depending on your available cpu power, a kernel build can
> take a while, and it could be a huge waste of time when having to
> wait for link stage, just to find out about missing functions.
>
> @linus: what's your oppinion ?
>
>
> --mtx
>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287


My previous clean-up (http://patchwork.ozlabs.org/patch/1112656/)
broke this build.

And, this patch will fix the build issue.

Did you realize the madness of
surrounding the forward declarations with #ifdef ?


All GPIO/pinctrl headers are written in a bad way.

Linus Walleij must realize he was doing *wrong*.


-- 
Best Regards
Masahiro Yamada
