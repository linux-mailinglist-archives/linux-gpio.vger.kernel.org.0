Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0395341D31A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 08:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348227AbhI3GQq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 02:16:46 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56966
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347847AbhI3GQq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 02:16:46 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 600B2402D9
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 06:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632982503;
        bh=l4P1yQgHmK4IoeNIUGcmxpjGHV2AL8XAWEflVAlKCuA=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ih/GKOgES5bbB9lqXk55cx3IkymGd0z9ss5VnOtRVO2TxtljoXBm0Yk/HxIeVgTBd
         DfqeQOQxr9Hl4UQE+T47SeI1FSCZZ+/Dqxe7ICDnl5SgebbtuYKCOQov2SSeAeikjA
         yqUpE0huQ6/cVrBmR7B+d+1UNeX+rhxpLoUNbxhFWunqy8ftCUPTykUfAsN/cqmrm6
         PqFjeMKOFKbE70pkMfuT18Tfww2WAs3pr6W+WZwO8GIG6OV0TBHotpE2Rw8HFMSXcr
         cbh9V/ZYXm/lK2nOlD8nHYkFkYNydCFgVvl97KaJUILsJcHpoJ6ZiwZvBuT/i9eBZv
         KiuIWkkaIpz8A==
Received: by mail-ed1-f72.google.com with SMTP id x26-20020a50f19a000000b003da81cce93bso5060298edl.19
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 23:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l4P1yQgHmK4IoeNIUGcmxpjGHV2AL8XAWEflVAlKCuA=;
        b=HUnUQ2z2ZNz8x3OWnJ+wm6wzUM9DPfxZOm11uT9KyVGwedaZ1f1egt2jwiMItKrbMo
         xyx6zp+Mn59vnIDvPEZFJcBi/QXhws/rs8PzLfZLfYNuZ2G1+XBZy+ydDYH3XNdMfOjH
         FztgSEK3usiiF3vsneMwythZcaBglHk0JODakxtnCnZaZaZA5sHCNC3gAD/DtddOXf1a
         fG4xMbJuzyH5BD9TSeevS6nCgE8TfIYICSSrVoaXiazpKV/c9IWzfpH7WSjoPf55DXXE
         A4/uhSYltXXXaNvxEmrK6po2jOanQz21vsjeMOtMrgQuFcy8wSFMYbmesbAkGIahwl+/
         MEvg==
X-Gm-Message-State: AOAM532cEh/MlCDXyc5XJt5A05ymI5xvJArTFkjwrdBOlKBwie3d/Qmo
        ynGF+ujqCHWpTPhJuV5nIVOiBkDp95p5ZG50Iu7PQ/qD4/+WjqIAiToc7qyQGPO0MsexnMSh6kG
        vthH7QGq8SuAyz8ymusAOccaL7f0xOPoH2Uj4rXY=
X-Received: by 2002:a05:6512:3193:: with SMTP id i19mr1482838lfe.485.1632982492890;
        Wed, 29 Sep 2021 23:14:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2ed5i0IuL5p++CT70JdS9PYYz1vbD+xm+23BVhAAobKjG9WLM+ErIJYhEnSrjoPv18RAJXQ==
X-Received: by 2002:a05:6512:3193:: with SMTP id i19mr1482787lfe.485.1632982492506;
        Wed, 29 Sep 2021 23:14:52 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id l6sm252964lfp.143.2021.09.29.23.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 23:14:51 -0700 (PDT)
To:     Will McVicker <willmcvicker@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
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
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
Date:   Thu, 30 Sep 2021 08:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/09/2021 21:48, Will McVicker wrote:
> On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 29/09/2021 01:56, Will McVicker wrote:
>>> This is v2 of the series of patches that modularizes a number of core
>>> ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
>>> modularized all of the drivers that are removed from the ARCH_EXYNOS
>>> series of "select XXX". This includes setting the following configs as
>>> tristate:
>>>
>>>  * COMMON_CLK_SAMSUNG
>>>  * EXYNOS_ARM64_COMMON_CLK
>>>  * PINCTRL_SAMSUNG
>>>  * PINCTRL_EXYNOS
>>>  * EXYNOS_PMU_ARM64
>>>  * EXYNOS_PM_DOMAINS
>>>
>>> Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
>>> which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
>>> The reason for these new configs is because we are not able to easily
>>> modularize the ARMv7 PMU driver due to built-in arch dependencies on
>>> pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
>>> the ARM and ARM64 portions into two separate configs.
>>>
>>> Overall, these drivers didn't require much refactoring and converted to
>>> modules relatively easily. However, due to my lack of exynos hardware, I
>>> was not able to boot test these changes. I'm mostly concerned about the
>>> CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
>>> requesting help for testing these changes on the respective hardware.
>>>
>>
>> These are all not tested at all? In such case, since these are not
>> trivial changes, please mark the series as RFT.
>>
>> I will not be able to test these for some days, so it must wait.
>>
>>
>> Best regards,
>> Krzysztof
> 
> +Cc Arnd and Olof,
> 
> Hi Krzysztof,
> 
> To avoid the scrambled conversation from the first patchset, I'm going
> to address all your general questions here in the cover letter thread
> so that it's easier for everyone to follow and reference in the
> future.
> 
>> What is more, it seems you entirely ignored Geert's comments. I pointed
>> attention to it last time and you just said you will send v2 instead of
>> joining discussion.
>>
>> It's a NAK for this reason - ignoring what Geert brought: you just broke
>> distro configs for Exynos.
> 
> First off I did want to chime into the discussion from the previous
> patchset, but I felt that Lee and Saravana addressed all your concerns
> regarding the intent and feasibility. You also made it clear what the
> next steps were that I needed to take.

