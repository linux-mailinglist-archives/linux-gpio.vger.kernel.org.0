Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D5448F79F
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jan 2022 16:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbiAOPrA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 10:47:00 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50340
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233029AbiAOPq7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 15 Jan 2022 10:46:59 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B0FE2402A6
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642261618;
        bh=pyv6K6/e4gWbzQck3Fw4qwBASmMwpzUJ8XeTxnDZIvo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=RkOM1FW8neJduttmQzjpOtxQWkyR5MaaIorfH0QleVQUIx0WKaox8ZWqUUYKErTZe
         rDc5A21Sef8DvxZgfxuiclsoKKlipwaf9vtGgCMq7hQxNBzUA7gmkMHAfpHsWu34xG
         b/H80A1CdpURB7Imb8f7cjHvVyBq80ModDG0BJrXmnEKmsd8RiM4JacShkf820f0cI
         nk3++oNjKFf8quE28ZqJNe2h9bFWNhuyFjBwMPviTPv6CUEQ4tgD5Ow9KnbftNdLgJ
         b7Grn8JOh1EnEPlc7CJUE4y3+0XP/2bp+fOYXCaf8Rjfdw/AQ1jQ8ElaH4K2GfAi2L
         v9updVNMvTHcQ==
Received: by mail-wm1-f70.google.com with SMTP id n25-20020a05600c3b9900b00348b83fbd0dso7544163wms.0
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 07:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pyv6K6/e4gWbzQck3Fw4qwBASmMwpzUJ8XeTxnDZIvo=;
        b=S3xLGYMb4OJ6intwcJLZOITaYudc28VrD93Z85IyxLKbPGGeyVTQVchVVm8DSWSE7R
         kS9D4Hw2l9RUVQ33ne2TDYut7M9ldDLXuHWFl5DF5xhDNsKbX10bHEMnGre+0DyGAJrc
         VopcmY+EYRXc3XQNPoqEcIxTyugfsJFYFdOQ/TeajSTw2biPz6o56d4CA48B1RWhnA9V
         o/hBGwdkJ52gQdrw5HwVR7UwCYNtPQOftmk/+1kpA/itsT8amJQ+YKiwMTv/mVFECngD
         KHvJvNIfU37jtiWmD+9Cvi+eksRAIfiSluYWOJO50z+iUBicy5K/h3azNNicLoLRq4Gw
         CZlQ==
X-Gm-Message-State: AOAM5302GwXvQkaUvY8yp0q30IYETlHZX6XI2HYV7G2zJS1piXwfAkeI
        xeoWBhpXjgjV6tWeQql3TQFkhYNgytmxD0ei+c8hMn6H5E+6mm/msZ9KqX6FHdI9bydr9zQ+TJJ
        X4S93lepnuGPdR9S30EAxvvhzOYWuabKWpfzltI0=
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr11902329wrp.36.1642261618194;
        Sat, 15 Jan 2022 07:46:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvsYLrH59WYGEMq9tEgh144HFNZsyjoe4tLn3KHcCiTauqFCWHR3XfTzCp3wI/MCFtaFxKwg==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr11902313wrp.36.1642261617998;
        Sat, 15 Jan 2022 07:46:57 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id j16sm8717042wrp.76.2022.01.15.07.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 07:46:57 -0800 (PST)
Message-ID: <cced7901-a855-c733-e716-f4a7f822b213@canonical.com>
Date:   Sat, 15 Jan 2022 16:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 00/28] pinctrl: dt-bindings: samsung: convert to
 dtschema
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4k3VNuQGfi_mnAWYUSXYaPmoFj1D55pHH0ByUsNu9kSyQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4k3VNuQGfi_mnAWYUSXYaPmoFj1D55pHH0ByUsNu9kSyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/01/2022 19:31, Sam Protsenko wrote:
> On Tue, 11 Jan 2022 at 22:15, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Hi,
>>
>> Changes since v1
>> ================
>> 1. Patch #1: add missing pin assignment (Alim).
>> 2. Patch #2: correct double sizeof() (Alim).
>> 3. Patch #7, #8: put label-override in proper patch (Alim).
>> 4. Patch #24: Extend doc, change the 'if' clause for wake-up interrupts.
>> 5. New patches: #25 - #28.
>>    Exynos850 and ExynosAutov9 seems to be different in pin ctrl interrupt
>>    handling, so they need their own compatibles.
>>    Please kindly review and provide feedback on these as I do not have
>>    details.
>> 6. Add review tags.
>>
>> Dependencies
>> ============
>> 1. Patch #2 ("pinctrl: samsung: accept GPIO bank nodes with a suffix") is
>>    necessary for DTS patches.
>>
>> 2. Last patches #27 and #28 depend on patch #26 adding the compatibles.
>>
>> Best regards,
>> Krzysztof
>>
>> Krzysztof Kozlowski (28):
>>   pinctrl: samsung: drop pin banks references on error paths
>>   pinctrl: samsung: accept GPIO bank nodes with a suffix
>>   ARM: dts: exynos: drop unused pinctrl defines in Exynos3250
>>   ARM: dts: exynos: simplify PMIC DVS pin configuration in Odroid XU
>>   ARM: dts: exynos: override pins by label in Peach Pit
>>   ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pit
>>   ARM: dts: exynos: override pins by label in Peach Pi
>>   ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pi
>>   ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
>>   ARM: dts: exynos: align pinctrl with dtschema in Exynos3250
>>   ARM: dts: exynos: align pinctrl with dtschema in Exynos4210
>>   ARM: dts: exynos: align pinctrl with dtschema in Exynos4412
>>   ARM: dts: exynos: align pinctrl with dtschema in Exynos5250
>>   ARM: dts: exynos: align pinctrl with dtschema in Exynos5260
>>   ARM: dts: exynos: align pinctrl with dtschema in Exynos5410
>>   ARM: dts: exynos: align pinctrl with dtschema in Exynos542x/5800
>>   arm64: dts: exynos: align pinctrl with dtschema in Exynos5433
>>   arm64: dts: exynos: align pinctrl with dtschema in Exynos7
>>   arm64: dts: exynos: align pinctrl with dtschema in Exynos850
>>   arm64: dts: exynos: align pinctrl with dtschema in ExynosAutov9
>>   ARM: dts: s3c24xx: align pinctrl with dtschema
>>   ARM: dts: s3c64xx: align pinctrl with dtschema
>>   ARM: dts: s5pv210: align pinctrl with dtschema
>>   dt-bindings: pinctrl: samsung: convert to dtschema
>>   dt-bindings: pinctrl: samsung: describe Exynos850 and ExynosAutov9
>>     wake-ups
>>   pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups
>>   arm64: dts: exynos: use dedicated wake-up pinctrl compatible in
>>     Exynos850
>>   arm64: dts: exynos: use dedicated wake-up pinctrl compatible in
>>     ExynosAutov9
>>
> 
> Maybe it makes sense to include my patch [1] for gpm6/gpm7 in this series?
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20220103181826.2136-1-semen.protsenko@linaro.org/T/
> 

Yes, if I am going to resend, I'll include yours. Otherwise, I will try
to remember when applying.


Best regards,
Krzysztof
