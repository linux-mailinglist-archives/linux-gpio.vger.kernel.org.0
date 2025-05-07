Return-Path: <linux-gpio+bounces-19749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69549AAE593
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2D73B20448
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 15:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22D628BA8B;
	Wed,  7 May 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MJYCS9l7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8328C004;
	Wed,  7 May 2025 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633195; cv=none; b=TxqdQKnt8+G2pXb2YRswtXJTzsucMYlrzxawSv/qLhlpQxkDlnW4Z1RBrx058KcBjB62BTueZOViVojqGynXtx/TqiHgvAAc/fQ2WefFTAk+WUxgHCcxP9CXxIld/Ojn/BlEtFlFH6lW6UXfvFkwM6dBcdNEO8Emtq7YR26Kx0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633195; c=relaxed/simple;
	bh=Nz0Ht5MdPONTxqjo5zO+b49OL16Vd73xW9XFTTKBs3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyVmt4DjnV7zSXr3dxgi70AlqChCQVk4pn5MH6ZID9vt8GV0v4w9zjF2JHXgHPUTtcIwr3qeDRUmrgW+xDpXQQfaFmYrXNBnA8UQQXMJn4rkP9qaRry8k7zymJQ4DU1PYx6GxrZZ+F8kdyS6g9bRNt63TN+6lrjOEmCtTMPBJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MJYCS9l7; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id BB3255874A9;
	Wed,  7 May 2025 15:29:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDE34439D8;
	Wed,  7 May 2025 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746631774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1o57JF9PGVkQw/jNDzy0IcTujjaomhdNiAGR1gzT3vI=;
	b=MJYCS9l7pqPRQTGgAtuQdJxrMSOJyf6Pv4mgh4CS65FwbbsMvGFHyBmxIrFvCVj3pYY2ED
	PraV3Jqnm+Mx/C25w/ydaO9c8ELmavwLQ75ap3zkeUyDk+9UwqS0m9HWL2KSpQfpX0K6Xp
	Yh8paIBDVG7pvHJohZPJiimUbR2+HjgcNIaKWBS9TlBvWjgDZxTIzJcf2uedCDQAbTeIPY
	6NZR/Bj09qzsxvYdxEZjP5maEtrnzyKTo39lAuWd58xFKKgibbQYfznhvqcF/KFFO6JBt0
	froYZIAeYx5zLLN4Q708XexzLNViLEaYmQqJ4YlpQ+70r4N/nuOkHieRw+XGYQ==
Message-ID: <cacda1ba-03f7-42e1-a898-9cdb0f19edf5@bootlin.com>
Date: Wed, 7 May 2025 17:29:32 +0200
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
 <cb98bec7-748c-4e00-aa9f-b5075bebb5b2@bootlin.com>
 <CAHp75Ve_oM6NyvLGsBK4CddEEv=cafw_VfONKwEBX2CBdNxJmA@mail.gmail.com>
 <CAHp75VeBBG-2OZ6fDDJMdZ=SGZRWyaL71nTXaHx7Pyr1PLME2w@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VeBBG-2OZ6fDDJMdZ=SGZRWyaL71nTXaHx7Pyr1PLME2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudehuddvgfdvfeetgffgleeuveejgfejtdehkeetheevheevgedujefgvddtteenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghro
 hdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

On 5/7/25 17:23, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 6:21 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Wed, May 7, 2025 at 5:53 PM Thomas Richard
>> <thomas.richard@bootlin.com> wrote:
>>> On 5/7/25 08:29, Andy Shevchenko wrote:
> 
> ...
> 
>>>>> + * gpio_fwd_gpio_add - Add a GPIO in the forwarder
>>>>
>>>> forwarder
>>>
>>> Sorry I do not see the typo :)
>>
>> Your original piece of the code. Please look better.
> 
> Ah, it was probably me mistakenly fixing the original text :-) It has
> a typo there.
> 

Oh I get it.
Yes you fixed the original text.
But I checked in my code and I missed it :)

Thomas

