Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851F82B4B56
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 17:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731619AbgKPQgM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 11:36:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:57474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730661AbgKPQgL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 11:36:11 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 597F420776;
        Mon, 16 Nov 2020 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605544571;
        bh=IZfzopMNCQqdPXHkBdcatEpepTwtxI9hKt+FYTBzPfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XWZBHoLbnOugySLUX71V9yCMYR2+VX5+dZZ2abGfC5T+2DwqZtUuKPPRdk84pmekb
         fa2m7Zw3G/Eyqr5pBThUfdcOdZW1/o4+wHJnX5gWZVHO1G4H1aAKPBhNeMK2xh3yRY
         zwZXk3kf6Z0s61pqH8est37zsO4x3w+lOSPX7Ypw=
Date:   Mon, 16 Nov 2020 16:36:03 +0000
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20201116163603.GA30507@willie-the-truck>
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org>
 <20201116155936.GE2224373@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116155936.GE2224373@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 04:59:36PM +0100, Thierry Reding wrote:
> On Fri, Nov 06, 2020 at 04:27:10AM +0000, John Stultz wrote:
> > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> > index 7be48c1bec96d..6f431b73e617d 100644
> > --- a/drivers/firmware/qcom_scm.c
> > +++ b/drivers/firmware/qcom_scm.c
> > @@ -1280,6 +1280,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
> >  	{ .compatible = "qcom,scm" },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
> >  
> >  static struct platform_driver qcom_scm_driver = {
> >  	.driver = {
> > @@ -1295,3 +1296,6 @@ static int __init qcom_scm_init(void)
> >  	return platform_driver_register(&qcom_scm_driver);
> >  }
> >  subsys_initcall(qcom_scm_init);
> > +
> > +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SCM driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 04878caf6da49..c64d7a2b65134 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -248,6 +248,7 @@ config SPAPR_TCE_IOMMU
> >  config ARM_SMMU
> >  	tristate "ARM Ltd. System MMU (SMMU) Support"
> >  	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> > +	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> >  	select IOMMU_API
> >  	select IOMMU_IO_PGTABLE_LPAE
> >  	select ARM_DMA_USE_IOMMU if ARM
> 
> This, in conjunction with deferred probe timeout, causes mayhem on
> Tegra186. The problem, as far as I can tell, is that there are various
> devices that are hooked up to the ARM SMMU, but if ARM SMMU ends up
> being built as a loadable module, then those devices will initialize
> without IOMMU support (because deferred probe will timeout before the
> ARM SMMU module can be loaded from the root filesystem).
> 
> Unfortunately, the ARM SMMU module will eventually end up being loaded
> once the root filesystem has been mounted (for example via SDHCI or
> Ethernet, both with using just plain, non-IOMMU-backed DMA API) and then
> initialize, configuring as "fault by default", which then results from a
> slew of SMMU faults from all the devices that have previously configured
> themselves without IOMMU support.

I wonder if fw_devlink=on would help here?

But either way, I'd be more inclined to revert this change if it's causing
problems for !QCOM devices.

Linus -- please can you drop this one (patch 3/3) for now, given that it's
causing problems?

Cheers,

Will
