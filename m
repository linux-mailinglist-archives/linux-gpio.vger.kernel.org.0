Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050583D3BBB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 16:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbhGWNnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 09:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbhGWNnq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 09:43:46 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B11C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 07:24:18 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id a5-20020a05683012c5b029036edcf8f9a6so2225115otq.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TFOUkgVe/De3oymeenLBuNPer+TUmPN7lpMy3blENNw=;
        b=kMYc3VLcZ8HQkeGDP4GCj08ozIhO820sv8drLzH/p0tt+jnIl+jqN4ig75T2p0lKw/
         GbMiV85J/nc0wqsoDrAy0FBoq8f4oWdxggAf3+1YZZPlqb/CIQw5PVwLqx2g1fKTU/xJ
         2zCvCUTIqjmHIwMlzDo3Cq42Eirw6Z6bccTo6dTdRcjCoYtQKxDXrejsuVsuSV7LCRQR
         tuD974zCr28piclys4fQ7Y+lvwA+YYLmvDQ7giWULxqVOoa7Wshd7pAgkk+NcwkU53VM
         XgANK5fQb4M+ZZKMo9j6bpevRaDl4Dkyn+6PvhDQZiXVmnZmgWeY7qgorQkOPqWuAEcY
         HFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TFOUkgVe/De3oymeenLBuNPer+TUmPN7lpMy3blENNw=;
        b=F8dG1lKfnM5ZWBdddoivw3R+r/z/VX6Qwf71B9Cmou7RWFwnFxQOR3bSQ5rud8f+V9
         2YkyTRzTI3vaSbos27JI6SoPcm4j+pkPkrKxDyb4zms7dCuAGu2l+tjn7iJLB26AZsW/
         cRLEhDK/1/srQdki7/4Siri+XDg+5JtL51ht29zjAkJyVYtDU2/Hz4Cj9dup0KuHCcRA
         QrLOxqQSYqe96ZaQLsG6GefNWd8w2FNyFrLuND5na4gSMQSyMaL3Xzv3U720+ColwlN/
         qQszNh2RJyAjbFshWjL+mVKuEg0CSqEt4Cm8BKcuTrvDx3pN5i4gVS7W8Mj4a36KyJpT
         cTuA==
X-Gm-Message-State: AOAM5317G+z9DjSf0eiyGZNZl9eD9SmJ92mx3oRQwmXo5ah8/3YymfMk
        9KCeZmh4Eue2TbV88NKVePl+/g==
X-Google-Smtp-Source: ABdhPJz+8ZHqxxjGU86tyolNaSdy9VlLyxBEJo+yDX15pPrPdOO0ZWJWGxlkjLP/OhHNkko5BhKtfA==
X-Received: by 2002:a9d:2c61:: with SMTP id f88mr3251914otb.62.1627050257958;
        Fri, 23 Jul 2021 07:24:17 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s7sm3420836ool.14.2021.07.23.07.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:24:17 -0700 (PDT)
Date:   Fri, 23 Jul 2021 09:24:14 -0500
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
Message-ID: <YPrRDrmlmF4ws4DQ@yoga>
References: <20210707045320.529186-1-john.stultz@linaro.org>
 <YPgK50dmV7Z69WsL@kroah.com>
 <CALAqxLUVgUT+1DyDGsFbF0138S0OYzpKADk__PsYbR4B4mbMhw@mail.gmail.com>
 <CAGETcx91URbHCYMoGt_cCgvMXNkVyJb4Ek-ng8jwR+eQhvZN1A@mail.gmail.com>
 <YPiCSOys6zEH6Kfg@yoga>
 <CAGETcx8Yw2QDYBYNpqVt_kPHnokFR+qinr5GAJ1byVWMuc3PLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx8Yw2QDYBYNpqVt_kPHnokFR+qinr5GAJ1byVWMuc3PLQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 21 Jul 16:07 CDT 2021, Saravana Kannan wrote:

> On Wed, Jul 21, 2021 at 1:23 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 21 Jul 13:00 CDT 2021, Saravana Kannan wrote:
> >
> > > On Wed, Jul 21, 2021 at 10:24 AM John Stultz <john.stultz@linaro.org> wrote:
> > > >
> > > > On Wed, Jul 21, 2021 at 4:54 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, Jul 07, 2021 at 04:53:20AM +0000, John Stultz wrote:
> > > > > > Allow the qcom_scm driver to be loadable as a permenent module.
> > > > >
> > > > > This feels like a regression, it should be allowed to be a module.
> > > >
> > > > I'm sorry, I'm not sure I'm following you, Greg.  This patch is trying
> > > > to enable the driver to be able to be loaded as a module.
> > >
> > > I think the mix up might be that Greg mentally read "permanent module"
> > > as "builtin"?
> > >
> > > "permanent module" is just something that can't be unloaded once it's
> > > loaded. It's not "builtin".
> > >
> >
> > Afaict there's nothing in this patch that makes it more or less
> > permanent.
> 
> The lack of a module_exit() makes it a permanent module. If you do
> lsmod, it'll mark this as "[permanent]".
> 

Cool, I didn't know that.

Thanks,
Bjorn
