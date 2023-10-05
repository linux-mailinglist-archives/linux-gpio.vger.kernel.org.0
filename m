Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF637BA9E8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 21:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbjJETS4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 15:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjJETS4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 15:18:56 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65883E8
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 12:18:54 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9b9faf05f51so13297666b.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696533532; x=1697138332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4qB0MRjQu2gDg3qHLpkWFP7s0OV5hXqOG3V7yLFlR88=;
        b=lyRWZExju0njGCQYaXxY6ertrnhUJNQyUCogPJv3jN+49Bu/75RMm3QkWhJJbwmo3b
         hJbKQKwhmKa/QKYl4ur+ncCsvbpdRfd6QG3YfFESYc1vRZ9QovHlYCpJF9Jke0EeAOUE
         0cfAD11jy6kJSQzvwuZGwhCRXiz7ElswmRDNdIzWJkf8+gDAqEHssk48evNYe+XpLodI
         6iQvts6Dbli62yZlksGzaDiRlO4QOlFvAqpQyKmwTbaUgXBAtbTk40BlkYOWZWrVSND4
         P5zwZAlagv1iy/OtUNFkTtsrRg2U7SU5BnQfYJyRUE2ttLMqoTkZEPjdrKmQEsNVBedE
         Z+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696533532; x=1697138332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4qB0MRjQu2gDg3qHLpkWFP7s0OV5hXqOG3V7yLFlR88=;
        b=lG8Bm+4fQ3tVdhNkC+B1QI4eMzx77TNfR9syKc4Zsgv9WstM236U8SXcejbxK8QtQd
         ZwZmuUnbItd8PnNbkfLJJq+jouKSRFch6Kx6RH8K9AeL51tHq6fm6VB5uTBpYJ2Fu4fp
         sjpRss6CwsH26YorEPQ6pR7zxce0PMD02jjOd3JM4hDg/OSF8N75bXiatqdVE0vvfU/a
         IIYhz4RGXZ+svW66fI8DuvWWdgVtWx2qoGETiPyCy9Y5I6MMxnLq+tv17+s+TWCB7bvA
         pmGW5d/eXL2gbs//XjghEwBRPLwJrRrT+i/sGCPe/7r1Wy3+Wjq2Tt+Fg0p0H0y2KZsL
         z3Jw==
X-Gm-Message-State: AOJu0Yzgjwk3dPte1oW1yDnFVL+Afwze+10mQoMeaDuRN6cdhwqe8whF
        at0SQFFQjvdAEAPqdDb6qXvGnw==
X-Google-Smtp-Source: AGHT+IH/m/j7FZXDxfGp/9so2jUuXWCuW+onwFoyf9Rc+60NFRqcUXdu+UUeX2mcuEHPK0r8m8U3Dg==
X-Received: by 2002:a17:906:3050:b0:9b2:be5e:7545 with SMTP id d16-20020a170906305000b009b2be5e7545mr4878651ejd.36.1696533532304;
        Thu, 05 Oct 2023 12:18:52 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id l12-20020a170906230c00b009920e9a3a73sm1631698eja.115.2023.10.05.12.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 12:18:51 -0700 (PDT)
Message-ID: <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>
Date:   Thu, 5 Oct 2023 21:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>,
        William McVicker <willmcvicker@google.com>
Cc:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@google.com
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com> <2023100520-cleaver-sinless-fbae@gregkh>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2023100520-cleaver-sinless-fbae@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/10/2023 20:05, Greg KH wrote:
> On Thu, Oct 05, 2023 at 10:59:12AM -0700, William McVicker wrote:
>> On 10/05/2023, Peter Griffin wrote:
>>> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
>>> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
>>> phones. It features:
>>> * 4xA55 little cluster
>>> * 2xA76 Mid cluster
>>> * 2xX1 Big cluster
>>>
>>> This commit adds the basic device tree for gs101 (SoC) and oriole
>>> (pixel 6). Further platform support will be added over time.
>>>
>>> It has been tested with a minimal busybox initramfs and boots to
>>> a shell.
>>>
>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>> ---
>>>  arch/arm64/Kconfig.platforms                  |    6 +
>>>  arch/arm64/boot/dts/Makefile                  |    1 +
>>>  arch/arm64/boot/dts/google/Makefile           |    6 +
>>>  arch/arm64/boot/dts/google/gs101-oriole.dts   |   68 +
>>>  arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1134 +++++++++++++++++
>>>  arch/arm64/boot/dts/google/gs101-pinctrl.h    |   17 +
>>>  arch/arm64/boot/dts/google/gs101.dtsi         |  501 ++++++++
>>>  7 files changed, 1733 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/google/Makefile
>>>  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
>>>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
>>>  create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
>>>
>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>>> index 6069120199bb..a5ed1b719488 100644
>>> --- a/arch/arm64/Kconfig.platforms
>>> +++ b/arch/arm64/Kconfig.platforms
>>> @@ -107,6 +107,12 @@ config ARCH_EXYNOS
>>>  	help
>>>  	  This enables support for ARMv8 based Samsung Exynos SoC family.
>>>  
>>> +config ARCH_GOOGLE_TENSOR
>>> +	bool "Google Tensor SoC fmaily"
>>> +	depends on ARCH_EXYNOS
>>> +	help
>>> +	  Support for ARMv8 based Google Tensor platforms.
>>
>> I'd like to bring up this thread and discuss the option of not introducing
>> another ARCH_* config:
>>
>>   https://lore.kernel.org/all/20200306103652.GA3634389@kroah.com/
> 
> I agree, PLEASE don't add platform config options as that makes it
> impossible to make a unified kernel image that works for more than one
> platform at the same time.

There is no single problem in making unified image as we were doing
since beginning of ARM64. The ARCH_* is not a obstacle for this.

> 
>> I especially don't like the "depends on ARCH_EXYNOS" because that forces one to
>> include all the other Exynos drivers that ARCH_EXYNOS selects that Google
>> Tensor SoCs don't need. Can we consider using SOC_GOOGLE instead and for all
>> drivers that actually depend on the SoC hardware, we can just add "depends on
>> SOC_GOOGLE"?
> 
> Why do any of this at all?  It should not be needed.
> 
>> The idea is that drivers should be tied to hardware -- not a specific vendor.
> 
> And drivers should be auto-loaded.
> 
> All of these drivers are not vendor-specific at all, they are based on
> the same IP blocks as others, so that is how they should be unified.

They are vendor specific. All of them are specifically for Exynos
hardwre, because this is Exynos. We call it Google GS/Tensor SoC just
for fancy convenience, but this just Exynos.

> 
>> By making drivers depend on ARCH_*, you are introducing an arbitrary vendor
>> dependency and not a hardware dependency.
> 
> Totally agree, thanks for bringing this up.
> 
Best regards,
Krzysztof

