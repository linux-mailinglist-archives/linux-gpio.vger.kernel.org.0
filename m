Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9364E3DC4DD
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 10:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhGaIM6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 31 Jul 2021 04:12:58 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:44726
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232291AbhGaIM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 31 Jul 2021 04:12:58 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 330E13F23F
        for <linux-gpio@vger.kernel.org>; Sat, 31 Jul 2021 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627719171;
        bh=HofaMjseVcCUgqSYBsyKnJ2om6JL+Ag5g9O40Ge5/aA=;
        h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=pfnVus/MejugzZUEcUWnpN2paDrXJJnd3HwCAXqr53/RkJ61uxwYKe3hwjaJ2yxuB
         oUUgoJwDX3I/NVYJuHoEatVKiTCDBONW5RmAQ8+0GzRHNhxcyiol3eJizmXQLCvOPR
         WUKckvpqKY0KC7aNnLGJbKVi4MDCPDfg3yVuJjh040XOVI5KLG2tMrYGKxhoM30CjN
         myW4vUHZ4cQx1V0SOwIRH1yj1YZ4CRGBSwVRyiYNxTb824tyjVLqY3u62/yU7W/1hk
         LpKYm2RcL382/nbjmxIgz9E7jJe6754Brw4Tn/O01Q0XDXaWBoJMJFmCfmlptAqTDQ
         zUBmteRPKKHqQ==
Received: by mail-ed1-f71.google.com with SMTP id n24-20020aa7c7980000b02903bb4e1d45aaso5795600eds.15
        for <linux-gpio@vger.kernel.org>; Sat, 31 Jul 2021 01:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HofaMjseVcCUgqSYBsyKnJ2om6JL+Ag5g9O40Ge5/aA=;
        b=smA3VRMl9+nu+Ku9d0aKoPxUXZnFWRGyRiAkEWdnwCexYHUJjh60WqCuatWktwQasO
         iyWPhfAvOVtcjRBJxR45DQnjBzViaO6BZG71J7NfQg6G0JmINp1ZEAvcza5Ny5Tt605X
         IXZhIbILU1O4SImCCwj45MUGL3hr+/3LFRwZNbs33RBfSi0vOwkAN3TI5tC1QlUYkBhU
         MihCQzf9Iou6IqZrZA3NXjmH8/9fPTd8hodnaMlQwiuyiRTz3EQ9JgqQHxCqukQiO0Z/
         UdmJnpAWiYYA2qccbidP4xvUJyWXcE6EykfH2LmJaSpvySumhVDiExvyW6ds9Ucq+Js8
         JD4w==
X-Gm-Message-State: AOAM533GkIDJ3N3ESKycPZZDHGdPjDliF/pcZgNRNl1gkZ894cb7S/tp
        wbiOsTkOeuTvhp1/unD7kWCMM3BCAPXa3AKVR6hnx/ktN6K/pu7RAzhAYAqMHkTiq8U5CwqNAB1
        WEZI/tbamWJXB+yrqoAFUpKu0jihnihaKAq4LPc4=
X-Received: by 2002:a17:906:cd1a:: with SMTP id oz26mr6577416ejb.101.1627719170297;
        Sat, 31 Jul 2021 01:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm7c/vYPdEZ6qJ4RX+9vAac/dbPuwTMcFunGU0oW5pq2v9q/TLiem2CXVaQ4vIsN9WXGr5Fg==
X-Received: by 2002:a17:906:cd1a:: with SMTP id oz26mr6577395ejb.101.1627719170126;
        Sat, 31 Jul 2021 01:12:50 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1860561edt.15.2021.07.31.01.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 01:12:49 -0700 (PDT)
Subject: Re: [PATCH 00/12] Add minimal support for Exynos850 SoC
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
 <c3486111-0ec9-9679-d2a2-68b2f33a2450@canonical.com>
 <CAPLW+4kbnJEBkc0D=RWt59JxBan8X1uDy6sSXBiYAq8N9FDV6A@mail.gmail.com>
 <13f166bb-7103-25d5-35a6-8ec53a1f1817@canonical.com>
Message-ID: <2dacc205-04ce-c206-a393-50ba0d5aa1a7@canonical.com>
Date:   Sat, 31 Jul 2021 10:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <13f166bb-7103-25d5-35a6-8ec53a1f1817@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31/07/2021 09:29, Krzysztof Kozlowski wrote:
> On 30/07/2021 21:02, Sam Protsenko wrote:
>> Hi Krzysztof,
>>
>> On Fri, 30 Jul 2021 at 20:21, Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>>
>>> On 30/07/2021 17:18, Krzysztof Kozlowski wrote:
>>>> On 30/07/2021 16:49, Sam Protsenko wrote:
>>>>> This patch series adds initial platform support for Samsung Exynos850
>>>>> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
>>>>> rootfs as a RAM disk. More advanced platform support (like MMC driver
>>>>> additions) will be added later. The idea is to keep the first submission
>>>>> minimal to ease the review, and then build up on top of that.
>>>>>
>>>>> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
>>>>>
>>>>
>>>> Great work!
>>>>
>>
>> Thanks, Krzysztof! And thank you for reviewing the whole series.
>>
>>>> What's the SoC revision number (should be accessible via
>>>> /sys/bus/soc/devices/soc0/)? Recent wrap in numbering of Exynos chips
>>>> might bring confusion...
>>
>> # cat /sys/devices/soc0/revision
>> 0
> 
> soc_id but you're right it won't be set for unknown SoCs. You need to
> extend drivers/soc/samsung/exynos-chipid.c to parse new values (E3830000
> for product ID) and maybe new register offsets (previous offset is 0x0,
> for 3830 is 0x10 I think). Also revision mask might change.
> 
>>> Judging by vendor's sources it is quite confusing. It looks mostly like
>>> Exynos3830 but in few other cases it uses Exynos9 compatibles (Exynos9,
>>> Exynos9820). Only in few places there is Exynos850. Marketing department
>>> made it so confusing...  The revision embedded in SoC would be very
>>> interesting.
>>>
>>
>> As I understand, this SoC is called Exynos850 everywhere now.
>> Exynos3830 is its old name, not used anymore. As you noticed from
>> patch #2, it shares some definitions with Exynos9 SoC, so I guess some
>> software is similar for both architectures. Not sure about hardware
>> though, never worked with Exynos9 CPUs. Anyway, I asked Samsung
>> representatives about naming, and it seems like we should stick to
>> "Exynos850" name, even in code.
> 
> 
> Since the chip identifies itself as E3830000, I would prefer naming
> matching real product ID instead of what is pushed by marketing or sales
> representatives. The marketing names don't have to follow any
> engineering rules, they can be changed and renamed. Sales follows rather
> money and corporate rules, not consistency for upstream project.

On the other hand we have already two exceptions for naming
inconsistency - Exynos3250 identifies itself as 3472 (which is confusing
because 3250 is two core and there is a separate quad-core
Exyons3472...) and Exynos5800 is actually marketing name for a revision
of Exynos5422. Maybe indeed will be easier to go with the branded name
850...


Best regards,
Krzysztof
