Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687423E3055
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 22:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243804AbhHFUcj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 16:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhHFUci (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 16:32:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24471C0613CF;
        Fri,  6 Aug 2021 13:32:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g30so15985757lfv.4;
        Fri, 06 Aug 2021 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C/zVNo/1ZCFRtL7GmaLSDm/O5uxdaQR4GtHKkpGKHTo=;
        b=McohqyqIsPlz8TRo8X71J5c357MvKWJurxAqO48dFG2SWc/0yiRM2PIlwGIXT4Iclx
         565lxeyg7Zgk7mGVtTwn3zfibdD6sDPTRD/SPf2c/wpqkYYu9eMfJhAF4Kn5iltNbFK0
         a16liBaVL1hybwxaJln5gJ/qCfBLVqLPae8ei/wYLzXk3GRP8MImdwOW7NXv8VDninq1
         Tfjmj4DFBDqYf862eJZPRXlj3MBnnO93kQXN2uAQR+S/Bv5zNw33YlkOLQVOzyRSWhUs
         ps/64awGy8J/MwmGYx/aM6BfgeaHcuJGfEzvNcKVYd88MX7kr8oyMijT1rOA0/jy42Lo
         W4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C/zVNo/1ZCFRtL7GmaLSDm/O5uxdaQR4GtHKkpGKHTo=;
        b=jM3nJcdkEEIU1rG1G1oLSgix1kDh8/jE1oprXhHoZ1ZNV1VQG/bI74dheKOoeFDuUp
         PKkMF6tdiz7aWJNT5Y6HnUdX1YYrAci4QCSN11Ker2dch7LmNM2/Oh6YCuzhLxQXspzH
         8rapQ6DO6cQHPTmltLe2S8lNWhqViKwxxtgebZV3kBntGOO1ZNbTmofSf/ZJy0RDOVKB
         pOD4F5+5sRQ4bXp3neoKAS2x+Fed3ckMEZwKMCy+/L4JUs7kz7XcGcTWtmvoukuGTShU
         zB5HGx7VM6mu12IDQOQPQc7uuGAodXr0O3e+tAd4P8YBUoiZlY8uRJphkOdphHdcCeSz
         AQQQ==
X-Gm-Message-State: AOAM533ylYHKVBidDBAauYOYKxqv0bgcW+WGxOhH2bUd1z63nhU56lOG
        G5uHqA4kGcRCWduJXdrUGEXoE13y4t0JKA==
X-Google-Smtp-Source: ABdhPJzaNnNjy1MXRjvBCgoiexsEu605DKEQ8aNo7pAnbk4xE3QEeTahwhSWiy8McXseAVii1SCvmw==
X-Received: by 2002:ac2:57cd:: with SMTP id k13mr9092414lfo.117.1628281939048;
        Fri, 06 Aug 2021 13:32:19 -0700 (PDT)
Received: from ?IPv6:2a02:a315:4139:be00:71e7:1ee1:196a:5bbb? ([2a02:a315:4139:be00:71e7:1ee1:196a:5bbb])
        by smtp.gmail.com with ESMTPSA id h1sm543751ljc.50.2021.08.06.13.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 13:32:18 -0700 (PDT)
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
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
 <20210730144922.29111-13-semen.protsenko@linaro.org>
 <455cfb5e-dff7-a5c0-3875-49abe3e900f3@canonical.com>
 <CAPLW+4nDS0atrbUFagDA0W_Ky5MvOiY+N+NQoQ+me4pndp_iWg@mail.gmail.com>
 <68734f6c-fc76-595c-8d34-8924dbbbb845@canonical.com>
 <CAPLW+4n_JKj5xeBHXONcv__vyAFvx3fhXoxJa17NTHK1RSJFJw@mail.gmail.com>
 <b753796c-2ce6-4166-7c20-289e950237ad@canonical.com>
From:   =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Message-ID: <50f84842-c397-8012-af95-e9d9fce53162@gmail.com>
Date:   Fri, 6 Aug 2021 22:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b753796c-2ce6-4166-7c20-289e950237ad@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

W dniu 06.08.2021 o 14:32, Krzysztof Kozlowski pisze:
> On 06/08/2021 14:07, Sam Protsenko wrote:
>> On Fri, 6 Aug 2021 at 10:49, Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>>
>>> On 06/08/2021 01:06, Sam Protsenko wrote:
>>>> On Sat, 31 Jul 2021 at 12:03, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>>
>>>>>>
>>>>>> This patch adds minimal SoC support. Particular board device tree files
>>>>>> can include exynos850.dtsi file to get SoC related nodes, and then
>>>>>> reference those nodes further as needed.
>>>>>>
>>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>>> ---
>>>>>>   .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
>>>>>>   arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
>>>>>>   arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
>>>>>
>>>>> Not buildable. Missing Makefile, missing DTS. Please submit with initial
>>>>> DTS, otherwise no one is able to verify it even compiles.
>>>>>
>>>>
>>>> This device is not available for purchase yet. I'll send the patch for
>>>> board dts once it's announced. I can do all the testing for now, if
>>>> you have any specific requests. Would it be possible for us to review
>>>> and apply only SoC support for now? Will send v2 soon...
>>>
>>> What you propose is equal to adding a driver (C source code) without
>>> ability to compile it. What's the point of having it in the kernel? It's
>>> unverifiable, unbuildable and unusable.
>>>
>>
>> Yes, I understand. That's adding code with no users, and it's not a
>> good practice.
>>
>>> We can review the DTSI however merging has to be with a DTS. Usually the
>>> SoC vendor adds first an evalkit (e.g. SMDK board). Maybe you have one
>>> for Exynos850? Otherwise if you cannot disclose the actual board, the
>>> DTSI will have to wait. You can submit drivers, though.
>>>
>>
>> Sure, let's go this way. I'll send v2 soon. Improving patches and
>> having Reviewed-by tag for those would good enough for me at this
>> point. I'll continue to prepare another Exynos850 related patches
>> until the actual board is announced, like proper clock driver, reset,
>> MMC, etc. Is it ok if I send those for a review too (so I can fix all
>> issues ahead)?
> 
> Sure, prepare all necessary drivers earlier. I suspect clocks will be a
> real pain because of significant changes modeled in vendor kernel. I
> remember Paweł Chmiel (+Cc) was doing something for these:
> https://github.com/PabloPL/linux/tree/exynos7420
> 
> I mentioned before - you should also modify the chipid driver. Check
> also other drivers in drivers/soc/samsung, although some are needed only
> for suspend&resume.
> 
> BTW, Paweł,
> How is your Exynos7420 progress? :)
Hi

