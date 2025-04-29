Return-Path: <linux-gpio+bounces-19467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09471AA11C3
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 18:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC16492534B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD1B24418E;
	Tue, 29 Apr 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="drNGjPIf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938FC2D1;
	Tue, 29 Apr 2025 16:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944989; cv=none; b=IBwApIYGGl3+bIK+CZnRBtThv+la3mY2+u4Z8tBwnYdY8gwT2RnyaH00OygcoPMS+/jDYsehFQvKMbArdT7R+Oxzsosxa5+AyeWNBAz9TNNzFhz/U+cpinOw1zQl5fnUnVn/joOMeVE+tloBHOVlsMWcgW8ouoaRj0yH96Yv6Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944989; c=relaxed/simple;
	bh=NLUqSchbUO5uxZ04fp8LvgAlxg/Pdf/0R5TYVjnGCzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WRE444+X3lxq/VWLSYC9c+8VEeOU3B3qVSx8MNFB+kgd0ytn3wcnqrWCU4LrbepHLavFJH9QLsWe44BUsEp7HIjUhPFWJ3kCNW/Ii+gNtwrBB+t+CBwqzZDH7K6/wGgSDcHU3vFtdozfJqSKZKChgT3jnRMTYPKuncEdliF7weM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=drNGjPIf; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TGgUTg3142222
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 11:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745944950;
	bh=NLUqSchbUO5uxZ04fp8LvgAlxg/Pdf/0R5TYVjnGCzI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=drNGjPIfPYOY0qawyTxWzrKDd3SSASKWtlVuyTr8H3K2i3Z8PB9TUpsQgAEOD5E2v
	 eCY/w+ZX02PI4si0q3fN8VsZYbKTvypKA8QR5GR5NXrpy4X34U4WsAz+8eBYRH+3Hc
	 l/ZtSUghjkFsFO579L2mGBeYap57aiXfj0NwTZBU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TGgUcP024603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 11:42:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 11:42:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 11:42:30 -0500
Received: from [10.249.35.43] ([10.249.35.43])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TGgTkT101899;
	Tue, 29 Apr 2025 11:42:30 -0500
Message-ID: <683a1c36-0b5a-461f-bc89-3a418f542b57@ti.com>
Date: Tue, 29 Apr 2025 11:42:29 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] gpio: tps65219: Add support for varying
 gpio/offset values
To: Jonathan Cormier <jcormier@criticallink.com>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Jerome Neanne <jneanne@baylibre.com>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <jsava@criticallink.com>
References: <20250425203315.71497-1-s-ramamoorthy@ti.com>
 <20250425203315.71497-4-s-ramamoorthy@ti.com>
 <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 4/28/2025 11:41 AM, Jonathan Cormier wrote:
> On 4/25/25 4:33 PM, Shree Ramamoorthy wrote:
>> Add device-specific structs to select the different PMIC .npgio and
>> .offset
>> values. With the chip_data struct values selected based on the match
>> data,
>> having a separate GPIO0_OFFSET macro is no longer needed.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>   drivers/gpio/gpio-tps65219.c | 29 +++++++++++++++++++++++++----
>>   1 file changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
>> index a5a9dfdb214c..c971deac8619 100644
>> --- a/drivers/gpio/gpio-tps65219.c
>> +++ b/drivers/gpio/gpio-tps65219.c
>> @@ -13,7 +13,6 @@
>>   #include <linux/regmap.h>
>>     #define TPS65219_GPIO0_DIR_MASK        BIT(3)
>> -#define TPS65219_GPIO0_OFFSET        2
>>   #define TPS6521X_GPIO0_IDX            0
>>     struct tps65219_gpio {
>> @@ -21,6 +20,11 @@ struct tps65219_gpio {
>>       struct tps65219 *tps;
>>   };
>>   +struct tps65219_chip_data {
>> +    int ngpio;
>> +    int offset;
>> +};
>> +
>>   static int tps65219_gpio_get_direction(struct gpio_chip *gc,
>> unsigned int offset)
>>   {
>>       struct tps65219_gpio *gpio = gpiochip_get_data(gc);
>> @@ -71,7 +75,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc,
>> unsigned int offset, int val
>>       struct device *dev = gpio->tps->dev;
>>       int v, mask, bit;
>>   -    bit = (offset == TPS6521X_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET :
>> offset - 1;
>> +    bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.offset -
>> 1) : offset - 1;
> (gpio->gpio_chip.offset - 1) is incorrect.  TPS65219_GPIO0_OFFSET used
> to be 2 but now ends up being calculated as 1.  This causes our board
> to power cycle when we try to blink our LED connected to GPIO (Pin 16)
> - "gpio 0".
>
> The whole reason for this strange offset math was that on the TPS65219:
> GPO0 -> Register bit 0
> GPO1 -> Register bit 1
> GPIO -> Register bit 2
>
> However Jerome wanted GPIO to map to linux "GPIO 0".  Is this still
> the case for TPS65215?

In my attempt to combine TPS65214 (which originally had 1 GPO and 1 GPIO
when I wrote the patch, but systems informed me they just switched it to
2 GPOs and 1 GPIO) & TPS65215 (2 GPOs and 1 GPIO), I made a mistake in
combining the 2 series during rebase & with how similar the PMICs are.
Thanks for reviewing this as I wrote it a cycle ago. I'll made the
necessary changes & re-test. I will double check that GPIO matches to
linux "GPIO 0" now that I have more context about the offset math (super
helpful explanation!).

>>         mask = BIT(bit);
>>       v = value ? mask : 0;
>> @@ -148,14 +152,29 @@ static const struct gpio_chip
>> tps65219_template_chip = {
>>       .get            = tps65219_gpio_get,
>>       .set            = tps65219_gpio_set,
>>       .base            = -1,
>> -    .ngpio            = 3,
>>       .can_sleep        = true,
>>   };
>>   +static const struct tps65219_chip_data chip_info_table[] = {
>> +    [TPS65215] = {
>> +        .ngpio = 2,
>> +        .offset = 1,
> I cannot validate this.
>
> The linked TRM for the TPS65215 mentions register and field names but
> doesn't provide any register addresses or field offsets. So I cannot
> validate if the GPIO0 math is correct or how it compares to the TPS65219.
>
> Figure 2-2 shows the PMIC has 3 "GPIO" (1 GPIO and 2 GPO) similar to
> the TPS65219 but Shree has stated there is only 2 (1 GPIO and 1 GPO)
> so a little confusing.
This was a mistake while rebasing to combine patches for TPS65214 and
TPS65215 :( I will fix this immediately. Sorry for the incorrect patch,
but thank you for taking the time to review!
>> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
>
>> +    },
>> +    [TPS65219] = {
>> +        .ngpio = 3,
>> +        .offset = 2,
> Offset 2 ends up becoming 1
>> +    },
>> +};
>
> Note for TI, this needs to be fixed in the SDK11 6.12 release for the
> AM62x as well.
>
> Note: Its unclear to me, why Jerome Neanne and I weren't included in
> this patch set, considering we were the ones who authored and
> submitted this driver.
Jerome's email came back as invalid & my habit of using suppress cc's
while sending these for review didn't add your email. I'll be sure to
add you to the cc list for future series! Sorry again for the mistakes
and dropped cc, will fix these accordingly.

