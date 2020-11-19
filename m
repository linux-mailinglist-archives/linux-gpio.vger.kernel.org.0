Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7D82B9B6B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 20:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgKSTVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 14:21:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:37572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727873AbgKSTVy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 14:21:54 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03390205F4;
        Thu, 19 Nov 2020 19:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605813713;
        bh=8fj67CP7oN2In7q58KE8aK4JheulyouCUulFz4iIxxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kSgBoALph8Z25CvHFObKdh1CZUxQYCbVHggW+x3B1R5A6KmiLyNYH3FnUVUhwALNK
         gWDYEVZMtKer6Y7RjYT5jkbEqN74DV10LiQNY7q6VDd8JF3SWcqJizwb8FQriyXXr4
         2nynhF1PhDNYrjKZF+eB5nqYzUdvZ+leaHvHlbBs=
Date:   Thu, 19 Nov 2020 19:21:48 +0000
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] Revert "firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module"
Message-ID: <20201119192147.GB4906@willie-the-truck>
References: <20201119174149.3860883-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119174149.3860883-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 06:41:49PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit d0511b5496c0 ("firmware: QCOM_SCM: Allow qcom_scm driver to be
> loadable as a permenent module") causes the ARM SMMU driver to be built
> as a loadable module when using the Aarch64 default configuration. This
> in turn causes problems because if the loadable module is not shipped
> in an initial ramdisk, then the deferred probe timeout mechanism will
> cause all SMMU masters to probe without SMMU support and fall back to
> just plain DMA ops (not IOMMU-backed).
> 
> Once the system has mounted the rootfs, the ARM SMMU driver will then
> be loaded, but since the ARM SMMU driver faults by default, this causes
> a slew of SMMU faults for the SMMU masters that have already been set
> up with plain DMA ops and cause these devices to malfunction.
> 
> Revert that commit to unbreak things while we look for an alternative
> solution.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/firmware/Kconfig                | 4 ++--
>  drivers/firmware/Makefile               | 3 +--
>  drivers/firmware/qcom_scm.c             | 4 ----
>  drivers/iommu/Kconfig                   | 2 --
>  drivers/net/wireless/ath/ath10k/Kconfig | 1 -
>  5 files changed, 3 insertions(+), 11 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

John previously agreed to this here:

https://lore.kernel.org/r/CALAqxLVDm923WRSB+DVxFacmEtmEPS7Qeq+rW_jbCDMNMWw9PQ@mail.gmail.com

so might be worth putting in a Link: tag when it gets applied.

Will
