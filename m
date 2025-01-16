Return-Path: <linux-gpio+bounces-14863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C47A137AC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 11:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5D31887003
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 10:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25E81DA60B;
	Thu, 16 Jan 2025 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q74jZqpO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEFF142E7C;
	Thu, 16 Jan 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022818; cv=none; b=l9q8X3/H/YReaGEI8FC9zB4nPnWZcUIInmUfl0b0UoUP2fQxHEHnB8EVQQmo43DZXhODeap9H2nSSna0Ex6gAfZ8GvEcr0bxrxsSO5nfD1lm8BfbegbPffza8E6w0tFQ9EYCii4//Aw+3xK+qeRrVh2r83iOV842pP2KEgY26pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022818; c=relaxed/simple;
	bh=qqJpTXUP3GhZ0W/fxsUBOFjIJ8kNite2YItXfgc9pgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZ8/UhquzlCb0XpUTU6UlpNY4WfOOdadD2pAskeOjnibeN30fyM1AiUEkWqTBDlpf61zmhoG8ilok94IbSNTG2XS5tri5WIo//xj4qoxVBeYd1WXR/HB0+yyHLPUmmbohfxxfd8RdRys7eZQ+QwrCQ4uYEhKzEJNKOTsrSww9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q74jZqpO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F083DC4CED6;
	Thu, 16 Jan 2025 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737022817;
	bh=qqJpTXUP3GhZ0W/fxsUBOFjIJ8kNite2YItXfgc9pgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q74jZqpO7BdxmoOsraDvrDdRdxNZ6USgpsfyXkP36HbFERv2Ce1WYgvJNtE1Vltij
	 /XQH1asFFuKpcYnyZsrhbf63iVwuMPCqf0CN/bQ9Z4kY4+4AAfOyfb7LY1VCVr3qdL
	 CDCyKVIUw6jOS+7/5BAMTY1BFaxKtvGUNKdFZg4NQyxnM946ggQI76Z4g+4amLa7EU
	 uv4sJhp7sHebnPhvWVShD1KH0NG3VbcTY+tiQBtOMjKZaLJMVk/kUkHDgbm9glKCo6
	 MUokw9X++gicc3ie17pRq26I5uz5+BjYeWz9XxSqeMhMM0F5ExEwdS1FBPI6i0sDVE
	 KCNJbrw9CtaHQ==
Message-ID: <b212d05d-de3b-41b2-bc48-c6b79ae54a8b@kernel.org>
Date: Thu, 16 Jan 2025 11:20:09 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
To: =?UTF-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 =?UTF-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "sean.wang@kernel.org" <sean.wang@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
 <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
 <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2025 09:18, Cathy Xu (许华婷) wrote:
> On Thu, 2025-01-16 at 08:28 +0100, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 16/01/2025 03:20, Cathy Xu (许华婷) wrote:
>>>>> +          bias-pull-down:
>>>>> +            oneOf:
>>>>> +              - type: boolean
>>>>> +              - enum: [100, 101, 102, 103]
>>>>> +                description: mt8196 pull down PUPD/R0/R1 type
>>>>> define value.
>>>>> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
>>>>> +                description: mt8196 pull down RSEL type define
>>>>> value.
>>>>
>>>> Not much improved.
>>>
>>>   I have removed the content related to 'resistance value', we use
>>> 'RSEL' instead of 'resistance value'.
>>
>> So the value in Ohms was removed? I assume above do not have known
>> value
>> in Ohms?
> 
>   Yes, value in Ohns was removed, no code have knowm value.

Does the hardware have known value in Ohms?


> 
>>
>>>
>>>>
>>>>
>>>>> +            description: |
>>>>> +              For pull down type is normal, it doesn't need
>>>>> add
>>>>> RSEL & R1R0.
>>>>> +              For pull down type is PUPD/R0/R1 type, it can
>>>>> add
>>>>> R1R0 define to
>>>>> +              set different resistance. It can support
>>>>> "MTK_PUPD_SET_R1R0_00" &
>>>>> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10"
>>>>> &
>>>>> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
>>>>> +              For pull down type is PD/RSEL, it can add RSEL
>>>>> define to set
>>>>> +              different resistance. It can support
>>>>> +              "MTK_PULL_SET_RSEL_000" &
>>>>> "MTK_PULL_SET_RSEL_001" &
>>>>> +              "MTK_PULL_SET_RSEL_010" &
>>>>> "MTK_PULL_SET_RSEL_011" &
>>>>> +              "MTK_PULL_SET_RSEL_100" &
>>>>> "MTK_PULL_SET_RSEL_101" &
>>>>> +              "MTK_PULL_SET_RSEL_110" &
>>>>> "MTK_PULL_SET_RSEL_111"
>>>>> define in
>>>>> +              mt8196.
>>>>> diff --git a/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>>>> b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>>>> new file mode 100644
>>>>> index 000000000000..bf0c8374407c
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>>>> @@ -0,0 +1,1572 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>>>> +/*
>>>>> + * Copyright (C) 2025 Mediatek Inc.
>>>>> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
>>>>> + */
>>>>> +
>>>>> +#ifndef __MT8196_PINFUNC_H
>>>>> +#define __MT8196_PINFUNC_H
>>>>> +
>>>>> +#include <dt-bindings/pinctrl/mt65xx.h>
>>>>> +
>>>>> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
>>>>> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
>>>>> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
>>>>> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
>>>>> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
>>>>> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)
>>>>
>>>> I do not see how you resolved my comment from v1. In v2 I
>>>> reminded
>>>> about
>>>> it, so you responded that yopu will change something, but I do
>>>> not
>>>> see
>>>> any changes.
>>>>
>>>> So explain: how did you resolve my comment?
>>>>
>>>> These two examples where you claim you will change something, but
>>>> send
>>>> the same. I skipped the rest of the patch.
>>>
>>>   Thank you for your patient response, here is my explanation for
>>> you
>>> question:
>>>
>>>   In v1, I undertand that you meant I didn't sent a real binding,
>>> and
>>
>>
>> The comment is under specific lines, so I said these defines are not
>> a
>> real binding. You sent them again, but they are still not bindings,
>> because they are not used in the driver. Maybe the usage is
>> convoluted,
>> so which part of implementation are these connecting with DTS? IOW,
>> which part of driver relies on the binding?
> 
>   I got you. This binding define many macros, which will be used for
> 'pinmux' setting in the DTS. The usage like this:
> 
>   adsp_uart_pins: adsp-uart-pins {
>                 pins-tx-rx {
>                         pinmux = <PINMUX_GPIO35__FUNC_O_ADSP_UTXD0>,
>                                  <PINMUX_GPIO36__FUNC_I1_ADSP_URXD0>;
>                 };
>         };


That's DTS, not driver, so not a binding. Drop the header from bindings.


Best regards,
Krzysztof

