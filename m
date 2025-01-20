Return-Path: <linux-gpio+bounces-14944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E968A16C77
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 13:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7951889836
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 12:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1801E0B67;
	Mon, 20 Jan 2025 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="geCnwOdj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4D1DF993;
	Mon, 20 Jan 2025 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737376932; cv=none; b=e1aofXXgz2uuI0ltXIX5Jisl9hxSum1A/1GXIoWVw2kZCku9HXfupaIsL8rOVgP3Hjs/eAAtkb8xIyHLt1x/eM23H2PvbWbBa9aGENZnL9G4hRD7YZcP6ut7RIgkdHeWO5iUlIje+mv4tB3M/zmjVvzpocA5neUOTgj39v+cVis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737376932; c=relaxed/simple;
	bh=4buDT01o+ogkMLuBe/lVOY9SSe5oxu1NeJw/qESAoWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJ0vMqMhiFYEvnAU2Mtpzl6GcGMDP/23aMict9H3n28G7NA055ZlB0w594KnqzcbNfflvUgO6ZU/2k2mT/PBe4W79s5mG3nG2/PgmOaAWoWRKR93vTl/lofdkA9S94+LlHHqi0QaP5OUGuVha/JOKJI9RtV5QdIMvZj1shoMq8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=geCnwOdj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737376928;
	bh=4buDT01o+ogkMLuBe/lVOY9SSe5oxu1NeJw/qESAoWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=geCnwOdjgZ1CvL2aCSZU72KpP7iYX76xdIjm45dgqCiR2nqRUzCFf442ZYJ3i8vmj
	 ADTCelvCDXcwXyeHiY04tqxrRHrDphkMHmK0cdZ2DPYG4GHC+pwDazBRQrU4Ow+1bG
	 qHX3xu38aWVbcFnh42zqPHphrQFEpQNjvkfeuuwXIaaW/3DLxKE+w4S3yUFHDQ+que
	 xFFgtYX+jMZJTJj0cMNVicZd8mZslwCZEMrtPC3oBemDjhANLZ6efVAoPfcDXTH07U
	 Qte/P6404Ye+rvePMwsOlggg7bx6MuZenkUMUlpfnGCxj9lvBePR3oJhBQgKN30KeF
	 jBqFqelOLz31g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CA0A17E0FAA;
	Mon, 20 Jan 2025 13:42:07 +0100 (CET)
Message-ID: <e7d49bda-8aaa-4897-8117-ab889fb27be0@collabora.com>
Date: Mon, 20 Jan 2025 13:42:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
To: =?UTF-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>,
 "krzk@kernel.org" <krzk@kernel.org>
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
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
 <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
 <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
 <b212d05d-de3b-41b2-bc48-c6b79ae54a8b@kernel.org>
 <bec17d1e215a11daa1fdede78c8070c8e1763c72.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <bec17d1e215a11daa1fdede78c8070c8e1763c72.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 20/01/25 10:17, Cathy Xu (许华婷) ha scritto:
> On Thu, 2025-01-16 at 11:20 +0100, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 16/01/2025 09:18, Cathy Xu (许华婷) wrote:
>>> On Thu, 2025-01-16 at 08:28 +0100, Krzysztof Kozlowski wrote:
>>>> External email : Please do not click links or open attachments
>>>> until
>>>> you have verified the sender or the content.
>>>>
>>>>
>>>> On 16/01/2025 03:20, Cathy Xu (许华婷) wrote:
>>>>>>> +          bias-pull-down:
>>>>>>> +            oneOf:
>>>>>>> +              - type: boolean
>>>>>>> +              - enum: [100, 101, 102, 103]
>>>>>>> +                description: mt8196 pull down PUPD/R0/R1
>>>>>>> type
>>>>>>> define value.
>>>>>>> +              - enum: [200, 201, 202, 203, 204, 205, 206,
>>>>>>> 207]
>>>>>>> +                description: mt8196 pull down RSEL type
>>>>>>> define
>>>>>>> value.
>>>>>>
>>>>>> Not much improved.
>>>>>
>>>>>    I have removed the content related to 'resistance value', we
>>>>> use
>>>>> 'RSEL' instead of 'resistance value'.

This is wrong.

>>>>
>>>> So the value in Ohms was removed? I assume above do not have
>>>> known
>>>> value
>>>> in Ohms?
>>>
>>>    Yes, value in Ohns was removed, no code have knowm value.
>>
>> Does the hardware have known value in Ohms?

It does.

> 
>    What do you mean by 'hardware'? When writing to the rsel register,
> the value written is 0-7.
> 

