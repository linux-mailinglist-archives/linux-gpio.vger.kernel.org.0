Return-Path: <linux-gpio+bounces-14712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13BA0B80A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 14:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A893A4F4C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 13:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A3D1A29A;
	Mon, 13 Jan 2025 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PjLU69Ra"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A2022CF31;
	Mon, 13 Jan 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774460; cv=none; b=EqCApcmJEZrHTzlL68iufXPftKc1wzpkWOJC+Z9mrk2UGhhjp/sKIjnzob0Ujvhg5SqwifbS3iUXkjcEMg1uecQEKw24fxWLx7uzJyXNSsYZkXXtYG1CVjHo61sB7ngwApISGlPi7M61g9ncmu09MiF/qdUAO8ox5lphIbyvo7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774460; c=relaxed/simple;
	bh=22Vhv7yDpoIIO9QZJmXGVQZPynnp6QNPf2YUTj++1xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmZIc4jeETzZC0Kc8si68//WsxTXVw3NH+gF/Dbw4pHGZApL8Z6aQHZ4mNNGxDLgAgyjzCh3Ac9SZuqSGunxoqyotzfkUTlMAP9mcuKhczUQqsTGbhih0HPNAcTEkicKoJ0UwhxYwdN3xsiplB8vzg3JW0bqZsefaz3u9dF0zcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PjLU69Ra; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736774455;
	bh=22Vhv7yDpoIIO9QZJmXGVQZPynnp6QNPf2YUTj++1xg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PjLU69RaepD7xUbmVYwxw9S9Tez+FlQrXUSVLditygrYflSpkULyPOkO97FpOnBJc
	 uNPci/lRLeVrcVkvtvEe1RHT6P1LqCbD5HJd2D/hgcZMpv7EZ4+3EC+e9dr4APFDPg
	 vR6Ko+m05oojBRgO821AeQRyQ8C6ueV6xKAI9DXl9ceWBZHyUUMYxdwRWYgbMMh5hG
	 CNS6qtms+HNa4skOHcIITbMlCLB9V4D4RbSrTGKGxFrDF+IxI98B+k9LNEeLCqB9cc
	 qikuFWd0kyC5HiC1mrK1UxUFwwoUuz3FkidNThopl7pPzHrDYUIdVD9Zo+TqFwKkn2
	 X+9mXiVlcFsVg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF86E17E0CDE;
	Mon, 13 Jan 2025 14:20:54 +0100 (CET)
Message-ID: <66218a3c-04c5-42ea-ba9c-e0fbc72ed16f@collabora.com>
Date: Mon, 13 Jan 2025 14:20:54 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
To: Krzysztof Kozlowski <krzk@kernel.org>, Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>,
 wenbin.mei@mediatek.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20250110104703.13625-1-ot_cathy.xu@mediatek.com>
 <20250110104703.13625-2-ot_cathy.xu@mediatek.com>
 <dnjtaapqbn6zy55k5ky7zltswkbg7cjh2xwlnrmqdiz7tfm6rc@wbepc5koem6e>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <dnjtaapqbn6zy55k5ky7zltswkbg7cjh2xwlnrmqdiz7tfm6rc@wbepc5koem6e>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/01/25 10:41, Krzysztof Kozlowski ha scritto:
> On Fri, Jan 10, 2025 at 06:42:28PM +0800, Cathy Xu wrote:
>> 1.Add pinctrl file on MediaTek mt8196.
> 
> Where? What is pinctrl file?
> 
>> 2.Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Look at git history how commit msgs are written for such changes.
> 
>>
>> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
>> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
>> ---
>>   .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  266 +++
>>   include/dt-bindings/pinctrl/mt8196-pinfunc.h  | 1572 +++++++++++++++++
>>   2 files changed, 1838 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
>>   create mode 100644 include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..abeb0d942cc4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
>> @@ -0,0 +1,266 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8196-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT8196 Pin Controller
>> +
>> +maintainers:
>> +  - Lei Xue <lei.xue@mediatek.com>
>> +  - Cathy Xu <ot_cathy.xu@mediatek.com>
>> +
>> +description:
>> +  The MediaTek's MT8196 Pin controller is used to control SoC pins.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8196-pinctrl
>> +
>> +  gpio-controller: true
>> +
>> +  '#gpio-cells':
>> +    description:
>> +      Number of cells in GPIO specifier, should be two. The first cell is the
>> +      pin number, the second cell is used to specify optional parameters which
>> +      are defined in <dt-bindings/gpio/gpio.h>.
>> +    const: 2
>> +
>> +  gpio-ranges:
>> +    maxItems: 1
>> +
>> +  gpio-line-names: true
>> +
>> +  reg:
>> +    items:
>> +      - description: gpio registers base address
>> +      - description: rt group io configuration registers base address
>> +      - description: rm1 group io configuration registers base address
>> +      - description: rm2 group io configuration registers base address
>> +      - description: rb group io configuration registers base address
>> +      - description: bm1 group io configuration registers base address
>> +      - description: bm2 group io configuration registers base address
>> +      - description: bm3 group io configuration registers base address
>> +      - description: lt group io configuration registers base address
>> +      - description: lm1 group io configuration registers base address
>> +      - description: lm2 group io configuration registers base address
>> +      - description: lb1 group io configuration registers base address
>> +      - description: lb2 group io configuration registers base address
>> +      - description: tm1 group io configuration registers base address
>> +      - description: tm2 group io configuration registers base address
>> +      - description: tm3 group io configuration registers base address
>> +
>> +  reg-names:
>> +    items:
>> +      - const: iocfg0
>> +      - const: iocfg_rt
>> +      - const: iocfg_rm1
>> +      - const: iocfg_rm2
>> +      - const: iocfg_rb
>> +      - const: iocfg_bm1
>> +      - const: iocfg_bm2
>> +      - const: iocfg_bm3
>> +      - const: iocfg_lt
>> +      - const: iocfg_lm1
>> +      - const: iocfg_lm2
>> +      - const: iocfg_lb1
>> +      - const: iocfg_lb2
>> +      - const: iocfg_tm1
>> +      - const: iocfg_tm2
>> +      - const: iocfg_tm3
> 
> Are you sure these are separate address spaces?
> 

