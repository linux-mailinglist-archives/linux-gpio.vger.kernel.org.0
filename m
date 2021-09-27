Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821CC419062
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 10:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbhI0IJz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 04:09:55 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57354
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233337AbhI0IJy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Sep 2021 04:09:54 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4CEEF401A9
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632730096;
        bh=q5WJ36pkYt6Zs2G3Lb2ExKY5tf1guh4Epvr/TI1D0B8=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NZYEXU2yJ9fRRMH0gfM2IgwOtmR0GGl8UsRGPXsnv7d+7F2XReRE0JmJAEV5/Rs4D
         6NvGaDSDhRzqdfL/s4B/uv/8QACz380Nppd+e0MYvHTZ7+DEuxUwkmfaeKFxsX0iuj
         /o+SN3kY40dWqWfnASWYmFhZJ9RcvsYl2OsXAnepbMktdyMu3/iR25v5yFDgYyIi6n
         qInPO8H0VUt+3Re0bitBmvveBtPZS7GbAJ4tjwr/68T1ZJbGdRUQSt/VY/gj0VQ1uj
         G5LEtJGzXk1uEuyiHlU5XNoEuxUmjb1ohjfctKtv4h3q13aUPp/yXz5UaP1xXb+l/4
         lzGa0G9J9df2w==
Received: by mail-lf1-f69.google.com with SMTP id m2-20020ac24ac2000000b003f524eae63eso15115371lfp.10
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 01:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q5WJ36pkYt6Zs2G3Lb2ExKY5tf1guh4Epvr/TI1D0B8=;
        b=mBSXnenbFfRu7arvCbQ2qkHFxKxC0eQyXjeC7hR/YG14FZnpSU+Lfnh5goj3x379+K
         777FRxiXQw6pd/kN/oQ34rOm2r9DgHu9tMOeubblq7ErWEpoRIfXPsY8CeyQ/RHQZM7L
         eU6JnXQ2t27/2+NZBf6ITqD8WkT/9McAGUUuqrtYwZ7hqcgSqRjDdwPT5R98+NhlM1+S
         Y2FPRdCckZ8NBjPU6/zOD3VkjNxNckwIbQ+kpd8Iqk8ki6mzKvMmmnXel/CbKZdrUvL6
         1/xus6Pl+l1C8Lgkl9Bzc+IBVZxB0IWRy3aBc3PrtXYNGpEwQbQO+DJMhMOXSorUx58W
         VcaA==
X-Gm-Message-State: AOAM533VWDYe33nUcwQy3XtNOpGHcxgriz2LUWtt5umNmzuw2IO5dVF3
        I+dv04Y9+jnd8Z1nvQUR77trMTqp61AJcVp0Ow5nJbO91uXKsR/vU9/J0aIDVKDToeTmu89GHH/
        rsho13DsClFXCel7QrotJ2mOijSztEW6v5U+LdA0=
X-Received: by 2002:a05:6512:b29:: with SMTP id w41mr23823285lfu.508.1632730095590;
        Mon, 27 Sep 2021 01:08:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO9D+MFvfo7QqvZbpj2VJouLw+R/EGuIqlkcKPx+aer2ePkAwgx+q+94o9gCaoeKkhveY6Ww==
X-Received: by 2002:a05:6512:b29:: with SMTP id w41mr23822816lfu.508.1632730087936;
        Mon, 27 Sep 2021 01:08:07 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 8sm1905053ljf.39.2021.09.27.01.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 01:08:07 -0700 (PDT)
To:     Saravana Kannan <saravanak@google.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kevin Hilman <khilman@baylibre.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
 <YUmTwZPqrCfRMekd@google.com>
 <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com>
 <CAGETcx9wp3cbsehODj=oAd658hF6KNL5Qiy2nVc=7Bxqxxwimw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
