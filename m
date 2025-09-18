Return-Path: <linux-gpio+bounces-25187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C48B3B6DA
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 11:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 724F41C23D25
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 09:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4463303C91;
	Fri, 29 Aug 2025 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVV01k+w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636452FE06B;
	Fri, 29 Aug 2025 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458970; cv=none; b=kd/ZXf/P98N5hoqESPVU5smSHvo/kB/iehMDdZdiXoDbOA5KIHSTdEWJSAl0n/FsnhuBqR43um35AMeHpTDo2+HmnxXw16EGcj2jJ+0DvKnN9cX6KmR6ZZINV5ichsAbo0wWjujy6WBi2IWMh6h1VZbHHQRUdpr+puWbIG9Pw20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458970; c=relaxed/simple;
	bh=UNbnxLyQqtgjYolstb23lpIvcWuMg/oYLAEbNfpM3sA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqWJadAbqq7bxWGVs4eLXAuBzPoiixCTsmrOIkIrHnAqyuG65x4BoVHAShoX8DPLgjK6hwMbUSG7YBQ+FAPX/w7yslxZeZ7DpbQnvXFffxwqz0nxyLzVoCzSG5tLgVoysGIc+/SSvASyLNNLRmH3CxaE+7KeAGuuP27h9qWwT14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVV01k+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE4FC4CEFB;
	Fri, 29 Aug 2025 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458970;
	bh=UNbnxLyQqtgjYolstb23lpIvcWuMg/oYLAEbNfpM3sA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UVV01k+wUDjQytZyC317riPX3ZY95mPuYL30zH90vRVC8nIUI9ulSp48R0iT8qqVx
	 I4p3ByfFNrZ5StjBkULCl8LFWAzf8WoAu60OiBE27d6SnAxc9dD9sPFyLtPHHZUzgy
	 UuTOcHkDAf8O0YB/0tN+YXEad+sdssI9mDj5I06Btq10Km7255Ar2J/k+oqODFGC8j
	 jtKa0rZV0LXXRKMX5wzruQlNef8sMMFVHr05qCC9tAuDSM8JYjYmZA7y1HcO+Bw8VT
	 Po4sgrP07ufDUoNs6wIF3uUGm1c1Mu0Cb1rB13dg6gZvoK7dswTFjhs6Ul5XwkFw6J
	 BWi7hIRqkfR3Q==
Message-ID: <c314b7c6-f5b7-4f3e-8d67-e3c92ff8ff37@kernel.org>
Date: Fri, 29 Aug 2025 11:16:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
 <f21e27da-de26-4835-9660-b39e99695281@csgroup.eu>
 <0f716362-07f4-4c79-bb0a-e71d2630a797@kernel.org>
 <1ba37df7-2d4a-4258-8220-58ee7d609264@csgroup.eu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1ba37df7-2d4a-4258-8220-58ee7d609264@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2025 10:35, Christophe Leroy wrote:
> 
> 
> Le 29/08/2025 à 09:47, Krzysztof Kozlowski a écrit :
>> On 28/08/2025 16:12, Christophe Leroy wrote:
>>>
>>>
>>> Le 28/08/2025 à 15:28, Rob Herring a écrit :
>>>> On Mon, Aug 25, 2025 at 2:20 AM Christophe Leroy
>>>> <christophe.leroy@csgroup.eu> wrote:
>>>>>
>>>>> In the QE, a few GPIOs are IRQ capable. Similarly to
>>>>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>>>>> GPIO"), add IRQ support to QE GPIO.
>>>>>
>>>>> Add property 'fsl,qe-gpio-irq-mask' similar to
>>>>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>>>
>>>> Why do you need to know this? The ones that have interrupts will be
>>>> referenced by an 'interrupts' property somewhere.
>>>
>>> I don't follow you. The ones that have interrupts need to be reported by
>>> gc->qe_gpio_to_irq[] so that gpiod_to_irq() return the IRQ number, for
>>> instance to gpio_sysfs_request_irq() so that it can install an irq
>>> handler. I can't see where they would be referenced by an "interrupts"
>>> property.
>>
>> They would be referenced by every consumer of these interrupts. IOW,
>> this property is completely redundant, because DT holds this information
>> already in other place.
> 
> But the gpio controller _is_ the consumer of these interrupts, it it 
> _not_ the provider.
> 
> The interrupts are provided by a separate interrupt controller. Let's 
> take the exemple of powerpc 8xx. Here is the list of interrupts handled 
> by the CPM interrupt controller on the 8xx:
> 
> 1 - GPIO Port C Line 4 interrupt
> 2 - GPIO Port C Line 5 interrupt
> 3 - SMC2 Serial controller interrupt
> 4 - SMC1 Serial controller interrupt
> 5 - SPI controller interrupt
> 6 - GPIO Port C Line 6 interrupt
> 7 - Timer 4 interrupt
> 8 - SCCd Serial controller interrupt
> 9 - GPIO Port C Line 7 interrupt
> 10 - GPIO Port C Line 8 interrupt
> 11 - GPIO Port C Line 9 interrupt
> 12 - Timer 3 interrupt
> 13 - SCCc Serial controller interrupt
> 14 - GPIO Port C Line 10 interrupt
> 15 - GPIO Port C Line 11 interrupt
> 16 - I2C Controller interrupt
> 17 - RISC timer table interrupt
> 18 - Timer 2 interrupt
> 19 - SCCb Serial controller interrupt
> 20 - IDMA2 interrupt
> 21 - IDMA1 interrupt
> 22 - SDMA channel bus error interrupt
> 23 - GPIO Port C Line 12 interrupt
> 24 - GPIO Port C Line 13 interrupt
> 25 - Timer 1 interrupt
> 26 - GPIO Port C Line 14 interrupt
> 27 - SCCd Serial controller interrupt
> 28 - SCCc Serial controller interrupt
> 29 - SCCb Serial controller interrupt
> 30 - SCCa Serial controller interrupt
> 31 - GPIO Port C Line 15 interrupt

