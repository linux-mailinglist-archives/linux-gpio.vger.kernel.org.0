Return-Path: <linux-gpio+bounces-570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA037FB8FB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 12:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 773A3B21DDC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE714EB50;
	Tue, 28 Nov 2023 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+beYF7Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B494B10D2
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 03:06:18 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54bbf08aa53so107998a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 03:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701169577; x=1701774377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOs52IqsPNI3Y8G4cqoTGDVpRB2H5zau87t8At0sOPo=;
        b=a+beYF7YOX/vdxcylplNdaZGixdFhAT64YXnammNbq3q+ZGGGxGCAqRcmqXF+coXgb
         3TFslhV+oQNSWuvKXCYaMl8E+7JO1fTv7eTj6OxvxuL4s1ujhWaoBgi/d6ISUd2Vgnrl
         DczNbov03Gg6plSjDw/fb0yJQwZt/IQ4BOaaPgInAniSomD9kvNIOG2QRXWn9VEExu+y
         mbmyoGxrjSVYSjKFn/9s+/YpiWHXGbsz18emutmvDzbI6aJveNwU7U4x2vlLTU1Q0pBm
         yqRxZMX6Nr1RK8ZDNBMmS13QOeD75qU8wtEEGc4cymPmvFvF9zGPBU/r/xhBDV3slRfV
         6QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701169577; x=1701774377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOs52IqsPNI3Y8G4cqoTGDVpRB2H5zau87t8At0sOPo=;
        b=YHbi0GjqDArplGxqvEOd0anOxAUryZKQcTE/0qmsWNZVOOcwgCIMEBbd9h3OByI1p0
         CWyD/dtcxKa+c/USpiD63+fgjCG6snUMnpwc/gFGm66hHImyFp7LkHZMceZpYDf0JPPi
         l/BWSETAzioywDU2GFR81KkO14hUE3XNh6+//JeCpknWxT0oEZ56SEBBpisx2+nIOwPR
         k9QxTWNyDN2Ob3839nPJUwUqDncGwrIL4KBU4czJgd0FzSoBVCcv26nB62Xj6GyBRev7
         XyeUlgRHnKoELbA8sJasHPG5YGAAQf+MCMIegp6b6073TkEnm8AFZmOkrcvXPJCupeQn
         r55A==
X-Gm-Message-State: AOJu0Yx2ZsDYzKUOuFtT5oi1/ZBsry+1HoQMGwcjLbkz8Uau+xqxNbSv
	9zX6kApQIrJG14gXOnP14VS+AQ==
X-Google-Smtp-Source: AGHT+IHCm/RW3LDAqX7Df5SfpIS6CYpn11PXDAZFZLqHNgCSmpwUyJ44diqkskrFppwDMbp/4gyDOQ==
X-Received: by 2002:aa7:c794:0:b0:54b:5c1d:4cea with SMTP id n20-20020aa7c794000000b0054b5c1d4ceamr4657584eds.26.1701169577236;
        Tue, 28 Nov 2023 03:06:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id e28-20020a50d4dc000000b0054b9c98b852sm833294edj.55.2023.11.28.03.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 03:06:16 -0800 (PST)
Message-ID: <2fab32e6-23a4-41bb-b47b-4f993fc590dc@linaro.org>
Date: Tue, 28 Nov 2023 12:06:15 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8663d26e-32b8-4f2b-b497-9efa7440f070@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2023 11:45, Jacky Huang wrote:
> Dear Krzysztof,
> 
> Thanks for your review.
> 
> On 2023/11/28 下午 05:34, Krzysztof Kozlowski wrote:
>> On 28/11/2023 09:37, Jacky Huang wrote:
>>>>> +			gpion: gpio@40040340 {
>>>>> +				reg = <0x340 0x40>;
>>>>> +				interrupts = <GIC_SPI  105 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +				clocks = <&clk GPN_GATE>;
>>>>> +				gpio-controller;
>>>>> +				#gpio-cells = <2>;
>>>>> +				interrupt-controller;
>>>>> +				#interrupt-cells = <2>;
>>>>> +			};
>>>>> +
>>>>> +			pcfg_default: pin-default {
>>>>> +				slew-rate = <0>;
>>>>> +				input-schmitt-disable;
>>>>> +				bias-disable;
>>>>> +				power-source = <1>;
>>>>> +				drive-strength = <17100>;
>>>>> +			};
>>>> It does not look like you tested the DTS against bindings. Please run
>>>> `make dtbs_check W=1` (see
>>>> Documentation/devicetree/bindings/writing-schema.rst or
>>>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>>>> for instructions).
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>> I forgot to remove 'ma35d1-pinfunc.h' from my local copy.
>>> After remove the '#include <dt-bindings/pinctrl/ma35d1-pinfunc.h>', it
>>> can pass
>>> the `make dtbs_check W=1` check.
>>> I will fix it in the next version.
>> Really? Then your bindings look wrong. Why do you mix MMIO nodes and
>> non-MMIO in one device node?
>>
>> Best regards,
>> Krzysztof
>>
> 
> Yes, it did pass the 'dtbs_check'. I guess the tool does not detect such 
> issues.
> Anyway, I will fix it in the next version.

Hm, I see your bindings indeed allow pin-.* and unit addresses, so it is
the binding issue.

The examples you used as reference - xlnx,zynqmp-pinctrl.yaml and
realtek,rtd1315e-pinctrl.yaml - do not mix these as you do.

I don't understand why do you need them yet. I don't see any populate of
children. There are no compatibles, either.

Which part of your driver uses them exactly?

Best regards,
Krzysztof


