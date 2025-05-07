Return-Path: <linux-gpio+bounces-19744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B63C9AAE392
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 16:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7DD61BA7A52
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 14:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE402289E0E;
	Wed,  7 May 2025 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UHwThykS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A19280325;
	Wed,  7 May 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629586; cv=none; b=fAsVUEjW3fLgz3yT2p1I760DxkSi9frWMNwxCuEut+iVcplCa700RLU6sHQtwT4Oas5atvAdeX49F8TJs4iKdfOl5+j98qDQCljraACurGszFVSf8GpBjEj190o2xO5PsN5cGh1888m7q2jD5QrRQu5t5VQOFk5vwoNOCg3sRzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629586; c=relaxed/simple;
	bh=860Cy43wuTr4BOgz0A4KfUV5gGHRPzJ3YR2WV8WhSsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mniFi0XeKNKzl7j8Imzn/6UEr9FUPOE56Q5tRf+db9vRVr0qIh2UgojWlHJ6HGB6etw2NIIfRryISJ6+7QnwxkQjSepqaBMJz9oqDxZDRfTGk8phEqNNOhQdNVOahoqAKdXeU5x5eNHNGV/Yhj/jW4G0rc+AZfq87ey6c78cmWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UHwThykS; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 995D743B65;
	Wed,  7 May 2025 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746629582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4rUVGQTujMSoZ9NRNRI+654RlT+kaV4WAhwcUmLWZg=;
	b=UHwThykSJ0NH1IOwHYI5CzrYbN0nKFD4xzMPYJwiSPLJ3e40RyCrPf9UNHoCsKsoyuqocI
	ucQJ1UQapCw1SG9aGJaUlztolZ6fweCYP3u7cB4bfTnryItp+5PLT3eG7iHJE+bNHAnT/n
	mj7RxO/XkDvlFEe42D/3L3hVvNqsViUeHN/0Xf72rSpdKjzkp/HFfCVfF9WqOze1HwkUs5
	O1S7twaHz9//1TbEE5s2L8Uja2wvaKS8g+uuf52ML5z4mAWEk/quEI4HZyt49Eauzk0yIM
	2WhmQC6mvg2Y/Tjvrk8j8vK7GmIrTN0/uggVmTWDkQ7yiOXyDCj/pTH+nyuFrA==
Message-ID: <cb98bec7-748c-4e00-aa9f-b5075bebb5b2@bootlin.com>
Date: Wed, 7 May 2025 16:53:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAHp75VdRp7RG-YCAL2Jx4uXsT2RVQNeu-MxPB5pWRq8TqtsSXw@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VdRp7RG-YCAL2Jx4uXsT2RVQNeu-MxPB5pWRq8TqtsSXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghro
 hdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

On 5/7/25 08:29, Andy Shevchenko wrote:
>> +/**
>> + * gpio_fwd_gpio_add - Add a GPIO in the forwarder
> 
> forwarder

Sorry I do not see the typo :)

> 
>> + * @fwd: GPIO forwarder
>> + * @desc: GPIO decriptor to register
> 
> descriptor
> 
>> + * @offset: offset for the GPIO in the forwarder
>> + *
>> + * Returns: 0 on success, or negative errno on failure.
>> + */
> 
> Please, spellcheck all of the comments.

Ditto

> 
> ...
> 
>> +#ifndef __LINUX_GPIO_FORWARDER_H
>> +#define __LINUX_GPIO_FORWARDER_H
> 
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/driver.h>
> 
> These are not used (at least as of this patch).

Indeed they are only needed in the pinctrl driver.

> 
> + struct gpio_chip;

And also struct gpio_desc;

Regards,

Thomas