Hardware means "the pin controller of the mt8196 SoC" :-)

Anyway.

The RSEL registers' function is to select a specific resistance value to
pullup/down a pin, or a group of pins.

Devicetree bindings require to specify values in known units, so in device tree
you *need* to specify the RSEL resistance in Ohms.

You cannot specify RSEL register value in device-tree. That's unacceptable.

Regards,
Angelo

>>
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>> +            description: |
>>>>>>> +              For pull down type is normal, it doesn't
>>>>>>> need
>>>>>>> add
>>>>>>> RSEL & R1R0.
>>>>>>> +              For pull down type is PUPD/R0/R1 type, it
>>>>>>> can
>>>>>>> add
>>>>>>> R1R0 define to
>>>>>>> +              set different resistance. It can support
>>>>>>> "MTK_PUPD_SET_R1R0_00" &
>>>>>>> +              "MTK_PUPD_SET_R1R0_01" &
>>>>>>> "MTK_PUPD_SET_R1R0_10"
>>>>>>> &
>>>>>>> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
>>>>>>> +              For pull down type is PD/RSEL, it can add
>>>>>>> RSEL
>>>>>>> define to set
>>>>>>> +              different resistance. It can support
>>>>>>> +              "MTK_PULL_SET_RSEL_000" &
>>>>>>> "MTK_PULL_SET_RSEL_001" &
>>>>>>> +              "MTK_PULL_SET_RSEL_010" &
>>>>>>> "MTK_PULL_SET_RSEL_011" &
>>>>>>> +              "MTK_PULL_SET_RSEL_100" &
>>>>>>> "MTK_PULL_SET_RSEL_101" &
>>>>>>> +              "MTK_PULL_SET_RSEL_110" &
>>>>>>> "MTK_PULL_SET_RSEL_111"
>>>>>>> define in
>>>>>>> +              mt8196.
>>>>>>> diff --git a/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>>>>>> b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..bf0c8374407c
>>>>>>> --- /dev/null
>>>>>>> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>>>>>> @@ -0,0 +1,1572 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>>>> */
>>>>>>> +/*
>>>>>>> + * Copyright (C) 2025 Mediatek Inc.
>>>>>>> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
>>>>>>> + */
>>>>>>> +
>>>>>>> +#ifndef __MT8196_PINFUNC_H
>>>>>>> +#define __MT8196_PINFUNC_H
>>>>>>> +
>>>>>>> +#include <dt-bindings/pinctrl/mt65xx.h>
>>>>>>> +
>>>>>>> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
>>>>>>> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
>>>>>>> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
>>>>>>> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) |
>>>>>>> 4)
>>>>>>> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) |
>>>>>>> 5)
>>>>>>> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) |
>>>>>>> 6)
>>>>>>
>>>>>> I do not see how you resolved my comment from v1. In v2 I
>>>>>> reminded
>>>>>> about
>>>>>> it, so you responded that yopu will change something, but I
>>>>>> do
>>>>>> not
>>>>>> see
>>>>>> any changes.
>>>>>>
>>>>>> So explain: how did you resolve my comment?
>>>>>>
>>>>>> These two examples where you claim you will change something,
>>>>>> but
>>>>>> send
>>>>>> the same. I skipped the rest of the patch.
>>>>>
>>>>>    Thank you for your patient response, here is my explanation
>>>>> for
>>>>> you
>>>>> question:
>>>>>
>>>>>    In v1, I undertand that you meant I didn't sent a real
>>>>> binding,
>>>>> and
>>>>
>>>>
>>>> The comment is under specific lines, so I said these defines are
>>>> not
>>>> a
>>>> real binding. You sent them again, but they are still not
>>>> bindings,
>>>> because they are not used in the driver. Maybe the usage is
>>>> convoluted,
>>>> so which part of implementation are these connecting with DTS?
>>>> IOW,
>>>> which part of driver relies on the binding?
>>>
>>>    I got you. This binding define many macros, which will be used
>>> for
>>> 'pinmux' setting in the DTS. The usage like this:
>>>
>>>    adsp_uart_pins: adsp-uart-pins {
>>>                  pins-tx-rx {
>>>                          pinmux =
>>> <PINMUX_GPIO35__FUNC_O_ADSP_UTXD0>,
>>>                                   <PINMUX_GPIO36__FUNC_I1_ADSP_URXD0
>>>> ;
>>>                  };
>>>          };
>>
>>
>> That's DTS, not driver, so not a binding. Drop the header from
>> bindings.
> 
>    Sorry, I don't quite understand the relationship between binding and
> driver. Driver will parse this macro to get gpio number and function.
> 

