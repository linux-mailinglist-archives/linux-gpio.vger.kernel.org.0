Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7612D2C0969
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388650AbgKWNHP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 08:07:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:43020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388245AbgKWNHC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Nov 2020 08:07:02 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EA3B20758;
        Mon, 23 Nov 2020 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606136821;
        bh=WUH2Rpg808m2OGpru47P3XBJyReIO6q1YH3CseP96cM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W1B8QrEhvlkB65v894sFr35TcvVI/ugFzhft75vpHynUt7dSnoVSBmKVOc99ZD7OA
         iHQg/swfkgmrH/0rCP+3VqozE1uqj0rQ8N13rE9Wc4IfRirnakz4CuTgcqqRPHNx0i
         0RtoYqauFgAfs6U+gPWx+wyIiz7WyvWaaZNMRh8Q=
Date:   Mon, 23 Nov 2020 13:06:54 +0000
From:   Will Deacon <will@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
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
        MSM <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20201123130653.GE10233@willie-the-truck>
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org>
 <20201116155936.GE2224373@ulmo>
 <20201116163603.GA30507@willie-the-truck>
 <CACRpkdZ9P0vG-deWmK8A-zRZbndq1gz_oaK_b128bu4NfUB+Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ9P0vG-deWmK8A-zRZbndq1gz_oaK_b128bu4NfUB+Nw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 23, 2020 at 01:35:14PM +0100, Linus Walleij wrote:
> On Mon, Nov 16, 2020 at 5:36 PM Will Deacon <will@kernel.org> wrote:
> 
> > Linus -- please can you drop this one (patch 3/3) for now, given that it's
> > causing problems?
> 
> Reverted now, sorry for missing to do this earlier.

Cheers, Linus!

Will
