Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2F42B8EFB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 10:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgKSJd5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 04:33:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:43618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgKSJd5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 04:33:57 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74D2422259;
        Thu, 19 Nov 2020 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605778436;
        bh=qXHuW+5mvL0kkht9BzXP9H3dcimpEpohk7274SXiPt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KuBYtJZnGXqY8JeIjLYwLEryyq/LFfBzf5DYNN5SW85VfI+kaKGbMGUzrSnqk2j0D
         LUlfV5i8/QByFuaWLyF9oZn0/7DWUdcAK4bPIfrg8X5L33e2/vwHHXGGVNtNaL5FIZ
         cPyAosIpV4VK+9atwS0PHWoHObpNFihK+s9u8lqY=
Date:   Thu, 19 Nov 2020 09:33:48 +0000
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20201119093348.GF3599@willie-the-truck>
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org>
 <20201116155936.GE2224373@ulmo>
 <20201116163603.GA30507@willie-the-truck>
 <CALAqxLVDm923WRSB+DVxFacmEtmEPS7Qeq+rW_jbCDMNMWw9PQ@mail.gmail.com>
 <20201117134754.GB2589875@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117134754.GB2589875@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 17, 2020 at 02:47:54PM +0100, Thierry Reding wrote:
> On Mon, Nov 16, 2020 at 11:48:39AM -0800, John Stultz wrote:
> > On Mon, Nov 16, 2020 at 8:36 AM Will Deacon <will@kernel.org> wrote:
> > > On Mon, Nov 16, 2020 at 04:59:36PM +0100, Thierry Reding wrote:
> > > > On Fri, Nov 06, 2020 at 04:27:10AM +0000, John Stultz wrote:
> > > > Unfortunately, the ARM SMMU module will eventually end up being loaded
> > > > once the root filesystem has been mounted (for example via SDHCI or
> > > > Ethernet, both with using just plain, non-IOMMU-backed DMA API) and then
> > > > initialize, configuring as "fault by default", which then results from a
> > > > slew of SMMU faults from all the devices that have previously configured
> > > > themselves without IOMMU support.
> > >
> > > I wonder if fw_devlink=on would help here?
> > >
> > > But either way, I'd be more inclined to revert this change if it's causing
> > > problems for !QCOM devices.
> > >
> > > Linus -- please can you drop this one (patch 3/3) for now, given that it's
> > > causing problems?
> > 
> > Agreed. Apologies again for the trouble.
> > 
> > I do feel like the probe timeout to handle optional links is causing a
> > lot of the trouble here. I expect fw_devlink would solve this, but it
> > may be awhile before it can be always enabled.  I may see about
> > pushing the default probe timeout value to be a little further out
> > than init (I backed away from my last attempt as I didn't want to
> > cause long (30 second) delays for cases like NFS root, but maybe 2-5
> > seconds would be enough to make things work better for everyone).
> 
> I think there are two problems here: 1) the deferred probe timeout can
> cause a mismatch between what SMMU masters and the SMMU think is going
> on and 2) a logistical problem of dealing with the SMMU driver being a
> loadable module.
> 
> The second problem can be dealt with by shipping the module in the
> initial ramdisk. That's a bit annoying, but perhaps the right thing to
> do. At least on Tegra we need this because all the devices that carry
> the root filesystem (Ethernet for NFS and SDHCI/USB/SATA/PCI for disk
> boot) are SMMU masters and will start to fault once the SMMU driver is
> loaded.

Realistically, if you're building an IOMMU driver as a module then it needs
to be part of the initrd and fw_devlink needs to be enabled. Relying on
timeouts and the phase of the moon is not going to be reliable.

But back to the original issue, I think we should revert the Kconfig patch
from Linus' tree. Please can you send a revert for that?

Will
