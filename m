Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5B82A11DB
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Oct 2020 01:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgJaAMz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 20:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgJaAMy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 20:12:54 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF63C0613D7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 17:12:54 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id j12so1998145oou.6
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 17:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jmkNEXF5cOAT44oNaa0CAo3EqS9dZFXr7FPYKKXyzfA=;
        b=vkv+Mg8Nts49zK21uhvvUUe5HteZqk+9SKh6/SBdxMAor/b0L82+k4Y9K+OUag78Wv
         Jwd17Mdpa5WLYk4wh0/aopakx193gqDo+w4ydvNcXNKYsyGYp7BM8O4M1B9z4c2CGzWG
         VJBdfedgdDtyB/TImJNMC13mpL5PkjU1wyUJjFWkmpqpiPaDPQqqFOYvrCiuJOKE8HFO
         xB/KsHdv8+71SRb1uWE6yyuPcUkEZsp2pDrfsUlvzk46cgY8i4Y2yQ4GPekvuoMtZjnC
         LiRWGuARhTqeOkeJy1gj7EU8+btrs+MC4WThY59ACMLglIDfdvkZpIvX4aGAKHNPs6Qs
         3u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jmkNEXF5cOAT44oNaa0CAo3EqS9dZFXr7FPYKKXyzfA=;
        b=J5QTwAhzWD9wMdggHmNNvuqKkZJDDIMA6VELdum6Ob8P8MzyhakJIIovs7g9Ro4Y2P
         XIucQEzuss0a09z83b+e7/vnpEHkGgjr9VH6k89paHIBZuKDq1K+1hQ4gwZ3h/oRl+Nj
         40qvkXgNOjf11kRBn0yuHr43JU9wQPuS/dL4hh/gHCLLnpP0oK3cG/eyvCAjaQOoE41E
         HAyzaJImEpl208hOHH4oi27nh5CLWGfhgP+1cECDZqG9QwmKxvfieRjJDEpQIRirXHje
         fWspVVzTcqhdo7vyjoIsgNRgMTov17Epsjja/xAw0AvqcGgqYbNWCM+x3Ywc9NwK/dI3
         PaeA==
X-Gm-Message-State: AOAM532OFTQFcRSYZe8mCv8GBPVw/ZQQh39ZOl6sxAvitteESvWRaDXu
        DKRJ+aAjbKtjAzOEB6YHQI8Lmz48objHPdHTahuSqw==
X-Google-Smtp-Source: ABdhPJyg1P2jxuPJ3INlKNqxkesvEgxWdFy6INsw9yDE1UyPF53CbdnrlycVF/620SDHWA8iQrGcl+qCxF8X7thlHv4=
X-Received: by 2002:a4a:5182:: with SMTP id s124mr3812313ooa.88.1604103173648;
 Fri, 30 Oct 2020 17:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org> <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck> <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck> <CALAqxLUDVEq4ds2Wbic6uaK3=dELKKO4eGQxjHFFz19GeUFd_w@mail.gmail.com>
 <20201028135118.GA28554@willie-the-truck> <ae6ba27a-d3c8-8b98-c263-ec779ef35738@arm.com>
 <CALAqxLW13=cvTX3ghskb9uG_YoVh7kvp8UQGUB8mVDGYXHWpVQ@mail.gmail.com> <b5c5146d-4112-e0c2-d1dd-2ad0882190b3@arm.com>
In-Reply-To: <b5c5146d-4112-e0c2-d1dd-2ad0882190b3@arm.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 30 Oct 2020 17:12:41 -0700
Message-ID: <CALAqxLW=11O=bRQbVr_Bg6t97BhfxAqLC1OmXRATNjKkbxVUTA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Maulik Shah <mkshah@codeaurora.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Marc Zyngier <maz@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 7:12 AM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2020-10-30 01:02, John Stultz wrote:
> > On Wed, Oct 28, 2020 at 7:51 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >> Hmm, perhaps I'm missing something here, but even if the config options
> >> *do* line up, what prevents arm-smmu probing before qcom-scm and
> >> dereferencing NULL in qcom_scm_qsmmu500_wait_safe_toggle() before __scm
> >> is initialised?
> >
> > Oh man, this spun me on a "wait, but how does it all work!" trip. :)
> >
> > So in the non-module case, the qcom_scm driver is a subsys_initcall
> > and the arm-smmu is a module_platform_driver, so the ordering works
> > out.
> >
> > In the module case, the arm-smmu code isn't loaded until the qcom_scm
> > driver finishes probing due to the symbol dependency handling.
>
> My point is that module load != driver probe. AFAICS you could disable
> drivers_autoprobe, load both modules, bind the SMMU to its driver first,
> and boom!
>
> > To double check this, I added a big msleep at the top of the
> > qcom_scm_probe to try to open the race window you described, but the
> > arm_smmu_device_probe() doesn't run until after qcom_scm_probe
> > completes.
>
> I don't think asynchronous probing is enabled by default, so indeed I
> would expect that to still happen to work ;)
>
> > So at least as a built in / built in, or a module/module case its ok.
> > And in the case where arm-smmu is a module and qcom_scm is built in
> > that's ok too.
>
> In the built-in case, I'm sure it happens to work out similarly because
> the order of nodes in the DTB tends to be the order in which devices are
> autoprobed. Again, async probe might be enough to break things; manually
> binding drivers definitely should; moving the firmware node to the end
> of the DTB probably would as well.

So, with modules, I turned on async probing for the two drivers, as
well as moved the firmware node to the end of the dtb, and couldn't
manage to trip it up even with a 6 second delay in the qcom_scm probe
function.

It was only when doing the same with everything built in that I did
manage to trigger the issue. So yes, you're right!  And it is an issue
more easily tripped with everything built in statically (and not
really connected to this patch series).

> > Its just the case my patch is trying to prevent is where arm-smmu is
> > built in, but qcom_scm is a module that it can't work (due to build
> > errors in missing symbols,  or if we tried to use function pointers to
> > plug in the qcom_scm - the lack of initialization ordering).
> >
> > Hopefully that addresses your concern? Let me know if I'm still
> > missing something.
>
> What I was dancing around is that the SCM API (and/or its users) appears
> to need a general way to tell whether SCM is ready or not, because the
> initialisation ordering problem is there anyway. Neither Kconfig nor the
> module loader can solve that.

Hrm... There is qcom_scm_is_available().  I tried adding a check for
that in qcom_smmu_impl_init() and return EPROBE_DEFER if it fails, but
I then hit a separate crash (tripping in iommu_group_remove_device on
a null dev->iommu_group value). But after adding a check for that, it
seems to be working...

I'll try to spin up a separate patch here for that in a second.

thanks
-john
