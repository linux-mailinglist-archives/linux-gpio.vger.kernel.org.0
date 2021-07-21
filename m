Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F120F3D17A5
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 22:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhGUTcg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 15:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhGUTcf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 15:32:35 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A489C061757
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 13:13:12 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id a17-20020a9d3e110000b02904ce97efee36so1244439otd.7
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 13:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lop2Mo3qaKZQHvdRq+YuqOoaPIzQiwDuhfWOgAOqAZ0=;
        b=PB5mPY5G2ota/+DFFfxv3JPi5/vJEoUikCFhR6GYPPynTWxryvDVQAjnTtQwa5NC5K
         8h+BmifA/rmTHaPIVlCdcglYRQYSXE0+fy4IZ+L5VDB9DeM5MDHAoqM6B0vhSYO3sKGx
         lHZX3keWuX9nc7XYdQ97FzDGY97MRBs2sYrar6FXMQRafku+SUf0KDpR8t6RDz/m9ME1
         7lFJyccSwSSiifWjfHMAIU3w72mDbgnkTh8gBqBut4/IjGpZoYqEydJ/FP68dicuDiq1
         6vu2iB76r8IUSdI6oEBE5OOZIzIe9emYP59IsOin4oGebtHd3WUzZX9p/V8zxSlAgbuB
         cfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lop2Mo3qaKZQHvdRq+YuqOoaPIzQiwDuhfWOgAOqAZ0=;
        b=Rge9ad94nTOBXc8vDMG8w7Pp+7hJB0Epiv0966ICJ61UFqmefxmNYi++KU8rjFuURb
         fG4re7+DWdPhZ7VrFGPv/oeIW+dTKyxj57yedScGLgSLQC3qXUyQF3yxRD3UP12C/x3F
         AcMXd5iueqkiAz5Jp+LkxEHNSEycQEFrP6Pe8C9M5MQuiS0HzVH4S8ulh/+VbqKsdabs
         FbDXpEOt/8GD/jyxaLUG05KqBn8cvye7KI7JgZLFixVjGIXF/JfyJVsuvkHQyFElzrKA
         vq2CwvW+AepHahfnVgFpTWBSYGA/NhfzDVi1nHRyV9IY7LYbwD3xKi2yudCokrNlfJcV
         TiGA==
X-Gm-Message-State: AOAM530hTlny6gWO1jvnCiw8MVlLlD6zn0JDWP2Bkt2oZB3MBirW6w5H
        Vq2L8NW8hB99DDdPww+9qG29EQ==
X-Google-Smtp-Source: ABdhPJwsrm6tGosBeciWrtLHpuumSbtrzelppV5AbtxXUKRLSAIzmTPCqypzIK2PjWq0vIb4pcWAcw==
X-Received: by 2002:a05:6830:34a4:: with SMTP id c36mr14509757otu.57.1626898391420;
        Wed, 21 Jul 2021 13:13:11 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b2sm1732793otf.40.2021.07.21.13.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 13:13:10 -0700 (PDT)
Date:   Wed, 21 Jul 2021 15:13:08 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Saravana Kannan <saravanak@google.com>
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
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
Message-ID: <YPh/1IN1A9BixMrw@yoga>
References: <20210707045320.529186-1-john.stultz@linaro.org>
 <YPJkF21ItYlKODyq@yoga>
 <CALAqxLUzTNiA7u=4_y9pkrh=Q_+vpPgFrhf_6F8-U0XPQU9crQ@mail.gmail.com>
 <YPXUI0VzpxYO56BU@yoga>
 <CAGETcx90xNFzEB9yfWvLg=X+ptrgNaQg9Ncxi-U_Z0vXHrUcgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx90xNFzEB9yfWvLg=X+ptrgNaQg9Ncxi-U_Z0vXHrUcgw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 19 Jul 16:53 CDT 2021, Saravana Kannan wrote:

