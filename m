Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5F43CEF54
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jul 2021 00:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhGSVuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 17:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385327AbhGSS45 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 14:56:57 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE1EC0613A7
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 12:28:02 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w188so21917590oif.10
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AsVttpaIz6o+7rFOVPCQbe/BzglpTdJrFiNYOm9U9B4=;
        b=xwBMdYLctnwna9IrwiJvv/IFdbPquUVCJaJF02XKLjARg7WlxJB/ZVtGmpR6HAwm0B
         DAlHudRafT5FK7eCPyfAYclwILvV18U9HWuu2hZRtoN9T+Bw77VtgScRYrx1vCdYlljg
         Iwkn0CtuZQHomiyQ0XeFefYfEq8KrIE0MKe0xvF9Tk4uob+ziMZ5iANeS3APKqwZTqBL
         TOTExV4mKvdgaUSAOiUfnI2rc3QQ2HFMHuiK4+BzFBTfRyzhtilJeMf7h/0DDv2p1abI
         MmF7SoQw7rmLOEZyWTtQUX/prQbprT9Gvc3gUPlbBtx+ehl7grqisfervRPvs/PmOmMX
         ijQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AsVttpaIz6o+7rFOVPCQbe/BzglpTdJrFiNYOm9U9B4=;
        b=G9kpBeDCs5XSRduV+xgjp1cWfgz/BiHS8h4ZpE2TpyARbVJ9rVd481f8ay4bwLot71
         EdGGhfll5YaMTz0K9QZkvhJpwHM3Lfc8knPgSXSdU9J3weXjyimMDDsOiXY1JcdCbV9y
         OM+Ka+YmxtV1huK6aEDAoBaTjCND124P2e0Fz+xPB7bw+/OjJ4xpiIAWLYhKSr/ezvS7
         KSSUiAYp6Ug7b/3xvU7e3d6xDx5M5UajgeDN9JQMIlOwmDWPv89bDVfWBZl6ghd46yM/
         FuvAn30b4kvYURxOE1xzXrATaM2Ak7BTNVyBTaCUGmqQl4wJhcKpGP/ONiV078S0cG5F
         jHfw==
X-Gm-Message-State: AOAM533uBsrzuLiJEwu3yS7je+xaROTh9Q7bBI8yRwBOlhIwSt1bq9og
        LGClTekqxwWSXRjiSDZsuat0HA==
X-Google-Smtp-Source: ABdhPJyja+h2hxOE+bpleMjs4kTNsVmCuEisdwIwTMDk7g7JkvErSsBCBiNgF7ZV7Ud5r3tIKV98WQ==
X-Received: by 2002:aca:4406:: with SMTP id r6mr13822205oia.50.1626723365906;
        Mon, 19 Jul 2021 12:36:05 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c8sm820849oto.17.2021.07.19.12.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 12:36:05 -0700 (PDT)
Date:   Mon, 19 Jul 2021 14:36:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
Message-ID: <YPXUI0VzpxYO56BU@yoga>
References: <20210707045320.529186-1-john.stultz@linaro.org>
 <YPJkF21ItYlKODyq@yoga>
 <CALAqxLUzTNiA7u=4_y9pkrh=Q_+vpPgFrhf_6F8-U0XPQU9crQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLUzTNiA7u=4_y9pkrh=Q_+vpPgFrhf_6F8-U0XPQU9crQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 19 Jul 14:00 CDT 2021, John Stultz wrote:

> On Fri, Jul 16, 2021 at 10:01 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Tue 06 Jul 23:53 CDT 2021, John Stultz wrote:
> > > Allow the qcom_scm driver to be loadable as a permenent module.
> > >
> > > This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> > > ensure that drivers that call into the qcom_scm driver are
> > > also built as modules. While not ideal in some cases its the
> > > only safe way I can find to avoid build errors without having
> > > those drivers select QCOM_SCM and have to force it on (as
> > > QCOM_SCM=n can be valid for those drivers).
> > >
> > > Reviving this now that Saravana's fw_devlink defaults to on,
> > > which should avoid loading troubles seen before.
> > >
> >
> > Are you (in this last paragraph) saying that all those who have been
> > burnt by fw_devlink during the last months and therefor run with it
> > disabled will have a less fun experience once this is merged?
> >
> 
> I guess potentially. So way back when this was originally submitted,
> some folks had trouble booting if it was set as a module due to it
> loading due to the deferred_probe_timeout expiring.
> My attempts to change the default timeout value to be larger ran into
> trouble, but Saravana's fw_devlink does manage to resolve things
> properly for this case.
> 

Unfortunately I see really weird things coming out of that, e.g. display
on my db845c is waiting for the USB hub on PCIe to load its firmware,
which typically times out after 60 seconds.

I've stared at it quite a bit and I don't understand how they are
related.

> But if folks are having issues w/ fw_devlink, and have it disabled,
> and set QCOM_SCM=m they could still trip over the issue with the
> timeout firing before it is loaded (especially if they are loading
> modules from late mounted storage rather than ramdisk).
> 

I guess we'll have to force QCOM_SCM=y in the defconfig and hope people
don't make it =m.

> > (I'm picking this up, but I don't fancy the idea that some people are
> > turning the boot process into a lottery)
> 
> Me neither, and I definitely think the deferred_probe_timeout logic is
> way too fragile, which is why I'm eager for fw_devlink as it's a much
> less racy approach to handling module loading dependencies.

Right, deferred_probe_timeout is the main issue here. Without it we
might get some weird probe deferral runs, but either some driver is
missing or it settles eventually.

With deferred_probe_timeout it's rather common for me to see things
end up probe out of order (even more now with fw_devlink finding cyclic
dependencies) and deferred_probe_timeout just breaking things.

> So if you
> want to hold on this, while any remaining fw_devlink issues get
> sorted, that's fine.  But I'd also not cast too much ire at
> fw_devlink, as the global probe timeout approach for handling optional
> links isn't great, and we need a better solution.
> 

There's no end to the possible and valid ways you can setup your
defconfig and run into the probe deferral issues, so I see no point in
holding this one back any longer. I just hope that one day it will be
possible to boot the upstream kernel in a reliable fashion.

Thanks,
Bjorn