That list is fixed per soc/device, so already implied by compatible.

> 
> As you can see in the list, the GPIO line interrupts are nested with 
> other types of interrupts so GPIO controller and Interrupt controller 
> are to be keept independant.
> 
> That's more or less the same here with my series, patch 1 implements an 
> interrupt controller (documented in patch 6) and then the GPIO 
> controllers consume the interrupts, for instance in gpiolib functions 
> gpio_sysfs_request_irq() [drivers/gpio/gpiolib-sysfs.c] or 
> edge_detector_setup() or debounce_setup() [drivers/gpio/gpiolib-cdev.c]
> 
> External drivers also use interrupts indirectly. For example driver 
> sound/soc/soc-jack.c, it doesn't have any direct reference to an 
> interrupt. The driver is given an array of GPIOs and then installs an 
> IRQ in function snd_soc_jack_add_gpios() by doing
> 
> 	request_any_context_irq(gpiod_to_irq(gpios[i].desc),
> 					      gpio_handler,
> 					      IRQF_SHARED |
> 					      IRQF_TRIGGER_RISING |
> 					      IRQF_TRIGGER_FALLING,
> 					      gpios[i].name,
> 					      &gpios[i]);


External drivers do not matter then. Your GPIO controller receives
specific interrupts (that's the interrupt property) and knows exactly
how each GPIO maps to it.

> 
>>
>>>
>>>>
>>>>> Here is an exemple for port B of mpc8323 which has IRQs for
>>>>
>>>> typo
>>>>
>>>>> GPIOs PB7, PB9, PB25 and PB27.
>>>>>
>>>>>           qe_pio_b: gpio-controller@1418 {
>>>>>                   compatible = "fsl,mpc8323-qe-pario-bank";
>>>>>                   reg = <0x1418 0x18>;
>>>>>                   interrupts = <4 5 6 7>;
>>>>>                   interrupt-parent = <&qepic>;
>>>>>                   gpio-controller;
>>>>>                   #gpio-cells = <2>;
>>>>>                   fsl,qe-gpio-irq-mask = <0x01400050>;
>>>>>           };
>>>>
>>>> You are missing #interrupt-cells and interrupt-controller properties.
>>>
>>> The gpio controller is not an interrupt controller. The GPIO controller
>>> is brought by patch 1/6 and documented in patch 6/6.
>>
>> Then the IRQ mask property is not right here. If you say "this GPIOs
>> have IRQs" it means this is an interrupt controller.
> 
> The mask tells to the GPIO controller which GPIO line has an interrupt 
> (so it can install the edge detector) and which doesn't have an 
> interrupt. The "interrupts" property gives a flat list of interrupts, 
> the mask in the above example tells: interrupt 4 is for line 7, 
> interrupt 5 is for line 9, interrupt 6 is for line 25, interrupt 7 is 
> for line 27. Other lines don't have interrupts.
> 
>>
>> If you say this is not an interrupt controller, then you cannot have
>> here interrupts per some GPIOs, obviously.
> 
> It has been working that way on powerpc 8xx for 8 years, since commit 
> 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx GPIO")
> 
> I don't understand why you say you cannot have
> here interrupts per some GPIOs. What am I missing ?

I used conditional. English conditional. If you claim this GPIO
controller is not an interrupt controller, then obviously it is not an
interrupt controller and cannot be used as interrupt controller.

If you use "foo" as interrupt controller, then clearly foo is an
interrupt controller.

Best regards,
Krzysztof

