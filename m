Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F3A3D1813
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 22:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhGUTnF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 15:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhGUTnF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 15:43:05 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9B9C061575
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 13:23:40 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so3219722otq.11
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=77dhpNLNlPTZpTCURQUnf+oZHn/H39pvM50oNH/nUpc=;
        b=YjPCN/rRIxpIJzYVmExEinm/P78doKDEyOHsAhpwBykxyVgKttjk81jWoHdxeagjCx
         qazfTYAVv2F8cJiIoBXQldyIB9X2iZDpTC9B2sWXQsuMFN6cHC5OjUzweiXHBnRE8knm
         mBGyLzUpbgRPD1fp/vu6+E6MWgQ2vzNj5atkmxbYQk5TBXwYD1ZTQNYi2zF5BFZGbNsP
         +JItZ0rOXWR3ClEyiy7sihCe9IxNJNXn37d/Nvkvkro14P+AxzcTa8g3aooGQ8+TCH7r
         +okZpgIj8LIh34FstHZs9mKBYZMXnJFSlZtCfge66nJKU5hn51rVmZ6q5PfdjteS3QOf
         3S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=77dhpNLNlPTZpTCURQUnf+oZHn/H39pvM50oNH/nUpc=;
        b=Gbx/ctE/Nte02tHC73OMaMTTL9t8GOZLH70skqshaWhpZXfluYYqWt6h9M2tXHepBp
         Vt+4WRiBmMnL7EHTIfkYeBImA1mN7WJxPmnIpCjcfgJUGzl4xrjKQ9wwUXD8FYsOeMzT
         bXW80PL4TgjUuh+mScfVHYzWoU5K7IoUNYDKlt+9uwqG0L36XdkG9VXAMIOiAHSOFsbk
         RumG7dOX39oJ+0fqlkK8+ti+P9MHwG9Tvnc/zJnCOAUgotP3IHvwuBupbbD309QEKS6c
         6qB1Z3KC0daG/qo8/uhIypwyKVQ3im4EjJ8wI99stVED+I6SQ9o3UVIYc2vuGfWXkwjs
         sNyQ==
X-Gm-Message-State: AOAM531CgS7yhhMI/EuFWUDr5T43n+HG2l9mnmdgVGfjIWtqyNqbkD87
        iUqnZSctp/Xsx2EAWCKQHgn7Yw==
X-Google-Smtp-Source: ABdhPJwnSDEVp2hbZ0kUNxTYaDzfnALKUB+kN8v1J2PAI7IeD1hHGGKQpAciErFoEbZXOlPZNL0lUA==
X-Received: by 2002:a9d:5a8:: with SMTP id 37mr27558191otd.345.1626899019664;
        Wed, 21 Jul 2021 13:23:39 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l17sm4939939ota.20.2021.07.21.13.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 13:23:39 -0700 (PDT)
Date:   Wed, 21 Jul 2021 15:23:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
Message-ID: <YPiCSOys6zEH6Kfg@yoga>
References: <20210707045320.529186-1-john.stultz@linaro.org>
 <YPgK50dmV7Z69WsL@kroah.com>
 <CALAqxLUVgUT+1DyDGsFbF0138S0OYzpKADk__PsYbR4B4mbMhw@mail.gmail.com>
 <CAGETcx91URbHCYMoGt_cCgvMXNkVyJb4Ek-ng8jwR+eQhvZN1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx91URbHCYMoGt_cCgvMXNkVyJb4Ek-ng8jwR+eQhvZN1A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 21 Jul 13:00 CDT 2021, Saravana Kannan wrote:

> On Wed, Jul 21, 2021 at 10:24 AM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, Jul 21, 2021 at 4:54 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Jul 07, 2021 at 04:53:20AM +0000, John Stultz wrote:
> > > > Allow the qcom_scm driver to be loadable as a permenent module.
> > >
> > > This feels like a regression, it should be allowed to be a module.
> >
> > I'm sorry, I'm not sure I'm following you, Greg.  This patch is trying
> > to enable the driver to be able to be loaded as a module.
> 
> I think the mix up might be that Greg mentally read "permanent module"
> as "builtin"?
> 
> "permanent module" is just something that can't be unloaded once it's
> loaded. It's not "builtin".
> 

Afaict there's nothing in this patch that makes it more or less
permanent. The module will be quite permanent (in practice) because
several other core modules reference symbols in the qcom_scm module.

But thanks to a previous patch, the qcom_scm device comes with
suppress_bind_attrs, to prevent that the device goes away from a simple
unbind operation - which the API and client drivers aren't designed to
handle.

So, it would have been better in this case to omit the word "permanent"
from the commit message, but the change is good and I don't want to
rebase my tree to drop that word.

Thanks,
Bjorn

> -Saravana
> 
> >
> > > > This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> > > > ensure that drivers that call into the qcom_scm driver are
> > > > also built as modules. While not ideal in some cases its the
> > > > only safe way I can find to avoid build errors without having
> > > > those drivers select QCOM_SCM and have to force it on (as
> > > > QCOM_SCM=n can be valid for those drivers).
> > > >
> > > > Reviving this now that Saravana's fw_devlink defaults to on,
> > > > which should avoid loading troubles seen before.
> > >
> > > fw_devlink was supposed to resolve these issues and _allow_ code to be
> > > built as modules and not forced to be built into the kernel.
> >
> > Right. I'm re-submitting this patch to enable a driver to work as a
> > module, because earlier attempts to submit it ran into boot trouble
> > because fw_devlink wasn't yet enabled.
> >
> > I worry something in my description made it seem otherwise, so let me
> > know how you read it and I'll try to avoid such confusion in the
> > future.
> >
> > thanks
> > -john
