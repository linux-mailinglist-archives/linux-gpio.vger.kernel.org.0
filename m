Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FEF2B0B66
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgKLRha (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:37:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:52666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbgKLRh3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:37:29 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD0C021D40;
        Thu, 12 Nov 2020 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605202649;
        bh=OpMVTIHp5xtXn9ioPR7A/G7DjaB4pvaonJfkTOta0JM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jUCznGRlc+VHYYw1MdvpmdeeJV7ioBUPoWwhFvMHgXduVEjM410PYXovDx+8g1Q25
         Bppux+CBwlFKPI8Wlk4fcsCSvhX5JE7Zbp2PszkU1tHqQaeylp/mVyHW2wDQ6RBFY/
         XkOwmmWRVxE4OIld1aqrLQBTkXON8YmwLEabZe0w=
Date:   Thu, 12 Nov 2020 17:37:22 +0000
From:   Will Deacon <will@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
        MSM <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20201112173721.GB20000@willie-the-truck>
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org>
 <CACRpkdYhfjRBz8GwMyCrOTzjd-Y6-G16xPjH6xhwSHcnaJfuXA@mail.gmail.com>
 <CALAqxLXigwvauJgvN5FxoND60zybYw1L78POHY6KoxP2_gpkFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLXigwvauJgvN5FxoND60zybYw1L78POHY6KoxP2_gpkFA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 10:51:46AM -0800, John Stultz wrote:
> On Tue, Nov 10, 2020 at 5:35 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Fri, Nov 6, 2020 at 5:27 AM John Stultz <john.stultz@linaro.org> wrote:
> >
> > > Allow the qcom_scm driver to be loadable as a permenent module.
> > >
> ...
> > I applied this patch to the pinctrl tree as well, I suppose
> > that was the intention. If someone gets upset I can always
> > pull it out.
> 
> Will: You ok with this?

We didn't come up with something better, so I can live with it. Not sure
about the otehr issues that were reported by Robin though -- your RFC for
fixing those looked a bit more controversial ;)

Will
