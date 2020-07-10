Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE2621B0C1
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 09:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgGJHyU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 03:54:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:41666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgGJHyT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Jul 2020 03:54:19 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A68C2077D;
        Fri, 10 Jul 2020 07:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594367658;
        bh=+CLcnOoiP11vbaLWEE7x8Qo9XjfxI8bf98D7jhYvsTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sUWC9jE9AeBrFenvWyUJ08C2OMyYdCth41lSdl+CQ2V8fdS58LUZAE5I1XadKMOEA
         keKID3B78XHkVhh2GKuELnZE3cw3xCKznbwgYEWS5MBQv6Uy9xrKR+Pp2oPgoouL2v
         gC+YoTwxB9rnjYdo2Ut08PPTzS7aCibv0NhI0Xe8=
Date:   Fri, 10 Jul 2020 08:54:12 +0100
From:   Will Deacon <will@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
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
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20200710075411.GA30011@willie-the-truck>
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org>
 <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 09, 2020 at 08:28:45PM -0700, John Stultz wrote:
> On Thu, Jul 2, 2020 at 7:18 AM Will Deacon <will@kernel.org> wrote:
> > On Thu, Jun 25, 2020 at 12:10:39AM +0000, John Stultz wrote:
> > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > index b510f67dfa49..714893535dd2 100644
> > > --- a/drivers/iommu/Kconfig
> > > +++ b/drivers/iommu/Kconfig
> > > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> > >  config ARM_SMMU
> > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
> > > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> > >       select IOMMU_API
> > >       select IOMMU_IO_PGTABLE_LPAE
> > >       select ARM_DMA_USE_IOMMU if ARM
> >
> > This looks like a giant hack. Is there another way to handle this?
> 
> Sorry for the slow response here.
> 
> So, I agree the syntax looks strange (requiring a comment obviously
> isn't a good sign), but it's a fairly common way to ensure drivers
> don't get built in if they optionally depend on another driver that
> can be built as a module.
>   See "RFKILL || !RFKILL", "EXTCON || !EXTCON", or "USB_GADGET ||
> !USB_GADGET" in various Kconfig files.
> 
> I'm open to using a different method, and in a different thread you
> suggested using something like symbol_get(). I need to look into it
> more, but that approach looks even more messy and prone to runtime
> failures. Blocking the unwanted case at build time seems a bit cleaner
> to me, even if the syntax is odd.

Maybe just split it out then, so that the ARM_SMMU entry doesn't have this,
as that driver _really_ doesn't care about SoC details like this. In other
words, add a new entry along the lines of:

	config ARM_SMMU_QCOM_IMPL
	default y
	#if QCOM_SCM=m this can't be =y
	depends on ARM_SMMU & (QCOM_SCM || !QCOM_SCM)

and then have arm-smmu.h provide a static inline qcom_smmu_impl_init()
which returns -ENODEV if CONFIG_ARM_SMMU_QCOM_IMPL=n and hack the Makefile
so that we don't bother to compile arm-smmu-qcom.o in that case.

Would that work?

Will
