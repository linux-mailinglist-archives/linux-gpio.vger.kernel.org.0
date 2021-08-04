Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99AC3E07B2
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 20:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240315AbhHDSg6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 14:36:58 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47346
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238923AbhHDSg6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 14:36:58 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 019A73F347
        for <linux-gpio@vger.kernel.org>; Wed,  4 Aug 2021 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628102204;
        bh=kLWUtHA3a5xY5N4esWD+HgIy7cu1PUh6hkksxjyOzDA=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=QEiioed295tlhKw5C0JyTnJTg/9K+9RKyHvE5KwGfbSQmRS9btrYGJdQi5/ofnBbe
         9Fyyu6sl8y/vDp0pbM3g0sO0W1pVWwdvocgJ/GvuLfeJQaHwIteuu/db9j4To3Fujk
         t/Etl26CDchJKRyblq9tPQqanCia0K22e0NTivexFbqxhElGBDalzsQ1T56aH0WZKs
         xsUR8InbVrVdwOhN6Vmqb8n1VMC8a6tPJ22Q+gPLXIN3+0suIhEv7sRifxKH1JcRy1
         rpjLwhf4yZfazOdjOMi6SY1tNDG5ZqmKu7Oop2BazqBSaR5yJK/mthsLnvB0yXNg9i
         ihOajgbuYBcdg==
Received: by mail-ed1-f70.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so1918203edu.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Aug 2021 11:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kLWUtHA3a5xY5N4esWD+HgIy7cu1PUh6hkksxjyOzDA=;
        b=kK/UJl/M8D9hoBJKTj151oyrNA8eCcu5oDeR3tkpgPuT4mR60CnMrtKiW34YlRZXMe
         X/+Eh98IFWCjJpHZkzubUKvYPAFIkOqqCZstJAq1RGLJP/VSaRDNAVZX/z7VlWBAx4pe
         4MHj9Eq/UibXJoxl+3hqQ+Nj2d7YDXoKZ9oKdH5O+jZAm5A+3N4ubUkPMn3bHAHFtuk/
         tvInqG4iAN5QpO0egQIhwOty2J/lLgIH9guleSPVesjNfyW5ga7AmkB5ufshETDTrSPw
         8mGzhwS154Zz+b5gELm0jGxl1zznxhz2LAjajab5v3fasC91yRSz/GS9WNapHVGLWjHY
         +FPA==
X-Gm-Message-State: AOAM530moECKcfAQlwkg4NpuE9iW6xD7qRy0WHVj23Wvr/HHYe0K7Hjo
        W5xisdllCDL0LQuTvAMcDNeltxIfBVsGsZi21jP85LVjCIy0t3+e4o8/RLBf5YUf+mujr3cnA2W
        L3MjZ4FOvHi//D7yHhTg1s9U2QjqyzK2/25cHqLE=
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr572936ejc.356.1628102203666;
        Wed, 04 Aug 2021 11:36:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9TZSrCE1ZT+ckWS9kno03EUR0eItVE1fmPjRT2brkptWJ/N8BEt1UTXE4ubRLwSxkR5ISYw==
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr572916ejc.356.1628102203469;
        Wed, 04 Aug 2021 11:36:43 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id cm1sm1248761edb.68.2021.08.04.11.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 11:36:42 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marc Zyngier <maz@kernel.org>
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
 <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
 <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
Message-ID: <bf21badb-804f-45f0-c02b-80ff57ab9931@canonical.com>
Date:   Wed, 4 Aug 2021 20:36:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/08/2021 16:39, Sam Protsenko wrote:
> Hi Marc,
> 
> On Fri, 30 Jul 2021 at 19:50, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On 2021-07-30 15:49, Sam Protsenko wrote:
>>> Samsung Exynos850 is ARMv8-based mobile-oriented SoC.
>>>
>>> Features:
>>>  * CPU: Cortex-A55 Octa (8 cores), up to 2 GHz
>>>  * Memory interface: LPDDR4/4x 2 channels (12.8 GB/s)
>>>  * SD/MMC: SD 3.0, eMMC5.1 DDR 8-bit
>>>  * Modem: 4G LTE, 3G, GSM/GPRS/EDGE
>>>  * RF: Quad GNSS, WiFi 5 (802.11ac), Bluetooth 5.0
>>>  * GPU: Mali-G52 MP1
>>>  * Codec: 1080p 60fps H64, HEVC, JPEG HW Codec
>>>  * Display: Full HD+ (2520x1080)@60fps LCD
>>>  * Camera: 16+5MP/13+8MP ISP, MIPI CSI 4/4/2, FD, DRC
>>>  * Connectivity: USB 2.0 DRD, USI (SPI/UART/I2C), HSI2C, I3C, ADC,
>>> Audio
>>>
>>> This patch adds minimal SoC support. Particular board device tree files
>>> can include exynos850.dtsi file to get SoC related nodes, and then
>>> reference those nodes further as needed.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
>>>  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
>>>  3 files changed, 1057 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>> b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>> new file mode 100644
>>> index 000000000000..4cf0a22cc6db
>>
>> [...]
>>
>>> +     gic: interrupt-controller@12a00000 {
>>> +             compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>
>> One thing for sure, it cannot be both. And given that it is
>> an A55-based SoC, it isn't either. It is more likely a GIC400.
>>
> 
> Yes, it's GIC-400, thanks for pointing that out. Will fix that in v2.
> 
>>> +             #interrupt-cells = <3>;
>>> +             #address-cells = <0>;
>>> +             interrupt-controller;
>>> +             reg = <0x0 0x12a01000 0x1000>,
>>> +                   <0x0 0x12a02000 0x1000>,
>>
>> This is wrong. It is architecturally set to 8kB.
>>
> 
> Nice catch! Actually there is an error (typo?) in SoC's TRM, saying
> that Virtual Interface Control Register starts at 0x3000 offset (from
> 0x12a00000), where it obviously should be 0x4000, that's probably
> where this dts error originates from. Btw, I'm also seeing the same
> error in exynos7.dtsi.

What's the error exactly? The "Virtual interface control register"
offset (3rd region) is set properly to 0x4000 on Exynos7. Also one for
the Exynos5433 looks correct.

> Though I don't have a TRM for Exynos7 SoCs, so
> not sure if I should go ahead and fix that too. Anyway, for Exynos850,
> I'll fix that in v2 series.


However while we are at addresses - why are you using address-cells 2?
It adds everywhere additional 0x0 before actual address.


Best regards,
Krzysztof
