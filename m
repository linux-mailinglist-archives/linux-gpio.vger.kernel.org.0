Return-Path: <linux-gpio+bounces-24484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E297B29CC0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 10:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB9A2A28A7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 08:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92C3304BD5;
	Mon, 18 Aug 2025 08:51:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DD9304BD0;
	Mon, 18 Aug 2025 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507064; cv=none; b=AE9F49UhZJdTE0TWMokGVW1I1e+AkdmI2t4tf2561XN9UBZVULsRs1XpPP8LsTkm8eVR6rKZiD/dgYNj/CqckPeK5LvUTYz88QJYbI0vuF7bE14VaWzQAh+bSw6LUdo3bbksnbkEzbwIeEORExypuJxy/wokRe/MrqLjlduGDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507064; c=relaxed/simple;
	bh=KcvJq8M0HpwaZwcXQIlx7Axgnixjejn3gLTyh60tocg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DU9s/dO7gQ2DWVuNM/txafuhNx+cPb7LQHle2NERO31BiPFVqRPBaqxC8/Jy9UYv8/wx/hhC0O1p0cILFo4FduEaXpCN/HqctlpFZOT2EcEdjS3w1V7uvewh3n/fpEbjuNNgSxQUHtTjEE+ayeLrWQ9dmvByf2RND2fUfIaiWog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55ZV6vqDz9sVP;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hybM51rxMvV; Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55ZV5jRkz9sVL;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A2A4C8B764;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id bcNwoLJxTpMP; Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 715818B763;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Message-ID: <d085efdd-fe8b-4efa-92e1-34573c55ade5@csgroup.eu>
Date: Mon, 18 Aug 2025 10:33:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <22b3847fd0011024c10aff48f1e5223894ce718a.1754996033.git.christophe.leroy@csgroup.eu>
 <CAMRc=Mce3LHtCUd-oO3uZjVAS-fywn86Zn+qmehZPJTKLzk6Sg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAMRc=Mce3LHtCUd-oO3uZjVAS-fywn86Zn+qmehZPJTKLzk6Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/08/2025 à 16:21, Bartosz Golaszewski a écrit :
> On Tue, 12 Aug 2025 13:02:53 +0200, Christophe Leroy
> <christophe.leroy@csgroup.eu> said:
>> In the QE, a few GPIOs are IRQ capable. Similarly to
>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>> GPIO"), add IRQ support to QE GPIO.
>>
>> Add property 'fsl,qe-gpio-irq-mask' similar to
>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>
>> Here is an exemple for port B of mpc8323 which has IRQs for
>> GPIOs PB7, PB9, PB25 and PB27.
>>
>> 	qe_pio_b: gpio-controller@1418 {
>> 		#gpio-cells = <2>;
>> 		compatible = "fsl,mpc8323-qe-pario-bank";
>> 		reg = <0x1418 0x18>;
>> 		interrupts = <4 5 6 7>;
>> 		fsl,qe-gpio-irq-mask = <0x01400050>;
>> 		interrupt-parent = <&qepic>;
>> 		gpio-controller;
>> 	};
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
>> index b502377193192..59145652ad850 100644
>> --- a/drivers/soc/fsl/qe/gpio.c
>> +++ b/drivers/soc/fsl/qe/gpio.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/err.h>
>>   #include <linux/io.h>
>>   #include <linux/of.h>
>> +#include <linux/of_irq.h>
>>   #include <linux/gpio/legacy-of-mm-gpiochip.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/gpio/driver.h>
>> @@ -32,6 +33,8 @@ struct qe_gpio_chip {
>>
>>   	/* saved_regs used to restore dedicated functions */
>>   	struct qe_pio_regs saved_regs;
>> +
>> +	int irq[32];
>>   };
>>
>>   static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
>> @@ -141,6 +144,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>>   	return 0;
>>   }
>>
>> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
>> +{
>> +	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
>> +
>> +	return qe_gc->irq[gpio] ? : -ENXIO;
>> +}
>> +
>>   struct qe_pin {
>>   	/*
>>   	 * The qe_gpio_chip name is unfortunate, we should change that to
>> @@ -304,6 +314,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>   	struct qe_gpio_chip *qe_gc;
>>   	struct of_mm_gpio_chip *mm_gc;
>>   	struct gpio_chip *gc;
>> +	u32 mask;
>>
>>   	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
>>   	if (!qe_gc) {
>> @@ -313,6 +324,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>
>>   	spin_lock_init(&qe_gc->lock);
>>
>> +	if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {
> 
> AFAICT: you can drop the of.h include and just use
> device_property_present() here.

This line reads the value of the mask, I can't see how it can be 
replaced by device_property_present().

> 
>> +		int i, j;
>> +
>> +		for (i = 0, j = 0; i < 32; i++)
>> +			if (mask & (1 << (31 - i)))
>> +				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
>> +	}
>> +
>>   	mm_gc = &qe_gc->mm_gc;
>>   	gc = &mm_gc->gc;
>>
>> @@ -323,6 +342,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>   	gc->get = qe_gpio_get;
>>   	gc->set = qe_gpio_set;
>>   	gc->set_multiple = qe_gpio_set_multiple;
>> +	gc->to_irq = qe_gpio_to_irq;
>>
>>   	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>>   	if (!ret)
>> --
>> 2.49.0
>>
>>
> 
> Bart


