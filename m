Return-Path: <linux-gpio+bounces-14857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C7AA133ED
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 08:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED26C16791A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 07:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5ACE194A67;
	Thu, 16 Jan 2025 07:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSVVfmGe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4DE24A7E8;
	Thu, 16 Jan 2025 07:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012545; cv=none; b=Dp5qWjSCZQBgNxa3WQbDrC/A9/7s9gQL2PbXLD3VhUX0UFR0FaHrISMHcF51dKKCTcEu9r9b/Rbv3Ess9KEaA06iAShVsXDQRO0wlUEhlK69X5bwEJbsUkauDMF3Pcit6D5hAhxiEMPOHpqZcybU2kClbkl2T+CHZlbyQgcAD90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012545; c=relaxed/simple;
	bh=I80ogNUmSoIctG6ONpKiNo6HZ4UauiCnTHsIxxGNjNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2zOaroR8XYvw6Rl6PIi88/x+JuOr7AP5Ur7GFY+9NsWSBTKJMNtyOOSwdHNUQSKvwg0Sxq4K7rdFaAzhsYDBS65KO7tG2MKnreO0OXeqNXXggg+yoIPos0VRL8iO3NQS9N/54ZJpFCU7B8q9KJIbZUOhAyBqJIUasGt4YScwdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSVVfmGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8831DC4CED6;
	Thu, 16 Jan 2025 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737012545;
	bh=I80ogNUmSoIctG6ONpKiNo6HZ4UauiCnTHsIxxGNjNM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DSVVfmGeGo50uvx1iR1+zuD4GZH/KUEs3SnyVF2/ETu7ac8C0OjvfVVA8d2BMV0d2
	 fpjfDDcWO8Ste7vrxmabwbjy5PdPDgQxEqUCJ9GnYCwykhUwM37tsXQtPJWDv8zlUA
	 8SIdnXUGvOUEX2048h4kYIqG4zzfRYPsH0dBWYOfg/DAXWiu60PEeifpAg2aHGkuso
	 lOTEwUfOgLw8agZp331WibpK5NEG56FAXbMRR1sBkbiGr9V5ZuC40S+2aYaALlMroH
	 Fnjfz7HhiuDHCwjNYEmXW28OZOwa3nhjpvped0ECXkiEArziIYNZfTPnvaSuJQ2/bb
	 ipvysAZo/ZMSg==
Message-ID: <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
Date: Thu, 16 Jan 2025 08:28:58 +0100
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
 =?UTF-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2025 03:20, Cathy Xu (许华婷) wrote:
>>> +          bias-pull-down:
>>> +            oneOf:
>>> +              - type: boolean
>>> +              - enum: [100, 101, 102, 103]
>>> +                description: mt8196 pull down PUPD/R0/R1 type
>>> define value.
>>> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
>>> +                description: mt8196 pull down RSEL type define
>>> value.
>>
>> Not much improved.
>   I have removed the content related to 'resistance value', we use
> 'RSEL' instead of 'resistance value'.

So the value in Ohms was removed? I assume above do not have known value
in Ohms?

> 
>>
>>
>>> +            description: |
>>> +              For pull down type is normal, it doesn't need add
>>> RSEL & R1R0.
>>> +              For pull down type is PUPD/R0/R1 type, it can add
>>> R1R0 define to
>>> +              set different resistance. It can support
>>> "MTK_PUPD_SET_R1R0_00" &
>>> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
>>> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
>>> +              For pull down type is PD/RSEL, it can add RSEL
>>> define to set
>>> +              different resistance. It can support
>>> +              "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001" &
>>> +              "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
>>> +              "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" &
>>> +              "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
>>> define in
>>> +              mt8196.
>>> diff --git a/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>> b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>> new file mode 100644
>>> index 000000000000..bf0c8374407c
>>> --- /dev/null
>>> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
>>> @@ -0,0 +1,1572 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>> +/*
>>> + * Copyright (C) 2025 Mediatek Inc.
>>> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
>>> + */
>>> +
>>> +#ifndef __MT8196_PINFUNC_H
>>> +#define __MT8196_PINFUNC_H
>>> +
>>> +#include <dt-bindings/pinctrl/mt65xx.h>
>>> +
>>> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
>>> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
>>> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
>>> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
>>> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
>>> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)
>>
>> I do not see how you resolved my comment from v1. In v2 I reminded
>> about
>> it, so you responded that yopu will change something, but I do not
>> see
>> any changes.
>>
>> So explain: how did you resolve my comment?
>>
>> These two examples where you claim you will change something, but
>> send
>> the same. I skipped the rest of the patch.
> 
>   Thank you for your patient response, here is my explanation for you
> question:
> 
>   In v1, I undertand that you meant I didn't sent a real binding, and


The comment is under specific lines, so I said these defines are not a
real binding. You sent them again, but they are still not bindings,
because they are not used in the driver. Maybe the usage is convoluted,
so which part of implementation are these connecting with DTS? IOW,
which part of driver relies on the binding?



> the bindings should be separated from driver. In addition, I should
> run scripts/checkpatch.pl and scripts/get_maintainers.pl. So in v2, I
> sent a real binding(mediatek,mt8196-pinctrl.yaml), and sent two
> separate patches, one for driver and one for bindings, also ran
> scripts/get_maintainers.pl get necessary people and sent to them.
> 
>   In v2, I understand that I need refer to git history to modify the
> commit msgs, so I made the changes in v3. Then you asked me about the
> difference between 'RSEL' and 'resistance value'. I replied that the
> 'resistance value' method is no longer use, so in v3, I removed all
> content about it(include entire 'rsel-resistance-in-si-unit' property
> and the parts mentioned in bias-pull-up/down).

Yes, thank you this I saw, the comments appear under specific places, so
only these places are discussed.



Best regards,
Krzysztof

