Return-Path: <linux-gpio+bounces-26930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A540BC8765
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 12:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7BC43A6CDE
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 10:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733A62D97B8;
	Thu,  9 Oct 2025 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="kqb/SNzh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com [136.143.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340762D94A6;
	Thu,  9 Oct 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760005524; cv=pass; b=lFTJXmc96N58bTVfOtQQy5/BxbxMoGM0lF+HrowX7D5JdiQeGYLH6RvZHv5kfZbZl2QfSwupPD0gMpCxKjkRwquu/c7KOREIdpzWAV5vivKomt4Z0oOOVO/EIyu3xuKzgPx4cWNK0D4NOTlw/LtHB+dFX+1oSIAt3obQB1B6pfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760005524; c=relaxed/simple;
	bh=Of+FE8sc5eJlL+XnoINtWrbK7uhmK2bCHKODmG3fu6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snhrm4kEsiZbjWngiR4X3Xg1ohM+RIrmhEqdSGeCGCtUKpmU8jLH/ET5o6bXPucffSgvszgwSfan3kJbV1CyQx9gS/pF+fF2gAqlR3WWRyEMe50iGnqO/N8Rag9spcoJEx9Vsdv4FVKfqKpRwnmoxE2oZsG+dyaEY0gYcFOmNuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=kqb/SNzh; arc=pass smtp.client-ip=136.143.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1760005481; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OeOxIB1NuAE+YRddXRZrc0wlgu2UOOE25xD3oH4wsYwkukfFBwSDAHkfLP60b/JMXglGpYRsf5B30422BQZ1vtUNuoUQoLGxvqJ/5wnMQSO2gZXUEUXd8cewuvS8xMwpZDZbX/e33pzErAjbDZc5c++3EROiNqcb1nBlcB7zi2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760005481; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BpIYlYHlHIGeo+yo32gJFi1Ltz6CTGf0iILOovCx0yg=; 
	b=inQnw42/yE6icwpP8GAszyfb1EJyfyIx3nN1fBj4NLVEEIjilkzhnmvSE//V0jliE9o/SxKFCxQLz38FkeZ+WgBa6LPozHKkLI4h3wGX9T33QXSL1puytaKZtpNOe6pliGO+NSlW/hVafu+E0pXqz7brmYMwEdOnyCjLjTNfIU0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760005481;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BpIYlYHlHIGeo+yo32gJFi1Ltz6CTGf0iILOovCx0yg=;
	b=kqb/SNzhlpwi3v5r07PAbA5dwMpnC9BUIXkBzciHhahR2T8RR9HzwpgWgcj+iW9N
	O/cLa8uTKtfd0V37GK5NVRTAwRQscnGmsR6eVjs5tUppyRTY1HCOxDciOGn0tv4Kwgw
	vPkSWp49F94aPBpVTwnTpEy7KKerg4ptXvkjacH0=
Received: by mx.zohomail.com with SMTPS id 1760005476896264.035669287107;
	Thu, 9 Oct 2025 03:24:36 -0700 (PDT)
Message-ID: <aca89e7d-421f-490f-8c3a-c2d9567dbc26@collabora.com>
Date: Thu, 9 Oct 2025 11:24:28 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: pca953x: enable latch only on edge-triggered inputs
To: Francesco Lavra <flavra@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Maria Garcia <mariagarcia7293@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Potin Lai <potin.lai.pt@gmail.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 Fabio Estevam <festevam@denx.de>, Ian Ray <ian.ray@gehealthcare.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008104309.794273-1-flavra@baylibre.com>
 <CACRpkdYDMRZMb+bDUgK5yiKU1Toy=S_ebo2_4WRasHxCqv+4xw@mail.gmail.com>
 <c75a89f8-9eb7-4300-979e-e11159dc6888@collabora.com>
 <02a02848044c32e78cfc806a3b95c1cb0d93d7fc.camel@baylibre.com>
