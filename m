Return-Path: <linux-gpio+bounces-19966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D96AB3AA1
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED49E19E187D
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E7A21D3EF;
	Mon, 12 May 2025 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="igdHCSr5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1F021B9F8;
	Mon, 12 May 2025 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060223; cv=none; b=pGhZfcffCn4NoIAdA8KwiO/gWOdog8sGhtqAjmHQgrFE/9C0cPUlQf4Cy6C55FJEt6pLzwtwEEiuxO4xPO2Pfou94phvdUG46lZ3PkdevcSMjtcK9WP0CTx7AWu/ST0d75QtFPHAHfawFLPEsdOFW46GgsraHKBhQVmrgUqNlFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060223; c=relaxed/simple;
	bh=dJLSXh6NRrH5GVSoNm8+zlgpZoDi2lHurrmrZhGWPo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ug2f3B4XJhONaorznfr+JO3Hnl0OgqfcAPYVR+FoishP9PFtvAKsVHascat7mj1VkgS6orkR2L/9ExhJN1G/BWhTfH7LtbcDvqJ1dEeA9BkYxRU4qZ07KoWioy36PwbYGjYkhXy7x8UvBbBXqRCQtph3dqexq0yzLzM/BXbQB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=igdHCSr5; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 999A441C93;
	Mon, 12 May 2025 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747060218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/Ui6oc5Nm+KkKzPZxG2CxXKG9UmNd43w4GiVI/YA3I=;
	b=igdHCSr5lt6uEPkbP9bms8179TGIn+n4NhO03e7kSzvUIcXmIdYS4VTrDzsW3Guoa6D0S/
	2B5q4fKplnv/PXqB6D90WwPdiD2EopmH373ZIip+wyuKthhCdficB8+QALLRyqvzIzVtnd
	E139KHdhArmwwO/Hm9Km/P2Lclo4ca2FNlyydyDtrMJhItKitJPvDCOjjE5wTwPfWLb96l
	Y4tayxl/RAPnND9+axz+gzLvqNnmYLjyF61bKxf4nd5zBSAn9KX9u79v6+lXGvGaR6QMgi
	UL3KwZtEMrBayhJdb6OrQjzEI5xfK8aomNdIBQUHpPi72nNtkBKD2leJ5X9N8A==
Message-ID: <b5b24b98-ae89-4d50-90cb-c2bbc38aafba@bootlin.com>
Date: Mon, 12 May 2025 16:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
 <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com>
 <aCIBoSi84NnwEA2s@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <aCIBoSi84NnwEA2s@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigq
 dhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

On 5/12/25 16:11, Andy Shevchenko wrote:
> On Mon, May 12, 2025 at 04:08:35PM +0200, Thomas Richard wrote:
>> On 5/9/25 11:07, Geert Uytterhoeven wrote:
>>> On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> 
> ...
> 
>>>> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
>>>> +                       unsigned long config);
>>>> +
>>>> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
>>>
>>> I would expect all of these to take gpiochip_fwd pointers instead of
>>> gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
>>> that does not correspond to a gpiochip_fwd object, causing a crash?
>>
>> Indeed nothing prevents from passing gpio_chip pointer which does not
>> correspond to a gpiochip_fwd object.
>> And it is also a bit weird to pass a gpiochip_fwd pointer in some cases
>> (for example gpio_fwd_gpio_add()) and a gpio_chip in other cases.
>>
>> I can keep GPIO operations as is, and create exported wrappers which
>> take a gpiochip_fwd pointer as parameter, for example:
>>
>> int gpiochip_fwd_get_multiple(struct gpiochip_fwd *fwd,
>> 			      unsigned long *mask,
>> 			      unsigned long *bits)
>> {
>> 	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
>>
>> 	return gpio_fwd_get_multiple_locked(chip, mask, bits);
>> }
>> EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_multiple, "GPIO_FORWARDER");
>>
>> So exported functions are gpiochip_fwd_*().
> 
> Sounds good for me. Let's wait for Geert's opinoin on this.

Regarding Geert's comment for patch 9/12, an other proposal for naming:
As mentioned above, exported functions gpiochip_fwd_*() take a
gpiochip_fwd as parameter.

But for all functions corresponding to a GPIO operation add the gpio
word, and for functions to add/remove GPIO descriptor add the desc word:

devm_gpiochip_fwd_alloc()
gpiochip_fwd_register()

gpiochip_fwd_desc_add()
gpiochip_fwd_desc_free()

gpiochip_fwd_get_gpiochip()
gpiochip_fwd_get_data()

gpiochip_fwd_gpio_request()
gpiochip_fwd_gpio_get_direction()
gpiochip_fwd_gpio_direction_input()
gpiochip_fwd_gpio_direction_output()
gpiochip_fwd_gpio_get()
gpiochip_fwd_gpio_set()
gpiochip_fwd_gpio_set_multiple()
gpiochip_fwd_gpio_get_multiple()
gpiochip_fwd_gpio_set_config()
gpiochip_fwd_gpio_to_irq()

Regards,

Thomas

