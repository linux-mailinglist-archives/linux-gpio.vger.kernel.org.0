Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BFF29FDA6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 07:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgJ3GJo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 02:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJ3GJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 02:09:35 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1A6C0613D3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 23:09:34 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id f37so4628919otf.12
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 23:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OHv3qXD9Nsz5SAwNQFVqE8iplEapZHDVektBwmjGoKQ=;
        b=lgxkN2Fiq0uQ+gFWcLDxMWjgOVcYPPlJM7bC4PRz2pSd+ehz1CZNpVLED6kwZy5nsc
         jH9c4wXmRVZR8puuWHpatKJBb4XPHAcf6kcYw9ssDOd6ZZo22m+2C1ayerMeni7E1s6d
         87p67dmH+pYH13N0VkV7Lv/SyzKEbUsu79/2B2G5xGo1boHvSZvw+ferESovUGFc5Jss
         cgUF8AwDVRuDjL1wVuhYNjpYYEOF5GwBMD3ijyGmFSBuY6/r92ESfiK2Z2/M6qHofEQY
         Gfq/h6GY422vzTK5+dwfvtC2XnfYtti1gk0XTuwQpwtpU4/3kIcQhQmWv+R4jFTp1E+C
         VvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OHv3qXD9Nsz5SAwNQFVqE8iplEapZHDVektBwmjGoKQ=;
        b=GCVdMxOgH6yRnKM2l7psmnH0VfLIVaOgAumeSHkNURCSdS2VdJgEXpQPli/cmgDO++
         XJDCD5kbciQYkVkPVfAbLpybVSwNDO536xzHqN+2sKRNPk777xa++RziSHVDE1X3bpQ2
         jI5Ztb5KG6v0jv8FwJu0t8Rwh7TKX6zlv1Xvmk4t66suL0mDDOE5kqEPCXHgDvupUQS3
         vP27bzWWh8KskqTPFRTGBFzmYH6diWCN1Fq/vHES1ISXJT7F3C/VGkczEF/Ur5Buv9EF
         AYehj40Rx26TxXYUDL4L5XqyrmGH+4KQfE7dJa4cwJ8e0W2RDY8kiT5ZCV8hikCGjpX3
         nETQ==
X-Gm-Message-State: AOAM533l+KDp56xPXGnblADB967TbVpylovzCwp6dK5CAZv7GpAxnlZY
        ghSCm352swyg8DAezk7AqagQUjKwZXiPsz1AJkR55A==
X-Google-Smtp-Source: ABdhPJy+qBsU/PGTXqQlbB+9AAjGvJ/8yyf5j0GKrjlrXDXbjKlnjfleDVvxRlBaDOzesvGrgg6pDipyuVyjHj8F22Q=
X-Received: by 2002:a05:6830:400c:: with SMTP id h12mr561860ots.102.1604038173959;
 Thu, 29 Oct 2020 23:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org> <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck> <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck> <CALAqxLUDVEq4ds2Wbic6uaK3=dELKKO4eGQxjHFFz19GeUFd_w@mail.gmail.com>
 <20201028135118.GA28554@willie-the-truck>
In-Reply-To: <20201028135118.GA28554@willie-the-truck>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 29 Oct 2020 23:09:21 -0700
Message-ID: <CALAqxLWyam_+R6KubTpFKrWkHGPXrqa+6Tz=BDxeP3t_gSqHCg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Will Deacon <will@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 6:51 AM Will Deacon <will@kernel.org> wrote:
> On Tue, Oct 27, 2020 at 10:53:47PM -0700, John Stultz wrote:
> > Alternatively, I'm considering trying to switch the module dependency
> > annotation so that the CONFIG_QCOM_SCM modularity depends on ARM_SMMU
> > being a module. But that is sort of putting the restriction on the
> > callee instead of the caller (sort of flipping the meaning of the
> > depends), which feels prone to later trouble (and with multiple users
> > of CONFIG_QCOM_SCM needing similar treatment, it would make it
> > difficult to discover the right combination of configs needed to allow
> > it to be a module).
> >
> > Anyway, I wanted to reach out to see if you had any further ideas
> > here. Sorry for letting such a large time gap pass!
>
> Well we can always go with your original hack, if it helps?
>
> https://lore.kernel.org/linux-iommu/20200714075603.GE4277@willie-the-truck/

Yea. After trying a few more ideas that didn't pan out, I think I'm
going to fall back to that. :(

thanks
-john
