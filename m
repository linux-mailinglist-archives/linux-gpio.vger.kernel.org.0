Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96ED41D9FB
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348155AbhI3Mkg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:40:36 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37416
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350955AbhI3Mkg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 08:40:36 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0F26B402CC
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633005533;
        bh=9UEPWfr7ebPMheyY1ItfdUf+trBF8Xkd/Vl6hTzqSXw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=RduqoL3PiYx+L2tJKpMT0qR3mfKWnTL68N50rVJdJ9ovQgYSOJob8W8KzZTQqEI9K
         K6y6+tYbu/aZm2TuoQgi51Y+JsP4KNV/gza7IptaZ+i6OPYnNmnK+WWQs/5eF3C+EB
         jZlr5ObwEy1AuZiJDPAgu+5LXPTTmgXs6721EZ7pk/t9/t2cgoi6MPGuGOGePyy+HK
         5SgxBgQiq3TifFnjzoL/vTPNudBt9hTBtXY4aNp4VfezNC+8vv+uGoqUh4cvwIclfn
         OPc+8dkq5eRJ8VeAMrW15mC8KMTkIHNhjJsUcwlOMuGV+KfQ181o/EoQrehreyy9wH
         mzy1ncCmLhjBg==
Received: by mail-lf1-f72.google.com with SMTP id s28-20020a056512203c00b003f42015e912so5486265lfs.4
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 05:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9UEPWfr7ebPMheyY1ItfdUf+trBF8Xkd/Vl6hTzqSXw=;
        b=3/IK/p/vnjOYDBvIGAabzQuX37Qagb7dgHtwN03a9wP82pyz07wF5nnH/EeOXyjElO
         cfkAuVycz/h0cGIkREid2D86cBcVwIdOPD+maHOpvjTZzqb7VmlY7kqT6LYSyNb8dHTF
         +qpV4c9N5pULYJO4a2qLT801IVmrXyMXkTRFbglP4l0mOdGwCrSSEcw7pmn9juGdwgly
         Nsax1eGIHBgn8VIBuaImtEq3YOW8eIQQ20Kn0P41sdN7xxExu93f/YgdEFPq4apq08Aw
         rXIBhdSdYtStNweFAQxly3J689eV1NMV2/UmiItOax1wzthd3JSgbMDFJp0AqRGc1v2Z
         Sn2Q==
X-Gm-Message-State: AOAM531JF35H/7twYfB+YFg8bjMhYvkWZudTirYYR3ijRBewDaBJAHr2
        gF1j0fKdKxuDldd6/bqhmeaOn+RcLjKnR+8hNS7hPSQkUox1aIOMlMhIbC3Y8moGC9CwnY6At2G
        Gl7kDic7HLbaNV74+xY/jj5v3TkJcqtawbFw49gQ=
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr5529040ljj.316.1633005521794;
        Thu, 30 Sep 2021 05:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4VmVl8yLsL1J3X6zPeVy08Dz03yCtDXig4BMfZlB5TReP45Vy4ZGUWpipnx+5aVpp7cIQEg==
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr5529018ljj.316.1633005521617;
        Thu, 30 Sep 2021 05:38:41 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id x9sm152040lfr.246.2021.09.30.05.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 05:38:41 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Will McVicker <willmcvicker@google.com>,
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
 <8928290c-73d9-0843-25ed-2a4817ad32f7@canonical.com>
 <YVWu2RoSqEzcG79I@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5eb551d9-a26e-f4eb-6641-3264c2398adc@canonical.com>
Date:   Thu, 30 Sep 2021 14:38:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWu2RoSqEzcG79I@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/09/2021 14:34, Lee Jones wrote:
> On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
>>>   It sounds like a lack of testing is your main concern.
>>>
>>>   How can I help here?  What H/W do I need to be able to fully test this?
>>
>> The changes here need to be tested on affected platforms (ARMv7 and
>> ARMv8), when built as a modules on some types of regular distros (e.g.
>> Arch, Ubuntu). From each of such boot I would be happy to see number of
>> new dmesg warnings/errors plus number of probe deferrals.
>>
>> Since the drivers could be switched to modules (and some distros might
>> do it), they might be hit by surprise regressions in boot performance
>> due to probe deferrals. This should be also checked on these platforms.
>> Geert pointed out before that clocks in many cases are not optional -
>> driver needs them and will wait defer.
>>
>> Assuming of course that boot succeeds. Minor differences in boot speed
>> should not be a problem, I think, because distro anyway chosen
>> all-module approach so it accepts the penalty.
> 
> Do you have any suggestions in terms of devboards?

Minimal set:
1. Something with Exynos4 (e.g. Odroid U3 with Exynos4412).
2. Something with Exynos 5422/5800 (e.g. Odroid XU3/XU4/HC1/MC1 or
Chromebook Peach Pi).
3. Exynos5433 - TM2 or TM2E. Boards are not widely available, so we need
to rely on provided testing by Samsung.

What would be good is to also test Exynos3 boards, but this is also not
widely available.


Best regards,
Krzysztof
