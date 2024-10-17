Return-Path: <linux-gpio+bounces-11567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131569A2C4E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 20:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372BF1C20F18
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 18:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E411F9EB3;
	Thu, 17 Oct 2024 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BC0M9aL7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C401F9437;
	Thu, 17 Oct 2024 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729190340; cv=none; b=lqKvT1mV+6Dvwfv8nt8WgCuT2KpHs23j86B+LbdBuRMOMkP6buv6/GkQOAjXNJTANmjSgmCG+PgcGWJj2sDH+2mCsTzD0akCI1JRzyON1RY9HhfDd1DvWPDdRMhZagXPyWVz87Ve1Z0PJYOYg4jL5l0hWgS7ZkSh+dt0l11VqRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729190340; c=relaxed/simple;
	bh=S4eVTtnVClCRlSR/KXv134cWAToD9EOj3njuGsmO7y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mmctRRdGepWIGTkQ9/7BWBYsib2/nRS41ZqM9/zwkBqRfqpIY3XSJjfQ/zrmfDZNx6JG24Qc2cKWxNfY/EQu+cyDYwqQzBCgWYgOOzExbiP8ZDBFtbyrtM81pY8MbU9Klov695EjQKx0q9fSNDS64mggysOZEe3FAf4VITtKRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BC0M9aL7; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49HIcl3f092734;
	Thu, 17 Oct 2024 13:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729190327;
	bh=QUPRWlSJCMr94gHz5yh8kxX5CDhtzNHWQ/fPn8iI5eY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BC0M9aL75uRaHnkLTUVJv9M5ZVkP0fTUHT4LA3sZMSih659fzRD9OcA89TTs10p0C
	 ZxpGm/DVA6nnR8xNY8b37WgHBiGwncG8ABn52z0H87nAlKexiGIup1UFdrh1bKbM3k
	 pwmdBMVPI+X5TXHCKgaJjxuX3a2XEOH2PjeY9Xfo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49HIclZ5015867;
	Thu, 17 Oct 2024 13:38:47 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Oct 2024 13:38:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Oct 2024 13:38:46 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49HIck2N023002;
	Thu, 17 Oct 2024 13:38:46 -0500
Message-ID: <53d989ec-06b6-4337-aef7-81e651fab3e1@ti.com>
Date: Thu, 17 Oct 2024 13:38:46 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
To: Andrew Davis <afd@ti.com>
CC: <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        <linux-serial@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
References: <20241011173356.870883-1-jm@ti.com>
 <20241011173356.870883-2-jm@ti.com>
 <89091165-74d1-442a-ab34-8e70f1a2d65b@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <89091165-74d1-442a-ab34-8e70f1a2d65b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 10/11/24 2:07 PM, Andrew Davis wrote:
> On 10/11/24 12:33 PM, Judith Mendez wrote:
>> Add omap_gpio_disable_irq and omap_gpio_enable_irq
>> calls in gpio-omap.
>>
>> Currently, kernel cannot disable gpio interrupts in
>> case of a irq storm, so add omap_gpio_disable_irq
>> so that interrupts can be disabled/enabled.
>>
>> Signed-off-by: Bin Liu <b-liu@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   drivers/gpio/gpio-omap.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
>> index 76d5d87e9681..913e6ece1238 100644
>> --- a/drivers/gpio/gpio-omap.c
>> +++ b/drivers/gpio/gpio-omap.c
>> @@ -711,6 +711,31 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
>>       raw_spin_unlock_irqrestore(&bank->lock, flags);
>>   }
>> +static void omap_gpio_set_irq(struct irq_data *d, bool enable)
>> +{
>> +    struct gpio_bank *bank = omap_irq_data_get_bank(d);
>> +    unsigned int offset = d->hwirq;
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&bank->lock, flags);
>> +    omap_set_gpio_irqenable(bank, offset, enable);
>> +    raw_spin_unlock_irqrestore(&bank->lock, flags);
>> +}
>> +
>> +static void omap_gpio_disable_irq(struct irq_data *d)
>> +{
>> +    bool enable = 1;
>> +
>> +    omap_gpio_set_irq(d, !enable);
> 
> Seems like an odd way to make "false", why not:
> 
> omap_gpio_set_irq(d, false);

Thanks for your review, you are right, but I will
be reverting to the original patch format. Where we do
not used wrappers function around omap_gpio_set_irq().

~ Judith

> 
> Andrew
> 
>> +}
>> +
>> +static void omap_gpio_enable_irq(struct irq_data *d)
>> +{
>> +    bool enable = 1;
>> +
>> +    omap_gpio_set_irq(d, enable);
>> +}
>> +
>>   static void omap_gpio_irq_print_chip(struct irq_data *d, struct 
>> seq_file *p)
>>   {
>>       struct gpio_bank *bank = omap_irq_data_get_bank(d);
>> @@ -723,6 +748,8 @@ static const struct irq_chip omap_gpio_irq_chip = {
>>       .irq_shutdown = omap_gpio_irq_shutdown,
>>       .irq_mask = omap_gpio_mask_irq,
>>       .irq_unmask = omap_gpio_unmask_irq,
>> +    .irq_disable = omap_gpio_disable_irq,
>> +    .irq_enable = omap_gpio_enable_irq,
>>       .irq_set_type = omap_gpio_irq_type,
>>       .irq_set_wake = omap_gpio_wake_enable,
>>       .irq_bus_lock = omap_gpio_irq_bus_lock,
>> @@ -737,6 +764,8 @@ static const struct irq_chip 
>> omap_gpio_irq_chip_nowake = {
>>       .irq_shutdown = omap_gpio_irq_shutdown,
>>       .irq_mask = omap_gpio_mask_irq,
>>       .irq_unmask = omap_gpio_unmask_irq,
>> +    .irq_disable = omap_gpio_disable_irq,
>> +    .irq_enable = omap_gpio_enable_irq,
>>       .irq_set_type = omap_gpio_irq_type,
>>       .irq_bus_lock = omap_gpio_irq_bus_lock,
>>       .irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,


