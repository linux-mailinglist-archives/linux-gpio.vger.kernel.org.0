Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588D12A078F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 15:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgJ3OMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 10:12:20 -0400
Received: from foss.arm.com ([217.140.110.172]:35516 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbgJ3OMU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Oct 2020 10:12:20 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D098139F;
        Fri, 30 Oct 2020 07:12:19 -0700 (PDT)
Received: from [10.57.54.223] (unknown [10.57.54.223])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C06B13F68F;
        Fri, 30 Oct 2020 07:12:16 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     John Stultz <john.stultz@linaro.org>
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
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org>
 <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck>
 <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck>
 <CALAqxLUDVEq4ds2Wbic6uaK3=dELKKO4eGQxjHFFz19GeUFd_w@mail.gmail.com>
 <20201028135118.GA28554@willie-the-truck>
 <ae6ba27a-d3c8-8b98-c263-ec779ef35738@arm.com>
 <CALAqxLW13=cvTX3ghskb9uG_YoVh7kvp8UQGUB8mVDGYXHWpVQ@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <b5c5146d-4112-e0c2-d1dd-2ad0882190b3@arm.com>
Date:   Fri, 30 Oct 2020 14:12:15 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLW13=cvTX3ghskb9uG_YoVh7kvp8UQGUB8mVDGYXHWpVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-10-30 01:02, John Stultz wrote:
> On Wed, Oct 28, 2020 at 7:51 AM Robin Murphy <robin.murphy@arm.com> wrote:
>> Hmm, perhaps I'm missing something here, but even if the config options
>> *do* line up, what prevents arm-smmu probing before qcom-scm and
>> dereferencing NULL in qcom_scm_qsmmu500_wait_safe_toggle() before __scm
>> is initialised?
> 
> Oh man, this spun me on a "wait, but how does it all work!" trip. :)
> 
> So in the non-module case, the qcom_scm driver is a subsys_initcall
> and the arm-smmu is a module_platform_driver, so the ordering works
> out.
> 
> In the module case, the arm-smmu code isn't loaded until the qcom_scm
> driver finishes probing due to the symbol dependency handling.

My point is that module load != driver probe. AFAICS you could disable 
drivers_autoprobe, load both modules, bind the SMMU to its driver first, 
and boom!

> To double check this, I added a big msleep at the top of the
> qcom_scm_probe to try to open the race window you described, but the
> arm_smmu_device_probe() doesn't run until after qcom_scm_probe
> completes.

I don't think asynchronous probing is enabled by default, so indeed I 
would expect that to still happen to work ;)

> So at least as a built in / built in, or a module/module case its ok.
> And in the case where arm-smmu is a module and qcom_scm is built in
> that's ok too.

In the built-in case, I'm sure it happens to work out similarly because 
the order of nodes in the DTB tends to be the order in which devices are 
autoprobed. Again, async probe might be enough to break things; manually 
binding drivers definitely should; moving the firmware node to the end 
of the DTB probably would as well.

> Its just the case my patch is trying to prevent is where arm-smmu is
> built in, but qcom_scm is a module that it can't work (due to build
> errors in missing symbols,  or if we tried to use function pointers to
> plug in the qcom_scm - the lack of initialization ordering).
> 
> Hopefully that addresses your concern? Let me know if I'm still
> missing something.

What I was dancing around is that the SCM API (and/or its users) appears 
to need a general way to tell whether SCM is ready or not, because the 
initialisation ordering problem is there anyway. Neither Kconfig nor the 
module loader can solve that.

One possible self-contained workaround would be to see if an SCM DT node 
exists, see if a corresponding device exists, and see if that device has 
a driver bound. It's a little ugly, and strictly it still doesn't tell 
you that the _right_ driver is bound, but at least it's a lot more 
robust than implicitly relying on DT order, default probing behaviours, 
and hope.

Robin.
