Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A24A7E1393
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Nov 2023 14:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjKENOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Nov 2023 08:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjKENOe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Nov 2023 08:14:34 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949C4F2
        for <linux-gpio@vger.kernel.org>; Sun,  5 Nov 2023 05:14:31 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so50002171fa.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 Nov 2023 05:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699190069; x=1699794869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqSv2UnZ+U1pe5KGwf29GbAFTynYSNuIgS0ilx1Gh6k=;
        b=uiNdfudBiCcsNQNDXsk+cinHgAvz74PPBwjQ8AgBK8+Ok4/cSY/xJCETjpaKBMtFMx
         RdjKw8d5QfudrCtWNB82U0RjNJmFoufxnrt0AJfGNAfJDCviawRk1ldDRIkR9oFpDYnz
         jkgm2WGcQD/2t6WUMCwSmypXf2olRfcq3g8xZPqanu6WN8qsqLDx6FiuYr8FJM5G7lur
         6T9OBtNQHlg7m33W1U0yhecAcCs8OCPUVyAwPV6c9pMv0o0wLiZBUQw3YjxwDz0aI9kO
         s0mAceMcdlFMKbAUwKcua7JcK9snqjsnyHQG6VjzBkYmoBf1i5b+ZHlVpQbz7LZyG3WV
         dv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699190069; x=1699794869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqSv2UnZ+U1pe5KGwf29GbAFTynYSNuIgS0ilx1Gh6k=;
        b=j6HzLz247VSJLv4eBWQLa+lY/vehCuNTxwo8M+f7A7XCnGoCb9HM8+Q24rygZUvQKH
         9+EndY6pMmD0DxmiVlr1qyywcv9BNVA4hpVBIcUSshWhIY/y3wREmYLnb8itc87PE2mS
         lJg+n+w1BovIP2bwQDvcXzWA6r6xZHKcYonsjjdW/nde5vLw1j1L5pJ82l5vFTTnPWaI
         o6GO1PU6WFEWiPPEhF3qVTTniCsDTbNgj2mufFAQ+NCr4d/zUMv/dD1rD4AiKlbuT39O
         KekbqtunBrJiRluAjsIbVVhN2/0ZffMb0HdJ5l9Iki1kA0jW75CLqo59rBzl/ccHIXXo
         ijNA==
X-Gm-Message-State: AOJu0Yz4SW3ZVF3XK5fRyxFgWKbxtx4rON3IeWaxaHZIYUWz3ntX93Q8
        EbbYcyM6xdtDj6Fb0ogT5HFkiA==
X-Google-Smtp-Source: AGHT+IGnKSMKqoVLMGiYGZbCupSjzNBC45bZJAUhZDif0PqgX/r7v34/Obqmw9T2Y6euojIAW4UL7A==
X-Received: by 2002:a2e:9246:0:b0:2c5:724:fd64 with SMTP id v6-20020a2e9246000000b002c50724fd64mr20383790ljg.46.1699190069521;
        Sun, 05 Nov 2023 05:14:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id ay8-20020a05600c1e0800b0040772138bb7sm9025518wmb.2.2023.11.05.05.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 05:14:29 -0800 (PST)
Message-ID: <17aed57a-5e40-494b-a1d6-293533498804@linaro.org>
Date:   Sun, 5 Nov 2023 14:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     William McVicker <willmcvicker@google.com>,
        Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>,
        Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
 <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
 <ZUUvp3kqM7NPlyZ_@google.com>
 <cee1b28d-5bd9-46eb-b9f4-facbad10b5d7@linaro.org>
 <2023110535-rare-underdone-b508@gregkh>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2023110535-rare-underdone-b508@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/11/2023 14:08, Greg KH wrote:
> On Sun, Nov 05, 2023 at 01:52:22PM +0100, Krzysztof Kozlowski wrote:
>> On 03/11/2023 18:36, William McVicker wrote:
>>
>>>>
>>>> That's indeed a problem. Future Tesla SoC might have just few pieces
>>>> similar to FSD. There would be no common SoC part, except the actual
>>>> Tesla IP.
>>>>
>>>> Same for Google. Future GSXXX, if done by Qualcomm, will be absolutely
>>>> different than GS101 and the only common part would be the TPU (Tensor).
>>>>
>>>> So now let's decide what is the common denominator:
>>>> 1. Core SoC architecture, like buses, pinctrl, clocks, timers, serial,
>>>> and many IP blocks, which constitute 95% of Devicetree bindings and drivers,
>>>> 2. The one, big piece made by Samsung's customer: TPU, NPU or whatever.
>>>
>>> As mentioned above, I think this should be based on how the DTBs and DTBOs are
>>> used and distributed.
>>
>> None of existing platforms do it. Nowhere. All chromebooks are split per
>> SoC, not "how DTBs should be used and distributed". There is no google,
>> no Chromebook directory. None of Samsung phones have it. No
>> Samsung-phone directory. None of Google phones have Pixel directory.
> 
> but for code we have:
> 	drivers/patform/chrome/
> 	drivers/firmware/google/
> 	drivers/net/ethernet/google/
> 
> don't know if that matters or not, but thought I would mention it...

Yes, for the drivers for the similar hardware we have it. We have
drivers for Chromebook's Embedded Controller - let's put it in one
place, so that maintenance and review will be easier.

Now for DTS, the common hardware is not "Samsung phones", but "Samsung
SoC". We organize it like:
1. Samsung phones with Samsung SoC -> arm64/dts/samsung
2. Samsung phones with Qualcomm SoC -> arm64/dts/qcom

because the main common part is the SoC, not the rest of the phone.
There is no reviewer or maintainer for Samsung phones. There is no need
for such. No benefits, almost not many common parts except some touchscreen.

Why Google Pixel suddenly should be exception from the way we handle DTS
of all ARM64 platforms?

Best regards,
Krzysztof