Those are different partitions of the GPIO controller, of which, each one does
provide full control and different functions that are partition-global and not
controller-global.

So, I can confirm that these are indeed separate address spaces - this is right.

>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +
>> +  interrupts:
>> +    description: The interrupt outputs to sysirq.
>> +    maxItems: 1
>> +
>> +  mediatek,rsel-resistance-in-si-unit:
>> +    type: boolean
>> +    description:
>> +      We provide two methods to select the resistance for I2C when pull up or
>> +      pull down. The first is by RSEL definition value, another one is by
>> +      resistance value(ohm). This flag is used to identify if the method is
>> +      resistance(si unit) value.
> 
> What is the point of choosing it? This is one hardware, one SoC, so how
> different boards can have different units? No, just use Ohms
> 

That's legacy from when the paris driver didn't specify the RSEL in ohms, and I
agree about deprecating that property and making it a default.

Cathy, please add a `has_legacy_rsel` boolean in the platform data and assign that
to true in *all* MediaTek pinctrl drivers that are not MT8196, then in
pinctrl-paris:

if (hw->soc->has_legacy_rsel)
	hw->rsel_si_unit = of_property_read_bool(....)
else
	hw->rsel_si_unit = true;

That way we can finally drop this property from drivers for new SoCs, including
the one for MT8196.

>> +
>> +# PIN CONFIGURATION NODES
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    patternProperties:
>> +      '^pins':
>> +        type: object
>> +        $ref: /schemas/pinctrl/pincfg-node.yaml
>> +        additionalProperties: false
>> +        description:
>> +          A pinctrl node should contain at least one subnode representing the
>> +          pinctrl groups available on the machine. Each subnode will list the
>> +          pins it needs, and how they should be configured, with regard to muxer
>> +          configuration, pullups, drive strength, input enable/disable and input
>> +          schmitt.
>> +
>> +        properties:
>> +          pinmux:
>> +            description:
>> +              Integer array, represents gpio pin number and mux setting.
>> +              Supported pin number and mux varies for different SoCs, and are
>> +              defined as macros in dt-bindings/pinctrl/mt8196-pinfunc.h
>> +              directly, for this SoC.
>> +
>> +          drive-strength:
>> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
>> +
>> +          drive-strength-microamp:
>> +            enum: [125, 250, 500, 1000]
> 
> Why duplicating properties? No, use only one.
> 

The problem here is not entirely about duplicating properties, and I'm not
sure that the reason is actually acceptable (but being this a special case
the `description` field would be mandatory to have IMO!!).

So, the reason for this separation is that the drive-strength-microamp does
activate a special feature in the controller called "advanced drive strength
mode", which is switching to different shunts that will decrease the power
efficiency of the chip (by an ignorable amount, if that's one pin - but if
that goes to something like 100 pins, it's not ignorable anymore).

I'd be happy if we could let them retain both properties after putting a
clear description of what's happening and why there are two of them.

>> +
>> +          bias-pull-down:
>> +            oneOf:
>> +              - type: boolean
>> +              - enum: [100, 101, 102, 103]
>> +                description: mt8196 pull down PUPD/R0/R1 type define value.
>> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
>> +                description: mt8196 pull down RSEL type define value.

These two must go away, RSEL shall be defined in Ohms unit in DTs/bindings.

>> +              - enum: [75000, 5000]
>> +                description: mt8196 pull down RSEL type si unit value(ohm).
>> +            description: |
>> +              For pull down type is normal, it doesn't need add RSEL & R1R0
>> +              define and resistance value.
>> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
>> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
>> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
>> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
>> +              For pull down type is RSEL, it can add RSEL define & resistance
>> +              value(ohm) to set different resistance by identifying property
>> +              "mediatek,rsel-resistance-in-si-unit". It can support
>> +              "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001" &
>> +              "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
>> +              "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" &
>> +              "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111" define in
>> +              mt8196. It can also support resistance value(ohm) "75000" & "5000"
>> +              in mt8196.
>> +
>> +          bias-pull-up:
>> +            oneOf:
>> +              - type: boolean
>> +              - enum: [100, 101, 102, 103]
>> +                description: mt8196 pull up PUPD/R0/R1 type define value.
>> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
>> +                description: mt8196 pull up RSEL type define value.
>> +              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
>> +                description: mt8196 pull up RSEL type si unit value(ohm).
> 
> Same problems.
> 
>> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>> @@ -0,0 +1,1572 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>> +/*
>> + * Copyright (C) 2025 Mediatek Inc.
>> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
>> + */
>> +
>> +#ifndef __MT8196_PINFUNC_H
>> +#define __MT8196_PINFUNC_H
>> +
>> +#include <dt-bindings/pinctrl/mt65xx.h>
>> +
>> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
>> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
>> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
>> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
>> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
>> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)
> 
> You got comment, so respond to it. Sending the same and expecting
> different results is fast way to get a grumpy response.
> 

...and I agree about every other comment from Krzysztof.

Cheers,
Angelo

