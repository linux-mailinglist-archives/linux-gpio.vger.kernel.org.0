Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 624A67BB157
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 08:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjJFGGj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 02:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjJFGGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 02:06:38 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0136E7
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 23:06:35 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9b974955474so316788766b.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696572394; x=1697177194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lShvcR5QOmRSXlFwQBNfqNwjJAm5BLtn8YJ+QgRN3Xs=;
        b=XnAMoq0Gj8bqqWeG4BF9bknTpJGMk/15D/BUDw2Gv35JB/ZJESfyRRWs/D8FqG7mev
         C73BiHVG0tM0kq42gbSmbRl4CsYyLctNGdIFjkIuR4Nr3w+LEw+RNHeEbitu4IVXlCeU
         mXqomPgJIVrOg+MY+SyMoB+zJ71aJlVLaLOvj+hMmfe5k7RyExteu5N/+1YsFTC2s1v0
         FNPE2z+GYs5y1wxOFK9prVZzP6pSEa0N7pj9LUG/ZZnFkdqaSoVfN43Z8JybZRmMCSyH
         glxslbwzZ6vomKFtR7+Ug6LTuguCV1TNKfofsAlxixjdjz/CN/fTISMhovVosZFsF7O4
         AFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696572394; x=1697177194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lShvcR5QOmRSXlFwQBNfqNwjJAm5BLtn8YJ+QgRN3Xs=;
        b=eMT9HizoFAtuAAt1nLq3sn6E2n5xWGlIjr4QnBjj0m5gWDiKm2sB/cpwUo4gmjUlDK
         YGVp5Nm0yAN5MXcHIQlJNf6SB2gfqB+BzXfAqbiJARzwqzBClJP0l2B8nySV9SBM3WrA
         OWV4iv5H9DrBjBeoBLeJQObecdV4yoecthK9huFqD+eD70aFF+0oVaFKT9o7JHqqlx0K
         3OOk/wxjH5+5odyJLs7gz1iNeoxEgu67EIP3cOvokFj0n7HbYaGXJV4VvnebUHt7Nt1U
         gLUALIkUHaMmouGi9x7NLejn3uJZZ2yw7r2pA4kJP906RZLDk12SEcCfbHyMfVcTMHS4
         ah5g==
X-Gm-Message-State: AOJu0YwMykjpxa5Dq50wywCwD3+icXsxwgg5KKzgr838ha0zLZkhLJ6Y
        gRNhmp3ZZRF2VwIFLX0qrz97f87TLHQAjxPkbecq9A==
X-Google-Smtp-Source: AGHT+IFy5QxeJOdvxZ9bKyosWcf+cPbAwd3FQFIqZG5rrU7HD2syWP0UoL4XnvOvjztvf7sUUIlKWg==
X-Received: by 2002:a17:906:31c5:b0:9a2:5bf:8b14 with SMTP id f5-20020a17090631c500b009a205bf8b14mr6981823ejf.22.1696572394205;
        Thu, 05 Oct 2023 23:06:34 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906299400b0098951bb4dc3sm2280807eje.184.2023.10.05.23.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 23:06:33 -0700 (PDT)
Message-ID: <44816879-a3a7-4bd0-bb20-19a645107b4b@linaro.org>
Date:   Fri, 6 Oct 2023 08:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
To:     William McVicker <willmcvicker@google.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
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
        kernel-team@android.com
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com> <2023100520-cleaver-sinless-fbae@gregkh>
 <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>
 <2023100513-mashing-scrubber-ea59@gregkh>
 <efc9f099-9c97-460b-b0c8-9891aa3b772a@linaro.org>
 <ZR9EnFw3vB92vlYM@google.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZR9EnFw3vB92vlYM@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/10/2023 01:19, William McVicker wrote:
> On 10/05/2023, Krzysztof Kozlowski wrote:
>> On 05/10/2023 21:23, Greg KH wrote:
>>> On Thu, Oct 05, 2023 at 09:18:48PM +0200, Krzysztof Kozlowski wrote:
>>>>>> I'd like to bring up this thread and discuss the option of not introducing
>>>>>> another ARCH_* config:
>>>>>>
>>>>>>   https://lore.kernel.org/all/20200306103652.GA3634389@kroah.com/
>>>>>
>>>>> I agree, PLEASE don't add platform config options as that makes it
>>>>> impossible to make a unified kernel image that works for more than one
>>>>> platform at the same time.
>>>>
>>>> There is no single problem in making unified image as we were doing
>>>> since beginning of ARM64. The ARCH_* is not a obstacle for this.
>>>
>>> Then why are the ARCH_* options needed at all?  What does this help out
>>> with?
>>
>> It helps all the people and distros who do not want to build/package
>> drivers or modules for unrelated hardware or architectures.
>>
>> Let's take Samsung Exynos UART driver. It will never, 100% never, work
>> on x86, x86_64. There is no single need to package it for kernels build
>> for these products. It will not work on nVidia Tegra ARM64, Qualcomm
>> ARM64 SoC, so if you do not want to run on Exynos, then you do no select
>> ARCH_EXYNOS and have significantly smaller image.
>>
>> Now, there is no problem to have one kernel for nVidia Tegra + Qualcomm
>> + Samsung Exynos with everything you need. The ARCH_EXYNOS or SOC_EXYNOS
>> or SOC_GOOGLE serves only the purpose to allow distros and people
>> customize build for specific hardware.
>>
>> It does not limit anyone on anything.
> 
> I'm glad you brought up Exynos UART because this is where one of the
> limitations is introduced. For example, if you want to modularize out all the
> vendor specific drivers from the core kernel to create a common arm64 kernel
> binary that works on all ARM64 devices, you will not be able to build in the
> early console UART drivers without enabling the respective ARCH_* configs.

When you build single kernel there is never need to NOT ENABLE
respective ARCH configs. Please describe me upstream case for such need
to NOT ENABLE.

> Being able to include SERIAL_SAMSUNG and SERIAL_MSM without all the vendor> specific drivers that ARCH_EXYNOS and ARCH_QCOM select is very
valuable for
> debugging early boot issues.

Really? How related? The drivers are independent. You describe some
out-of-tree development process which we never needed for upstream work.
And we did here quite a lot of upstream, specially if you look at ARCH_QCOM.

> 
> I understand that ARCH_* configs are used to selectively pick which device tree
> blobs are built, but forcing developers to pick all or nothing is where I have
> a problem.

No one forces you to pick up everything or nothing. You select
ARCH_EXYNOS and still can drop all optional drivers. It's true you
cannot drop mandatory drivers, but you are upstreaming Exynos platform,
right? We do not talk about your out-of-tree Google work because it does
not matter.

Best regards,
Krzysztof

