Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9631A2BA1EB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 06:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgKTFaC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 00:30:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgKTFaB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 00:30:01 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F11DC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 21:30:01 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id n129so8695563iod.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 21:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rRcCB+0d/+THcleGXpsHmeFsuUEX7prgA/r7g5goMgs=;
        b=X+Aq3YwzSwGhvP/e0i+IuVbMbyQTZSCRysWsd3OqVj87//mRB3V/YLTSHNZsxaORWj
         1KXTCYjyUp3/2Z9zqudwBQSuw8IBSATkTy0UvlTiJaSCLjJ6KMRm3H2ZETnE9iNKUdnj
         lBY0xPKh2uUxfWtWx4agxyo9Y0NU8BZDtMhAUZi7xOYFDMdqGrzLhOt2VSlEpsTS0H4R
         9EwQmbrtgjVqurBf4Kl/vrUdJiSAp4uqC9lNvSD8OnJ1jSK9R4vpRkfCSscMDN12uqdP
         JwCnBmgAS2Nsfyet+Xb5p4AhBenblWZPt+ybpKaMBl2myoqzH3AS/GayIn0oQ09BiXOi
         cetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rRcCB+0d/+THcleGXpsHmeFsuUEX7prgA/r7g5goMgs=;
        b=XRveXyucwGIDWhPdo8IG5jnMxJyRzupsRVuoV0klis2XBVvwGiwSMey/4SEAXeYd4H
         YNFn7m3+q5y7Cq03TDLDQxRDT43nbNv6OiydIJMgtHCA55woGvBf7Zr4jhMpPvJJueD3
         r0+ZjEIJ+Btr8Ci/29qPM1Drsf3asOpR9/ypFcjOVGGB3c9a1kxy26qgQNDrvqqbBW4c
         jyjb7V6pMg/QJoDzij2J8vwJ3ReUIaRLv+NTQql1Kp5ykALM5H1Q2rvoPMYpYkB8wprJ
         DaSrGnQbfuw1re/sExvcYvRpEs8imxjqSGfYMWFEai1aegYrRV0qYb/Uxk+4gZeQJHp6
         Ioew==
X-Gm-Message-State: AOAM533Qmnmc+VgBMma6waazgw3ljsWPMfq9PVRssYaMtGCBe2hTHjhV
        OpjNKQ0SBKf9uYnU2USuwYsfqnHKFj1YYFhpEJ7LyagY+jw=
X-Google-Smtp-Source: ABdhPJxvWl2kEt+gAhL8w8b0FjxyE1ijV9kgnPD7gx//s/TvbREuA8gWrdLOrOAIFSZllFXI3ABfREApFhu4yx/jCy8=
X-Received: by 2002:a05:6638:22bb:: with SMTP id z27mr18289084jas.47.1605850200674;
 Thu, 19 Nov 2020 21:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20201119174149.3860883-1-thierry.reding@gmail.com>
In-Reply-To: <20201119174149.3860883-1-thierry.reding@gmail.com>
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Thu, 19 Nov 2020 23:29:48 -0600
Message-ID: <CAOCOHw5sAc=VnDy68yihniZ+nW6JYJeFckE9gPbJJgGCo5kcGQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module"
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Will Deacon <will@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 11:42 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Commit d0511b5496c0 ("firmware: QCOM_SCM: Allow qcom_scm driver to be
> loadable as a permenent module") causes the ARM SMMU driver to be built
> as a loadable module when using the Aarch64 default configuration. This
> in turn causes problems because if the loadable module is not shipped
> in an initial ramdisk, then the deferred probe timeout mechanism will
> cause all SMMU masters to probe without SMMU support and fall back to
> just plain DMA ops (not IOMMU-backed).
>
> Once the system has mounted the rootfs, the ARM SMMU driver will then
> be loaded, but since the ARM SMMU driver faults by default, this causes
> a slew of SMMU faults for the SMMU masters that have already been set
> up with plain DMA ops and cause these devices to malfunction.
>

FWIW I had the same issues on the Qualcomm platform and merged a patch
that turns QCOM_SCM=y in arm64 defconfig earlier today. So this should
hide the problem in next linux-next. (And it really should be =y in
defconfig regardless of this revert or not).

> Revert that commit to unbreak things while we look for an alternative
> solution.
>

I don't fancy the fact that we have a situation where if you're
unlucky to have probe deferrals lingering past late initcall things
will start to just break and this from a growing number of resource
types. But I also don't see any alternatives to fixing the kernel to
handle this gracefully.

Regards,
Bjorn
