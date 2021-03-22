Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C673C345270
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 23:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhCVWb7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 18:31:59 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59353 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhCVWb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 18:31:57 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MhCq4-1ltvx30HYI-00eIda for <linux-gpio@vger.kernel.org>; Mon, 22 Mar
 2021 23:31:55 +0100
Received: by mail-ot1-f47.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso843437otp.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 15:31:54 -0700 (PDT)
X-Gm-Message-State: AOAM530esmgvvAH0KJq944E8t/IWnoH6jU7KdU3aJjpbKeRIqKqKKzvO
        DmQYspnRLmsGHepPNP/JlbVMOdQyNH9k1cBshNs=
X-Google-Smtp-Source: ABdhPJwOcWPpzcqjAv/Dgl1M9Z1NlCH1VtTgH7ZBIFPFMWqNW0C//GZeRwnW2hFI0GnC0a7+TRZQLzil+1+6LeaWpWg=
X-Received: by 2002:a05:6830:14c1:: with SMTP id t1mr1698057otq.305.1616452313823;
 Mon, 22 Mar 2021 15:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <1042421616413081@mail.yandex.ru> <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
 <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
 <BYAPR01MB5621066B411F68EF840B8417D0659@BYAPR01MB5621.prod.exchangelabs.com>
 <36281616430257@mail.yandex.ru> <d7685a8561d9be5ce6269bbf5d600f8f3f5f743b.camel@gmail.com>
In-Reply-To: <d7685a8561d9be5ce6269bbf5d600f8f3f5f743b.camel@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 22 Mar 2021 23:31:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0nvComAVhUSK9NgnakLjqqVvnFJRx6oVciuG4deK7VDQ@mail.gmail.com>
Message-ID: <CAK8P3a0nvComAVhUSK9NgnakLjqqVvnFJRx6oVciuG4deK7VDQ@mail.gmail.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        Hartley Sweeten <hartleys@visionengravers.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:R2dGy2pWg7zc/1iH82Xtnc1bMTwJ8BhuDKqIbWwcIXIj0LsjoA9
 c3puHHiM3eaDg6dl3Z8yCspaFWknW0e4vdUKSlJ7VvU30t8sYB/05ou6LB6jiFB6TUYBGmX
 zZJuZqaBk1dpa5yd9NsIPCvFmaspQXrTfpxh/VVZBUsNbV/KTt4FFFz2/ODV856PdFro7z8
 /VuhWylVgGludD8Wv1YMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i6HOTkvwCho=:1HCxWFmiaqqz85AKmVz8Z5
 zRadNw1rbdJiLczjt9RD/9+8HXD+esZwYcLolDyW8m4V2KFSDbbKOhBvI5hVJWYoLy7M/onXK
 iV3DIzM8LUBE1hQDjWHM9IQEXAvkHnA/KnJGoi0I17hAXKU2zCtsS8VTe5FnhifDJJjrpmeUA
 besbSuRKChzRxm0Cc2CzuBsc4eIWIW+hol/5KAjLSWtvFVSGbnfVO/2xFYK/DjSV1M6jTy1fC
 CjaYPtCnqzW26Sgjiyl6mNY6jwrXbGD99g9EEgeIC+1nXn+TIkeCuvjYVrCi7vTurjiD5SG9L
 M4YfQi/CxsLqveL6xebU0tXNZBk9k+Dx0xYHNs4W7XfTC1oT4JcELQacGOQGk0VJYvE84ZDpS
 pdtAQg4lOjBsL5AKvavy0OTgi0eAh9Lv1SK7WgCuKObzR+lzsxcKeiYAlJtcDdyCpKTDugHVr
 2gC6YOkpBN4fs6LdrHXAO+phB/EegEe8TEPTNJv930rUEF32UYDCBLY5265l11Rach163N3RQ
 3iLqvPDWFFxtTrJeK9Hv2hqFmvNu5ft10O9QUqR6dkP+Xlf7AUOJdv9nr9uSFn83g==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 6:00 PM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Mon, 2021-03-22 at 19:48 +0300, nikita.shubin@maquefel.me wrote:
> > > > >  Note that the GPIO banks are registered a bit goofy, Ports C and F are
> > > > >  not in order. They have been that way since the original Cirrus "crater"
> > > > >  code base. If I remember correctly this was somewhere back in the 2.6.x
> > > > >  kernel. Please make sure the GPIO numbers stay the same so that any
> > > > >  userspace code does not break.
> > >
> > > >  I'm sceptical about this DT convertion.
> > >
> > > I'm in the same boat. One of the reasons I have not tried to convert it...
> >
> > I find this a bit confusing, so you think ep93xx shouldn't be touched at all ?
> >
> > AFAIK the question is reworking to DT or it will be dropped eventually:
> >
> > https://lore.kernel.org/lkml/CAK8P3a2VW8T+yYUG1pn1yR-5eU4jJXe1+M_ot6DAvfr2KyXCzQ@mail.gmail.com/
>
> I somehow missed the Jan Email even though I should be in the "maintainers"
> for EP93xx. I still know about thousands of devices running 24/7 with mainline Linux.
>
> Is it really about "DT conversion or die"?
> These systems really have very tight RAM and Flash budgets...

I would very much like to see the platform get modernized, though as far
as I'm concerned, the DT conversion is not the highest priority here.

One thing I really want to see happen is to move the few remaining
private implementations of the clk API over to the common-clk framework,
and once that is done, allow ep93xx to be built into the same kernel
as all other arm9 based platforms. There are still a couple of other platforms
that are missing a little work for this, but it should be doable.

Unfortunately, building a multiplatform kernel makes the kernel image
somewhat larger because it includes the code for CONFIG_OF, though
it does not have the runtime overhead for the DT data structures that you
get when running a DT-enabled kernel. Enabling CONFIG_USE_OF
increased the ep93xx_defconfig build for me by 128KB, replacing
the private clk driver with CONFIG_COMMON_CLOCK (and no driver)
on top added another 50KB, and finally enabling multiplatform added
another 2KB. In total, that is 2.7% total bloat in just the kernel image:

   text    data     bss     dec     hex filename
5677321 1119704   90556 6887581 69189d build/tmp/vmlinux
5782854 1143720   92188 7018762 6b190a build/tmp/vmlinux-use_of
5830020 1153408   89396 7072824 6bec38 build/tmp/vmlinux-of+clk
5829320 1153920   91308 7074548 6bf2f4 build/tmp/vmlinux-multi

I also think at some point in the distant future we will require DT boot for
everything, but that probably comes after most ARMv4T and earlier machines
have fallen out of use. I'd like to get a feeling for how EP93xx fits in there,
can you say what memory configurations are widely deployed and how
long you expect them to receive kernel upgrades in the future? Are these
systems that will definitely get put out of use at a particular time (e.g.
mobile phone infrastructure for older networks or fixed-time support
contracts), or are these systems that you expect to keep patching until
the hardware dies?

          Arnd
