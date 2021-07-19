Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956583CF268
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jul 2021 05:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243409AbhGTC1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 22:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359691AbhGSVWP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 17:22:15 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D055C05BD14
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 14:54:25 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id r135so30061352ybc.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mgewm5mjx+FRnoLmab+NYqOB950vpM/jLC7o5sa2XM8=;
        b=l0R7mPgHhU+9/Prsowfdj7Q2tQ1PxSoUyzKyHKVvNc724HS7Q2DlFv99s3OP2TG/Zq
         lwEOjLRSF21f2rIl6xbmlp+HtCrfmG/rtgg50IMgNNhdd7MvHme0UH+zssIKkD4DysIV
         9n03+QQKXy8uuwmkJD8Mr+uOSE/yA0i2iVtHLv/9GUxl+FSGRkhTePgD8pYCukp4Dyz7
         nqQ6P12jnkTl+CUhabJGja6HSNCHhD9KeRBFuzhgnM8w1DbZ2CXLE0Q7Ci39eg+sf+vv
         GsJnL5QEKafmdGXCglA+rJ9522ssx6xe5cbdRqM+wnuZ2Iz4xFxlQvezVkADeXN2P62Z
         xTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mgewm5mjx+FRnoLmab+NYqOB950vpM/jLC7o5sa2XM8=;
        b=Cre6b7muA0rjSVZx2PQJ9NUPNP0T5QSQMwqPVWfpLhlA7NLoSWJ2p8q5AycDMp9ZTE
         MI9yxTyXgr0MW9JHDFqqwInTXCUa7yopTF2pDWOocNgugEArS1DMkgcBX+LKSPZGoe+F
         gkxmXia5llEgu0wZbDL3qJiATfNM2+2JeeisP5gnBY3BLGdW8++abQh55p3SxMa6o1ez
         BTsIj2JgS4oKMDxJTZQ1IyYrn/+Mk9mtVjrU7GWtgat6RFAc1tezplbSIKEn/SSv109x
         AEsIzZifLHUFZH59lOeb8SLHxakpvRpTDZChYwvPt9NKn9Rh+1YB7X+7oAckdGY5NnXB
         OedA==
X-Gm-Message-State: AOAM5337ejGoSNPi54pPhzOEiwi2K6oee8mLNhNBXH6E18B1FtFsxBAP
        yZi5cVpNErPwRw9Hm66ND9eYdjW3etkgRr4MQofCug==
X-Google-Smtp-Source: ABdhPJzzk8LrlzrvE22blW8gQTFo/PFlSTmtqN8jtyX4Dwh9d+eIRQ31WAGLf0IV9Ru2kTwRL7h6I1jaXreQrxJjSnI=
X-Received: by 2002:a25:8b91:: with SMTP id j17mr33097786ybl.228.1626731663924;
 Mon, 19 Jul 2021 14:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210707045320.529186-1-john.stultz@linaro.org>
 <YPJkF21ItYlKODyq@yoga> <CALAqxLUzTNiA7u=4_y9pkrh=Q_+vpPgFrhf_6F8-U0XPQU9crQ@mail.gmail.com>
 <YPXUI0VzpxYO56BU@yoga>
In-Reply-To: <YPXUI0VzpxYO56BU@yoga>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 19 Jul 2021 14:53:47 -0700
Message-ID: <CAGETcx90xNFzEB9yfWvLg=X+ptrgNaQg9Ncxi-U_Z0vXHrUcgw@mail.gmail.com>
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 19, 2021 at 12:36 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 19 Jul 14:00 CDT 2021, John Stultz wrote:
>
> > On Fri, Jul 16, 2021 at 10:01 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > On Tue 06 Jul 23:53 CDT 2021, John Stultz wrote:
> > > > Allow the qcom_scm driver to be loadable as a permenent module.
> > > >
> > > > This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> > > > ensure that drivers that call into the qcom_scm driver are
> > > > also built as modules. While not ideal in some cases its the
> > > > only safe way I can find to avoid build errors without having
> > > > those drivers select QCOM_SCM and have to force it on (as
> > > > QCOM_SCM=n can be valid for those drivers).
> > > >
> > > > Reviving this now that Saravana's fw_devlink defaults to on,
> > > > which should avoid loading troubles seen before.
> > > >
> > >
> > > Are you (in this last paragraph) saying that all those who have been
> > > burnt by fw_devlink during the last months and therefor run with it
> > > disabled will have a less fun experience once this is merged?
> > >

Bjorn,

I jump in and help with any reports of issues with fw_devlink if I'm
cc'ed. Please feel free to add me and I'll help fix any issues you
have with fw_devlink=on.

> >
> > I guess potentially. So way back when this was originally submitted,
> > some folks had trouble booting if it was set as a module due to it
> > loading due to the deferred_probe_timeout expiring.
> > My attempts to change the default timeout value to be larger ran into
> > trouble, but Saravana's fw_devlink does manage to resolve things
> > properly for this case.
> >
>
> Unfortunately I see really weird things coming out of that, e.g. display
> on my db845c is waiting for the USB hub on PCIe to load its firmware,
> which typically times out after 60 seconds.
>
> I've stared at it quite a bit and I don't understand how they are
> related.

Can you please add me to any email thread with the details? I'd be
happy to help.

First step is to make sure all the devices probe as with
fw_devlink=permissive. After that if you are still seeing issues, it's
generally timing issues in the driver. But if the actual timing issue
is identified (by you or whoever knows the driver seeing the issue),
then I can help with fixes or suggestions for fixes.

> > But if folks are having issues w/ fw_devlink, and have it disabled,
> > and set QCOM_SCM=m they could still trip over the issue with the
> > timeout firing before it is loaded (especially if they are loading
> > modules from late mounted storage rather than ramdisk).
> >
>
> I guess we'll have to force QCOM_SCM=y in the defconfig and hope people
> don't make it =m.
>
> > > (I'm picking this up, but I don't fancy the idea that some people are
> > > turning the boot process into a lottery)
> >
> > Me neither, and I definitely think the deferred_probe_timeout logic is
> > way too fragile, which is why I'm eager for fw_devlink as it's a much
> > less racy approach to handling module loading dependencies.
>
> Right, deferred_probe_timeout is the main issue here. Without it we
> might get some weird probe deferral runs, but either some driver is
> missing or it settles eventually.
>
> With deferred_probe_timeout it's rather common for me to see things
> end up probe out of order (even more now with fw_devlink finding cyclic
> dependencies) and deferred_probe_timeout just breaking things.

Again, please CC me on these threads and I'd be happy to help.

>
> > So if you
> > want to hold on this, while any remaining fw_devlink issues get
> > sorted, that's fine.  But I'd also not cast too much ire at
> > fw_devlink, as the global probe timeout approach for handling optional
> > links isn't great, and we need a better solution.
> >
>
> There's no end to the possible and valid ways you can setup your
> defconfig and run into the probe deferral issues, so I see no point in
> holding this one back any longer. I just hope that one day it will be
> possible to boot the upstream kernel in a reliable fashion.

Might not be believable, but I'm hoping fw_devlink helps you meet this goal :)

-Saravana
