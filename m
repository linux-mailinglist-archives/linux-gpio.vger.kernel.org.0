Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB00241D7CB
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 12:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349979AbhI3KfH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 06:35:07 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38376
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349972AbhI3KfF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 06:35:05 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3E91640606
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 10:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632998002;
        bh=GOsn/2G+QDkwZL3ol+c1IzRmuz+gnJwlWT3R8gDjJFk=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=wXqp+yH28nVffXORezqlAAXrvZS/adVgxiyw3Cf1dszPlR3QF/uMxtDSrnYlKjaVC
         hvMraqRZZj78r+sSEECPCoqn6NL/rIfH9BQ9QRqb+FcT8frPU/XvYWD9FAh5IQL5LR
         XIfDiLStys0W2msCjsSZM6Jnjvb5Q+UtxuAv3Z+M4Icz/6iMxGc+ULtCphLimvlpiP
         SHQu4iAkKRsaPA4lBOsDruhx875Kb0ItrT6TBx2fmyfDzjUUyRbazUaCK/sVwIiar1
         g7fryv8Z2UeiMLxDuOUENQRZGEPhzhhYkIs+2QM9eCC2YuKpFfTy2R3fxpMt6KvWSx
         DB4jmYdie8WGQ==
Received: by mail-lf1-f71.google.com with SMTP id s8-20020ac25c48000000b003faf62e104eso5136655lfp.22
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 03:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GOsn/2G+QDkwZL3ol+c1IzRmuz+gnJwlWT3R8gDjJFk=;
        b=wzm2NNnwI450ID2XtTkpLFdQcmtj7hJFY98Di/nteLYhiKdLZV8yItdEAprIQyd96Y
         bmbEvQk1YEhGempPE1Jyt/cRLT2GcF5NmT/9iExK7s5HvW2jWAMJp63cOWPjPK2kD+Vt
         1QD/WeegXkKIxQP55HpDLrCPmLw1HWt9YaQSYAJjZJzVGb5DNUlc7vl5ZaeatLZ4sf1J
         887vDxvZAz9+pKECr7MbGyUk8LSdlfReInXze9OWMyfPFOy1B3TL9mIpH0UI9SyImINm
         RaH0n5N+iUsrvX8Yy6OSwQGQh0sqW+jisUE4G7cJWyT51gZ6wEITnH0QHznHg9mrdS3O
         X3xw==
X-Gm-Message-State: AOAM530Dgm8+LdhjQmUnqZr1BE9U2evUjH9wV/H2YzaokU0HVd5ZJx9p
        sPcqIzhKlKt4pGr9MB03hBdDNy5VT1d7pRJLt5HRmycIXPQwUi9jaaF5rHjd8I0B4r5mSFyRf1X
        qeVV1i/iqvUh9WinfMl+Of1GJLPAOaz+oyliqd7Q=
X-Received: by 2002:a05:6512:3e0d:: with SMTP id i13mr4920580lfv.163.1632997998211;
        Thu, 30 Sep 2021 03:33:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxETr3CaHtbnwBWgWoqOUI2YRgnTBmnRAzo89eooVW15+hZ/fIaabzddiJvzz02VweMmWN/VA==
X-Received: by 2002:a05:6512:3e0d:: with SMTP id i13mr4920553lfv.163.1632997997906;
        Thu, 30 Sep 2021 03:33:17 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id q1sm327976lfg.18.2021.09.30.03.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 03:33:17 -0700 (PDT)
To:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <CAK8P3a0zezKvexqvL29Oc44uQq-8QG7LwZy31VYJuYAYbh-Utw@mail.gmail.com>
 <YVWDsFE7qyH6AwxR@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <8928290c-73d9-0843-25ed-2a4817ad32f7@canonical.com>
