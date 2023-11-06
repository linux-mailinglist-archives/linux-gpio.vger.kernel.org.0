Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF287E25F4
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 14:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbjKFNqq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 08:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjKFNqp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 08:46:45 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A07B10A
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 05:46:40 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40859dee28cso34769395e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 05:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699278399; x=1699883199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfclcSLgQxICu2GB1UKyZCIx3NhEDKrGC7w4owwvvMY=;
        b=dkXiW86+UVI4f+Bz8CsF2Rj43l1JVYZBLSldiJfttmrl0s1+WHONLvcj8l842O4ecV
         ZMgjDYVNWFV3uIoNDIvegkSCLHc6sIiiIoniri3Rw1e+0iQYWVUmEFB/ps0DMO6MwzZV
         v9/0MzpeK/kcfRqUmZzWsviPHVnCMFnesG9znKRu8+Hn8skcxoQZfkzuv/Y2kelamuVH
         CkBFVW5JoU53gmQNT88po/Y37jyFHu6hxre9aaMecJ/f1uV36HGri/2k3v8fcR6LSPmM
         UZM3e90UOXb0h24iJAjwj1938KjapeUNjzIF2fQLfhxTeBaiwfi+6EfIIWS5fPR85I44
         q/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278399; x=1699883199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfclcSLgQxICu2GB1UKyZCIx3NhEDKrGC7w4owwvvMY=;
        b=TzZeJROL/txLzEvZu5pbdbD/YaCZTRUIeZkTpXqAHtd7SPzLfpEjH4X+PRygfwfMw1
         99h1D8usltvwUfTK2/0RuqhpjPSlzhI7xt2shuAbV0b2rvGiafBw9lby/+78BMT6i/7l
         ynjvPF9ByrlKiTdDwwpvM9TD1mKZI83g5O34QnY4/wNj5hiiGNDeza5bRGiqem0nMYwU
         zEma4UkENmEKETTLdXqQvqlScurL5FG1YwzrW7aM75VBU2ZtL4VeixGrbaCwWYQtojfx
         uhcoQmj8/Y+yIx7A9xJg2QbCzuwk1+PTCHQNnq0wlMPPXpM8WMCIpf1uBTFwl8rEZdzr
         4HbQ==
X-Gm-Message-State: AOJu0Yz49Q3D5yddZLuk5BrfvYZboT36pRGxsSVzgIjc+eHogkXmYmip
        igZUMS8iUmTzzTEv2cR4hnX3Sg==
X-Google-Smtp-Source: AGHT+IFYMfGYrwL1R4L0XkqT72HNxHdjpYeTOLe3yXLpAnvzcJ4/8ou6iLx70ZjuhAa+uxOYu/Rk9Q==
X-Received: by 2002:a05:600c:1988:b0:409:19a0:d26f with SMTP id t8-20020a05600c198800b0040919a0d26fmr24323551wmq.23.1699278398828;
        Mon, 06 Nov 2023 05:46:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm12377550wmr.14.2023.11.06.05.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 05:46:38 -0800 (PST)
Message-ID: <308e2d07-1993-42d2-95eb-8132efaed1df@linaro.org>
Date:   Mon, 6 Nov 2023 14:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>,
        Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
 <CADrjBPqB5MOQeMV6uSJHLVyMJYWm7Nm_1XGSq331gPRfO1jkzg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CADrjBPqB5MOQeMV6uSJHLVyMJYWm7Nm_1XGSq331gPRfO1jkzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/11/2023 13:46, Peter Griffin wrote:
>>
>> Also, what kind of Google IP are you talking about? I believe only the
>> neural accelerator should be custom-ish.
> 
> This should not be considered an exhaustive list, but whilst looking in the
> downstream public drivers at least the following Google IPs in the SoC
> 
> TPU/ML accelerator
> Bigocean av1 video accelerator
> Emerald hill compression engine
> Camera ISP blocks
> (AoC) Always on Compute
> 
> Plus of course Arm IPs (CPU+GPU), Synopsis IPs (USB, PCI. phys) etc.

These are all common to Exynos and usually they use Exynos-specific
glue, so we consider them all Exynos-specific.

> 
> The Exynos based IPs tend to be for things like pinmux, clocks, i2c, spi,
> uart, mfc, display controller, timer etc.
> 
>>
>> Additionally, I believe it having or not having Google IP is irrelevant:
>> for example, the new Raspberry Pi 5 Broadcom SoC has a lot of
>> Raspberry's own IP, but it's still called Broadcom as it's the real
>> manufacturer and designer of the chip.
> 
> I think RPi / Broadcom is a very different situation to this. The original SoC
> in RPi 1 was wholly designed by Broadcom, and marketed as a Broadcom
> SoC [1].
> 
> Further iterations of the SoC until now have also not had RPi IP integrated.
> RPi themselves refer to them as "Broadcom SoCs" on their webpage [2],
> so it is completely expected that they live in a broadcom directory.
> 
> BCM2717 has integrated the RPi ISP, but to all intents and purposes this is a
> Broadcom owned and designed SoC, albeit only now sold to one customer.

