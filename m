Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF05345A0C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 09:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCWIqd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 04:46:33 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:33503 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhCWIqB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 04:46:01 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MwgKC-1la6ov1SA6-00y8lk for <linux-gpio@vger.kernel.org>; Tue, 23 Mar
 2021 09:45:59 +0100
Received: by mail-oi1-f171.google.com with SMTP id a8so16207728oic.11
        for <linux-gpio@vger.kernel.org>; Tue, 23 Mar 2021 01:45:59 -0700 (PDT)
X-Gm-Message-State: AOAM533wlZkaynqfBn1ZgUdtrFzrni96W/KOe8apbTTxG4QMhuIqjMSS
        qstazNCy/BSkhqR6BRFiHlBOj8N7KImJ/7Jkeqo=
X-Google-Smtp-Source: ABdhPJzQmGw011UXILN2BDEwMXKlw26sEgLPVU/W+wyViwEWMAMef5SrGii2NY9fB4wchYEotnl8jy5sY0sFnrDkF9k=
X-Received: by 2002:aca:5945:: with SMTP id n66mr2477821oib.11.1616489158136;
 Tue, 23 Mar 2021 01:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <1042421616413081@mail.yandex.ru> <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
 <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com>
 <BYAPR01MB5621066B411F68EF840B8417D0659@BYAPR01MB5621.prod.exchangelabs.com>
 <36281616430257@mail.yandex.ru> <d7685a8561d9be5ce6269bbf5d600f8f3f5f743b.camel@gmail.com>
 <CAK8P3a0nvComAVhUSK9NgnakLjqqVvnFJRx6oVciuG4deK7VDQ@mail.gmail.com> <854f1b96be2e2bf3daa9b8f2d8d00560f11fdfd3.camel@gmail.com>
In-Reply-To: <854f1b96be2e2bf3daa9b8f2d8d00560f11fdfd3.camel@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 23 Mar 2021 09:45:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a25wfLQQ=VumEffAwef-e5Hkq2ipLst9ZMssM5Yd1tJsA@mail.gmail.com>
Message-ID: <CAK8P3a25wfLQQ=VumEffAwef-e5Hkq2ipLst9ZMssM5Yd1tJsA@mail.gmail.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        Hartley Sweeten <hartleys@visionengravers.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:p8bFY54JN52T/3xWGKDs7y1Y27pgxa+HZ0HgsIaltUJUyqLFFnN
 TT0GQsa6BQlD4QBcpJd/pKrxNHKMfTLoTAQdraBOvcz7f3u24pXeZ7RE+BB8xKGOjassyT5
 Hd7FsmxPXtKhsbHv4NEEqNtLF9HDHHyGVAX0vp73gipQ72pfCFFLERKhQUpgsHCfKlKWEm9
 TEK3CKvSHZ4w2cm6JYb0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NiD2UeFdOvI=:4cFS879ZvGoO1tKOI7Y8dC
 wJbJr0LJCofO23+iCMSkF6w6o7P3mXgpRyc++2x9WZsQ467zC0pLruK2kfCGxpj8hM4mHs2A4
 BpuK+vOuJ0Ss6w0qZ/a/d0TWMWQMGF5BAubJ4UmpEDEpy5tmtSocmTiu2vVdDRxWnJG0GxaGq
 szB1xr+OZnpvFZxJ59cJzCTz2abiDx98s8fxf9RdFSL0TM2PWOeAIN/HOROETucIgNJ+EYHxK
 YQ3X6lGU/l0dFhlrg3CzRV4W075jTMuyLf15efeF+JdZLeaZOnqAczlLzohI/L1a9tm8eqjTx
 BX1uRMBqXX1/SNYURSrAgHYnhvwa7jn0JZxDNLIyjvTdMVXIrF4oEFmnjMkd0ICTETR2PyR/d
 k3rNpum+30l9jv3tFz2eK97lVlAT6p4wT+uzqIjp1gcUzZBYUNFbdFWywKG0h
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 23, 2021 at 7:57 AM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Mon, 2021-03-22 at 23:31 +0100, Arnd Bergmann wrote:
>
> This doesn't sound so bad as I expected. I still had no chance to figure out
> much bigger increase from 5.4 to 5.12 ;)
>
> >    text    data     bss     dec     hex filename
> > 5677321 1119704   90556 6887581 69189d build/tmp/vmlinux
> > 5782854 1143720   92188 7018762 6b190a build/tmp/vmlinux-use_of
> > 5830020 1153408   89396 7072824 6bec38 build/tmp/vmlinux-of+clk
> > 5829320 1153920   91308 7074548 6bf2f4 build/tmp/vmlinux-multi
> >
> > I also think at some point in the distant future we will require DT boot for
> > everything, but that probably comes after most ARMv4T and earlier machines
> > have fallen out of use. I'd like to get a feeling for how EP93xx fits in there,
> > can you say what memory configurations are widely deployed and how
>
> The systems I know have 32MB RAM and 16MB Flash (but only 2MB was reserved for
> compressed kernel back then).

I see, so with 32MB/2MB you are hitting both limits already and are using a
rather customized user space, and 200KB is both significant and in the
within range of the bloat you can expect from the other updates over one
or two years.

I expect the bloat problem to gradually get worse over time, as fewer
developers care about the sub-256MB machines than they used to.

On the plus side, there should be some gains in enabling
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION in the future, and
as long as we support machines without DT, you can probably add
a trivial local patch to turn off CONFIG_OF even for machines that
are multiplatform-enabled, though I would prefer not to allow that
configuration in mainline kernels.

> > long you expect them to receive kernel upgrades in the future? Are these
> > systems that will definitely get put out of use at a particular time (e.g.
> > mobile phone infrastructure for older networks or fixed-time support
> > contracts), or are these systems that you expect to keep patching until
> > the hardware dies?
>
> Yes, I expect them to work (and be patched) until they die and this
> may take another decade ;)

Ok, makes sense. I suppose once you get to the end of that time, you
can consider permanently moving to an LTS kernel, but that only gives
you two (at most six) years of updates.

       Arnd
