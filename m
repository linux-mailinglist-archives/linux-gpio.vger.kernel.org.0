Return-Path: <linux-gpio+bounces-647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4F7FD3C3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 137B5B216D3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7E519BAF;
	Wed, 29 Nov 2023 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6s7uf/1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A645AF;
	Wed, 29 Nov 2023 02:14:12 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1fa2b8f7f27so2308416fac.0;
        Wed, 29 Nov 2023 02:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701252852; x=1701857652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGZ3TgbJjq9FTWNge0Xm7kDLqkirObI8+B/QdDXRIsg=;
        b=W6s7uf/1Eg/pt0nNYKH56gzXoDXwPzNPI6FVJmpMjuu1bNGrdayU2asVw+5tv0CdiZ
         xojJL/fEMGp4JPCvKwvE/IAmZXNpBNrHGU+M5baTDigV+nEZgUIAiWC/yLuS/f/6VMig
         Qx1SFCIyO4Ow3N+1ah37T87Wi8VNXwziu2ANf2TQq8cEway5SZJj39zly2nrW3Tim1OA
         wG2O3HGu6zTPruWwkAFZkYUVBLf6i+F901refzOIwwcQOGlnThF9347/ZcCBJcWMTc9V
         vG3p9M0amFwKbXRzM7VrchFbUxsL0gMUvWIBUow7m5rKB3IvrnC8HXpE4yU+BMkSOTAu
         C7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701252852; x=1701857652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGZ3TgbJjq9FTWNge0Xm7kDLqkirObI8+B/QdDXRIsg=;
        b=OaW6d2hYwJ0TmZEzS5oS6ojIb0n12UNDvIUMizEndxL0EwjiZ9+RKjw6oxIf5Nnwmk
         o6ljGJmscOmjlsu9kZYhRcBZQvFgnVQtQUwikIZlyy1WnTYTAapAsUdWgbYA8UGYgM6E
         H3r1JbXAvBc4ccMuDlaLqAr7f0WhvgvcHGVoD19liKOlujoGjHlvCOEYQWjnBTYLNtgO
         izqru5IByTmPOePCgqikn9iNIJmDuxR1gbLoVuhNQu5MXZ3EAJBWLz82KyJOlDOTVcG6
         jNx1RcjxKahRH5h2ttbfSo+IiahmU/x42ryOPD8sX9M39L5OC//c64vRyjwLAj2jZvbB
         ZUvA==
X-Gm-Message-State: AOJu0Yz/AzC70mcDrzqf/YXf1hsoLBMOuTJGWJ/UHj+F/CIyWKAUF/xE
	Z6/fSgGgdZKsoPBK5iNVznk=
X-Google-Smtp-Source: AGHT+IEPWKGIQhyEyqP/kA8WufJf3oEEHDE+txRrCHUCkSm+i0dp+E3Y9yS8oy/osYm2DLZZdpF5dA==
X-Received: by 2002:a05:6870:75c9:b0:1e9:da6f:a161 with SMTP id de9-20020a05687075c900b001e9da6fa161mr25452160oab.3.1701252851813;
        Wed, 29 Nov 2023 02:14:11 -0800 (PST)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id e17-20020aa78c51000000b006c06779e593sm10682629pfd.16.2023.11.29.02.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 02:14:11 -0800 (PST)
Message-ID: <6d511cc4-f22c-4c8f-a1ea-a8d99be95157@gmail.com>
Date: Wed, 29 Nov 2023 18:14:07 +0800
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
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
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
 <9ec2dd42-5173-40df-8e6b-9c09f2d77f67@linaro.org>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <9ec2dd42-5173-40df-8e6b-9c09f2d77f67@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Dear Krzysztof,


On 2023/11/29 下午 06:02, Krzysztof Kozlowski wrote:
> On 29/11/2023 10:41, Jacky Huang wrote:
>> Dear Krzysztof,
>>
>>
>> On 2023/11/29 下午 04:11, Krzysztof Kozlowski wrote:
>>> On 29/11/2023 04:35, Jacky Huang wrote:
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>>>
>>>>>> Yes, it did pass the 'dtbs_check'. I guess the tool does not detect such
>>>>>> issues.
>>>>>> Anyway, I will fix it in the next version.
>>>>> Hm, I see your bindings indeed allow pin-.* and unit addresses, so it is
>>>>> the binding issue.
>>>>>
>>>>> The examples you used as reference - xlnx,zynqmp-pinctrl.yaml and
>>>>> realtek,rtd1315e-pinctrl.yaml - do not mix these as you do.
>>>>>
>>>>> I don't understand why do you need them yet. I don't see any populate of
>>>>> children. There are no compatibles, either.
>>>>>
>>>>> Which part of your driver uses them exactly?
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>> I will move the 'pcfg_default: pin-default' from dtsi to dts, like this:
>>>>
>>>> &pinctrl {
>>>>        pcfg_default: pin-default {
>>>>            slew-rate = <0>;
>>>>            input-schmitt-disable;
>>>>            bias-disable;
>>>>            power-source = <1>;
>>>>            drive-strength = <17100>;
>>>>        };
>>> This solves nothing. It's the same placement.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> OK, it stil be the binding issues.
>> For "^pin-[a-z0-9]+$", I reference to the "pcfg-[a-z0-9-]+$" of
>> rockchip,pinctrl.yaml.
>>
>> My intention is to describe a generic pin configuration, aiming to make
>> the pin
>> description more concise. In actual testing, it proves to be effective.
> Can you instead respond to my actual questions?
>
> Best regards,
> Krzysztof
>

The the last one item of nuvoton,pins is a phandle, which can refer to 
'&pin-default'. The following code of driver pinctrl-ma35.c parse 
"nuvoton,pins", including the node reference by phandle. list = 
of_get_property(np, "nuvoton,pins", &size); size /= sizeof(*list); if 
(!size || size % 4) { dev_err(npctl->dev, "wrong setting!\n"); return 
-EINVAL; } grp->npins = size / 4; grp->pins = devm_kzalloc(npctl->dev, 
grp->npins * sizeof(*grp->pins), GFP_KERNEL); if (!grp->pins) return 
-ENOMEM; pin = grp->settings = devm_kzalloc(npctl->dev, grp->npins * 
sizeof(*grp->settings), GFP_KERNEL); if (!grp->settings) return -ENOMEM; 
for (i = 0, j = 0; i < size; i += 4, j++) { struct device_node 
*np_config; const __be32 *phandle; pin->offset = be32_to_cpu(*list++) * 
MA35_MFP_REG_SZ_PER_BANK + MA35_MFP_REG_BASE; pin->shift = 
(be32_to_cpu(*list++) * MA35_MFP_BITS_PER_PORT) % 32; pin->muxval = 
be32_to_cpu(*list++); phandle = list++; if (!phandle) return -EINVAL; 
np_config = of_find_node_by_phandle(be32_to_cpup(phandle)); ret = 
pinconf_generic_parse_dt_config(np_config, NULL, &pin->configs, 
&pin->nconfigs); if (ret) return ret; grp->pins[j] = 
npctl->info->get_pin_num(pin->offset, pin->shift); pin++; } Best 
Regards, Jacky Huang

