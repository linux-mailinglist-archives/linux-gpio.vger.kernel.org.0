Return-Path: <linux-gpio+bounces-11337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573699E013
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D980A281BE8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5E118BC21;
	Tue, 15 Oct 2024 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv1YQk3i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C91AF4EE;
	Tue, 15 Oct 2024 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979203; cv=none; b=dYyIc6MqnsQCRRghQ6bOCxGYy76hSkus+EerPpiP3n1IPLkJbIz39An4xWb2iWBu7nc5EfrQHNSFnUiRL2y4hbaWjWWndDgcsfE2tv1xWjoTvXhIA0sbqUWzTouAzidwwcbCec070gXwomwILfQShOK0MS0LaH1mZC67h5Re6V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979203; c=relaxed/simple;
	bh=rL++ewozoXto81Yc1rbqAgf54mHr09dluoYtOFAcW5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YH9OcBboF+IMt9Cs8lBJqsadbAhLtOVscbiY5I8uF6DYTk1UKXuCdPF+O4vsvEuno6YYLJRsDmNGKRnsr7qjklj53QlRehQGb/dMdK7RRiiYcYwzIGErbtNHcSR7lsw27wu2AYdnW3IqAi8XtNAOJzZ1NDQsUnKCVtzgvM8LfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv1YQk3i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97E5C4CEC7;
	Tue, 15 Oct 2024 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728979202;
	bh=rL++ewozoXto81Yc1rbqAgf54mHr09dluoYtOFAcW5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bv1YQk3iD1eSxJHZHi8RXPgJZCFbvJhEW8fBDGP/ZF1uVphUH3yd/OxIGGs/fTOun
	 Co6g46kVVCw0DbHrATa/ke2QdsdMdf4XxaUa24x71/0A5qKZN8TBnA/1bVJyUmK3Fc
	 c1lS/iS31DPP0CTrbt3JPq3Oz5wo1sZGIaube9+aeQw8q4U7YOWyzQ8HsDHRLpKHRT
	 aIE7mUUve1+KZCyjGJiAUAyX2p9uVk6SoHTr2PuGT5u+NYUo2qMoCOAXRxpWxK8CUc
	 HdQXaeXuxxuNMqlgLcfUE8SnRqonasE3eT7znNdm0EXJhyR2sVWRRBEElQvSHNPO2r
	 f7UOOx0En1ROQ==
Message-ID: <9c7f0c20-aafe-45b2-aa3e-c2c21e3a5b71@kernel.org>
Date: Tue, 15 Oct 2024 09:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-2-3e74a65c285e@amlogic.com>
 <aju3dgugbmj52i74j7csyuwejczsvk4sxtsdzuq62jutq7jxbe@wbc7fveloxv2>
 <1c054eb4-9ac1-4965-8847-d851b9fb1131@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <1c054eb4-9ac1-4965-8847-d851b9fb1131@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2024 09:54, Xianwei Zhao wrote:
> Hi Krzysztof,
>      Thanks for your reply.
> 
> On 2024/10/15 14:01, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Mon, Oct 14, 2024 at 05:05:52PM +0800, Xianwei Zhao wrote:
>>> Add a new pinctrl driver for Amlogic A4 SoCs which share
>>> the same register layout as the previous Amlogic S4.
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   drivers/pinctrl/meson/Kconfig              |    6 +
>>>   drivers/pinctrl/meson/Makefile             |    1 +
>>>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1176 ++++++++++++++++++++++++++++
>>>   3 files changed, 1183 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
>>> index cc397896762c..3e90bb5ec442 100644
>>> --- a/drivers/pinctrl/meson/Kconfig
>>> +++ b/drivers/pinctrl/meson/Kconfig
>>> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
>>>        select PINCTRL_MESON_AXG_PMX
>>>        default y
>>>
>>> +config PINCTRL_AMLOGIC_A4
>>> +     tristate "Amlogic A4 SoC pinctrl driver"
>>> +     depends on ARM64
>>> +     select PINCTRL_MESON_AXG_PMX
>>> +     default y
>>> +
>>>   config PINCTRL_AMLOGIC_C3
>>>        tristate "Amlogic C3 SoC pinctrl driver"
>>>        depends on ARM64
>>> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
>>> index 9e538b9ffb9b..c92a65a83344 100644
>>> --- a/drivers/pinctrl/meson/Makefile
>>> +++ b/drivers/pinctrl/meson/Makefile
>>> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) += pinctrl-meson-axg.o
>>>   obj-$(CONFIG_PINCTRL_MESON_G12A) += pinctrl-meson-g12a.o
>>>   obj-$(CONFIG_PINCTRL_MESON_A1) += pinctrl-meson-a1.o
>>>   obj-$(CONFIG_PINCTRL_MESON_S4) += pinctrl-meson-s4.o
>>> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) += pinctrl-amlogic-a4.o
>>>   obj-$(CONFIG_PINCTRL_AMLOGIC_C3) += pinctrl-amlogic-c3.o
>>>   obj-$(CONFIG_PINCTRL_AMLOGIC_T7) += pinctrl-amlogic-t7.o
>>> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>>> new file mode 100644
>>> index 000000000000..dee1ae43edb5
>>> --- /dev/null
>>> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>>> @@ -0,0 +1,1176 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>> +/*
>>> + * Pin controller and GPIO driver for Amlogic A4 SoC.
>>> + *
>>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> + *         Huqiang Qin <huqiang.qin@amlogic.com>
>>> + */
>>> +
>>> +#include <dt-bindings/gpio/amlogic-a4-gpio.h>
>>
>> I do not see any usage of it.
>>
> 
> The header file "amlogic-a4-gpio.h"  is used by AMLOGIC_PIN and 
> GPIO_GROUP_V2, The code used  is  AMLOGIC_GPIO().
> This is binding definition.

Then all other defines are not used. AMLOGIC_GPIO is not used by DTS, so
how is that a binding? Don't stuff random defines into the bindings.

Best regards,
Krzysztof