Content-Language: en-US
From: Martyn Welch <martyn.welch@collabora.com>
In-Reply-To: <02a02848044c32e78cfc806a3b95c1cb0d93d7fc.camel@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 09/10/2025 08:44, Francesco Lavra wrote:
> On Thu, 2025-10-09 at 08:17 +0100, Martyn Welch wrote:
>> On 09/10/2025 07:03, Linus Walleij wrote:
>>> Hi Francesco,
>>>
>>> thanks for your patch!
>>>
>>> On Wed, Oct 8, 2025 at 12:43 PM Francesco Lavra <flavra@baylibre.com>
>>> wrote:
>>>
>>>
>>>> The latched input feature of the pca953x GPIO controller is useful
>>>> when an input is configured to trigger interrupts on rising or
>>>> falling edges, because it allows retrieving which edge type caused
>>>> a given interrupt even if the pin state changes again before the
>>>> interrupt handler has a chance to run. But for level-triggered
>>>> interrupts, reading the latched input state can cause an active
>>>> interrupt condition to be missed, e.g. if an active-low signal (for
>>>> which an IRQ_TYPE_LEVEL_LOW interrupt has been configured) triggers
>>>> an interrupt when switching to the inactive state, but then becomes
>>>> active again before the interrupt handler has a chance to run: in
>>>> this case, if the interrupt handler reads the latched input state,
>>>> it will wrongly assume that the interrupt is not pending.
>>>> Fix the above issue by enabling the latch only on edge-triggered
>>>> inputs, instead of all interrupt-enabled inputs.
>>>>
>>>> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
>>>> ---
>>>>    drivers/gpio/gpio-pca953x.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-
>>>> pca953x.c
>>>> index e80a96f39788..e87ef2c3ff82 100644
>>>> --- a/drivers/gpio/gpio-pca953x.c
>>>> +++ b/drivers/gpio/gpio-pca953x.c
>>>> @@ -761,10 +761,13 @@ static void pca953x_irq_bus_sync_unlock(struct
>>>> irq_data *d)
>>>>           int level;
>>>>
>>>>           if (chip->driver_data & PCA_PCAL) {
>>>> +               DECLARE_BITMAP(latched_inputs, MAX_LINE);
>>>>                   guard(mutex)(&chip->i2c_lock);
>>>>
>>>> -               /* Enable latch on interrupt-enabled inputs */
>>>> -               pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip-
>>>>> irq_mask);
>>>> +               /* Enable latch on edge-triggered interrupt-enabled
>>>> inputs */
>>>> +               bitmap_or(latched_inputs, chip->irq_trig_fall, chip-
>>>>> irq_trig_raise, gc->ngpio);
>>>> +               bitmap_and(latched_inputs, latched_inputs, chip-
>>>>> irq_mask, gc->ngpio);
>>>> +               pca953x_write_regs(chip, PCAL953X_IN_LATCH,
>>>> latched_inputs);
>>>
>>> This driver is used by a *lot* of systems and people.
>>>
>>> It is maybe the most used GPIO driver in the kernel.
>>>
>>> So I added a lot of affected developers to the To: line of
>>> the mail so we can get a wider review and testing.
>>>
>>
>> I don't have access to the relevant hardware to test this anymore and
>> it's been a while since I thought much about edge vs. level triggered
>> interrupts. But if the state of the interrupt is unilaterally returning
>> to an inactive state, it sounds like that should be configured as an
>> edge triggered interrupt, not a level triggered one...
> 
> I will try to better describe the problematic scenario:
> - a device has an IRQ line that becomes active when the device needs to be
> serviced, and becomes inactive when the device has been serviced (e.g. by
> reading a status register); this is the classic use case for level-
> triggered interrupts
> - the IRQ line of this device is connected to a pca953x input, and this
> input is configured as a level-triggered interrupt
> - the device IRQ line becomes active, this triggers an interrupt in the
> pca953x, the pca953x interrupt handler is invoked, it reads the input
> state, then calls the nested interrupt handler
> - the nested interrupt handler services the device, which causes the IRQ
> line to become inactive: this triggers a second interrupt in the pca953x
> - before the pca953x interrupt handler is invoked for the second time, the
> device IRQ line becomes active again
> - the pca953x interrupt handler is invoked, it reads the input state, which
> shows the line as inactive (because that is the state that triggered the
> second interrupt), and as a result the nested interrupt handler is not
> invoked, and the device will stay forever with the interrupt line asserted
> 
> With my proposed change, in the last step above the pca953x interrupt
> handler will read the current input state instead of the state that caused
> the second interrupt, and thus will correctly invoke the nested interrupt
> handler for the second time.

Thanks for the detail Francesco.

To me it seems that the latching is more or less required in the edge 
triggered case because, as the hardware manual for the PCAL6408A at 
least states:

     When an input latch register bit is 0, the corresponding input pin
     state is not latched...    ...If the input goes back to its initial
     logic state before the Input port register is read, then the
     interrupt is cleared.

So the hardware doesn't retain which bits triggered the interrupt 
without the latching.

For level based interrupts I think you're right and it doesn't make 
sense to latch the value.

This change seems sensible to me.

Reviewed-by: Martyn Welch <martyn.welch@collabora.com>

