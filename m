Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25DD2ECF88
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 13:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbhAGMVH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 07:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbhAGMVG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 07:21:06 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB6AC0612F4;
        Thu,  7 Jan 2021 04:20:26 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b26so14062348lff.9;
        Thu, 07 Jan 2021 04:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Ica5wxM3VmIgHFkLm3xrS5tnSw4ogCV6HXVcKn05y7I=;
        b=tmcR4fn3KzKDvtDtKYFvQxtNivl4NwJab3Uku7DObbhXp7/pKAMiMCU8AeyCQ4q1VZ
         7FdSm9s6PI5zVOcLc9Sb95lKNoXo7L0l/QcGJL+rHoTQAs8lvevclGPqUUyNIehYsbOQ
         BWkv3Oucm1+CpbSAKyOXtPkMhrQ4vZ25j4p0TzxdOW07Ce0OFdte6R+beEdWIrF9J9dL
         enXd1DlPP7zcWR+vT2izY7fn7oOfCUemcFQmvB98IRGaumaJy2QLID8rIXwmMarbvell
         LtWw/4jWKiuux+DtaVmp8vYfyWToFX0HiSdu6cxjJm0A1QHEl1S3+UldDcP3wqusKLqw
         lEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ica5wxM3VmIgHFkLm3xrS5tnSw4ogCV6HXVcKn05y7I=;
        b=HEjJUNIzI0ZSTG51/kmwCxor5hno0sSWg75W0MRvqNxG4Him4ahxEFJRrBqw2JbBIi
         48ClA+UkOx/eQD4pw6pqyvW391LRkgvDAFEsSeEcGjy1kft1fD2XDAhIVOGkH+R5FQVD
         sqiNcu/7uC+f/WVGNvWylxFpIZLN78LROA0ouuQFZrPe+zixGv27CuQuPlku77Hutn2p
         liq74ENhxVeemRvKt3aXe+FVGZEgahXJ5nDgyNxWnvJvY/sc/ziSI2cf0mNcfi0GBI6K
         ar956kkBtx/ANnvCV8LKLMBaOmZp1ex2/O7wys4YvWtF7EbYwtfHpA5CTD/yZCUpqZOs
         HvYA==
X-Gm-Message-State: AOAM531hQxMbOC8koDN6XJLsbyhkCXR4FLWinCMycyr2+IWRcG93128e
        wnFmprfIPEHutJF+YEHGGgQKz3DXfSc=
X-Google-Smtp-Source: ABdhPJw3cOFyJgz3ySs3TbKkPlOpkZY6mcXnjDaOPa+9OPHVCv22MZ11YBoJtxmGNYVkK5LUpBlTMA==
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr4233499ljc.324.1610022024689;
        Thu, 07 Jan 2021 04:20:24 -0800 (PST)
Received: from mobilestation ([95.79.125.2])
        by smtp.gmail.com with ESMTPSA id c5sm1147390ljj.67.2021.01.07.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 04:20:23 -0800 (PST)
Date:   Thu, 7 Jan 2021 15:20:21 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        luojiaxing <luojiaxing@huawei.com>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
Message-ID: <20210107122021.u4qd76aidub7utyn@mobilestation>
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
 <20201130112250.GK4077@smile.fi.intel.com>
 <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
 <20201205221522.ifjravnir5bzmjff@mobilestation>
 <CACRpkdawv2NUahn2gniH=29T6qqqFYSa53giC01PS1wq91+Ksg@mail.gmail.com>
 <a18dfb3ef4dd80dddbd038507d9b8b2f@kernel.org>
 <1cc78cf1-edfb-4327-c99c-b3603dc0b3be@huawei.com>
 <CAMpxmJU-9Txc--paCmoe+xCAe=qdboarjOTf+YktShoEDRD3RQ@mail.gmail.com>
 <CAHp75VcFo2hc1kjP9jLxmCdN79rD2R4vCw2P8UssbWe2v4zwcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcFo2hc1kjP9jLxmCdN79rD2R4vCw2P8UssbWe2v4zwcw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello folks,
My comments are below.

