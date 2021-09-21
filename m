Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37067413022
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 10:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhIUI1N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 04:27:13 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34674
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230415AbhIUI1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 04:27:12 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7E5673F048
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632212743;
        bh=PakN2wbGs/med/D4ZWenpx5EeuVdG2xsZUFyxVDNDpM=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=LAk0vPfckMMSyktNld/vuvQX+8a5g4UIMfl1CqaBK7GK0XnoJvq3JrEICNr5naYig
         j4heNgKMAZ5c3BFGl+sLwp9UYQnCTeOtgeodsCAq0eFju4pv+ZajDTEx/Jl9bhZ/+Z
         /AaEJ5wUnutJfAt6hoyfU8OqzbZZ+s8tq15BdbRIlrfasRhoJk6VLwS498fdM1Hbq2
         Kc2EMhZRTRg8a0mwr4AejWXLamww2eMmvEghwAT48ZUbg0wZDzV2XUH4OUjhf07avb
         q41LjW5jFh7/cUEw+GfJVoNggp9oW7PToPaqgLVlsoxJcUPyEgKETPpVOSrdhkcZeE
         KPPQwECZV5+sQ==
Received: by mail-wr1-f71.google.com with SMTP id i4-20020a5d5224000000b0015b14db14deso8161306wra.23
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 01:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PakN2wbGs/med/D4ZWenpx5EeuVdG2xsZUFyxVDNDpM=;
        b=uZraPmtkPbpaWCWktQeZC+VgjUInbxokEP1Ia3f/9aN+95PUzY6zWFmRUq9dTUZAjY
         NW4zKUgHOkN1yXCgKSJ9w1HI+LfrjvzkIzZeLGS+11iVIm2JdLGiSQvtjn1HQXvHWmFT
         UUAsNxjsHvNd8KBCBn4p+zlSMPuzuZps2iuGKZRcZyRL4Xl7drRsVMUF66f6lEyrUD9+
         32mjKU4E2PDTyDlYQR+uSd7AyBqlJwgtthieT5aS7NeXTrXqC8icWpjdH6s5atvCX4ew
         R7BuH4mqeCrsymgNY17/Xe3FHVs/T3aRdGe+MIgVV8zm+iufpGNwDiZYQfK+/gU1aB2/
         J8yg==
X-Gm-Message-State: AOAM531hUZuSGvCnn2Bys90zbTRMvlk/dgx+UKWq6J56q7L747eMDBBl
        /p1qImLte4TJlgRwr5FZYDrOsDR5zFlnC8z00HhmJ18GLWOfws2Cd76E+C0GDZHWIwrVTGXYW7m
        VKxYtrgYQndzsZjTiPgTaMUkyfqS1m/fcDFofgD4=
X-Received: by 2002:a1c:210a:: with SMTP id h10mr3268407wmh.117.1632212743169;
        Tue, 21 Sep 2021 01:25:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp0rPHyWd368/Ze8iF9YfFlWr90/JCakDv7rQLGftI6ArWqIbwE51Hrm/RKPh1ClGVqMawxw==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr3268385wmh.117.1632212742951;
        Tue, 21 Sep 2021 01:25:42 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id g2sm5599447wrb.20.2021.09.21.01.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 01:25:42 -0700 (PDT)
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will McVicker <willmcvicker@google.com>,
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
        linux-rtc@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
 <YUmTwZPqrCfRMekd@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
Message-ID: <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com>
Date:   Tue, 21 Sep 2021 10:25:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUmTwZPqrCfRMekd@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/09/2021 10:11, Lee Jones wrote:
> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> 
>> On 20/09/2021 21:03, Will McVicker wrote:
>>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
>>> a handful of drivers without allowing the vendor to override any of the
>>> default configs. This takes away from the flexibilty of compiling a generic
>>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
>>> modularize these drivers out of the core kernel in order to share a generic
>>> kernel image across multiple devices that require device-specific kernel
>>> modules.
>>
>> You do not address the issue in these patches. The problem you describe
>> is that drivers are not modules and you are not changing them into modules.
> 
> The wording is unfortunate.  The reason for this change doesn't have
> much to do with kernel modules.
> 
> Let's go back in time 18 months or so when Greg KH submitted this [0]
> patch, which you Acked.  Greg was trying to solve the problem of not
> having to enable ARCH_EXYNOS on kernels which are designed to be
> platform agnostic (sometimes called Generic Kernels).  For some reason
> SERIAL_SAMSUNG is the only symbol with these dependencies, so the
> solution seemed simple and straight forward at the time.
> 
> However, For sound reasons Geert NACKed the patch.
> 
> Quoting from [1] he says:
> 
>   "A generic kernel will include Samsung SoC support, hence
>   PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."

Yes, it's correct reasoning. There is also one more use-case -
non-upstreamed (out of tree) platform which wants to use Exynos-specific
drivers. Something like was happening with Apple M1 except that it got
upstreamed and we do not care much about out-of-tree.

> 
> However, since the entry for ARCH_EXYNOS *insists* on building-in a
> bunch of other symbols (via 'select') which will be unused in most
> cases, this is not a currently acceptable approach for many Generic
> Kernels due to size constraints.

In the mainline kernel there is no such use case. If you want to have
Exynos-whatever-driver (e.g. SERIAL_SAMSUNG or S3C RTC), you should
select ARCH_EXYNOS because otherwise it does not make any sense. Zero
sense. Such kernel won't work.

It makes sense only if there is some other work, hidden here, where
someone might want to have SERIAL_SAMSUNG or S3C RTC without
ARCH_EXYNOS. Although GKI is not that work because GKI kernel will
select ARCH_EXYNOS. It must select ARCH_EXYNOS if it wants to support
Exynos platforms.

Therefore I expect first to bring this "some other work, hidden here" to
broader audience, so we can review its use case.

> 
> What this patch does is migrates those symbols from being 'select'ed
> (always built-in with no recourse) to 'default y'.  Where the former
> cannot be over-ridden, but the latter can be via a vendor's
> defconfig/fragment.

It cannot be overridden by vendor fragment because options are not
visible. You cannot change them.

The patch does nothing in this regard (making them selectable/possible
to disable), which is why I complained.

> 
> I doubt many (any?) of these symbols can be converted to kernel
> modules anyway, as they are required very early on in the boot
> sequence.

True, some could, some not. Also some platforms are set up via
bootloader, so actually could "survive" till module is loaded from some
initrd.


Best regards,
Krzysztof