Message-ID: <5ec72235-add4-d6dd-f89f-ca3941c9878e@canonical.com>
Date:   Mon, 27 Sep 2021 10:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx9wp3cbsehODj=oAd658hF6KNL5Qiy2nVc=7Bxqxxwimw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/09/2021 04:17, Saravana Kannan wrote:
> On Tue, Sep 21, 2021 at 1:25 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 21/09/2021 10:11, Lee Jones wrote:
>>> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
>>>
>>>> On 20/09/2021 21:03, Will McVicker wrote:
>>>>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
>>>>> a handful of drivers without allowing the vendor to override any of the
>>>>> default configs. This takes away from the flexibilty of compiling a generic
>>>>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
>>>>> modularize these drivers out of the core kernel in order to share a generic
>>>>> kernel image across multiple devices that require device-specific kernel
>>>>> modules.
>>>>
>>>> You do not address the issue in these patches. The problem you describe
>>>> is that drivers are not modules and you are not changing them into modules.
>>>
>>> The wording is unfortunate.  The reason for this change doesn't have
>>> much to do with kernel modules.
>>>
>>> Let's go back in time 18 months or so when Greg KH submitted this [0]
>>> patch, which you Acked.  Greg was trying to solve the problem of not
>>> having to enable ARCH_EXYNOS on kernels which are designed to be
>>> platform agnostic (sometimes called Generic Kernels).  For some reason
>>> SERIAL_SAMSUNG is the only symbol with these dependencies, so the
>>> solution seemed simple and straight forward at the time.
>>>
>>> However, For sound reasons Geert NACKed the patch.
>>>
>>> Quoting from [1] he says:
>>>
>>>   "A generic kernel will include Samsung SoC support, hence
>>>   PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."
>>
>> Yes, it's correct reasoning. There is also one more use-case -
>> non-upstreamed (out of tree) platform which wants to use Exynos-specific
>> drivers. Something like was happening with Apple M1 except that it got
>> upstreamed and we do not care much about out-of-tree.
>>
>>>
>>> However, since the entry for ARCH_EXYNOS *insists* on building-in a
>>> bunch of other symbols (via 'select') which will be unused in most
>>> cases, this is not a currently acceptable approach for many Generic
>>> Kernels due to size constraints.
>>
>> In the mainline kernel there is no such use case. If you want to have
>> Exynos-whatever-driver (e.g. SERIAL_SAMSUNG or S3C RTC), you should
>> select ARCH_EXYNOS because otherwise it does not make any sense. Zero
>> sense. Such kernel won't work.
>>
>> It makes sense only if there is some other work, hidden here, where
>> someone might want to have SERIAL_SAMSUNG or S3C RTC without
>> ARCH_EXYNOS. Although GKI is not that work because GKI kernel will
>> select ARCH_EXYNOS. It must select ARCH_EXYNOS if it wants to support
>> Exynos platforms.
>>
>> Therefore I expect first to bring this "some other work, hidden here" to
>> broader audience, so we can review its use case.
>>
>>>
>>> What this patch does is migrates those symbols from being 'select'ed
>>> (always built-in with no recourse) to 'default y'.  Where the former
>>> cannot be over-ridden, but the latter can be via a vendor's
>>> defconfig/fragment.
>>
>> It cannot be overridden by vendor fragment because options are not
>> visible. You cannot change them.
>>
>> The patch does nothing in this regard (making them selectable/possible
>> to disable), which is why I complained.
>>
>>>
>>> I doubt many (any?) of these symbols can be converted to kernel
>>> modules anyway, as they are required very early on in the boot
>>> sequence.
>>
>> True, some could, some not. Also some platforms are set up via
>> bootloader, so actually could "survive" till module is loaded from some
>> initrd.
> 
> Hi Krzysztof,
> 
> I was trying to chime in, but the discussion got spread out across all
> the patches. Since the cover letter seems to have everyone, I thought
> I'd reply here. Hope you don't mind. I'll try to respond/chime in on
> the various topics that were raised across the patches.
> 
> Yes, the next patch series would To/Cc folks correctly. William simply
> forgot to use the --to-cover and --cc-cover options when using git
> send-email.
> 
> I agree with you that it doesn't make sense to have ARCH_EXYNOS
> enabled but to have all the clock drivers exynos compiled out. Then
> one obviously can't boot an exynos platform using that kernel.

If downstream kernel does not use any upstream platforms (e.g.
Exynos5433 or Exynos7) and has its own drivers for everything, then
downstream does not even need ARCH_EXYNOS. Just disable it.

> I think
> William is going to send out a new patch series with a few drivers
> modularized. That'll ensure all the common exynos clock code is
> modularized and we have a few examples of exynos clock modules.

If it works on supported Exynos platforms: awesome!
If it does not work: not that good. I understand that downstream or
vendor do not want to mainline their SoC drivers and SoC support. Either
because HW is too new (do not disclose it) or it is too old (lost
interest). It's their right, they do not have to work with mainline on
this. However changing mainline kernel in such a case to affect it so
you can use your non-upstreamed drivers is wrong.

Affecting upstream platforms just because vendor/downstream does not
want to mainline some code is unacceptable. Please upstream your drivers
and DTS.

Everyone else are working like this. NXP, Renesas, Xilinx, TI, Rockchip,
AllWinner. Samsung or Google is not special to receive an exception for
this.

> 
> Speaking of modules, a fully modularized generic ARM64 kernel where
> everything is modularized out and we only load the necessary modules
> is a great goal. And this is where I can chime in the most since I
> wrote fw_devlink and tested this out. Such a kernel is not
> hypothetical. IIRC hikey960 can already do this. There's an upstream
> amlogic(?) board that can do this (Kevin Hilman has done that). A more
> complex/recent/powerful, but downstream example is the Pixel 5 -- it
> has a fully modular kernel. 320+ modules! Including interrupt
> controllers, timers, pinctrl and clocks.

Awesome! I am in, if it works. :)

> I can assure you any of the framework code related to pulling off
> booting a fully modular ARM64 kernel is already upstreamed
> (fw_devlink, irq framework changes, etc) or sent upstream (timer -- by
> a SoC vendor, etc) and being worked on. As for fw_devlink, I've
> extended it way past what GKI or Android would need. It would have
> been super trivial if all I wanted to do was support Android devices.
> I've also upstreamed changes that improve module loading time for all
> ARM64 modules. All of this and more upstream work came out of GKI and
> our push to be upstream first -- so I think it's reasonable to say the
> GKI effort helps and cares to get more work upstreamed.

Except UFS driver and recent Linaro work on Exynos850, none of these
apply to the vendor discussed here.

> Speaking of GKI, let's not speak of it. It really doesn't matter.
> Android is just yet another distribution (albeit a very popular one).
> The part that's relevant to upstream/all the other distributions is
> the fully modular generic ARM64 kernel and that's what we should focus
> on.
> 
> In that context, I think William's attempts are reasonable and I think
> he'll be glad to fix up any technical issues that people point out. So
> hopefully we can focus on that?

Yes, we can focus on that. In technical issues, I do not agree to
affecting negatively supported platforms just because downstream/vendor
does not want to send upstream its drivers.

Please upstream your drivers. By "your" I mean all the drivers which you
want to enable after disabling ARCH_EXYNOS mainline drivers.

Best regards,
Krzysztof
