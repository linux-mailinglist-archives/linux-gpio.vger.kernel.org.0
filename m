Return-Path: <linux-gpio+bounces-25185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA713B3B675
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 10:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42950463024
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 08:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACB72C11FD;
	Fri, 29 Aug 2025 08:50:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A39481B1;
	Fri, 29 Aug 2025 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457436; cv=none; b=ulvfOHzx1eJ6pQ4SzUbxrt0aFGDCWYcgBdaNBrx9S5SQAjzZEKcYGZP1Mpef9rLJVujkmou9N8OmkvzN7VSESnPmCj+zQz7GmfzdgwBp9A/VGHME4rzsqC20UkkUAxkBv74IMb40iR2B3jYqsbt/Pbs8lC+aJZYWuhBjk5e3fvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457436; c=relaxed/simple;
	bh=dTg7CoqjKnU1/MdFeozbFQDmTonqmWUzWZM3kYznqMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoViG8om83Hkj8yDwf39OtQrgDa1bOpmFONNTA/OpN+UvHzRPNVRk4Bz0t+uBQJU8sZIiaGyIePB3eC0sGSsogCj7M88zE3E3r5Q+bil3jwXBeFOfMgQNEi2RhJZgsa+rPZ2pBMBWyLZM13xrDo3EwbEDgauOdfwUSjekgDAdUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cCs6D1Vmbz9sT1;
	Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9NDmBDpyOOx; Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cCs6D0Xh0z9sSr;
	Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F40178B778;
	Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uQqX3YFuqtHI; Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 53B0A8B776;
	Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
Message-ID: <1ba37df7-2d4a-4258-8220-58ee7d609264@csgroup.eu>
Date: Fri, 29 Aug 2025 10:35:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <0f716362-07f4-4c79-bb0a-e71d2630a797@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/08/2025 à 09:47, Krzysztof Kozlowski a écrit :
> On 28/08/2025 16:12, Christophe Leroy wrote:
>>
>>
>> Le 28/08/2025 à 15:28, Rob Herring a écrit :
>>> On Mon, Aug 25, 2025 at 2:20 AM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>>
>>>> In the QE, a few GPIOs are IRQ capable. Similarly to
>>>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>>>> GPIO"), add IRQ support to QE GPIO.
>>>>
>>>> Add property 'fsl,qe-gpio-irq-mask' similar to
>>>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>>
>>> Why do you need to know this? The ones that have interrupts will be
>>> referenced by an 'interrupts' property somewhere.
>>
>> I don't follow you. The ones that have interrupts need to be reported by
>> gc->qe_gpio_to_irq[] so that gpiod_to_irq() return the IRQ number, for
>> instance to gpio_sysfs_request_irq() so that it can install an irq
>> handler. I can't see where they would be referenced by an "interrupts"
>> property.
> 
> They would be referenced by every consumer of these interrupts. IOW,
> this property is completely redundant, because DT holds this information
> already in other place.

But the gpio controller _is_ the consumer of these interrupts, it it 
_not_ the provider.

The interrupts are provided by a separate interrupt controller. Let's 
take the exemple of powerpc 8xx. Here is the list of interrupts handled 
by the CPM interrupt controller on the 8xx:

1 - GPIO Port C Line 4 interrupt
2 - GPIO Port C Line 5 interrupt
3 - SMC2 Serial controller interrupt
4 - SMC1 Serial controller interrupt
5 - SPI controller interrupt
6 - GPIO Port C Line 6 interrupt
7 - Timer 4 interrupt
8 - SCCd Serial controller interrupt
9 - GPIO Port C Line 7 interrupt
10 - GPIO Port C Line 8 interrupt
11 - GPIO Port C Line 9 interrupt
12 - Timer 3 interrupt
13 - SCCc Serial controller interrupt
14 - GPIO Port C Line 10 interrupt
15 - GPIO Port C Line 11 interrupt
16 - I2C Controller interrupt
17 - RISC timer table interrupt
18 - Timer 2 interrupt
19 - SCCb Serial controller interrupt
20 - IDMA2 interrupt
21 - IDMA1 interrupt
22 - SDMA channel bus error interrupt
23 - GPIO Port C Line 12 interrupt
24 - GPIO Port C Line 13 interrupt
25 - Timer 1 interrupt
26 - GPIO Port C Line 14 interrupt
27 - SCCd Serial controller interrupt
28 - SCCc Serial controller interrupt
29 - SCCb Serial controller interrupt
30 - SCCa Serial controller interrupt
31 - GPIO Port C Line 15 interrupt

As you can see in the list, the GPIO line interrupts are nested with 
other types of interrupts so GPIO controller and Interrupt controller 
are to be keept independant.

That's more or less the same here with my series, patch 1 implements an 
interrupt controller (documented in patch 6) and then the GPIO 
controllers consume the interrupts, for instance in gpiolib functions 
gpio_sysfs_request_irq() [drivers/gpio/gpiolib-sysfs.c] or 
edge_detector_setup() or debounce_setup() [drivers/gpio/gpiolib-cdev.c]

External drivers also use interrupts indirectly. For example driver 
sound/soc/soc-jack.c, it doesn't have any direct reference to an 
interrupt. The driver is given an array of GPIOs and then installs an 
IRQ in function snd_soc_jack_add_gpios() by doing

	request_any_context_irq(gpiod_to_irq(gpios[i].desc),
					      gpio_handler,
					      IRQF_SHARED |
					      IRQF_TRIGGER_RISING |
					      IRQF_TRIGGER_FALLING,
					      gpios[i].name,
					      &gpios[i]);

> 
>>
>>>
>>>> Here is an exemple for port B of mpc8323 which has IRQs for
>>>
>>> typo
>>>
>>>> GPIOs PB7, PB9, PB25 and PB27.
>>>>
>>>>           qe_pio_b: gpio-controller@1418 {
>>>>                   compatible = "fsl,mpc8323-qe-pario-bank";
>>>>                   reg = <0x1418 0x18>;
>>>>                   interrupts = <4 5 6 7>;
>>>>                   interrupt-parent = <&qepic>;
>>>>                   gpio-controller;
>>>>                   #gpio-cells = <2>;
>>>>                   fsl,qe-gpio-irq-mask = <0x01400050>;
>>>>           };
>>>
>>> You are missing #interrupt-cells and interrupt-controller properties.
>>
>> The gpio controller is not an interrupt controller. The GPIO controller
>> is brought by patch 1/6 and documented in patch 6/6.
> 
> Then the IRQ mask property is not right here. If you say "this GPIOs
> have IRQs" it means this is an interrupt controller.

The mask tells to the GPIO controller which GPIO line has an interrupt 
(so it can install the edge detector) and which doesn't have an 
interrupt. The "interrupts" property gives a flat list of interrupts, 
the mask in the above example tells: interrupt 4 is for line 7, 
interrupt 5 is for line 9, interrupt 6 is for line 25, interrupt 7 is 
for line 27. Other lines don't have interrupts.

> 
> If you say this is not an interrupt controller, then you cannot have
> here interrupts per some GPIOs, obviously.

It has been working that way on powerpc 8xx for 8 years, since commit 
726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx GPIO")

I don't understand why you say you cannot have
here interrupts per some GPIOs. What am I missing ?

Thanks
Christophe

