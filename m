Return-Path: <linux-gpio+bounces-643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C5C7FD371
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61C771C20EB3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB0019471;
	Wed, 29 Nov 2023 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lyrR25av"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0091990
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 02:02:39 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54b8a4d64b5so3591025a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 02:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701252158; x=1701856958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIR1+lFYVoP8VkCPK2xf++tTI+o3PmKoM1Fva6K+WBY=;
        b=lyrR25avWdsLYfOVXWEIYgBuO35xEfG8xnaXvw3mUsUws2wBejo13YrVQu8v+Gj40t
         JKtC7NWRawhkboZLMWS2ysNyDxckqlpQ+XQDEEJBRJ63j6T1jsKxNuJtiHUEkLxIgwaG
         UqJ3k7rrkzukOZLt6o8VZtBoVZuP6bJg8Xm1+Xqek66/dPzbR9AJguiUqr+x9J7e7rln
         gXbOzNktsPdt6s9jg8T6hPGUtwDi/D/O2gquz50T4s7Hn8vfkDeLE4zerVJReStCKLKt
         RVQQI+rYGquW4CcnM3MNZUaWGitz1OyDoTvtxZVmT3GLHQEbgg5BrNEq08IXml7BY53m
         pkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701252158; x=1701856958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jIR1+lFYVoP8VkCPK2xf++tTI+o3PmKoM1Fva6K+WBY=;
        b=ML2j5/rVvXBI1tExkDFmodCRQ1HjjBuoggrZpnXIega8EEgLCVc86hFH6+gQskkM5H
         spN4dqiJtNcB/9pF51daMqQNI2Nj+lZ1JsU2CZczWQdcAoG43bKO4c+1qzAZSnInd8Xw
         8UCTriOqoj+7RloOdGoYcG9GIcuq2Msgzh7DCXroy8Sip9FmnDlbbItLDmQLzQvL+IJ5
         6BLXChJCn6M0W7n4nDiaEPXNXD24rNPC3+wI596X3pve0o5KSS4BPof04qgVHSipZF0k
         fwAxeLr3k1VdUAO460bWZVWnA+CyrtKh3+dDmFZo6LitidmZeu2UWfrA5ZAJ9YNXDp8z
         JeTQ==
X-Gm-Message-State: AOJu0Yzk88YZp6nW6fJie52aqQKrVxV90XOxFb5dDL5V5inmXAhOlg8/
	4uAdsaW9+EWVA6DyyppDQanDNg==
X-Google-Smtp-Source: AGHT+IGBe5fF2feOJ6GepESC8b3vogAUSudTCK+dIfUV5hi6Xelj/XxVrSSUnouqB2whrDTf7qU00Q==
X-Received: by 2002:aa7:dd17:0:b0:54b:d16:4c49 with SMTP id i23-20020aa7dd17000000b0054b0d164c49mr11097087edv.16.1701252157786;
        Wed, 29 Nov 2023 02:02:37 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id k11-20020a056402048b00b00537963f692esm7111666edv.0.2023.11.29.02.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 02:02:37 -0800 (PST)
Message-ID: <9ec2dd42-5173-40df-8e6b-9c09f2d77f67@linaro.org>
Date: Wed, 29 Nov 2023 11:02:35 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: nuvoton: Add pinctrl support for
 ma35d1
Content-Language: en-US
To: Jacky Huang <ychuang570808@gmail.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com
References: <20231128061118.575847-1-ychuang570808@gmail.com>
 <20231128061118.575847-4-ychuang570808@gmail.com>
 <7edda3ca-b98a-4125-979f-3ee7ac718a9a@linaro.org>
 <a0be9aaa-290d-450e-b0b8-d87453bcaaa0@gmail.com>
 <7fed5d90-da04-40fb-8677-b807b6f51cc9@linaro.org>
 <8663d26e-32b8-4f2b-b497-9efa7440f070@gmail.com>
 <2fab32e6-23a4-41bb-b47b-4f993fc590dc@linaro.org>
 <ff83f0f2-541a-4677-a247-5f47fdcca3f1@gmail.com>
 <db3ede63-8708-469f-8e7b-aca798ed50e0@linaro.org>
 <4b00c41c-7751-40ca-bf2d-53f1179772d4@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4b00c41c-7751-40ca-bf2d-53f1179772d4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2023 10:41, Jacky Huang wrote:
> 
> Dear Krzysztof,
> 
> 
> On 2023/11/29 下午 04:11, Krzysztof Kozlowski wrote:
>> On 29/11/2023 04:35, Jacky Huang wrote:
>>>>>> Best regards,
>>>>>> Krzysztof
>>>>>>
>>>>> Yes, it did pass the 'dtbs_check'. I guess the tool does not detect such
>>>>> issues.
>>>>> Anyway, I will fix it in the next version.
>>>> Hm, I see your bindings indeed allow pin-.* and unit addresses, so it is
>>>> the binding issue.
>>>>
>>>> The examples you used as reference - xlnx,zynqmp-pinctrl.yaml and
>>>> realtek,rtd1315e-pinctrl.yaml - do not mix these as you do.
>>>>
>>>> I don't understand why do you need them yet. I don't see any populate of
>>>> children. There are no compatibles, either.
>>>>
>>>> Which part of your driver uses them exactly?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>> I will move the 'pcfg_default: pin-default' from dtsi to dts, like this:
>>>
>>> &pinctrl {
>>>       pcfg_default: pin-default {
>>>           slew-rate = <0>;
>>>           input-schmitt-disable;
>>>           bias-disable;
>>>           power-source = <1>;
>>>           drive-strength = <17100>;
>>>       };
>> This solves nothing. It's the same placement.
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> OK, it stil be the binding issues.
> For "^pin-[a-z0-9]+$", I reference to the "pcfg-[a-z0-9-]+$" of 
> rockchip,pinctrl.yaml.
> 
> My intention is to describe a generic pin configuration, aiming to make 
> the pin
> description more concise. In actual testing, it proves to be effective.

Can you instead respond to my actual questions?

Best regards,
Krzysztof