Sadly i had to postpone it for a while. Maybe will have more time now to 
get back to it.

About clock driver. In vendor sources there is clk driver with something 
called virtual clocks (different than real ones). That driver calls 
another driver called pwrcal, responsible for real manipulation of 
clocks in hardware. This one has info about real clocks and also 
additional info about for example rate for some of them, which is read 
from binary from memory, by another driver called ect_parser in case of 
devices at which i did looked.

In my case i was able to find some more info about real clocks there - 
for example register names and offsets 
https://github.com/krzk/linux-vendor-backup/blob/mokee/android-3.18-samsung-galaxy-s7-sm-g930f-exynos8890/drivers/soc/samsung/pwrcal/S5E8890/S5E8890-cmusfr.h 
and some clocks hierarchy info inside 
https://github.com/krzk/linux-vendor-backup/blob/mokee/android-3.18-samsung-galaxy-s7-sm-g930f-exynos8890/drivers/soc/samsung/pwrcal/S5E8890/S5E8890-cmu.c 
but there was still many info missing.

Finding a way (which could be applied to other Exynos SOC) to "convert" 
or use that vendor code and turn it into mainline driver, especially 
without TRM which is not available for all/most of them, would be great.

I'm wondering if Exynos850 device has the same issue as on 7420 (and 
probably 8890/7578 and maybe also other 64 bit Exynos devices) - broken 
firmware. For example i had to specify in dts timer clock frequency, on 
few devices there is also a problem with timer registers not properly 
configured by FW, which probably won't be fixed by vendor and patches 
with workaround for it in kernel were rejected :/.
> 
>> And should I maybe add RFC tag for those?
> 
> No need. Drivers can be merged before DTS users.
> 
> Best regards,
> Krzysztof
> 

