Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3DC21BFB9
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 00:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgGJWWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 18:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgGJWWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 18:22:07 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AFAC08C5DC
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 15:22:07 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id k4so6061154oik.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 15:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sfPk1+u61DN4Dz/z2Pu4rTndUdKhPwDaWZtZBaUU1jg=;
        b=CGWgrEwlpWSxGS28p+B9aKE3dWl38zgj4StlTqSCg3W9KgUJXjeDSaY6Jwx8i9lwRi
         9UpvDUF7JWYl638DQLAuqEazgzf8DbZZ9YxsBc+6s4pA0JeV/ASd0IAshGRT8qT4BX0S
         xxqg9moE+lu34pnF6PLPa3mQs1nK4VYFyAzoCRitXkydtj0aNPoPsnzkeIETzFjSHGPb
         shBuYBhaTugM1OgtxES7TxTi/SzCN3mS/hMPilaBmHk0TAg8MoF64kvJ+n7z+8WllDhx
         AAW0+zB1xhT0lObKRKFabhrxJAJ+RjvomcYh6bFq6juanWOudCq7LiXglEaxQI7fxDia
         slHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sfPk1+u61DN4Dz/z2Pu4rTndUdKhPwDaWZtZBaUU1jg=;
        b=fkK+N+OhT2mlMpxkwNaQ10b9NTZrXa2u+/QGQ+eheDzqCXOyilDL6j3i3f7GMV+zmA
         kYCLAkYCA7mTHQ91g5ojF0um7/1k9hvOw9xiEMKN75Ot7R+pBF0QR/c8AWK84ChavNbU
         fDQtaO84tA6s6HQFNCwF6h5BGguJalkwp6E4RvIU6vaIyGCjcD3Kkjc3Re4r9fUrxpBC
         20Mjs9lz6PXT2uAouV90fArvPpQGNPbd36/RPQsTjUDXdBSmPxy76ph/sH1dt7gx75JA
         L4ToG5nN2ZmMbQSnFaeBSY09WevDxgk4aRVdkmvF7D1y1EFhWbvYGPkzrKMcSOT1/4u2
         l8PA==
X-Gm-Message-State: AOAM531vJus3T3dPt68Ck3sSNritNhI/wMru+30kv6zYpqv+fNmp899y
        83xdpwDuV8N1Z60udAFIJeZlE/Zcd5zl9adrZ6MkxA==
X-Google-Smtp-Source: ABdhPJxLt4Cehy4m7wD0RYUwN5jq18bgpscixR8K5qySY9mHffzEWL0hF8baUYqT7R4HfV0LqTJoVtMk95ufKZmESKg=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr5976661oif.10.1594419726479;
 Fri, 10 Jul 2020 15:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org> <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com> <20200710075411.GA30011@willie-the-truck>
In-Reply-To: <20200710075411.GA30011@willie-the-truck>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 10 Jul 2020 15:21:53 -0700
Message-ID: <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Will Deacon <will@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 10, 2020 at 12:54 AM Will Deacon <will@kernel.org> wrote:
> On Thu, Jul 09, 2020 at 08:28:45PM -0700, John Stultz wrote:
> > On Thu, Jul 2, 2020 at 7:18 AM Will Deacon <will@kernel.org> wrote:
> > > On Thu, Jun 25, 2020 at 12:10:39AM +0000, John Stultz wrote:
> > > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > > index b510f67dfa49..714893535dd2 100644
> > > > --- a/drivers/iommu/Kconfig
> > > > +++ b/drivers/iommu/Kconfig
> > > > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> > > >  config ARM_SMMU
> > > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > > >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
> > > > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> > > >       select IOMMU_API
> > > >       select IOMMU_IO_PGTABLE_LPAE
> > > >       select ARM_DMA_USE_IOMMU if ARM
> > >
> > > This looks like a giant hack. Is there another way to handle this?
> >
> > Sorry for the slow response here.
> >
> > So, I agree the syntax looks strange (requiring a comment obviously
> > isn't a good sign), but it's a fairly common way to ensure drivers
> > don't get built in if they optionally depend on another driver that
> > can be built as a module.
> >   See "RFKILL || !RFKILL", "EXTCON || !EXTCON", or "USB_GADGET ||
> > !USB_GADGET" in various Kconfig files.
> >
> > I'm open to using a different method, and in a different thread you
> > suggested using something like symbol_get(). I need to look into it
> > more, but that approach looks even more messy and prone to runtime
> > failures. Blocking the unwanted case at build time seems a bit cleaner
> > to me, even if the syntax is odd.
>
> Maybe just split it out then, so that the ARM_SMMU entry doesn't have this,
> as that driver _really_ doesn't care about SoC details like this. In other
> words, add a new entry along the lines of:
>
>         config ARM_SMMU_QCOM_IMPL
>         default y
>         #if QCOM_SCM=m this can't be =y
>         depends on ARM_SMMU & (QCOM_SCM || !QCOM_SCM)
>
> and then have arm-smmu.h provide a static inline qcom_smmu_impl_init()
> which returns -ENODEV if CONFIG_ARM_SMMU_QCOM_IMPL=n and hack the Makefile
> so that we don't bother to compile arm-smmu-qcom.o in that case.
>
> Would that work?

I think this proposal still has problems with the directionality of the call.

The arm-smmu-impl.o calls to arm-smmu-qcom.o which calls qcom_scm.o
So if qcom_scm.o is part of a module, the calling code in
arm-smmu-qcom.o also needs to be a module, which means CONFIG_ARM_SMMU
needs to be a module.

I know you said the arm-smmu driver doesn't care about SoC details,
but the trouble is that currently the arm-smmu driver does directly
call the qcom-scm code. So it is a real dependency. However, if
QCOM_SCM is not configured, it calls stubs and that's ok.  In that
way, the "depends on QCOM_SCM || !QCOM_SCM" line actually makes sense.
It looks terrible because we're used to boolean logic, but it's
ternary.

Maybe can have the ARM_SMMU_QCOM_IMPL approach you suggest above, but
that just holds the issue out at arms length, because we're still
going to need to have:
  depends on ARM_SMMU_QCOM_IMPL || !ARM_SMMU_QCOM_IMPL
in the ARM_SMMU definition, which I suspect you're wanting to avoid.

Otherwise the only thing I can think of is a deeper reworking of the
arm-smmu-impl code so that the arm-smmu-qcom code probes itself and
registers its hooks with the arm-smmu core.
That way the arm-smmu driver would not directly call any SoC specific
code (and thus have no dependencies outward). But it's probably a fair
amount of churn vs the extra depends string.

thanks
-john