> On Mon, Jul 19, 2021 at 12:36 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 19 Jul 14:00 CDT 2021, John Stultz wrote:
> >
> > > On Fri, Jul 16, 2021 at 10:01 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > On Tue 06 Jul 23:53 CDT 2021, John Stultz wrote:
> > > > > Allow the qcom_scm driver to be loadable as a permenent module.
> > > > >
> > > > > This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> > > > > ensure that drivers that call into the qcom_scm driver are
> > > > > also built as modules. While not ideal in some cases its the
> > > > > only safe way I can find to avoid build errors without having
> > > > > those drivers select QCOM_SCM and have to force it on (as
> > > > > QCOM_SCM=n can be valid for those drivers).
> > > > >
> > > > > Reviving this now that Saravana's fw_devlink defaults to on,
> > > > > which should avoid loading troubles seen before.
> > > > >
> > > >
> > > > Are you (in this last paragraph) saying that all those who have been
> > > > burnt by fw_devlink during the last months and therefor run with it
> > > > disabled will have a less fun experience once this is merged?
> > > >
> 
> Bjorn,
> 
> I jump in and help with any reports of issues with fw_devlink if I'm
> cc'ed. Please feel free to add me and I'll help fix any issues you
> have with fw_devlink=on.
> 

Thanks Saravana, unfortunately I've only heard these reports second hand
so far, not been able to reproduce them on my own. I appreciate your
support and will certainly reach out if I need some assistance.

> > >
> > > I guess potentially. So way back when this was originally submitted,
> > > some folks had trouble booting if it was set as a module due to it
> > > loading due to the deferred_probe_timeout expiring.
> > > My attempts to change the default timeout value to be larger ran into
> > > trouble, but Saravana's fw_devlink does manage to resolve things
> > > properly for this case.
> > >
> >
> > Unfortunately I see really weird things coming out of that, e.g. display
> > on my db845c is waiting for the USB hub on PCIe to load its firmware,
> > which typically times out after 60 seconds.
> >
> > I've stared at it quite a bit and I don't understand how they are
> > related.
> 
> Can you please add me to any email thread with the details? I'd be
> happy to help.
> 
> First step is to make sure all the devices probe as with
> fw_devlink=permissive. After that if you are still seeing issues, it's
> generally timing issues in the driver. But if the actual timing issue
> is identified (by you or whoever knows the driver seeing the issue),
> then I can help with fixes or suggestions for fixes.
> 
> > > But if folks are having issues w/ fw_devlink, and have it disabled,
> > > and set QCOM_SCM=m they could still trip over the issue with the
> > > timeout firing before it is loaded (especially if they are loading
> > > modules from late mounted storage rather than ramdisk).
> > >
> >
> > I guess we'll have to force QCOM_SCM=y in the defconfig and hope people
> > don't make it =m.
> >
> > > > (I'm picking this up, but I don't fancy the idea that some people are
> > > > turning the boot process into a lottery)
> > >
> > > Me neither, and I definitely think the deferred_probe_timeout logic is
> > > way too fragile, which is why I'm eager for fw_devlink as it's a much
> > > less racy approach to handling module loading dependencies.
> >
> > Right, deferred_probe_timeout is the main issue here. Without it we
> > might get some weird probe deferral runs, but either some driver is
> > missing or it settles eventually.
> >
> > With deferred_probe_timeout it's rather common for me to see things
> > end up probe out of order (even more now with fw_devlink finding cyclic
> > dependencies) and deferred_probe_timeout just breaking things.
> 
> Again, please CC me on these threads and I'd be happy to help.
> 
> >
> > > So if you
> > > want to hold on this, while any remaining fw_devlink issues get
> > > sorted, that's fine.  But I'd also not cast too much ire at
> > > fw_devlink, as the global probe timeout approach for handling optional
> > > links isn't great, and we need a better solution.
> > >
> >
> > There's no end to the possible and valid ways you can setup your
> > defconfig and run into the probe deferral issues, so I see no point in
> > holding this one back any longer. I just hope that one day it will be
> > possible to boot the upstream kernel in a reliable fashion.
> 
> Might not be believable, but I'm hoping fw_devlink helps you meet this goal :)
> 

Sounds good, I hope so too :)

Regards,
Bjorn
