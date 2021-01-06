Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756C12EBC50
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 11:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbhAFKZE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 05:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbhAFKZD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 05:25:03 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EE4C06134C
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jan 2021 02:24:23 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id qw4so4254137ejb.12
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2021 02:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ouwqT1eQ1MXRTFWxdKfIfTZinN8hn8mWSYkwmrznYxk=;
        b=YvK0ZmQgh8xHY2kg9C7ynBGXLQhG+pS9LsE1bley+oGdzbvqKQe638fqGu5n1yO4Hv
         DfOzsisia8i0vy3s8o9iRz68FUDPjFoIZUZ4/r0b3uDgouQGOhqdteczEKrvLZ7QuEPc
         gYNyw6O32HAZ3A4jvrfo8LjJi8ZDEoVS/UxbXJys8wuEuBNWYJjyuA7G96+6PuTz11ii
         dpJFWUXoO8QqP0x8eB0m0GEHyqJMi+HNX7dbXjH2yzMQo2OWu6Nw1GmIF/lkUe/nASER
         3GAQlZnc1/v6g5SnGkmM+mZQPCKl93vIWD6XBCFHm2hLkDrWo+XVR7ipYAnPVEKxy3yk
         puqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ouwqT1eQ1MXRTFWxdKfIfTZinN8hn8mWSYkwmrznYxk=;
        b=Ohw9HvSDcNkxcyUEXbEGUEuCZthopZp7MDHg65DxLirlPTWE+GdYKwviElVqEKSPrM
         JKhekWGT08lc/YHK6X4hdWNYRMkde6srLFV++CXeNJ+aaEpP4CnatrzznpA3UqsweVQE
         sU8mBe6Yc5BbIVD8rMHdyhf1lFTPVUuoFS2wokM0LPOpaVc0fqFTgpe79efESaB9hPL/
         DLNetTV3Iy1rdQHPQcHFMsF6BrX2R2gncorubtSWan0SCvtxhQgFa0m71yfBde6iv/vY
         a7M2BhqL08pcilNyPYcYaABYjgqcJAOPGeWzD4DmszXqji+yScB+xAqzReJJXsnTLz0p
         W6HQ==
X-Gm-Message-State: AOAM532mngqhiNs1kuuptG7kuSpcqYSARomil/bsabmTzP3cJBimZiRa
        x5bEGzaU8oUn/KHJ4ITe1xMdkWZvgLjyIE7rIE6Pqg==
X-Google-Smtp-Source: ABdhPJwTYl56gA/BZhj+pNmtdQJqVbSIvh+rCUjzJ6vuHGtcBBIc0JBNeMZhJgSBmZ+6rLm3iHOCdV/kvbnaAA+g3M4=
X-Received: by 2002:a17:906:3a55:: with SMTP id a21mr2445482ejf.516.1609928661932;
 Wed, 06 Jan 2021 02:24:21 -0800 (PST)
MIME-Version: 1.0
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
 <20201130112250.GK4077@smile.fi.intel.com> <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
 <20201205221522.ifjravnir5bzmjff@mobilestation> <CACRpkdawv2NUahn2gniH=29T6qqqFYSa53giC01PS1wq91+Ksg@mail.gmail.com>
 <a18dfb3ef4dd80dddbd038507d9b8b2f@kernel.org> <1cc78cf1-edfb-4327-c99c-b3603dc0b3be@huawei.com>
In-Reply-To: <1cc78cf1-edfb-4327-c99c-b3603dc0b3be@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 6 Jan 2021 11:24:11 +0100
Message-ID: <CAMpxmJU-9Txc--paCmoe+xCAe=qdboarjOTf+YktShoEDRD3RQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
To:     luojiaxing <luojiaxing@huawei.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 2:10 PM luojiaxing <luojiaxing@huawei.com> wrote:
>
>
> On 2020/12/7 2:50, Marc Zyngier wrote:
> > On 2020-12-06 15:02, Linus Walleij wrote:
> >> On Sat, Dec 5, 2020 at 11:15 PM Serge Semin <fancer.lancer@gmail.com>
> >> wrote:
> >>
> >>> Hmm, that sounds like a problem, but the explanation is a bit unclear
> >>> to me. AFAICS you are saying that the only callbacks which are
> >>> called during the IRQ request/release are the irq_enable(), right? If
> >>> so then the only reason why we haven't got a problem reported due to
> >>> that so far is that the IRQs actually unmasked by default.
> >>
> >> What we usually do in cases like that (and I have discussed this
> >> with tglx in the past I think) is to simply mask off all IRQs in
> >> probe().
> >> Then they will be unmasked when requested by drivers.
> >>
> >> See e.g. gpio-pl061 that has this line in probe():
> >> writeb(0, pl061->base + GPIOIE); /* disable irqs */
> >
> > This should definitely be the default behaviour. The code code
> > expects all interrupt sources to be masked until actively enabled,
> > usually with the IRQ being requested.
>
>
> I think this patch is used for that purpose. I do two things in
> irq_enable(): unmask irq and then enable IRQ;
>
> and for irq_disable(), it's similar; mask IRQ then disable it.

Hi!

Could you please resend this patch rebased on top of v5.11-rc2 and
with the detailed explanation you responded with to Andy as part of
the commit message?

Thanks!
Bart
