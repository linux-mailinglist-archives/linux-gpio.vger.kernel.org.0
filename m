Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2F33CEF52
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jul 2021 00:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383762AbhGSVue (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 17:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384091AbhGSSTp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 14:19:45 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FDFC061767
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 11:49:15 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id g22so20026238lfu.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jdLZvJN21CTu/nU9p3zM/7iZ/xDd3v4ptR1eHb187U=;
        b=GAA2TFcqcWKOiNo7WTflTgsUtZoVN+Sr0pFrALy8uy/woqt17QIoJqfYp3Tuf8NwtD
         jMiXlHSGBKJkq9CnBheHrhObo675Jc2Ua5Rd03WylMJj4URR+qAs5aEfbtR8twNDiUCq
         nxPCeUDKG8iUp9iK9SKc40K8Mljh6vKLRfOR0sz1fFweRa3X30nbCQJcwNA4f7pXWhs3
         B4R4+85bflBh80tdunaKPpbFV7h39mGQfhA94+U/bsyVicM5BZgtkOUpbNc1KIRbqTvS
         sF6tcpFTV1R0Pu4eIYZdf5XHr88AeJWG3VEIbp0uj1SDhe3DRa2rxXZPJfECGCM2yVaL
         rQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jdLZvJN21CTu/nU9p3zM/7iZ/xDd3v4ptR1eHb187U=;
        b=r14c15GIfTq6ur9BolHNKRo5oYcQbvLd7jYcqljuvxnAoGO3eqIQpY3Ud1VsYqqtnN
         cmKRjTOTbW4hENQUewroll9VdB15GC9aePuA21z+svVCJbUQ2fOZAwLQCqeIKTS/MHAq
         Y1uqhrB+PTJ+UxL3yASxinI9tKEPEkyUZc4eGQ5tZ4dUPa9ch0p54qt9204OurJJHcUY
         pcwx34ULWTZXX5Blrr0g7/8x3tawy4IEnwGEGLerMmHKMcMEw7Lq0FFGdqqY+kjGjhxW
         OxY9sMF9BjRGyMJJTm1SJilYrE9E1Etr6pn9LqPPG5y6jmAN1HsDxp+zUlwtEI1/duAa
         RjhA==
X-Gm-Message-State: AOAM531EzQoy16mp4QEwFLsrvCyiW20WI1lIrbFxDYU2A5GUaMh7y35S
        IKEdByX7kiP9e+B5qjZfdiz7loHPngQaZPG68PAI5Q==
X-Google-Smtp-Source: ABdhPJzfaiUMhEtqkQ8scwUqGoeeaz2XvfjZbPLzAoB9375A2Qo9QDi+PUY9EVT8e3XQhXZTEWfjw+m4kUjCVu+SYWs=
X-Received: by 2002:a19:7408:: with SMTP id v8mr19183878lfe.508.1626721216181;
 Mon, 19 Jul 2021 12:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210707045320.529186-1-john.stultz@linaro.org> <YPJkF21ItYlKODyq@yoga>
In-Reply-To: <YPJkF21ItYlKODyq@yoga>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 19 Jul 2021 12:00:05 -0700
Message-ID: <CALAqxLUzTNiA7u=4_y9pkrh=Q_+vpPgFrhf_6F8-U0XPQU9crQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 16, 2021 at 10:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Tue 06 Jul 23:53 CDT 2021, John Stultz wrote:
> > Allow the qcom_scm driver to be loadable as a permenent module.
> >
> > This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> > ensure that drivers that call into the qcom_scm driver are
> > also built as modules. While not ideal in some cases its the
> > only safe way I can find to avoid build errors without having
> > those drivers select QCOM_SCM and have to force it on (as
> > QCOM_SCM=n can be valid for those drivers).
> >
> > Reviving this now that Saravana's fw_devlink defaults to on,
> > which should avoid loading troubles seen before.
> >
>
> Are you (in this last paragraph) saying that all those who have been
> burnt by fw_devlink during the last months and therefor run with it
> disabled will have a less fun experience once this is merged?
>

I guess potentially. So way back when this was originally submitted,
some folks had trouble booting if it was set as a module due to it
loading due to the deferred_probe_timeout expiring.
My attempts to change the default timeout value to be larger ran into
trouble, but Saravana's fw_devlink does manage to resolve things
properly for this case.

But if folks are having issues w/ fw_devlink, and have it disabled,
and set QCOM_SCM=m they could still trip over the issue with the
timeout firing before it is loaded (especially if they are loading
modules from late mounted storage rather than ramdisk).

> (I'm picking this up, but I don't fancy the idea that some people are
> turning the boot process into a lottery)

Me neither, and I definitely think the deferred_probe_timeout logic is
way too fragile, which is why I'm eager for fw_devlink as it's a much
less racy approach to handling module loading dependencies.  So if you
want to hold on this, while any remaining fw_devlink issues get
sorted, that's fine.  But I'd also not cast too much ire at
fw_devlink, as the global probe timeout approach for handling optional
links isn't great, and we need a better solution.

thanks
-john
