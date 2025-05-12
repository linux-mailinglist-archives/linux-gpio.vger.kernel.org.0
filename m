Return-Path: <linux-gpio+bounces-19956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC86AAB3A0D
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B2D3A7E46
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A751E2838;
	Mon, 12 May 2025 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m8yD0cSo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244E9475;
	Mon, 12 May 2025 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058921; cv=none; b=LAba3v2eDbv5OkkG7K3+joZTIwFYZfkI9rcK24u6hc3VSTmQxDiZz/xmLS0j3UptZGnUHfag2igE6rJH+PtiaiMt8kDt5UitPg58iNOm7WLSem6ASS8L/3eBg88tScSMqTbHNlwm6W7nE/I+VQqg/kdSII4hAUggckx9iiDnrRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058921; c=relaxed/simple;
	bh=YdNaJ2Ux8y3aK+SH+c2ZLzGpvzgZM+r/94+gNHp1FFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V98IU45H0ZJRnqbnxBFYFN/6YTMUr7vefKYbQ9RfJP2PyJ9FKG59zMOKy++p/4NPbopd6UhuI4c8+o9EhMRRBA/urNchUYQwoNzISLM8atjIProoRU468T/mKsyihn2Q2p2sjjQO7OUrSP4t5MDS6CmaAuEMHtQlhzRxVJtYb/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m8yD0cSo; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA3554392C;
	Mon, 12 May 2025 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747058917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZBTuyYQwI1Qzb+1wmtbRMwmp21zHViJvEZ9jvcBsBg=;
	b=m8yD0cSozRfxKuW7ODIcf6hJq7/HckdvZGfiUfynARqWyIVDsmkDkw1CdaZ8en2i221aD6
	vszx72Jtu/BdAT8PLs4E4jpd02YgqAqrUyExuzOaGINHWobjN1+Fy9lvlsW9aExt4WoL/Q
	d9cYAJd+2NyliJzWUvqSMNbpv4OoYDfXePvj1s7/08JOwqG5Qql9FgS4i08L4ijoASXE2V
	FVtYkC/9+jagVlLPl7bc1T0xdHNCLbDHYE4CH0VyBgofMes1CuEH4s3EOGqDJiDP3oCbst
	v3Vh9EFqXydMpMxy0deAGXCwTjhhOO2z81589goIqaExggvBHD7AvvGXRgoV5w==
Message-ID: <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com>
Date: Mon, 12 May 2025 16:08:35 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddugeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhefgfeehveeggfeggfekhfehgfffkeeghfeuffeikeekjeehkeetvedthedtieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhus
 hdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Hi Geert

Thanks a lot for the review.

On 5/9/25 11:07, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
>> Export all symbols and create header file for the GPIO forwarder library.
>> It will be used in the next changes.
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

...

>> +
>> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
>> +                       unsigned long config);
>> +
>> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
> 
> I would expect all of these to take gpiochip_fwd pointers instead of
> gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
> that does not correspond to a gpiochip_fwd object, causing a crash?

Indeed nothing prevents from passing gpio_chip pointer which does not
correspond to a gpiochip_fwd object.
And it is also a bit weird to pass a gpiochip_fwd pointer in some cases
(for example gpio_fwd_gpio_add()) and a gpio_chip in other cases.

I can keep GPIO operations as is, and create exported wrappers which
take a gpiochip_fwd pointer as parameter, for example:

int gpiochip_fwd_get_multiple(struct gpiochip_fwd *fwd,
			      unsigned long *mask,
			      unsigned long *bits)
{
	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);

	return gpio_fwd_get_multiple_locked(chip, mask, bits);
}
EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_multiple, "GPIO_FORWARDER");

So exported functions are gpiochip_fwd_*().

Regards,

Thomas
-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

