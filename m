Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4687E38FD0F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 10:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhEYIq0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 04:46:26 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:33410 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhEYIqZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 04:46:25 -0400
Received: by mail-vs1-f53.google.com with SMTP id f11so15664130vst.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 01:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dJ9eOB2FxEvSV1edZSgSXNi+Ihp2mCyL71mjH2iTNCI=;
        b=mu6sSH1kKlQ3cgIW+GgAMx7Xoc/F1G/JvR83BbRBsTfJvt2eiVIdq6Tj101TCBb2en
         Hy7SfK/WOxn4D5H4gKADCKwCL/xBpKNQqttKXsxZLMaZmlYpKlsA1VFbaeUyNnGY41aJ
         xxa6dko2w5crVOajU8Pj6e9NdQEfF/+OyYBaE1s+6QphFYrtkKY+ovKM7lA/J5R+RbFv
         dcP3LAAA1wjSBZPu7+B1xTAp5WMO8m7584lgz4CaLmmEh9ejlFfeq32j8w+AHT4L+M9o
         MG5yM+3h//OyWXe275jAAK6Z8A6pkP7nRXN1NAyM3uhndj3c2byNOl3iiwY9YGipk948
         2CmA==
X-Gm-Message-State: AOAM533g9vXJuldiji1zLDFPRUzR1YwrnyPaKjXT66oIsYc8BoZwe5hF
        wH6riuqx3GH6LUrVSjc/fOgtmoddz1m+bEocyp8=
X-Google-Smtp-Source: ABdhPJxnP3uMPPW/RMJFjN67TKxwTZneOhYjB7IZsMfwF3JNSD0PLu2hFnHDu48E7s0xmBOKXydqMvgb8PrrVMBAwnk=
X-Received: by 2002:a67:8713:: with SMTP id j19mr25019539vsd.3.1621932295191;
 Tue, 25 May 2021 01:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <1042421616413081@mail.yandex.ru> <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
 <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
 <BYAPR01MB5621066B411F68EF840B8417D0659@BYAPR01MB5621.prod.exchangelabs.com>
 <36281616430257@mail.yandex.ru> <d7685a8561d9be5ce6269bbf5d600f8f3f5f743b.camel@gmail.com>
 <CAK8P3a0nvComAVhUSK9NgnakLjqqVvnFJRx6oVciuG4deK7VDQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0nvComAVhUSK9NgnakLjqqVvnFJRx6oVciuG4deK7VDQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 May 2021 10:44:44 +0200
Message-ID: <CAMuHMdUAd6GE39r1a0PMgYajScy=Yu+-ojBFTXCfVWv9Jb961g@mail.gmail.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        Hartley Sweeten <hartleys@visionengravers.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 11:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Mar 22, 2021 at 6:00 PM Alexander Sverdlin
> <alexander.sverdlin@gmail.com> wrote:
> > On Mon, 2021-03-22 at 19:48 +0300, nikita.shubin@maquefel.me wrote:
> > > > > >  Note that the GPIO banks are registered a bit goofy, Ports C and F are
> > > > > >  not in order. They have been that way since the original Cirrus "crater"
> > > > > >  code base. If I remember correctly this was somewhere back in the 2.6.x
> > > > > >  kernel. Please make sure the GPIO numbers stay the same so that any
> > > > > >  userspace code does not break.
> > > >
> > > > >  I'm sceptical about this DT convertion.
> > > >
> > > > I'm in the same boat. One of the reasons I have not tried to convert it...
> > >
> > > I find this a bit confusing, so you think ep93xx shouldn't be touched at all ?
> > >
> > > AFAIK the question is reworking to DT or it will be dropped eventually:
> > >
> > > https://lore.kernel.org/lkml/CAK8P3a2VW8T+yYUG1pn1yR-5eU4jJXe1+M_ot6DAvfr2KyXCzQ@mail.gmail.com/
> >
> > I somehow missed the Jan Email even though I should be in the "maintainers"
> > for EP93xx. I still know about thousands of devices running 24/7 with mainline Linux.
> >
> > Is it really about "DT conversion or die"?
> > These systems really have very tight RAM and Flash budgets...
>
> I would very much like to see the platform get modernized, though as far
> as I'm concerned, the DT conversion is not the highest priority here.
>
> One thing I really want to see happen is to move the few remaining
> private implementations of the clk API over to the common-clk framework,
> and once that is done, allow ep93xx to be built into the same kernel
> as all other arm9 based platforms. There are still a couple of other platforms
> that are missing a little work for this, but it should be doable.
>
> Unfortunately, building a multiplatform kernel makes the kernel image
> somewhat larger because it includes the code for CONFIG_OF, though
> it does not have the runtime overhead for the DT data structures that you
> get when running a DT-enabled kernel. Enabling CONFIG_USE_OF
> increased the ep93xx_defconfig build for me by 128KB, replacing
> the private clk driver with CONFIG_COMMON_CLOCK (and no driver)
> on top added another 50KB, and finally enabling multiplatform added
> another 2KB. In total, that is 2.7% total bloat in just the kernel image:
>
>    text    data     bss     dec     hex filename
> 5677321 1119704   90556 6887581 69189d build/tmp/vmlinux
> 5782854 1143720   92188 7018762 6b190a build/tmp/vmlinux-use_of
> 5830020 1153408   89396 7072824 6bec38 build/tmp/vmlinux-of+clk
> 5829320 1153920   91308 7074548 6bf2f4 build/tmp/vmlinux-multi

Hence you'll get about the same kernel image size increase either
by converting to DT and COMMON_CLOCK now, or by doing nothing and
booting v5.16-rc1 in six months...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