One of the steps was problem with distros using everything as modules.
They should not receive these drivers as modules.
Reminder: these are essential drivers and all Exynos platforms must have
them as built-in (at least till someone really tests this on multiple
setups).

> 
>> Please also explain why Exynos is so special that we deviate from the
>> policy for all SoC that critical SoC-related drivers have to be enabled
>> (built-in or as module).
> 
> I am not actually changing ANY default build configurations here and
> I'm not removing any existing configuration.

You are changing not default, but selectability which is part of the
enforced configuration to make platforms working. The distros do not
always choose defaults but rather all as modules. Kernel configuration
is huge and complex, so by mistake they could now even disable
potentially essential driver. There is no need to disable for example
essential clock driver on a supported Exynos platform.

> I tried to make it pretty
> clear in my original patch series commit messages that none of my
> changes modify the default behavior. The .config is the same with and
> without my patches. All of these drivers remain enabled as built-in.
> So if there is a distro that requires all of these drivers to be
> built-in, then they can continue as is without noticing any
> difference. IOW, all of these changes are/should be backwards
> compatible.

I was not referring to default neither to backwards compatibility.
Please explain why Exynos is special that it does not require essential
drivers to be selected as built-in. For example why aren't same changes
done for Renesas?

Is that now a new global approach that all SoC drivers should be allowed
to be disabled for ARCH_XXX?

> 
> I really appreciate yours and John Stultz's comments regarding
> including the "why" in my commit message wording. I will spend more
> time on the next series on trying to write a more meaningful commit
> message, but before that we can surely discuss the "why" here.
> 
> As mentioned by Lee and Saravana, our common goal is to make it easier
> for everyone to contribute upstream. In particular, this series of
> patches is laying the ground work for distros to have more flexibility
> in supporting a wider range of platforms without forcing everyone to
> include unnecessary drivers. 

The drivers are usually necessary. Actually, you admitted you didn't
test patchset, so how do you even know that they are unnecessary? How do
 you judge?

> You said that upstream supports a generic
> kernel, but I argue that the upstream "generic" arm64 kernel can't be
> considered generic if it builds in SoC specific drivers that can be
> modules.

Good point, but since having them as modules was not tested, I consider
it as theoretical topic.

> This patch series is addressing exactly that -- allow distros
> to move SoC specific drivers out of the core kernel and into modules.
> Ultimately, our goal is to be able to directly develop with the
> upstream kernel on new and old SoCs by not including SoC specific
> drivers in our generic kernel distro. This helps the upstream
> community in a number of ways:
> 
> (1) It makes the ARM64 generic kernel smaller by converting more
> drivers into modules
> (2) It makes it a lot easier for everyone to develop upstream if they
> can directly use the upstream kernel without carrying downstream
> changes.

I don't understand the point (2) here. Anyone can use upstream kernel
for supported and unsupported platforms. How upstream benefits from a
change affecting supported platforms made for unsupported, downstream
platforms.

> 
>> Even if there was, I think it is good to have dependencies like
>> ARCH_EXYNOS, as they let us partition the (19000, as Arnd said recently)
>> Kconfig symbols into better manageable groups.  Without these, we cannot
>> do better than "depends on ARM || ARM64 || COMPILE_TEST".
> 
> My patch series still keeps the dependencies on ARCH_EXYNOS. I am
> totally fine with "depends on ARCH_EXYNOS" and totally fine with
> "default ARCH_EXYNOS". The problem we have is that ARCH_EXYNOS
> forcefully selects SoC specific drivers to be built-in because it just
> adds more and more SoC-specific drivers to a generic kernel.

The selected drivers are essential for supported platforms. We don't
even know what are these unsupported, downstream platforms you want
customize kernel for. They cannot be audited, cannot be compared.

Therefore I don't agree with calling it a "problem" that we select
*necessary* drivers for supported platforms. It's by design - supported
platforms should receive them without ability to remove.

If you want to change it, let me paste from previous discussion:

Affecting upstream platforms just because vendor/downstream does not
want to mainline some code is unacceptable. Please upstream your drivers
and DTS.

Everyone else are working like this. NXP, Renesas, Xilinx, TI, Rockchip,
AllWinner. Samsung or Google is not special to receive an exception for
this.


> 
> I know you are asking for me to only push changes that have proven to
> work. 

Yep, tested.

> The theory behind these changes has been proven downstream on
> other devices and I'm more than willing to help debug any issues that
> arise out of this patch series, but since I don't have the hardware
> myself I do need help with device testing these changes.

Downstream uses very specific Linux "distro" or fork - Android - with
changes not present in others. Although tests on other
(unsupported/unupstreamed) devices is good, but it's not sufficient. For
example I guess that half or most of Odroid devices are running standard
Linux distro (Arch, Ubuntu).

You also mentioned downstream devices but without actually ever defining
them. Please be more specific. What SoC, what hardware?

Best regards,
Krzysztof
