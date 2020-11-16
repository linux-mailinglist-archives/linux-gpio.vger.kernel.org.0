Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC822B5190
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 20:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbgKPTsw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 14:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730605AbgKPTsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 14:48:52 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0E6C0613D2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 11:48:52 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id t10so4192687oon.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 11:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i/jF2vypozoIAWRoRUvExzTm1upLK9kXuTA4kYYBoQM=;
        b=uCYbRXt0REy+9MdFUsPc354Sh1shvPq/44EoBKW8dlVEhWu2PsBHUOlTLgW0pbkcA/
         XY6DrDjfxSubwTt3hnLvxkzczKeKX/tDDl1RvU41VhfRU5uk9JA8Xvie/HPDVmYcwthh
         zADqTYV7qIU2NfqcbnWwMTa/irq1n53tVZD+GFYxd4czNRDmofzXQSLSAVksjfayLJxC
         F2NB+5yuV1S5xfjiBD5YHoM/2YcjZO4mSAdp1mwPbqjBYmSb2Zo8kPiutdp8anKgzGFP
         cZJCQ/ubY2T8mN/fKJj/RJ5pC9O42JAhZOUWzZgiD4ewlW5WLm3zlpaFeqkk9vNy3TIa
         NLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/jF2vypozoIAWRoRUvExzTm1upLK9kXuTA4kYYBoQM=;
        b=YvC32spgc7VROeMEi6fGoGkZmEIlUWS3vFSQCw0XsT+l62MZcnxxJ5GH580MBTaRie
         58YVl1sS8qeG3r8sX0oMxLKzdWbzdSWpoexgq6JQrrQiv6kpX5LAYfKgnpzXTiwn6kWS
         j0SpMBIm5FqlW9/YwSW9D7/ipn0CC6+LhIaVJUr97Px3JI5zYx9FgN7YwhgyGCwWhBPW
         xqOyu30KUtsXShkt5yEKqwSE67qP4nRoVMEo8nh2MaIoy4EkoXw5InSiYw/BEaRVwSAA
         pHrxUilv/dvmpsMg3Hln3EysaBQu2nDoniPag2AHb0QUktgATYQ5xe+c1oPsvaf0hqSX
         7G5g==
X-Gm-Message-State: AOAM532Cg+CZq6M+sFqH+xexzNPpeaQAcbo/fPmQwZ6gcTuO3EhJyuU0
        8KYhUDhby0Q6W4mosLH34Yn+XE/Z3slSk51P6ta5BQ==
X-Google-Smtp-Source: ABdhPJxq2rLWqbms4p0dfqF261lSEUqJezo2VNYvxSZDGEUqeNo2rc3yzBUfI/Hco8mHWx6SRZ/m0Uc+hY7wn2qh3jc=
X-Received: by 2002:a4a:6802:: with SMTP id p2mr716194ooc.9.1605556131545;
 Mon, 16 Nov 2020 11:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org> <20201116155936.GE2224373@ulmo>
 <20201116163603.GA30507@willie-the-truck>
In-Reply-To: <20201116163603.GA30507@willie-the-truck>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 16 Nov 2020 11:48:39 -0800
Message-ID: <CALAqxLVDm923WRSB+DVxFacmEtmEPS7Qeq+rW_jbCDMNMWw9PQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Will Deacon <will@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 8:36 AM Will Deacon <will@kernel.org> wrote:
> On Mon, Nov 16, 2020 at 04:59:36PM +0100, Thierry Reding wrote:
> > On Fri, Nov 06, 2020 at 04:27:10AM +0000, John Stultz wrote:
> > Unfortunately, the ARM SMMU module will eventually end up being loaded
> > once the root filesystem has been mounted (for example via SDHCI or
> > Ethernet, both with using just plain, non-IOMMU-backed DMA API) and then
> > initialize, configuring as "fault by default", which then results from a
> > slew of SMMU faults from all the devices that have previously configured
> > themselves without IOMMU support.
>
> I wonder if fw_devlink=on would help here?
>
> But either way, I'd be more inclined to revert this change if it's causing
> problems for !QCOM devices.
>
> Linus -- please can you drop this one (patch 3/3) for now, given that it's
> causing problems?

Agreed. Apologies again for the trouble.

I do feel like the probe timeout to handle optional links is causing a
lot of the trouble here. I expect fw_devlink would solve this, but it
may be awhile before it can be always enabled.  I may see about
pushing the default probe timeout value to be a little further out
than init (I backed away from my last attempt as I didn't want to
cause long (30 second) delays for cases like NFS root, but maybe 2-5
seconds would be enough to make things work better for everyone).

thanks
-john