Date:   Thu, 30 Sep 2021 12:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWDsFE7qyH6AwxR@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/09/2021 11:30, Lee Jones wrote:
> On Thu, 30 Sep 2021, Arnd Bergmann wrote:
> 
>> On Thu, Sep 30, 2021 at 8:15 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>> On 29/09/2021 21:48, Will McVicker wrote:
>>>> On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>>>> What is more, it seems you entirely ignored Geert's comments. I pointed
>>>>> attention to it last time and you just said you will send v2 instead of
>>>>> joining discussion.
>>>>>
>>>>> It's a NAK for this reason - ignoring what Geert brought: you just broke
>>>>> distro configs for Exynos.
>>>>
>>>> First off I did want to chime into the discussion from the previous
>>>> patchset, but I felt that Lee and Saravana addressed all your concerns
>>>> regarding the intent and feasibility. You also made it clear what the
>>>> next steps were that I needed to take.
>>>
>>> One of the steps was problem with distros using everything as modules.
>>> They should not receive these drivers as modules.
>>> Reminder: these are essential drivers and all Exynos platforms must have
>>> them as built-in (at least till someone really tests this on multiple
>>> setups).
>>
>> Agreed. I absolutely love the work of the GKI developers to turn more
>> drivers into loadable modules, but the "correctness-first" principle is
>> not up for negotiation. If you are uncomfortable with the code or the
>> amount of testing because you think it breaks something, you should
>> reject the patches. Moving core platform functionality is fundamentally
>> hard and it can go wrong in all possible ways where it used to work
>> by accident because the init order was fixed.
>>
>>>>> Please also explain why Exynos is so special that we deviate from the
>>>>> policy for all SoC that critical SoC-related drivers have to be enabled
>>>>> (built-in or as module).
>>>>
>>>> I am not actually changing ANY default build configurations here and
>>>> I'm not removing any existing configuration.
>>>
>>> You are changing not default, but selectability which is part of the
>>> enforced configuration to make platforms working. The distros do not
>>> always choose defaults but rather all as modules. Kernel configuration
>>> is huge and complex, so by mistake they could now even disable
>>> potentially essential driver. There is no need to disable for example
>>> essential clock driver on a supported Exynos platform.
>>
>> I'm not overly worried about the defaults. If the drivers work as loadable
>> modules, I'm happy with them being loadable modules in distros.
>> If they don't work this way, then the patches are broken and should
>> not get merged.
>>
>> I don't even mind having essential drivers that can be turned off,
>> since we already have a ton of those (e.g. serial ports on most platforms).
>> It's up to distros to know which drivers to enable, though having
>> either reasonable defaults or fail-safe Kconfig dependencies (e.g.
>> making it impossible to turn off but allowing modules) is clearly
>> best.
>>
>>>> I tried to make it pretty
>>>> clear in my original patch series commit messages that none of my
>>>> changes modify the default behavior. The .config is the same with and
>>>> without my patches. All of these drivers remain enabled as built-in.
>>>> So if there is a distro that requires all of these drivers to be
>>>> built-in, then they can continue as is without noticing any
>>>> difference. IOW, all of these changes are/should be backwards
>>>> compatible.
>>>
>>> I was not referring to default neither to backwards compatibility.
>>> Please explain why Exynos is special that it does not require essential
>>> drivers to be selected as built-in. For example why aren't same changes
>>> done for Renesas?
>>>
>>> Is that now a new global approach that all SoC drivers should be allowed
>>> to be disabled for ARCH_XXX?
>>
>> I wouldn't enforce it either way across platforms. I would prefer drivers
>> to be loadable modules where possible (and tested), rather than
>> selected by the platform Kconfig. If you want to ensure the exynos
>> drivers are impossible to turn into a nonworking state, that's up to you.
>>
>>>> You said that upstream supports a generic
>>>> kernel, but I argue that the upstream "generic" arm64 kernel can't be
>>>> considered generic if it builds in SoC specific drivers that can be
>>>> modules.
>>>
>>> Good point, but since having them as modules was not tested, I consider
>>> it as theoretical topic.
>>
>> I actually disagree strongly with labelling the kernel as "non-generic"
>> just because it requires platform specific support to be built-in rather than
>> a loadable module. This has never been possible on any platform
>> I'm aware of, and likely never will, except for minor variations of
>> an existing platform.
>>
>> Look at x86 as an example: there are less than a dozen SoC platforms
>> supported and they are incredibly similar hardware-wise, but the kernel
>> is anything but "generic" in the sense that was mentioned above.
>> Most of the platform specific drivers in arch/x86/platform and the
>> corresponding bits in drivers/{irqchip,clocksource,iommu} are always
>> built-in, and a lot more is hardwired in architecture code as PCI
>> quirks or conditional on cpuid or dmi firmware checks.
>>
>>>>> Even if there was, I think it is good to have dependencies like
>>>>> ARCH_EXYNOS, as they let us partition the (19000, as Arnd said recently)
>>>>> Kconfig symbols into better manageable groups.  Without these, we cannot
>>>>> do better than "depends on ARM || ARM64 || COMPILE_TEST".
>>>>
>>>> My patch series still keeps the dependencies on ARCH_EXYNOS. I am
>>>> totally fine with "depends on ARCH_EXYNOS" and totally fine with
>>>> "default ARCH_EXYNOS". The problem we have is that ARCH_EXYNOS
>>>> forcefully selects SoC specific drivers to be built-in because it just
>>>> adds more and more SoC-specific drivers to a generic kernel.
>>>
>>> The selected drivers are essential for supported platforms. We don't
>>> even know what are these unsupported, downstream platforms you want
>>> customize kernel for. They cannot be audited, cannot be compared.
>>>
>>> Therefore I don't agree with calling it a "problem" that we select
>>> *necessary* drivers for supported platforms. It's by design - supported
>>> platforms should receive them without ability to remove.
>>>
>>> If you want to change it, let me paste from previous discussion:
>>>
>>> Affecting upstream platforms just because vendor/downstream does not
>>> want to mainline some code is unacceptable. Please upstream your drivers
>>> and DTS.
>>
>> Agreed. I understand that it would be convenient for SoC vendors to
>> never have to upstream their platform code again, and that Android
>> would benefit from this in the short run.
>>
>> From my upstream perspective, this is absolutely a non-goal. If it becomes
>> easier as a side-effect of making the kernel more modular, that's fine.
>> The actual goal should be to get more people to contribute upstream so
>> devices run code that has been reviewed and integrated into new kernels.
>>
>>>> I know you are asking for me to only push changes that have proven to
>>>> work.
>>>
>>> Yep, tested.
>>
>> I'm generally fine with "obviously correct" ones as well, but it's up to
>> you to categorize them ;-)

Thanks Arnd!

> 
> Arnd,
> 
>   FWIW, I agree with all of your points.>
> Krzysztof,
> 
>   It sounds like a lack of testing is your main concern.
> 
>   How can I help here?  What H/W do I need to be able to fully test this?

The changes here need to be tested on affected platforms (ARMv7 and
ARMv8), when built as a modules on some types of regular distros (e.g.
Arch, Ubuntu). From each of such boot I would be happy to see number of
new dmesg warnings/errors plus number of probe deferrals.

Since the drivers could be switched to modules (and some distros might
do it), they might be hit by surprise regressions in boot performance
due to probe deferrals. This should be also checked on these platforms.
Geert pointed out before that clocks in many cases are not optional -
driver needs them and will wait defer.

Assuming of course that boot succeeds. Minor differences in boot speed
should not be a problem, I think, because distro anyway chosen
all-module approach so it accepts the penalty.

Best regards,
Krzysztof