Not that different.
Broadcom designed previous chip.
Samsung designed previous chip.
Broadcom designed BCM2717 with RPi ISP.
Samsung designed GS101 with Tensor NPU and other blocks.

>>>
>>> I guess the same is also true for `axis,artpec8` and `tesla,fsd` SoCs.
>>> IMO the SoC compatible string should be uniquely identifying the actual
>>> SoC, not a close relative.
>>>
>>> Regarding product_id you are correct this reads 0x09845000 but even
>>> within Samsung Exynos family there are examples where the register
>>> value does not match the SoC compatible. For example Exynos850 SoC
>>> has a product ID value of "E3830". Where the Linux compatible is
>>> matching the Samsung marketing name, not the internal/outdated name.
>>
>> I did not know Exynos 850 is also not going under it's real name.
> 
> It is going by its real name :) just not by its internal name that nobody has
> heard of.
> 
>> Ultimately, I believe all of those SoCs should go under their technical
>> name in the exynos/ directory.
>>
>> Another concern is that Google could in the future license other SoC: be
>> it Qualcomm, Nvidia or anything. If we put completely different hw under
>> google/ directory, does it really make sense? In that case, who'll
>> maintain the google/ directory? Exynos people? Qualcomm people if they
>> license it? Some other people?
> 
> I expect Google, or Google sponsored devs (as is the case for Linaro) to be
> helping maintain the Google SoCs upstream. See the MAINTAINERS entry
> for this series of who I expect to maintain this google directory.

That's fine. What I don't agree is with putting it into Google, because
Google wants to have all its phones in one place. That's not the
argument we used for any other SoCs or products.

We do not make decisions based on marketing or packaging wishes of some
company. Otherwise Samsung phones will be together. Toradex boards (also
spanning over NXP and TI) as well. Chromebooks DTS as well (oh, Doug
would be happy, I guess :) ). And so on.

> 
>>
>> Then, I don't think Tensor G3 has a proper "GS" name, it goes by "Zuma"
>> in decompiled kernel modules as far as I see.
> 
> That is correct, it is named Zuma downstream and they did away with the
> gs101, gs201 type naming scheme.
> 
>>
>> Finally, Tesla people already tried to submit drivers called by Tesla
>> name, but which basically copied the functionality of the Exynos
>> drivers. We would want to avoid that, ideally.
> 
> As you can see from this series we are not proposing that. Any IPs that
> use Exynos IP we are using the existing upstream driver and enhance
> it where we have features that aren't present upstream.
> 
>>
>> My opinion is that all the Tesla and Google SoCs should be in the
>> exynos/ directory, not only because they are basically Samsung Exynos,
>> but also because they don't really need a separate directory: neither
>> Google nor Tesla didn't neither manufacture or design those SoCs from
>> scratch.
> 
> Who manufactures it seems irrelevant. Qcom and Broadcom don't
> manufacture their SoCs either, but they still live in qcom and broadcom
> directories upstream. Whether they designed the SoC from scratch or not
> is also IMO largely irrelevant. In many cases the upstream community
> has no way to determine whether things were outsourced or not anyway.
> Did Apple outsource things in their silicon design? Who knows, and why
> do we care? It's an apple branded chip in an apple branded product
> let's call the directory apple.
> 
> Interestingly apple uses the same uart driver as Tensor, when I check back
> through the commits in the driver.
> 
> fcbba344907afe26da487f1ed0b0e285c06a547b
> 
> tty: serial: samsung_tty: Add support for Apple UARTs
> 
> Apple SoCs are a distant descendant of Samsung designs and use yet
>  another variant of their UART style, with different interrupt handling.
> 
> 
>> The only reason I can think of for them to have it in a
>> separate directory is maybe because Google and Tesla actually paid
>> Samsung money for the right to call Exynos "Google designed" SoCs, but I
>> believe the kernel should be left out of that.
> 
> Also the fact that they contain IPs not found in Samsung designed devices,
> aren't known to most people as Exynos, and the maintenance issues of
> having all the Google, Tesla, Axis, Exynos based SoCs in the same directory
> (and who knows how many other ASIC customers in the future).
> 
> Ultimately it is Krzysztof's decision I think. I followed what he had previously
> accepted for other SoCs for consistency and also because it seemed like the
> correct approach to help scale up and ease the maintenance burden. If I look
> at the number of tensor based SoCs, phones per SoC and board variants per
> phone model, then you end up having a lot of files in the exynos directory over
> time.

I agreed on Tesla FSD in its own place mainly because of arguments
provided that time: it's entirely different architecture. These
arguments were not backed by actual facts or proofs, though. The
upstreamed parts of FSD turned out to be... only Exynos specific. There
is literally nothing non-Exynos in upstream. Therefore knowing the
outcome I would say: put FSD into samsung directory.

About GS101 I have the same questions - how similar it is? I am pretty
sure that 95% of upstreamed code (DTS and drivers) will be Exynos-like
(except for missing upstream support for generations of Exynos SoC!).
But I cannot really judge and I am not going to investigate downstream
code to figure this out. Thus if you insist that SoC architecture and
core features are quite different from Exynos family, then sure, I can
live with it.

Best regards,
Krzysztof