On Wed, Jan 06, 2021 at 01:44:28PM +0200, Andy Shevchenko wrote:
> On Wednesday, January 6, 2021, Bartosz Golaszewski <
> bgolaszewski@baylibre.com> wrote:
> 
> > On Mon, Dec 7, 2020 at 2:10 PM luojiaxing <luojiaxing@huawei.com> wrote:
> > >
> > >
> > > On 2020/12/7 2:50, Marc Zyngier wrote:
> > > > On 2020-12-06 15:02, Linus Walleij wrote:
> > > >> On Sat, Dec 5, 2020 at 11:15 PM Serge Semin <fancer.lancer@gmail.com>
> > > >> wrote:
> > > >>

> > > >>> Hmm, that sounds like a problem, but the explanation is a bit unclear
> > > >>> to me. AFAICS you are saying that the only callbacks which are
> > > >>> called during the IRQ request/release are the irq_enable(), right? If
> > > >>> so then the only reason why we haven't got a problem reported due to
> > > >>> that so far is that the IRQs actually unmasked by default.

As I said the problem explanation stated in the log is a bit unclear
to me.  It needs elaboration at the very least in v2 with more details
why masking and masking needs to be performed in the IRQ
disable/enable callback. But AFAICS from the code invocation stack and
the Luo further messages the problem with having both mask/unmask and
disable/enable IRQ-chip functionality may indeed exist.

Judging by the irq_enable() and irq_disable() functions code both of them
use only one pair of the IRQ switchers with giving more favor to the
IRQ disable/enable methods. So if the later are specified for an IRQ
chip, then the IRQ mask/unmask functions just won't be called. (Though
I might be wrong in this matter. Marc, please correct me if I am.) In our
case if for some reason any of the GPIO lane IRQ has been masked for
instance by a bootloader or the default state has been changed on
IP-core level, then the corresponding IRQ just won't be activated by
the kernel IRQs subsystem. In case of my DW APB core and most likely in
the most of the cases all the IRQs are unmasked, but disabled by default.
That's why we haven't got any report about the problem until now.

> > > >>

> > > >> What we usually do in cases like that (and I have discussed this
> > > >> with tglx in the past I think) is to simply mask off all IRQs in
> > > >> probe().
> > > >> Then they will be unmasked when requested by drivers.
> > > >>
> > > >> See e.g. gpio-pl061 that has this line in probe():
> > > >> writeb(0, pl061->base + GPIOIE); /* disable irqs */
> > > >
> > > > This should definitely be the default behaviour. The code code
> > > > expects all interrupt sources to be masked until actively enabled,
> > > > usually with the IRQ being requested.

What DW APB driver has different with respect to the others is that it
provides both IRQ mask/unmask and disable/enable functionality. So
if we get to mask all the IRQs in the probe method, then according to
the irq_enable()/irq_disable() code semantics and as Luo said the
corresponding IRQ won't be unmasked in request_irq(), but will be just
enabled. So effectively the IRQ will be left masked, which of course
we don't want to happen after the successful request_irq() method
return.

As I see it the problem either needs to be worked around in the local
driver (for instance in a way Luo suggests) or fixed in the IRQ subsystem
level.

> > >
> > >

> > > I think this patch is used for that purpose. I do two things in
> > > irq_enable(): unmask irq and then enable IRQ;
> > >
> > > and for irq_disable(), it's similar; mask IRQ then disable it.

Yeah, this patch provides a work around for the problem. So the
chip->irq_enable() callback enables and unmasks the corresponding
GPIO IRQ, while chip->irq_disable() masks and disables it. In this
case the irq_mask()/irq_unmask() methods just get to be redundant
since won't be used by the core anyway.

But before accepting the solution in my opinion it would be better to
at least discuss whether it is possible to fix the
irq_enable()/irq_disable() methods so the similar problem wouldn't
happen for the hardware like DW APB.

Marc, Linus, Andy, Bartosz, Luo what do you think? Wouldn't that be
better to fix the IRQ subsystem code instead seeing it doesn't cover
all the possible hardware like with both types of IRQ enable/mask
callback provided?

> >
> > Hi!
> >
> > Could you please resend this patch rebased on top of v5.11-rc2 and
> > with the detailed explanation you responded with to Andy as part of
> > the commit message?
> >
> >

> I guess it’s more than that. What’s the driver maintainer position here?

Andy, thanks for sending a notification about this patch. Please see my
comments above.

-Sergey

> 
> 
> 
> > Thanks!
> > Bart
> >
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
